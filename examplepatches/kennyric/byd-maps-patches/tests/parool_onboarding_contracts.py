"""Independent Parool original hashes; shared cohort bodies verified unchanged."""
from dpg_onboarding_contracts import ORIGINAL as COHORT

CHANGED = {('nl/persgroep/edition/ui/main/MainActivity', 'ExternalOfferNavigationEffect(Landroidx/navigation/NavHostController;Landroidx/compose/runtime/Composer;I)V'): '47e6210e8c537e3f1e455eb3ab6278aa3a72f3ef4b8d73f460c2140c68c74cb1',
 ('nl/persgroep/edition/ui/main/OnboardingScreenKt', 'OnboardingScreen(Lnl/persgroep/common/DpgBrand;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;Landroidx/compose/runtime/Composer;II)V'): '4c86844fa2433bc188a08b62038ad834e4b008ecfa4dfdb79734d368568cec01'}
ORIGINAL = {
    "startup": 'b49af15a2e5142c8f31d13c4bcfdeda398a7ad61e5ffe26d7d9d7ceaa9c8ed65',
    "retained": [(c, s, CHANGED.get((c, s), h)) for c, s, h in COHORT["trouw"]["retained"]],
}
