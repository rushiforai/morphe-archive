package cs;

import android.content.ClipData;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.CancellationSignal;
import aosp.androidx.core.content.FileProvider;
import com.teslacoilsw.launcher.NovaLauncher;
import e20.d0;
import i2.h0;
import i2.r0;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.ArrayList;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.UInt;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import tx.b4;
import tx.z;
import v70.w;
import v70.x;
import z2.r1;
import z2.y;

/* loaded from: classes4.dex */
public final class h implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f47820a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f47821b;

    public h(BitmapFactory.Options options, InputStream inputStream) {
        this.f47820a = 7;
        this.f47821b = inputStream;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f47820a) {
            case 0:
                ((yw.a) this.f47821b).b();
                break;
            case 1:
                Bitmap bitmap = (Bitmap) obj;
                d10.c cVar = (d10.c) this.f47821b;
                Context context = cVar.f71306t;
                ga.e eVar = cVar.f48827w;
                File file = new File(((NovaLauncher) context).getCacheDir(), "fileprovider_temp/export.png");
                File parentFile = file.getParentFile();
                Intrinsics.d(parentFile);
                parentFile.mkdirs();
                try {
                    bitmap.compress(Bitmap.CompressFormat.PNG, 100, new FileOutputStream(file));
                } catch (FileNotFoundException e3) {
                    e3.printStackTrace();
                }
                NovaLauncher novaLauncher = (NovaLauncher) context;
                Uri uriC = FileProvider.a(novaLauncher, "com.teslacoilsw.launcher.fileprovider").c(file);
                Intent intent = new Intent("android.intent.action.SEND");
                intent.setType("image/png");
                intent.putExtra("android.intent.extra.STREAM", uriC);
                intent.setClipData(ClipData.newRawUri(null, uriC));
                intent.addFlags(1);
                CharSequence charSequenceFlattenToShortString = eVar.f57300l;
                if ((charSequenceFlattenToShortString == null || charSequenceFlattenToShortString.length() == 0) && (eVar instanceof ga.g)) {
                    ComponentName componentName = ((ga.g) eVar).f57311s;
                    charSequenceFlattenToShortString = componentName != null ? componentName.flattenToShortString() : null;
                }
                if (charSequenceFlattenToShortString == null || charSequenceFlattenToShortString.length() == 0) {
                    int i5 = eVar.f57290b;
                    String str = i5 != 0 ? i5 != 1 ? i5 != 2 ? i5 != 4 ? "Unknown" : "Widget" : "Folder" : "Shortcut" : "App";
                    charSequenceFlattenToShortString = str + "_" + eVar.f57289a;
                }
                intent.putExtra("android.intent.extra.TITLE", charSequenceFlattenToShortString);
                novaLauncher.startActivity(Intent.createChooser(intent, "Export PNG"), null);
                break;
            case 2:
                ((w) ((x) this.f47821b)).j(new d0((k30.x) obj));
                break;
            case 3:
                ((CancellationSignal) this.f47821b).cancel();
                break;
            case 4:
                int iR = r0.r(((i2.s) obj).f61148a);
                UInt.Companion companion = UInt.f71696b;
                Function2 function2 = (Function2) this.f47821b;
                tz.m mVar = tz.n.Companion;
                int i11 = (iR >>> 24) & 255;
                if (i11 < 50) {
                    i11 = 50;
                }
                int iO0 = ul.b.o0(iR, i11);
                mVar.getClass();
                function2.invoke(new tz.n(tz.m.a(iO0)), Boolean.FALSE);
                break;
            case 5:
                ((ArrayList) this.f47821b).get(((Number) obj).intValue());
                break;
            case 6:
                break;
            case 7:
                InputStream inputStream = (InputStream) this.f47821b;
                try {
                    int i12 = Result.f71687b;
                    inputStream.close();
                    Unit unit = Unit.f71706a;
                } catch (Throwable th2) {
                    int i13 = Result.f71687b;
                    ResultKt.a(th2);
                }
                break;
            case 8:
                float[] fArr = ((h0) obj).f61121a;
                y yVar = (y) this.f47821b;
                if (yVar.isAttached()) {
                    r1.f(yVar).z(yVar, fArr);
                }
                break;
            case 9:
                Boolean bool = (Boolean) obj;
                bool.getClass();
                ((t70.m) this.f47821b).i(bool, z.f90080d);
                break;
            default:
                ((b4) this.f47821b).f89669a = null;
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ h(Object obj, int i5) {
        this.f47820a = i5;
        this.f47821b = obj;
    }
}
