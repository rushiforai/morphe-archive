package a5;

import android.content.ClipData;
import android.content.pm.ApkChecksum;
import android.view.ContentInfo;
import android.view.autofill.AutofillId;
import android.view.translation.ViewTranslationRequest;

/* loaded from: classes2.dex */
public abstract /* synthetic */ class c {
    public static /* bridge */ /* synthetic */ ApkChecksum e(Object obj) {
        return (ApkChecksum) obj;
    }

    public static /* synthetic */ ContentInfo.Builder g(ClipData clipData, int i5) {
        return new ContentInfo.Builder(clipData, i5);
    }

    public static /* bridge */ /* synthetic */ ContentInfo i(Object obj) {
        return (ContentInfo) obj;
    }

    public static /* synthetic */ ViewTranslationRequest.Builder l(AutofillId autofillId, long j11) {
        return new ViewTranslationRequest.Builder(autofillId, j11);
    }

    public static /* synthetic */ void n() {
    }
}
