"""Owned consent entry guards; no age selection or consent state is fabricated."""
CONSENT_EDITS=[
    {'owner':'Lnl/vi/ads/data/google_consent/GoogleConsent;','signature':'requestForConsent(Landroid/app/Activity;)V','index':0,'original':[],
     'replacement':['const-string v0, "activity"','invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V','invoke-direct {p0, p1}, Lnl/vi/ads/data/google_consent/GoogleConsent;->showAgeGateDialogIfNeeded(Landroid/app/Activity;)V','return-void']},
    {'owner':'Lnl/vi/ads/data/google_consent/GoogleConsent;','signature':'forceLoadForm(Landroid/app/Activity;Lnl/vi/ads/data/google_consent/GoogleConsentFormDialogCallback;)V','index':0,'original':[],
     'replacement':['const-string v0, "activity"','invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V','const-string v0, "googleConsentFormDialogCallback"','invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V','const/4 v0, 0x0','sput-boolean v0, Lnl/vi/ads/data/google_consent/GoogleConsent;->isLoadingForm:Z','invoke-interface {p2}, Lnl/vi/ads/data/google_consent/GoogleConsentFormDialogCallback;->onDialogDismissed()V','return-void']},
]
