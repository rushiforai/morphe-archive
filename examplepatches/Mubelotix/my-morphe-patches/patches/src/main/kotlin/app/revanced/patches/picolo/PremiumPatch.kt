package app.revanced.patches.picolo

import app.morphe.patcher.patch.rawResourcePatch

@Suppress("unused")
val premiumPatch = rawResourcePatch(
    name = "Activates premium features",
) {
    compatibleWith("com.picolo.android"("2.4.0"));

    execute {
        val file = get("assets/index.android.bundle");
        var content = file.readText();

        val old = "{return v.isPremium||v.isOldPremium}";
        val new = "{return true}";

        if (!content.contains(old)) {
            throw Exception("Couldn't find the expected string in the file");
        }

        content = content.replace(old, new);

        file.writeText(content);
    }
}
