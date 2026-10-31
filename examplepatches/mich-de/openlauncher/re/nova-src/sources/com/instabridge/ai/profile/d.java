package com.instabridge.ai.profile;

import kotlin.jvm.functions.Function1;

/* loaded from: classes3.dex */
public final /* synthetic */ class d implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35546a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ProfileActivity f35547b;

    public /* synthetic */ d(ProfileActivity profileActivity, int i5) {
        this.f35546a = i5;
        this.f35547b = profileActivity;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f35546a) {
            case 0:
                return ProfileActivity.requestSignIn$lambda$14(this.f35547b, ((Boolean) obj).booleanValue());
            case 1:
                return ProfileActivity.showPlanSelector$lambda$15(this.f35547b, (String) obj);
            default:
                return ProfileActivity.onCreate$lambda$9(this.f35547b, (String) obj);
        }
    }
}
