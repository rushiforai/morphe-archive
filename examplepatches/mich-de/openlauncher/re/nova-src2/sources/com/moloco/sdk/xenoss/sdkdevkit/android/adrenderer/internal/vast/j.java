package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast;

import android.util.Xml;
import com.moloco.sdk.internal.x;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.w;
import java.io.Closeable;
import java.io.StringReader;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.io.CloseableKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes4.dex */
public final class j implements i {

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.VastParserImpl", f = "VastParser.kt", l = {65}, m = "invoke")
    public static final class a extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public Object f40323a;

        /* renamed from: b, reason: collision with root package name */
        public /* synthetic */ Object f40324b;

        /* renamed from: d, reason: collision with root package name */
        public int f40326d;

        public a(Continuation<? super a> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f40324b = obj;
            this.f40326d |= Integer.MIN_VALUE;
            return j.this.a(null, this);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x005c A[Catch: all -> 0x002b, TryCatch #2 {all -> 0x002b, blocks: (B:12:0x0027, B:24:0x0058, B:26:0x005c, B:27:0x0062), top: B:42:0x0027 }] */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0062 A[Catch: all -> 0x002b, TRY_LEAVE, TryCatch #2 {all -> 0x002b, blocks: (B:12:0x0027, B:24:0x0058, B:26:0x005c, B:27:0x0062), top: B:42:0x0027 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.i
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object a(@NotNull String str, @NotNull Continuation<? super x<w, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.k>> continuation) {
        a aVar;
        Throwable th2;
        Closeable closeable;
        if (continuation instanceof a) {
            aVar = (a) continuation;
            int i5 = aVar.f40326d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                aVar.f40326d = i5 - Integer.MIN_VALUE;
            } else {
                aVar = new a(continuation);
            }
        }
        Object obj = aVar.f40324b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = aVar.f40326d;
        try {
            if (i11 != 0) {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                closeable = (Closeable) aVar.f40323a;
                try {
                    ResultKt.b(obj);
                    w wVar = (w) obj;
                    Object bVar = wVar == null ? new x.b(wVar) : new x.a(com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.k.f38782c);
                    CloseableKt.a(closeable, null);
                    return bVar;
                } catch (Throwable th3) {
                    th2 = th3;
                    try {
                        throw th2;
                    } catch (Throwable th4) {
                        CloseableKt.a(closeable, th2);
                        throw th4;
                    }
                }
            }
            ResultKt.b(obj);
            StringReader stringReader = new StringReader(str);
            try {
                XmlPullParser xmlPullParserNewPullParser = Xml.newPullParser();
                xmlPullParserNewPullParser.setFeature("http://xmlpull.org/v1/doc/features.html#process-namespaces", false);
                xmlPullParserNewPullParser.setInput(stringReader);
                aVar.f40323a = stringReader;
                aVar.f40326d = 1;
                Object objS = k.S(xmlPullParserNewPullParser, aVar);
                if (objS == coroutineSingletons) {
                    return coroutineSingletons;
                }
                obj = objS;
                closeable = stringReader;
                w wVar2 = (w) obj;
                if (wVar2 == null) {
                }
                CloseableKt.a(closeable, null);
                return bVar;
            } catch (Throwable th5) {
                th2 = th5;
                closeable = stringReader;
                throw th2;
            }
        } catch (Exception unused) {
            return new x.a(com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.k.f38781b);
        }
    }
}
