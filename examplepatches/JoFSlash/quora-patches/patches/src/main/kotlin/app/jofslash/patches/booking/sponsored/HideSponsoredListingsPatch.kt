package app.jofslash.patches.booking.sponsored

import app.jofslash.patches.booking.shared.Constants.COMPATIBILITY_BOOKING
import app.jofslash.patches.booking.shared.enableSabaJsonFilter
import app.jofslash.patches.booking.shared.fieldGettersOf
import app.jofslash.patches.booking.shared.returnEarly
import app.jofslash.patches.booking.shared.sabaJsonFilterPatch
import app.jofslash.patches.booking.shared.methodOf
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction22c
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import org.w3c.dom.Element

private const val HOTEL = "Lcom/booking/common/data/Hotel;"
private const val PROPERTY_MARKER = "Lcom/booking/maps/data/PropertyMarker;"

/** Starts loading a Google display ad (AdMob) when its place in a server-driven page is drawn. */
private const val AD_LOAD_EFFECT = "Lcom/booking/adscomponents/saba/ui/AdComponent\$assembleComponent\$1\$1;"

/** Google's ads SDK starts itself when the app starts, through this content provider. */
private const val MOBILE_ADS_INIT_PROVIDER = "com.google.android.gms.ads.MobileAdsInitProvider"

private val hideDisplayAdsResourcePatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val providers = document.getElementsByTagName("provider")
            var found = false
            for (i in 0 until providers.length) {
                val provider = providers.item(i) as Element
                if (provider.getAttribute("android:name") == MOBILE_ADS_INIT_PROVIDER) {
                    provider.setAttribute("android:enabled", "false")
                    found = true
                }
            }
            if (!found) throw PatchException("Couldn't find Google's ads SDK in the manifest")
        }
    }
}

@Suppress("unused")
val hideSponsoredListingsPatch = bytecodePatch(
    name = "Hide sponsored listings",
    description = "Removes the properties marked \"Ad\" (sponsored listings) and Google's display ads from " +
            "search results. On the map, sponsored properties are shown like any other property, without the " +
            "ad megaphone.",
    default = true
) {
    category("Search")
    compatibleWith(COMPATIBILITY_BOOKING)

    dependsOn(sabaJsonFilterPatch, hideDisplayAdsResourcePatch)

    execute {
        // Search results are a server-driven page: the list items that carry Booking's native ad
        // actions (ad impression and ad click) are taken out of its JSON.
        enableSabaJsonFilter("hideSponsored")

        // Native property cards and map markers: no sponsored data, so no "Ad" badge, no sponsored
        // marker style and no ad impression or click tracking.
        fieldGettersOf(HOTEL, "sponsoredListing").forEach { it.returnEarly() }
        fieldGettersOf(PROPERTY_MARKER, "sponsoredListing").forEach { it.returnEarly() }
        // The search map reads the marker's field directly (the megaphone "ad" pin, its ad
        // tracking and its own sponsored layer), so the field is left empty when a marker is made:
        // the property shows as an ordinary price pin.
        var cleared = 0
        mutableClassDefBy(PROPERTY_MARKER).methods.filter { it.name == "<init>" }.forEach { constructor ->
            val instructions = constructor.implementation?.instructions?.toList() ?: return@forEach
            instructions.indices.reversed().forEach { index ->
                val instruction = instructions[index]
                if (instruction.opcode != Opcode.IPUT_OBJECT) return@forEach
                val field = (instruction as ReferenceInstruction).reference as FieldReference
                if (field.definingClass != PROPERTY_MARKER || field.name != "sponsoredListing") return@forEach
                constructor.addInstruction(index, "const/4 v${(instruction as Instruction22c).registerA}, 0x0")
                cleared++
            }
        }
        if (cleared == 0) throw PatchException("Couldn't find where a map marker's sponsored data is set")

        // Google display ads (AdMob): the filter above takes them out of the search results; any
        // left elsewhere never load, so they stay empty and nothing is asked of Google's ad
        // servers or reported back to Booking.
        methodOf(AD_LOAD_EFFECT, "invokeSuspend").apply {
            val code = implementation ?: throw PatchException("$AD_LOAD_EFFECT->invokeSuspend has no code")
            val parameterRegisters = parameterTypes.size + if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
            if (code.registerCount - parameterRegisters < 1) {
                throw PatchException("$AD_LOAD_EFFECT->invokeSuspend has too few registers")
            }
            addInstructions(
                0,
                """
                    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
                    return-object v0
                """
            )
        }
    }
}
