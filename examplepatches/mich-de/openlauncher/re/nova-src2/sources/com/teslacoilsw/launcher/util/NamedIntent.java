package com.teslacoilsw.launcher.util;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Process;
import android.os.UserHandle;
import com.android.launcher3.shortcuts.ShortcutKey;
import com.teslacoilsw.launcher.NovaShortcutHandler;
import kotlin.Metadata;
import kotlin.jvm.JvmField;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import mx.c0;
import mx.g0;
import org.jetbrains.annotations.NotNull;
import r70.k;
import u90.b;
import w20.g;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0007\u0018\u00002\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"Lcom/teslacoilsw/launcher/util/NamedIntent;", "Landroid/os/Parcelable;", "w20/h", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public final class NamedIntent implements Parcelable {

    /* renamed from: a, reason: collision with root package name */
    public final String f46368a;

    /* renamed from: b, reason: collision with root package name */
    public final Intent f46369b;

    /* renamed from: c, reason: collision with root package name */
    public final UserHandle f46370c;

    /* renamed from: d, reason: collision with root package name */
    public static final NamedIntent f46367d = new NamedIntent("None", null, Process.myUserHandle());

    @JvmField
    @NotNull
    public static final Parcelable.Creator<NamedIntent> CREATOR = new g();

    public NamedIntent(String str, Intent intent, UserHandle userHandle) {
        this.f46368a = str;
        this.f46369b = intent;
        this.f46370c = userHandle;
    }

    public final String a(Context context) {
        c0 c0VarC;
        if (equals(f46367d)) {
            return context.getString(2132018734);
        }
        String str = this.f46368a;
        return (str.length() != 0 || (c0VarC = c0.c(this.f46369b)) == null) ? str : context.getString(c0VarC.f77040a);
    }

    public final String b() {
        ComponentName componentName = NovaShortcutHandler.f45670c;
        Intent intent = this.f46369b;
        Intrinsics.d(intent);
        if (Intrinsics.b(componentName, intent.getComponent())) {
            return e(g0.e());
        }
        return "$action=" + intent.getAction() + ";component=" + intent.getComponent();
    }

    public final ShortcutKey d() {
        Intent intent = this.f46369b;
        if (intent == null) {
            return null;
        }
        return ShortcutKey.d(intent, this.f46370c);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final String e(Context context) {
        Intent intent = this.f46369b;
        if (intent == null) {
            return null;
        }
        String str = this.f46368a;
        if (k.R0('$', 0, 6, str) != -1) {
            throw new IllegalStateException("NamedIntent cannot have $ in title");
        }
        StringBuilder sb2 = new StringBuilder(str);
        sb2.append('$');
        sb2.append(intent.toUri(0));
        UserHandle userHandleMyUserHandle = Process.myUserHandle();
        UserHandle userHandle = this.f46370c;
        if (!Intrinsics.b(userHandle, userHandleMyUserHandle)) {
            sb2.append(' ');
            sb2.append(b.J(context, userHandle));
        }
        return sb2.toString();
    }

    public final String toString() {
        String strE = e(g0.e());
        return strE == null ? "NullNamedIntent" : strE;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(this.f46368a);
        parcel.writeParcelable(this.f46369b, i5);
        parcel.writeParcelable(this.f46370c, i5);
    }
}
