package androidx.compose.ui.text.input;

import b.c9;
import b.u4;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import kotlin.Deprecated;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r3.l;
import r3.m;
import r3.n;
import r3.o;
import r3.t;

@Metadata(d1 = {"\u0000@\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u000f\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0013\b\u0007\u0018\u0000 12\u00020\u0001:\u00012BO\u0012\b\b\u0002\u0010\u0003\u001a\u00020\u0002\u0012\b\b\u0002\u0010\u0005\u001a\u00020\u0004\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0002\u0012\b\b\u0002\u0010\b\u001a\u00020\u0007\u0012\b\b\u0002\u0010\n\u001a\u00020\t\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u000b\u0012\b\b\u0002\u0010\u000e\u001a\u00020\r¢\u0006\u0004\b\u000f\u0010\u0010BG\b\u0017\u0012\b\b\u0002\u0010\u0003\u001a\u00020\u0002\u0012\b\b\u0002\u0010\u0005\u001a\u00020\u0004\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0002\u0012\b\b\u0002\u0010\b\u001a\u00020\u0007\u0012\b\b\u0002\u0010\n\u001a\u00020\t\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u000b¢\u0006\u0004\b\u000f\u0010\u0011B;\b\u0017\u0012\b\b\u0002\u0010\u0003\u001a\u00020\u0002\u0012\b\b\u0002\u0010\u0005\u001a\u00020\u0004\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0002\u0012\b\b\u0002\u0010\b\u001a\u00020\u0007\u0012\b\b\u0002\u0010\n\u001a\u00020\t¢\u0006\u0004\b\u000f\u0010\u0012JU\u0010\u0015\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0005\u001a\u00020\u00042\b\b\u0002\u0010\u0006\u001a\u00020\u00022\b\b\u0002\u0010\b\u001a\u00020\u00072\b\b\u0002\u0010\n\u001a\u00020\t2\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u000b2\b\b\u0002\u0010\u000e\u001a\u00020\r¢\u0006\u0004\b\u0013\u0010\u0014JM\u0010\u0015\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0005\u001a\u00020\u00042\b\b\u0002\u0010\u0006\u001a\u00020\u00022\b\b\u0002\u0010\b\u001a\u00020\u00072\b\b\u0002\u0010\n\u001a\u00020\t2\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u000bH\u0007¢\u0006\u0004\b\u0016\u0010\u0017JA\u0010\u0015\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\b\b\u0002\u0010\u0005\u001a\u00020\u00042\b\b\u0002\u0010\u0006\u001a\u00020\u00022\b\b\u0002\u0010\b\u001a\u00020\u00072\b\b\u0002\u0010\n\u001a\u00020\tH\u0007¢\u0006\u0004\b\u0018\u0010\u0019J\u001a\u0010\u001b\u001a\u00020\u00022\b\u0010\u001a\u001a\u0004\u0018\u00010\u0001H\u0096\u0002¢\u0006\u0004\b\u001b\u0010\u001cJ\u000f\u0010\u001e\u001a\u00020\u001dH\u0016¢\u0006\u0004\b\u001e\u0010\u001fJ\u000f\u0010!\u001a\u00020 H\u0016¢\u0006\u0004\b!\u0010\"R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010#\u001a\u0004\b$\u0010%R\u0017\u0010\u0005\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010&\u001a\u0004\b'\u0010\u001fR\u0017\u0010\u0006\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0006\u0010#\u001a\u0004\b(\u0010%R\u0017\u0010\b\u001a\u00020\u00078\u0006¢\u0006\f\n\u0004\b\b\u0010&\u001a\u0004\b)\u0010\u001fR\u0017\u0010\n\u001a\u00020\t8\u0006¢\u0006\f\n\u0004\b\n\u0010&\u001a\u0004\b*\u0010\u001fR\u0019\u0010\f\u001a\u0004\u0018\u00010\u000b8\u0006¢\u0006\f\n\u0004\b\f\u0010+\u001a\u0004\b,\u0010-R\u0017\u0010\u000e\u001a\u00020\r8\u0006¢\u0006\f\n\u0004\b\u000e\u0010.\u001a\u0004\b/\u00100¨\u00063"}, d2 = {"Landroidx/compose/ui/text/input/ImeOptions;", b.f42142b, b.f42142b, "singleLine", "Lr3/n;", "capitalization", "autoCorrect", "Lr3/o;", "keyboardType", "Lr3/l;", "imeAction", "Lr3/t;", "platformImeOptions", "Lt3/b;", "hintLocales", "<init>", "(ZIZIILr3/t;Lt3/b;Lkotlin/jvm/internal/DefaultConstructorMarker;)V", "(ZIZIILr3/t;Lkotlin/jvm/internal/DefaultConstructorMarker;)V", "(ZIZIILkotlin/jvm/internal/DefaultConstructorMarker;)V", "copy-wBHncE4", "(ZIZIILr3/t;Lt3/b;)Landroidx/compose/ui/text/input/ImeOptions;", "copy", "copy-YTHSh70", "(ZIZIILr3/t;)Landroidx/compose/ui/text/input/ImeOptions;", "copy-uxg59PA", "(ZIZII)Landroidx/compose/ui/text/input/ImeOptions;", InneractiveMediationNameConsts.OTHER, "equals", "(Ljava/lang/Object;)Z", b.f42142b, "hashCode", "()I", b.f42142b, "toString", "()Ljava/lang/String;", "Z", "getSingleLine", "()Z", "I", "getCapitalization-IUNYP9k", "getAutoCorrect", "getKeyboardType-PjHm6EE", "getImeAction-eUduSuo", "Lr3/t;", "getPlatformImeOptions", "()Lr3/t;", "Lt3/b;", "getHintLocales", "()Lt3/b;", k.O, "r3/m", "ui-text"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes.dex */
public final class ImeOptions {
    public static final int $stable = 0;

    @NotNull
    public static final m Companion = new m();

    @NotNull
    private static final ImeOptions Default = new ImeOptions(false, 0, false, 0, 0, null, null, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE, null);
    private final boolean autoCorrect;
    private final int capitalization;

    @NotNull
    private final t3.b hintLocales;
    private final int imeAction;
    private final int keyboardType;

    @Nullable
    private final t platformImeOptions;
    private final boolean singleLine;

    @Deprecated
    public /* synthetic */ ImeOptions(boolean z11, int i5, boolean z12, int i11, int i12, DefaultConstructorMarker defaultConstructorMarker) {
        this(z11, i5, z12, i11, i12);
    }

    /* renamed from: copy-YTHSh70$default, reason: not valid java name */
    public static /* synthetic */ ImeOptions m67copyYTHSh70$default(ImeOptions imeOptions, boolean z11, int i5, boolean z12, int i11, int i12, t tVar, int i13, Object obj) {
        if ((i13 & 1) != 0) {
            z11 = imeOptions.singleLine;
        }
        if ((i13 & 2) != 0) {
            i5 = imeOptions.capitalization;
        }
        if ((i13 & 4) != 0) {
            z12 = imeOptions.autoCorrect;
        }
        if ((i13 & 8) != 0) {
            i11 = imeOptions.keyboardType;
        }
        if ((i13 & 16) != 0) {
            i12 = imeOptions.imeAction;
        }
        if ((i13 & 32) != 0) {
            imeOptions.getClass();
            tVar = null;
        }
        int i14 = i12;
        t tVar2 = tVar;
        return imeOptions.m70copyYTHSh70(z11, i5, z12, i11, i14, tVar2);
    }

    /* renamed from: copy-uxg59PA$default, reason: not valid java name */
    public static /* synthetic */ ImeOptions m68copyuxg59PA$default(ImeOptions imeOptions, boolean z11, int i5, boolean z12, int i11, int i12, int i13, Object obj) {
        if ((i13 & 1) != 0) {
            z11 = imeOptions.singleLine;
        }
        if ((i13 & 2) != 0) {
            i5 = imeOptions.capitalization;
        }
        if ((i13 & 4) != 0) {
            z12 = imeOptions.autoCorrect;
        }
        if ((i13 & 8) != 0) {
            i11 = imeOptions.keyboardType;
        }
        if ((i13 & 16) != 0) {
            i12 = imeOptions.imeAction;
        }
        int i14 = i12;
        boolean z13 = z12;
        return imeOptions.m71copyuxg59PA(z11, i5, z13, i11, i14);
    }

    /* renamed from: copy-wBHncE4$default, reason: not valid java name */
    public static /* synthetic */ ImeOptions m69copywBHncE4$default(ImeOptions imeOptions, boolean z11, int i5, boolean z12, int i11, int i12, t tVar, t3.b bVar, int i13, Object obj) {
        if ((i13 & 1) != 0) {
            z11 = imeOptions.singleLine;
        }
        if ((i13 & 2) != 0) {
            i5 = imeOptions.capitalization;
        }
        if ((i13 & 4) != 0) {
            z12 = imeOptions.autoCorrect;
        }
        if ((i13 & 8) != 0) {
            i11 = imeOptions.keyboardType;
        }
        if ((i13 & 16) != 0) {
            i12 = imeOptions.imeAction;
        }
        if ((i13 & 32) != 0) {
            imeOptions.getClass();
            tVar = null;
        }
        if ((i13 & 64) != 0) {
            bVar = imeOptions.hintLocales;
        }
        t tVar2 = tVar;
        t3.b bVar2 = bVar;
        int i14 = i12;
        boolean z13 = z12;
        return imeOptions.m72copywBHncE4(z11, i5, z13, i11, i14, tVar2, bVar2);
    }

    @Deprecated
    /* renamed from: copy-YTHSh70, reason: not valid java name */
    public final /* synthetic */ ImeOptions m70copyYTHSh70(boolean singleLine, int capitalization, boolean autoCorrect, int keyboardType, int imeAction, t platformImeOptions) {
        return new ImeOptions(singleLine, capitalization, autoCorrect, keyboardType, imeAction, platformImeOptions, this.hintLocales, (DefaultConstructorMarker) null);
    }

    @Deprecated
    /* renamed from: copy-uxg59PA, reason: not valid java name */
    public final /* synthetic */ ImeOptions m71copyuxg59PA(boolean singleLine, int capitalization, boolean autoCorrect, int keyboardType, int imeAction) {
        return new ImeOptions(singleLine, capitalization, autoCorrect, keyboardType, imeAction, (t) null, this.hintLocales, (DefaultConstructorMarker) null);
    }

    @NotNull
    /* renamed from: copy-wBHncE4, reason: not valid java name */
    public final ImeOptions m72copywBHncE4(boolean singleLine, int capitalization, boolean autoCorrect, int keyboardType, int imeAction, @Nullable t platformImeOptions, @NotNull t3.b hintLocales) {
        return new ImeOptions(singleLine, capitalization, autoCorrect, keyboardType, imeAction, platformImeOptions, hintLocales, (DefaultConstructorMarker) null);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ImeOptions)) {
            return false;
        }
        ImeOptions imeOptions = (ImeOptions) other;
        return this.singleLine == imeOptions.singleLine && this.capitalization == imeOptions.capitalization && this.autoCorrect == imeOptions.autoCorrect && this.keyboardType == imeOptions.keyboardType && this.imeAction == imeOptions.imeAction && Intrinsics.b(this.hintLocales, imeOptions.hintLocales);
    }

    public final boolean getAutoCorrect() {
        return this.autoCorrect;
    }

    /* renamed from: getCapitalization-IUNYP9k, reason: not valid java name and from getter */
    public final int getCapitalization() {
        return this.capitalization;
    }

    @NotNull
    public final t3.b getHintLocales() {
        return this.hintLocales;
    }

    /* renamed from: getImeAction-eUduSuo, reason: not valid java name and from getter */
    public final int getImeAction() {
        return this.imeAction;
    }

    /* renamed from: getKeyboardType-PjHm6EE, reason: not valid java name and from getter */
    public final int getKeyboardType() {
        return this.keyboardType;
    }

    @Nullable
    public final t getPlatformImeOptions() {
        return null;
    }

    public final boolean getSingleLine() {
        return this.singleLine;
    }

    public int hashCode() {
        return this.hintLocales.f88511a.hashCode() + u4.a(this.imeAction, u4.a(this.keyboardType, c9.f(u4.a(this.capitalization, Boolean.hashCode(this.singleLine) * 31, 31), 31, this.autoCorrect), 31), 961);
    }

    @NotNull
    public String toString() {
        return "ImeOptions(singleLine=" + this.singleLine + ", capitalization=" + ((Object) n.a(this.capitalization)) + ", autoCorrect=" + this.autoCorrect + ", keyboardType=" + ((Object) o.a(this.keyboardType)) + ", imeAction=" + ((Object) l.a(this.imeAction)) + ", platformImeOptions=null, hintLocales=" + this.hintLocales + ')';
    }

    @Deprecated
    public /* synthetic */ ImeOptions(boolean z11, int i5, boolean z12, int i11, int i12, t tVar, DefaultConstructorMarker defaultConstructorMarker) {
        this(z11, i5, z12, i11, i12, tVar);
    }

    public /* synthetic */ ImeOptions(boolean z11, int i5, boolean z12, int i11, int i12, t tVar, t3.b bVar, DefaultConstructorMarker defaultConstructorMarker) {
        this(z11, i5, z12, i11, i12, tVar, bVar);
    }

    private ImeOptions(boolean z11, int i5, boolean z12, int i11, int i12, t tVar, t3.b bVar) {
        this.singleLine = z11;
        this.capitalization = i5;
        this.autoCorrect = z12;
        this.keyboardType = i11;
        this.imeAction = i12;
        this.hintLocales = bVar;
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public ImeOptions(boolean z11, int i5, boolean z12, int i11, int i12, t tVar, t3.b bVar, int i13, DefaultConstructorMarker defaultConstructorMarker) {
        z11 = (i13 & 1) != 0 ? false : z11;
        i5 = (i13 & 2) != 0 ? 0 : i5;
        z12 = (i13 & 4) != 0 ? true : z12;
        i11 = (i13 & 8) != 0 ? 1 : i11;
        i12 = (i13 & 16) != 0 ? 1 : i12;
        tVar = (i13 & 32) != 0 ? null : tVar;
        if ((i13 & 64) != 0) {
            t3.b bVar2 = t3.b.f88510c;
            bVar = t3.b.f88510c;
        }
        this(z11, i5, z12, i11, i12, tVar, bVar, (DefaultConstructorMarker) null);
    }

    public /* synthetic */ ImeOptions(boolean z11, int i5, boolean z12, int i11, int i12, t tVar, int i13, DefaultConstructorMarker defaultConstructorMarker) {
        this((i13 & 1) != 0 ? false : z11, (i13 & 2) == 0 ? i5 : 0, (i13 & 4) != 0 ? true : z12, (i13 & 8) != 0 ? 1 : i11, (i13 & 16) == 0 ? i12 : 1, (i13 & 32) != 0 ? null : tVar, (DefaultConstructorMarker) null);
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    private ImeOptions(boolean z11, int i5, boolean z12, int i11, int i12, t tVar) {
        this(z11, i5, z12, i11, i12, tVar, t3.b.f88510c, (DefaultConstructorMarker) null);
        t3.b bVar = t3.b.f88510c;
    }

    public /* synthetic */ ImeOptions(boolean z11, int i5, boolean z12, int i11, int i12, int i13, DefaultConstructorMarker defaultConstructorMarker) {
        this((i13 & 1) != 0 ? false : z11, (i13 & 2) != 0 ? 0 : i5, (i13 & 4) != 0 ? true : z12, (i13 & 8) != 0 ? 1 : i11, (i13 & 16) != 0 ? 1 : i12, (DefaultConstructorMarker) null);
    }

    private ImeOptions(boolean z11, int i5, boolean z12, int i11, int i12) {
        this(z11, i5, z12, i11, i12, null, null, 64, null);
    }
}
