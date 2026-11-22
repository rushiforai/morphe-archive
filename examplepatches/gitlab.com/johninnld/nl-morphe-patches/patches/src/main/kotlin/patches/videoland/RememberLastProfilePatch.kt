package patches.videoland

import patches.videoland.profile.ProfileEvent
import patches.videoland.profile.ProfileSite
import patches.videoland.profile.rememberProfile

@Suppress("unused")
val rememberLastProfilePatch = rememberProfile(videolandMobile, originalInput, listOf(
    ProfileSite(ProfileEvent.LAUNCH, "Lcom/bedrockstreaming/shared/mobile/activity/SplashActivity;",
        "onCreate(Landroid/os/Bundle;)V", 6, 34,
        "19867aa4998f87af1f7ad6bed1490488187d97ef69713fc3f00b010eb9e0b1a9"),
    ProfileSite(ProfileEvent.PHONE_STORE, "Lcom/bedrockstreaming/shared/common/component/navigation/LogoutAwareNavigationContextStore;",
        "<init>(Lcom/bedrockstreaming/component/navigation/data/NavigationContextStore;LAr/b;Landroid/content/Context;LA8/i;)V", 6, 30,
        "f86f6644642beb93078c4b81b998a620ca56abcd9ade75dc28673f143eba7f47"),
    ProfileSite(ProfileEvent.LOGOUT, "LIl/b;",
        "accept(Ljava/lang/Object;)V", 5, 16,
        "0aefc819e425eeaa8064d1939f4377cf4c052d6576a1bc81c86ba0dcebfcf36b"),
    ProfileSite(ProfileEvent.RENDER, "Lcom/bedrockstreaming/feature/catalog/presentation/mobile/EntityLayoutDelegate;",
        "a(Lcom/bedrockstreaming/feature/catalog/presentation/mobile/EntityLayoutDelegate;Lcom/bedrockstreaming/feature/catalog/presentation/mobile/EntityLayoutDelegate\$c;Lcom/bedrockstreaming/component/layout/presentation/LegacyEntityLayoutViewModel\$d;Loz/d;)Ljava/lang/Object;", 38, 668,
        "2b1dec2bd22d44e7e8c8dd276c54feeab8dba012c74b653afb0acfdeae83c43a"),
    ProfileSite(ProfileEvent.CHOICE, "Lcom/bedrockstreaming/component/layout/presentation/LegacyEntityLayoutViewModel;",
        "n(Lj8/a;Lcom/bedrockstreaming/component/layout/domain/core/model/Item;Lcom/bedrockstreaming/component/layout/domain/core/model/Target;)V", 20, 124,
        "aac29867de6e07cd85c31689c4cc168ae51ff861c381a46c34a1a8344208bedb"),
    ProfileSite(ProfileEvent.HOME, "Lcom/bedrockstreaming/shared/mobile/feature/home/presentation/view/HomeFragment;",
        "E0(Lcom/bedrockstreaming/shared/common/feature/home/presentation/viewmodel/HomeViewModel\$d;)V", 15, 236,
        "6d98db3d18b9a03f67dd03780a2b821cf1b41715d9c51cdbab7d72679b7ce885"),
    ProfileSite(ProfileEvent.NEW_INTENT, "Lcom/bedrockstreaming/shared/mobile/feature/home/presentation/view/HomeActivity;",
        "onNewIntent(Landroid/content/Intent;)V", 4, 9,
        "7c5644fad4ba3327580f4653b136e175050398be49fb427e6df919caae104e2a"),
))
