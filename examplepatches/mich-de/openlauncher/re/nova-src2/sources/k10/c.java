package k10;

import android.content.ContentValues;
import com.teslacoilsw.launcher.theme.ThemeListFragment;
import java.text.Collator;
import java.util.Comparator;

/* loaded from: classes4.dex */
public final /* synthetic */ class c implements Comparator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f70854a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Collator f70855b;

    public /* synthetic */ c(Collator collator, int i5) {
        this.f70854a = i5;
        this.f70855b = collator;
    }

    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        switch (this.f70854a) {
            case 0:
                ContentValues contentValues = (ContentValues) obj;
                ContentValues contentValues2 = (ContentValues) obj2;
                String asString = contentValues.getAsString("title");
                String asString2 = contentValues2.getAsString("title");
                Collator collator = this.f70855b;
                int iCompare = collator.compare(asString, asString2);
                return iCompare == 0 ? collator.compare(contentValues.getAsString("intent"), contentValues2.getAsString("intent")) : iCompare;
            default:
                ThemeListFragment.ThemePackageInfo themePackageInfo = (ThemeListFragment.ThemePackageInfo) obj;
                ThemeListFragment.ThemePackageInfo themePackageInfo2 = (ThemeListFragment.ThemePackageInfo) obj2;
                int i5 = themePackageInfo.f46344e;
                int i11 = themePackageInfo2.f46344e;
                if (i5 == i11) {
                    return this.f70855b.compare(themePackageInfo.f46341b.toString(), themePackageInfo2.f46341b.toString());
                }
                return i5 < i11 ? -1 : 1;
        }
    }
}
