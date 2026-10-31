package io.branch.search.internal;

import android.annotation.SuppressLint;
import android.content.Context;
import android.util.Log;
import android.widget.Toast;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class N6 implements InterfaceC3148f9 {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final File f62971a;

    /* renamed from: b, reason: collision with root package name */
    @SuppressLint({"SimpleDateFormat"})
    @NotNull
    public final SimpleDateFormat f62972b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final ExecutorService f62973c;

    public static final class a {
        @NotNull
        public static N6 a(@NotNull Context context, @NotNull InterfaceC3133eb processHandler) {
            String strA;
            Intrinsics.g(context, "context");
            Intrinsics.g(processHandler, "processHandler");
            if (processHandler.a()) {
                strA = "[main process]";
            } else {
                StringBuilder sb2 = new StringBuilder("[");
                String strE = processHandler.e();
                if (strE == null) {
                    strE = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                }
                strA = Z.a(sb2, r70.k.m1(strE, ":", strE), AbstractJsonLexerKt.END_LIST);
            }
            File file = new File(context.getExternalFilesDir(null), b.c0.k("BranchSDK.log", strA));
            Toast.makeText(context, "Branch log created in " + strA, 1).show();
            return new N6(file);
        }
    }

    public N6(@NotNull File file) {
        Intrinsics.g(file, "file");
        this.f62971a = file;
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
        simpleDateFormat.setTimeZone(TimeZone.getTimeZone("UTC"));
        this.f62972b = simpleDateFormat;
        ExecutorService executorServiceNewSingleThreadExecutor = Executors.newSingleThreadExecutor();
        Intrinsics.f(executorServiceNewSingleThreadExecutor, "newSingleThreadExecutor()");
        this.f62973c = executorServiceNewSingleThreadExecutor;
    }

    @Override // io.branch.search.internal.InterfaceC3148f9
    public final void a(@NotNull AbstractC3080b9 message) {
        Intrinsics.g(message, "message");
        this.f62973c.submit(new s90.s0(15, this, message));
    }

    public final String b(AbstractC3080b9 abstractC3080b9) {
        String str = "UTC " + this.f62972b.format(new Date());
        if (abstractC3080b9.f64019a != a50.b.f403d) {
            return str + ' ' + Z8.a(abstractC3080b9) + ": " + abstractC3080b9.a();
        }
        return str + ' ' + Z8.a(abstractC3080b9) + ": " + abstractC3080b9.a() + '\n' + Log.getStackTraceString(abstractC3080b9.f64021c);
    }

    public static final void a(N6 this$0, AbstractC3080b9 message) throws IOException {
        Intrinsics.g(this$0, "this$0");
        Intrinsics.g(message, "$message");
        BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(this$0.f62971a, true));
        try {
            bufferedWriter.write(this$0.b(message));
            bufferedWriter.newLine();
            Unit unit = Unit.f71706a;
            bufferedWriter.close();
        } finally {
        }
    }
}
