package com.google.android.gms.wallet;

import android.app.Activity;
import android.app.Fragment;
import android.app.PendingIntent;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import gi.a;
import gi.f;

@Deprecated
/* loaded from: classes3.dex */
public final class zzd extends Fragment {

    /* renamed from: a, reason: collision with root package name */
    public int f33985a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f33986b;

    @Override // android.app.Fragment
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.f33985a = getArguments().getInt("requestCode");
        if (a.f57678a == getArguments().getLong("initializationElapsedRealtime")) {
            if (f.f57686a.get(getArguments().getInt("resolveCallId")) != null) {
                throw new ClassCastException();
            }
        }
        boolean z11 = false;
        if (bundle != null && bundle.getBoolean("delivered")) {
            z11 = true;
        }
        this.f33986b = z11;
    }

    @Override // android.app.Fragment
    public final void onResume() throws PendingIntent.CanceledException {
        super.onResume();
        if (Log.isLoggable("AutoResolveHelper", 5)) {
            Log.w("AutoResolveHelper", "Sending canceled result for garbage collected task!");
        }
        if (this.f33986b) {
            return;
        }
        this.f33986b = true;
        Activity activity = getActivity();
        activity.getFragmentManager().beginTransaction().remove(this).commit();
        int i5 = this.f33985a;
        Intent intent = new Intent();
        int i11 = a.f57679b;
        PendingIntent pendingIntentCreatePendingResult = activity.createPendingResult(i5, intent, 1073741824);
        if (pendingIntentCreatePendingResult == null) {
            if (Log.isLoggable("AutoResolveHelper", 5)) {
                Log.w("AutoResolveHelper", "Null pending result returned when trying to deliver task result!");
            }
        } else {
            try {
                pendingIntentCreatePendingResult.send(0);
            } catch (PendingIntent.CanceledException e3) {
                if (Log.isLoggable("AutoResolveHelper", 6)) {
                    Log.e("AutoResolveHelper", "Exception sending pending result", e3);
                }
            }
        }
    }

    @Override // android.app.Fragment
    public final void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putBoolean("delivered", this.f33986b);
    }
}
