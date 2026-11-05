package app.template.patches.truecaller.controls

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

// The main Settings screen: CategoriesFragment keeps its name (it is the start destination of the
// settings nav graph). onViewCreated binds the inflated fragment_categories rows (item_premium,
// item_watch, ..., item_about, item_help, a TextView each in one vertical LinearLayout, with a
// layout_divider View before each) through the ViewBinding's inlined "Missing required view" check.
internal object CategoriesFragmentViewCreatedFingerprint : Fingerprint(
    definingClass = "Lcom/truecaller/settings/impl/ui/categories/CategoriesFragment;",
    name = "onViewCreated",
    returnType = "V",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
    filters = listOf(string("Missing required view with ID: ")),
)
