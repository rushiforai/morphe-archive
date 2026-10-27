package app.template.patches.mxplayer

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_MX_PLAYER_AD
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

@Suppress("unused")
val cleanMePagePatch = bytecodePatch(
    name = "Clean Me page",
    description = "Removes the Status Saver, Legal, and Help sections from the Me page while keeping " +
        "the 8-item local tools grid, App Theme, Settings, and Custom Pop-up Play.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MX_PLAYER_AD)

    dependsOn(mxIntegrityCorePatch)

    execute {
        val localMeClass = LocalMeOnViewCreatedFingerprint.classDef
        val bindingInfo = resolveLocalMeBinding(localMeClass)

        val legalField = bindingInfo.rowFieldsByLabel.getValue("Legal")
        val fieldsToHide = buildList<FieldReference> {
            addAll(bindingInfo.promoAndAdFields)
            add(bindingInfo.rowFieldsByLabel.getValue("WhatsApp Status Saver"))
            bindingInfo.statusSaverBadgeField?.let(::add)
            add(legalField)
            add(bindingInfo.rowFieldsByLabel.getValue("Help"))
            add(bindingInfo.rowFieldsByLabel.getValue("DataPrivacy"))
        }.distinctBy { "${it.name}:${it.type}" }

        // Only collapse `legalField`'s parent card (`0x7f0b08ea`), which groups Legal, Help, and
        // DataPrivacy. (`WhatsApp Status Saver` `E` is already a standalone card child of the root
        // vertical LinearLayoutCompat, and `Custom Pop-up Play` `e` stays visible inside Settings card.)
        val parentsToHide = listOf(legalField)

        // 1. Disarm the background WhatsApp status scanner coroutine so opening Me never wastes
        //    disk I/O scanning WhatsApp status folders or toggling the Status Saver badge, and
        //    promote LocalMeFragment's package-private inner coroutine classes to PUBLIC so moving
        //    LocalMeFragment under BytecodeMode.STRIP_SAFE remains safe even on API 24-25.
        val whatsappCoroutineClass = LocalMeWhatsAppStatusFingerprint.classDef
        whatsappCoroutineClass.accessFlags = whatsappCoroutineClass.accessFlags or AccessFlags.PUBLIC.value
        whatsappCoroutineClass.returnUnitInstance(LocalMeWhatsAppStatusFingerprint.method)
        classDefForEach { classDef ->
            if (classDef.type.startsWith("Lcom/mxtech/videoplayer/ad/subscriptions/ui/metab/fragment/LocalMeFragment\$") &&
                !AccessFlags.PUBLIC.isSet(classDef.accessFlags)
            ) {
                mutableClassDefBy(classDef).let {
                    it.accessFlags = (it.accessFlags and AccessFlags.PRIVATE.value.inv() and AccessFlags.PROTECTED.value.inv()) or AccessFlags.PUBLIC.value
                }
            }
        }

        // 2. Enforce view hiding at the end of `initViews` (`G8` in 3.4.x / `J8` in 3.3.1, where
        //    `"whats_app_entry_enabled"` sets `Status Saver` visible), `onViewCreated`, and `onResume`
        //    using branch-label-safe `appendHideBindingViews` so both top-right `Me` activity mode and
        //    bottom-bar `Me` tab mode stay 100% clean.
        val initViewsMethod = localMeClass.methods.firstOrNull {
            it.parameterTypes.isEmpty() &&
                it.returnType == "V" &&
                it.containsString("whats_app_entry_enabled")
        } ?: throw PatchException("LocalMeFragment whats_app_entry_enabled init method not found")

        initViewsMethod.appendHideBindingViews(
            bindingInfo = bindingInfo,
            fieldsToHide = fieldsToHide,
            hideParentsOf = parentsToHide,
        )
        localMeClass.requireMethod("onViewCreated", "V", listOf("Landroid/view/View;", "Landroid/os/Bundle;"))
            .appendHideBindingViews(
                bindingInfo = bindingInfo,
                fieldsToHide = fieldsToHide,
                hideParentsOf = parentsToHide,
            )
        localMeClass.requireMethod("onResume", "V", emptyList())
            .appendHideBindingViews(
                bindingInfo = bindingInfo,
                fieldsToHide = fieldsToHide,
                hideParentsOf = parentsToHide,
            )
    }
}
