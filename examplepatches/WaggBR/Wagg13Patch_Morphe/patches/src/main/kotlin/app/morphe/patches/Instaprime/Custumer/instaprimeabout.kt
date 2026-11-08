package app.morphe.patches.instaprime.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val CATEGORY = "Lcom/primemods/ui/preferences/base/BasePreferenceCategory;"
private const val INFO_PREF_NAME = "com.primemods.ui.preferences.base.BaseInfoPreference"
private const val BASE_PREF_NAME = "com.primemods.ui.preferences.base.BasePreference"

// ---- textos novos ----
private const val TG_TITLE = "Mod Crack by Wagg13"
private const val TG_DESC = "Those who live by deceit cannot demand honesty"
private const val TG_URL = "https://t.me/wagg13mods"
private const val CHANGELOG_DESC = "Next time, improve the code obfuscation ;D"
private const val CLONE_OLD = "Clone)"
private const val CLONE_NEW = "Clone PREMIUM)"

// ---- entradas "Follow us" a esconder (todas menos tg_channel) ----
private val HIDDEN_KEYS = listOf("ig_page", "official_site", "wa_channel", "tg_group", "yt_channel")

internal object InstaPrimeAboutPatch {
    @Suppress("unused")
    val patch = bytecodePatch(
        name = "Custom About screen",
        description = "Tela Sobre do InstaPrime: só o Telegram Channel (t.me/wagg13mods) e textos personalizados.",
    ) {
        compatibleWith("com.instaprime.android"("435.0.0.37.76"))

        execute {
            val category = mutableClassDefBy(CATEGORY)
            val prefType = "Landroid/preference/Preference;"
            val staticPublic = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value

            // ------------------------------------------------------------------ w13get(Preference, String): String
            val w13get = MutableMethod(
                ImmutableMethod(
                    category.type,
                    "w13get",
                    listOf(
                        ImmutableMethodParameter(prefType, null, null),
                        ImmutableMethodParameter("Ljava/lang/String;", null, null),
                    ),
                    "Ljava/lang/String;",
                    staticPublic,
                    null,
                    null,
                    MutableMethodImplementation(4), // v0,v1 + p0,p1
                ),
            ).apply {
                addInstructionsWithLabels(
                    0,
                    """
                        invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
                        move-result-object v0
                        invoke-virtual {v0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;
                        move-result-object v0
                        const/4 v1, 0x1
                        invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V
                        invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;
                        move-result-object v0
                        check-cast v0, Ljava/lang/String;
                        return-object v0
                    """,
                )
            }
            category.methods.add(w13get)

            // ------------------------------------------------------------------ w13set(Preference, String, String): void
            val w13set = MutableMethod(
                ImmutableMethod(
                    category.type,
                    "w13set",
                    listOf(
                        ImmutableMethodParameter(prefType, null, null),
                        ImmutableMethodParameter("Ljava/lang/String;", null, null),
                        ImmutableMethodParameter("Ljava/lang/String;", null, null),
                    ),
                    "V",
                    staticPublic,
                    null,
                    null,
                    MutableMethodImplementation(5), // v0,v1 + p0,p1,p2
                ),
            ).apply {
                addInstructionsWithLabels(
                    0,
                    """
                        invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
                        move-result-object v0
                        invoke-virtual {v0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;
                        move-result-object v0
                        const/4 v1, 0x1
                        invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V
                        invoke-virtual {v0, p0, p2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
                        return-void
                    """,
                )
            }
            category.methods.add(w13set)

            // ------------------------------------------------------------------ addPreference
            val hiddenChecks = HIDDEN_KEYS.joinToString("\n") { key ->
                """
                    const-string v1, "$key"
                    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                    move-result v1
                    if-nez v1, :skip
                """.trimIndent()
            }

            val addPreference = MutableMethod(
                ImmutableMethod(
                    category.type,
                    "addPreference",
                    listOf(ImmutableMethodParameter(prefType, null, null)),
                    "Z",
                    AccessFlags.PUBLIC.value,
                    null,
                    null,
                    MutableMethodImplementation(6), // v0..v3 + this + p1
                ),
            ).apply {
                addInstructionsWithLabels(
                    0,
                    """
                        invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
                        move-result-object v0
                        invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;
                        move-result-object v0
                        const-string v1, "$INFO_PREF_NAME"
                        invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v1
                        if-nez v1, :do_clone
                        const-string v1, "$BASE_PREF_NAME"
                        invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v1
                        if-eqz v1, :after_clone
                        :do_clone
                        const-string v0, "mSummary"
                        invoke-static {p1, v0}, $CATEGORY->w13get(${prefType}Ljava/lang/String;)Ljava/lang/String;
                        move-result-object v1
                        if-eqz v1, :after_clone
                        const-string v2, "$CLONE_OLD"
                        const-string v3, "$CLONE_NEW"
                        invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
                        move-result-object v1
                        invoke-static {p1, v0, v1}, $CATEGORY->w13set(${prefType}Ljava/lang/String;Ljava/lang/String;)V
                        :after_clone
                        invoke-virtual {p1}, $prefType->getKey()Ljava/lang/String;
                        move-result-object v0
                        if-eqz v0, :keep
                        $hiddenChecks

                        const-string v1, "changelogs"
                        invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v1
                        if-eqz v1, :not_changelogs
                        const-string v1, "mSummary"
                        const-string v2, "$CHANGELOG_DESC"
                        invoke-static {p1, v1, v2}, $CATEGORY->w13set(${prefType}Ljava/lang/String;Ljava/lang/String;)V
                        goto :keep
                        :not_changelogs

                        const-string v1, "tg_channel"
                        invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                        move-result v1
                        if-eqz v1, :keep
                        const-string v1, "mTitle"
                        const-string v2, "$TG_TITLE"
                        invoke-static {p1, v1, v2}, $CATEGORY->w13set(${prefType}Ljava/lang/String;Ljava/lang/String;)V
                        const-string v1, "mSummary"
                        const-string v2, "$TG_DESC"
                        invoke-static {p1, v1, v2}, $CATEGORY->w13set(${prefType}Ljava/lang/String;Ljava/lang/String;)V
                        new-instance v1, Landroid/content/Intent;
                        const-string v2, "android.intent.action.VIEW"
                        const-string v3, "$TG_URL"
                        invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
                        move-result-object v3
                        invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V
                        invoke-virtual {p1, v1}, $prefType->setIntent(Landroid/content/Intent;)V
                        const-string v1, "wagg13_tg"
                        invoke-virtual {p1, v1}, $prefType->setKey(Ljava/lang/String;)V
                        :keep
                        invoke-super {p0, p1}, Landroid/preference/PreferenceCategory;->addPreference($prefType)Z
                        move-result v0
                        return v0
                        :skip
                        const/4 v0, 0x1
                        return v0
                    """,
                )
            }
            category.methods.add(addPreference)

            // ------------------------------------------------------------------ findPreference
            val dummyKeys = HIDDEN_KEYS + "tg_channel"
            val dummyChecks = dummyKeys.joinToString("\n") { key ->
                """
                    const-string v2, "$key"
                    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                    move-result v2
                    if-nez v2, :dummy
                """.trimIndent()
            }

            val findPreference = MutableMethod(
                ImmutableMethod(
                    category.type,
                    "findPreference",
                    listOf(ImmutableMethodParameter("Ljava/lang/CharSequence;", null, null)),
                    prefType,
                    AccessFlags.PUBLIC.value,
                    null,
                    null,
                    MutableMethodImplementation(5), // v0..v2 + this + p1
                ),
            ).apply {
                addInstructionsWithLabels(
                    0,
                    """
                        invoke-super {p0, p1}, Landroid/preference/PreferenceCategory;->findPreference(Ljava/lang/CharSequence;)$prefType
                        move-result-object v0
                        if-nez v0, :done
                        if-eqz p1, :done
                        invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
                        move-result-object v1
                        $dummyChecks
                        :done
                        return-object v0
                        :dummy
                        new-instance v0, $prefType
                        invoke-virtual {p0}, $prefType->getContext()Landroid/content/Context;
                        move-result-object v1
                        invoke-direct {v0, v1}, $prefType-><init>(Landroid/content/Context;)V
                        return-object v0
                    """,
                )
            }
            category.methods.add(findPreference)
        }
    }
}
