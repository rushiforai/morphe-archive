package com.teslacoilsw.launcher.theme;

import android.animation.AnimatorSet;
import android.app.Activity;
import android.app.Fragment;
import android.app.FragmentTransaction;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.recyclerview.widget.s2;
import com.google.android.gms.internal.consent_sdk.k0;
import com.teslacoilsw.launcher.theme.ThemeListFragment;
import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public class c extends s2 implements View.OnClickListener, View.OnLongClickListener {

    /* renamed from: b, reason: collision with root package name */
    public final View f46347b;

    /* renamed from: c, reason: collision with root package name */
    public final TextView f46348c;

    /* renamed from: d, reason: collision with root package name */
    public final ImageView f46349d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ d f46350e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c(d dVar, View view) {
        super(view);
        this.f46350e = dVar;
        this.f46347b = view;
        this.f46348c = (TextView) view.findViewById(2131428412);
        this.f46349d = (ImageView) view.findViewById(2131428202);
        view.setOnClickListener(this);
        view.setOnLongClickListener(this);
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View view) {
        Fragment themeImagePicker;
        Fragment appPicker;
        int position = getPosition();
        d dVar = this.f46350e;
        ThemeListFragment themeListFragment = dVar.f46355e;
        ArrayList arrayList = dVar.f46351a;
        if (position >= arrayList.size()) {
            if (getPosition() == dVar.getItemCount() - 1) {
                Intent intent = new Intent("android.intent.action.VIEW");
                intent.setData(Uri.parse("market://search?q=icon+theme"));
                try {
                    themeListFragment.startActivity(intent);
                    return;
                } catch (Exception unused) {
                    k0.x(themeListFragment.getActivity(), "Play Store not available", 0).show();
                    return;
                }
            }
            return;
        }
        Object obj = arrayList.get(getPosition());
        Intrinsics.e(obj, "null cannot be cast to non-null type com.teslacoilsw.launcher.theme.ThemeListFragment.ThemePackageInfo");
        ThemeListFragment.ThemePackageInfo themePackageInfo = (ThemeListFragment.ThemePackageInfo) obj;
        String str = themePackageInfo.f46340a;
        int i5 = themePackageInfo.f46343d;
        CharSequence charSequence = themePackageInfo.f46341b;
        if ("com.teslacoilsw.launcher:GALLERY".equals(str)) {
            List list = themeListFragment.f46338k;
            v20.e eVar = themeListFragment.f46331d;
            appPicker = new GalleryAppPicker();
            Bundle bundle = new Bundle();
            bundle.putParcelable("base-intent", GalleryAppPicker.f46304u);
            if (eVar == v20.e.f92028d) {
                bundle.putParcelable("secondary-base-intent", gz.a.f58634g);
            }
            ArrayList<String> arrayList2 = new ArrayList<>(list.size());
            Iterator it = list.iterator();
            while (it.hasNext()) {
                arrayList2.add(((ThemeListFragment.ThemePackageInfo) it.next()).f46340a);
            }
            arrayList2.add("com.jim2");
            bundle.putStringArrayList("excludedPackages", arrayList2);
            appPicker.setArguments(bundle);
        } else if ("com.teslacoilsw.launcher:ADW".equals(str)) {
            Intent intent2 = gz.a.f58634g;
            List list2 = themeListFragment.f46338k;
            appPicker = new AppPicker();
            Bundle bundle2 = new Bundle();
            bundle2.putParcelable("base-intent", intent2);
            ArrayList<String> arrayList3 = new ArrayList<>(list2.size());
            Iterator it2 = list2.iterator();
            while (it2.hasNext()) {
                arrayList3.add(((ThemeListFragment.ThemePackageInfo) it2.next()).f46340a);
            }
            bundle2.putStringArrayList("excludedPackages", arrayList3);
            appPicker.setArguments(bundle2);
        } else {
            if ("com.teslacoilsw.launcher".equals(str)) {
                v20.e eVar2 = themeListFragment.f46331d;
                themeImagePicker = new DefaultIconPicker();
                Bundle bundle3 = new Bundle();
                bundle3.putString("packageName", str);
                bundle3.putInt("themeType", eVar2.ordinal());
                bundle3.putString("title", charSequence.toString());
                bundle3.putInt("iconResId", i5);
                themeImagePicker.setArguments(bundle3);
            } else {
                v20.e eVar3 = themeListFragment.f46331d;
                themeImagePicker = new ThemeImagePicker();
                Bundle bundle4 = new Bundle();
                bundle4.putString("packageName", str);
                bundle4.putInt("themeType", eVar3.ordinal());
                bundle4.putString("title", charSequence.toString());
                bundle4.putInt("iconResId", i5);
                bundle4.putParcelable("themePackageInfo", themePackageInfo);
                themeImagePicker.setArguments(bundle4);
            }
            appPicker = themeImagePicker;
        }
        Bundle arguments = appPicker.getArguments();
        v20.e eVar4 = themeListFragment.f46331d;
        Intrinsics.d(eVar4);
        arguments.putInt("themeType", eVar4.ordinal());
        appPicker.getArguments().putBoolean("return-data", themeListFragment.f46332e);
        if (themeListFragment.f46333f != 0) {
            appPicker.getArguments().putInt("iconSize", themeListFragment.f46333f);
        }
        appPicker.getArguments().putParcelable("internalPicker", themePackageInfo.f46345f);
        appPicker.getArguments().putParcelable("themePackageInfo", themePackageInfo);
        Activity activity = themeListFragment.getActivity();
        Intrinsics.e(activity, "null cannot be cast to non-null type com.teslacoilsw.launcher.theme.PickerActivity");
        PickerActivity pickerActivity = (PickerActivity) activity;
        AnimatorSet animatorSet = pickerActivity.f46311r;
        if (animatorSet == null || !animatorSet.isRunning()) {
            appPicker.setTargetFragment(themeListFragment, 1);
            FragmentTransaction fragmentTransactionBeginTransaction = pickerActivity.getFragmentManager().beginTransaction();
            fragmentTransactionBeginTransaction.add(2131428092, appPicker);
            fragmentTransactionBeginTransaction.setTransition(0);
            fragmentTransactionBeginTransaction.addToBackStack(null);
            fragmentTransactionBeginTransaction.commit();
            pickerActivity.f46312s = view;
        }
    }

    @Override // android.view.View.OnLongClickListener
    public final boolean onLongClick(View view) {
        int adapterPosition = getAdapterPosition();
        d dVar = this.f46350e;
        ArrayList arrayList = dVar.f46351a;
        if (adapterPosition >= arrayList.size()) {
            return false;
        }
        Object obj = arrayList.get(getAdapterPosition());
        Intrinsics.e(obj, "null cannot be cast to non-null type com.teslacoilsw.launcher.theme.ThemeListFragment.ThemePackageInfo");
        Intent intent = ((ThemeListFragment.ThemePackageInfo) obj).f46345f;
        if (intent == null) {
            return false;
        }
        dVar.f46355e.startActivityForResult(intent, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE);
        return true;
    }
}
