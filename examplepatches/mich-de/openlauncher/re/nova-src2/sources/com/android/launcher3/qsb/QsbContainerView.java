package com.android.launcher3.qsb;

import android.app.SearchManager;
import android.appwidget.AppWidgetManager;
import android.appwidget.AppWidgetProviderInfo;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.provider.Settings;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.android.launcher3.graphics.FragmentWithPreview;
import ge.d;
import java.util.Iterator;
import k30.e;
import ma.a;
import o9.g3;

/* loaded from: classes2.dex */
public class QsbContainerView extends FrameLayout {

    public static class QsbFragment extends FragmentWithPreview {

        /* renamed from: c, reason: collision with root package name */
        public static final /* synthetic */ int f21233c = 0;

        /* renamed from: a, reason: collision with root package name */
        public final String f21234a = "qsb_widget_id";

        /* renamed from: b, reason: collision with root package name */
        public a f21235b;

        @Override // com.android.launcher3.graphics.FragmentWithPreview
        public final void a() {
            this.f21235b = new a(getActivity(), new d(27), new e(this, 5));
            int i5 = getActivity().getResources().getConfiguration().orientation;
        }

        @Override // android.app.Fragment
        public final void onActivityResult(int i5, int i11, Intent intent) {
            if (i5 == 1) {
                if (i11 != -1) {
                    this.f21235b.deleteHost();
                } else {
                    g3.l(getActivity()).edit().putInt(this.f21234a, intent.getIntExtra("appWidgetId", -1)).apply();
                }
            }
        }

        @Override // android.app.Fragment
        public final View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
            return new FrameLayout(getActivity());
        }

        @Override // android.app.Fragment
        public final void onDestroy() {
            this.f21235b.stopListening();
            super.onDestroy();
        }
    }

    public QsbContainerView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public static ComponentName a(Context context) {
        AppWidgetProviderInfo appWidgetProviderInfo;
        String strB = b(context);
        if (strB != null) {
            Iterator<AppWidgetProviderInfo> it = AppWidgetManager.getInstance(context).getInstalledProvidersForPackage(strB, null).iterator();
            appWidgetProviderInfo = null;
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                AppWidgetProviderInfo next = it.next();
                if (next.provider.getPackageName().equals(strB) && next.configure == null) {
                    if ((next.widgetCategory & 4) != 0) {
                        appWidgetProviderInfo = next;
                        break;
                    }
                    if (appWidgetProviderInfo == null) {
                        appWidgetProviderInfo = next;
                    }
                }
            }
        } else {
            appWidgetProviderInfo = null;
        }
        if (appWidgetProviderInfo != null) {
            return appWidgetProviderInfo.provider;
        }
        String strB2 = b(context);
        if (strB2 != null) {
            return new ComponentName(strB2, strB2);
        }
        return null;
    }

    public static String b(Context context) {
        String string = Settings.Global.getString(context.getContentResolver(), "SEARCH_PROVIDER_PACKAGE_NAME");
        if (string == null) {
            SearchManager searchManager = (SearchManager) context.getSystemService(SearchManager.class);
            if (searchManager.getGlobalSearchActivity() != null) {
                return searchManager.getGlobalSearchActivity().getPackageName();
            }
        }
        return string;
    }

    @Override // android.view.View
    public final void setPadding(int i5, int i11, int i12, int i13) {
        super.setPadding(0, 0, 0, 0);
    }
}
