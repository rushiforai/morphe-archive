package patches.videolandatv

import patches.videoland.profile.ProfileEvent
import patches.videoland.profile.ProfileSite
import patches.videoland.profile.rememberProfile

@Suppress("unused")
val rememberLastProfilePatch = rememberProfile(videolandTv, originalInput, listOf(
    ProfileSite(ProfileEvent.LAUNCH, "Lcom/bedrockstreaming/shared/tv/activity/SplashActivity;",
        "onCreate(Landroid/os/Bundle;)V", 6, 37,
        "11b17acc9ce5a6ea80088a3d9067bb15c372213111e6c6f8cce44e89baf4e52e"),
    ProfileSite(ProfileEvent.TV_STORE, "Lcom/bedrockstreaming/shared/common/component/navigation/LogoutAwareNavigationContextStore;",
        "<init>(Lcom/bedrockstreaming/component/navigation/data/NavigationContextStore;LRp/b;Landroid/content/Context;Lw8/k;)V", 6, 30,
        "2ebb0550f607a6d9370adb14a67aac4797d977d4abd271d569ce82a31632d90c"),
    ProfileSite(ProfileEvent.LOGOUT, "Lkk/b;",
        "accept(Ljava/lang/Object;)V", 5, 15,
        "8e1a9eb35ccdaa4300ad11923ed6900fc8bc410fa705664fcb8cbd5d840107be"),
    ProfileSite(ProfileEvent.RENDER, "Lcom/bedrockstreaming/feature/catalog/presentation/tv/EntityLayoutDelegate;",
        "a(Lcom/bedrockstreaming/feature/catalog/presentation/tv/EntityLayoutDelegate;Lcom/bedrockstreaming/feature/catalog/presentation/tv/EntityLayoutDelegate\$e;Lcom/bedrockstreaming/component/layout/presentation/LegacyEntityLayoutViewModel\$d;Ltv/c;)Ljava/lang/Object;", 40, 809,
        "adcd6f8278f6a560a1457237f7c8ccaaa909fa3c67ef2540d481dbdfd0896e75"),
    ProfileSite(ProfileEvent.CHOICE, "Lcom/bedrockstreaming/component/layout/presentation/LegacyEntityLayoutViewModel;",
        "n(Lf8/a;Lcom/bedrockstreaming/component/layout/domain/core/model/Item;Lcom/bedrockstreaming/component/layout/domain/core/model/Target;)V", 20, 132,
        "f8b078f5ea0fee4e856eca9d23c6ec6c34bf68dd771709f8d989b9af1d7d7058"),
    ProfileSite(ProfileEvent.HOME, "Lcom/bedrockstreaming/shared/tv/feature/home/HomeFragment;",
        "U(Lcom/bedrockstreaming/shared/common/feature/home/presentation/viewmodel/HomeViewModel\$d;)V", 13, 143,
        "1b60b1e1f91cec6a0b48ef2bfde9363f09ed16a008e90e6d3b1f1f4eb39cf186"),
    ProfileSite(ProfileEvent.NEW_INTENT, "Lcom/bedrockstreaming/shared/tv/feature/home/HomeActivity;",
        "onNewIntent(Landroid/content/Intent;)V", 4, 9,
        "54a08fc91ef3a1aedd17a6a482e4c155e97494c4d04a11c48f4df6d244d4cc6c"),
    ProfileSite(ProfileEvent.CANCEL, "Lcom/bedrockstreaming/feature/accountsharing/presentation/tv/detection/DetectionFragment;",
        "onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V", 5, 26,
        "14d93b3cd9e9b425b93d1e4b6e3feaa821b2cf14d486dbe6463951bf325dbfed"),
))
