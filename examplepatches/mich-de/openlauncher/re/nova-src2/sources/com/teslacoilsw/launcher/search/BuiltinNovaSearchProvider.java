package com.teslacoilsw.launcher.search;

import android.content.Context;
import android.content.pm.PackageManager;
import android.net.Uri;
import kotlin.Metadata;
import kotlin.jvm.functions.Function1;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0017\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/teslacoilsw/launcher/search/BuiltinNovaSearchProvider;", "Lcom/teslacoilsw/launcher/search/NovaSearchProvider;", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public class BuiltinNovaSearchProvider extends NovaSearchProvider {

    /* renamed from: w, reason: collision with root package name */
    public final String f46215w;

    /* renamed from: x, reason: collision with root package name */
    public final Function1 f46216x;

    /* JADX WARN: Illegal instructions before constructor call */
    public BuiltinNovaSearchProvider(String str, Uri uri, String str2, Uri uri2, String str3, Function1 function1, int i5) {
        uri2 = (i5 & 8) != 0 ? uri : uri2;
        str3 = (i5 & 16) != 0 ? null : str3;
        function1 = (i5 & 32) != 0 ? null : function1;
        super(str, uri, str2, uri2);
        this.f46215w = str3;
        this.f46216x = function1;
    }

    @Override // com.teslacoilsw.launcher.search.NovaSearchProvider
    public final Function1 e() {
        Function1 function1 = this.f46216x;
        return function1 == null ? this.f46233g : function1;
    }

    @Override // com.teslacoilsw.launcher.search.NovaSearchProvider
    public final boolean f(Context context) throws PackageManager.NameNotFoundException {
        String str = this.f46215w;
        if (str == null) {
            return true;
        }
        try {
            context.getApplicationContext().getPackageManager().getPackageInfo(str, 0);
            return true;
        } catch (Exception unused) {
            return false;
        }
    }
}
