package com.teslacoilsw.launcher.rawdatalogger;

import a80.d;
import android.content.Context;
import android.content.SharedPreferences;
import androidx.work.CoroutineWorker;
import androidx.work.WorkerParameters;
import br.c;
import com.google.firebase.crashlytics.internal.persistence.b;
import j10.m;
import java.io.File;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.random.Random;
import m10.e;
import m10.f;
import o7.n;
import o7.p;
import org.jetbrains.annotations.NotNull;
import t70.m0;
import t70.y0;

@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0007\u0018\u00002\u00020\u0001:\u0001\bB\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0006\u0010\u0007¨\u0006\t"}, d2 = {"Lcom/teslacoilsw/launcher/rawdatalogger/SubmitRawDataLogWork;", "Landroidx/work/CoroutineWorker;", "Landroid/content/Context;", "context", "Landroidx/work/WorkerParameters;", "workerParams", "<init>", "(Landroid/content/Context;Landroidx/work/WorkerParameters;)V", "br/c", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class SubmitRawDataLogWork extends CoroutineWorker {

    /* renamed from: g, reason: collision with root package name */
    public static final c f46161g = new c();

    /* renamed from: f, reason: collision with root package name */
    public final Context f46162f;

    public SubmitRawDataLogWork(@NotNull Context context, @NotNull WorkerParameters workerParameters) {
        super(context, workerParameters);
        this.f46162f = context;
    }

    /* JADX WARN: Removed duplicated region for block: B:38:0x00dc  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0126  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x0133  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x0139  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x013f  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:45:0x0126 -> B:46:0x012b). Please report as a decompilation issue!!! */
    @Override // androidx.work.CoroutineWorker
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object doWork(Continuation continuation) throws Throwable {
        e eVar;
        File[] fileArrListFiles;
        int length;
        int i5;
        long j11;
        e eVar2;
        File file;
        File[] fileArr;
        int i11;
        Object objA;
        if (continuation instanceof e) {
            eVar = (e) continuation;
            int i12 = eVar.A;
            if ((i12 & Integer.MIN_VALUE) != 0) {
                eVar.A = i12 - Integer.MIN_VALUE;
            } else {
                eVar = new e(this, (ContinuationImpl) continuation);
            }
        }
        Object obj = eVar.f75813y;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i13 = eVar.A;
        int i14 = 0;
        if (i13 == 0) {
            ResultKt.b(obj);
            Context context = this.f46162f;
            if (m.k(context)) {
                File[] fileArrListFiles2 = new File(context.getCacheDir(), "pendingRawData").listFiles();
                if (fileArrListFiles2 != null) {
                    int length2 = fileArrListFiles2.length;
                    while (i14 < length2) {
                        fileArrListFiles2[i14].delete();
                        i14++;
                    }
                }
                return p.a();
            }
            if (m.i(context)) {
                return new n();
            }
            SharedPreferences sharedPreferences = context.getSharedPreferences("datalog", 0);
            long jI = sharedPreferences.getLong("userId", Long.MAX_VALUE);
            if (jI == Long.MAX_VALUE) {
                Random.f71890a.getClass();
                jI = Random.f71891b.i(Long.MIN_VALUE, 9223372036854775806L);
                sharedPreferences.edit().putLong("userId", jI).apply();
            }
            fileArrListFiles = new File(context.getCacheDir(), "pendingRawData").listFiles(new b(2));
            if (fileArrListFiles == null) {
                fileArrListFiles = new File[0];
            }
            length = fileArrListFiles.length;
            i5 = 0;
            j11 = jI;
            if (i5 < length) {
            }
        } else {
            if (i13 == 1) {
                length = eVar.f75812x;
                int i15 = eVar.f75811w;
                j11 = eVar.f75808t;
                file = eVar.f75810v;
                File[] fileArr2 = eVar.f75809u;
                ResultKt.b(obj);
                eVar2 = eVar;
                i11 = i15;
                fileArr = fileArr2;
                File file2 = file;
                byte[] bArr = (byte[]) obj;
                m10.b bVar = m10.b.f75799a;
                long j12 = Long.parseLong(file2.getName());
                eVar2.f75809u = fileArr;
                eVar2.f75810v = file2;
                eVar2.f75808t = j11;
                eVar2.f75811w = i11;
                eVar2.f75812x = length;
                eVar2.A = 2;
                File[] fileArr3 = fileArr;
                objA = bVar.a(j11, j12, bArr, eVar2);
                if (objA != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            if (i13 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            length = eVar.f75812x;
            int i16 = eVar.f75811w;
            j11 = eVar.f75808t;
            File file3 = eVar.f75810v;
            File[] fileArr4 = eVar.f75809u;
            ResultKt.b(obj);
            if (!((Boolean) obj).booleanValue()) {
                file3.delete();
                i5 = i16 + 1;
                fileArrListFiles = fileArr4;
                if (i5 < length) {
                    return p.a();
                }
                file = fileArrListFiles[i5];
                a80.e eVar3 = y0.f88884a;
                d dVar = d.f488c;
                f fVar = new f(file, null, i14);
                eVar.f75809u = fileArrListFiles;
                eVar.f75810v = file;
                eVar.f75808t = j11;
                eVar.f75811w = i5;
                eVar.f75812x = length;
                eVar.A = 1;
                Object objY = m0.y(dVar, fVar, eVar);
                if (objY != coroutineSingletons) {
                    eVar2 = eVar;
                    i11 = i5;
                    fileArr = fileArrListFiles;
                    obj = objY;
                    File file22 = file;
                    byte[] bArr2 = (byte[]) obj;
                    m10.b bVar2 = m10.b.f75799a;
                    long j122 = Long.parseLong(file22.getName());
                    eVar2.f75809u = fileArr;
                    eVar2.f75810v = file22;
                    eVar2.f75808t = j11;
                    eVar2.f75811w = i11;
                    eVar2.f75812x = length;
                    eVar2.A = 2;
                    File[] fileArr32 = fileArr;
                    objA = bVar2.a(j11, j122, bArr2, eVar2);
                    if (objA != coroutineSingletons) {
                        fileArr4 = fileArr32;
                        obj = objA;
                        file3 = file22;
                        i16 = i11;
                        eVar = eVar2;
                        if (!((Boolean) obj).booleanValue()) {
                            return new o7.m();
                        }
                    }
                }
                return coroutineSingletons;
            }
        }
    }
}
