package com.facebook.ads;

import android.content.Intent;
import android.content.res.Configuration;
import android.os.Bundle;
import android.view.MotionEvent;
import com.facebook.ads.internal.api.AudienceNetworkActivityApi;
import java.io.FileDescriptor;
import java.io.PrintWriter;

/* loaded from: classes2.dex */
public final class b implements AudienceNetworkActivityApi {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ AudienceNetworkActivity f27499a;

    public b(AudienceNetworkActivity audienceNetworkActivity) {
        this.f27499a = audienceNetworkActivity;
    }

    @Override // com.facebook.ads.internal.api.AudienceNetworkActivityApi
    public final void dump(String str, FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
        super/*android.app.Activity*/.dump(str, fileDescriptor, printWriter, strArr);
    }

    @Override // com.facebook.ads.internal.api.AudienceNetworkActivityApi
    public final void finish(int i5) {
        super/*android.app.Activity*/.finish();
    }

    @Override // com.facebook.ads.internal.api.AudienceNetworkActivityApi
    public final void onActivityResult(int i5, int i11, Intent intent) {
        super/*android.app.Activity*/.onActivityResult(i5, i11, intent);
    }

    @Override // com.facebook.ads.internal.api.AudienceNetworkActivityApi
    public final void onBackPressed() {
        super/*android.app.Activity*/.onBackPressed();
    }

    @Override // com.facebook.ads.internal.api.AudienceNetworkActivityApi
    public final void onConfigurationChanged(Configuration configuration) {
        super/*android.app.Activity*/.onConfigurationChanged(configuration);
    }

    @Override // com.facebook.ads.internal.api.AudienceNetworkActivityApi
    public final void onCreate(Bundle bundle) {
        super/*android.app.Activity*/.onCreate(bundle);
    }

    @Override // com.facebook.ads.internal.api.AudienceNetworkActivityApi
    public final void onDestroy() {
        super/*android.app.Activity*/.onDestroy();
    }

    @Override // com.facebook.ads.internal.api.AudienceNetworkActivityApi
    public final void onPause() {
        super/*android.app.Activity*/.onPause();
    }

    @Override // com.facebook.ads.internal.api.AudienceNetworkActivityApi
    public final void onResume() {
        super/*android.app.Activity*/.onResume();
    }

    @Override // com.facebook.ads.internal.api.AudienceNetworkActivityApi
    public final void onSaveInstanceState(Bundle bundle) {
        super/*android.app.Activity*/.onSaveInstanceState(bundle);
    }

    @Override // com.facebook.ads.internal.api.AudienceNetworkActivityApi
    public final void onStart() {
        super/*android.app.Activity*/.onStart();
    }

    @Override // com.facebook.ads.internal.api.AudienceNetworkActivityApi
    public final void onStop() {
        super/*android.app.Activity*/.onStop();
    }

    @Override // com.facebook.ads.internal.api.AudienceNetworkActivityApi
    public final boolean onTouchEvent(MotionEvent motionEvent) {
        return super/*android.app.Activity*/.onTouchEvent(motionEvent);
    }
}
