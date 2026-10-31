package o80;

import aa.n;
import android.app.WallpaperInfo;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.AsyncTask;
import androidx.compose.ui.node.LayoutNode;
import com.android.launcher3.LauncherWallpaperPickerActivity;
import ct.v;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import ninja.sesame.lib.bridge.v1.SearchResults;
import ninja.sesame.lib.bridge.v1.SuggestOnComplete;
import o9.m2;
import o9.n2;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: classes5.dex */
public final class e extends AsyncTask {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f79721a;

    /* renamed from: b, reason: collision with root package name */
    public int f79722b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f79723c;

    /* renamed from: d, reason: collision with root package name */
    public final Object f79724d;

    public e(SearchResults searchResults, SuggestOnComplete suggestOnComplete, int i5) {
        this.f79721a = 0;
        this.f79723c = searchResults;
        this.f79724d = suggestOnComplete;
        this.f79722b = i5 < 0 ? LayoutNode.NotPlacedPlaceOrder : i5;
    }

    @Override // android.os.AsyncTask
    public final Object doInBackground(Object[] objArr) {
        Drawable nVar;
        Bitmap bitmap;
        switch (this.f79721a) {
            case 0:
                int i5 = this.f79722b;
                if (i5 != 0) {
                    try {
                        if (i.f() && a.f79714a) {
                            SearchResults searchResults = (SearchResults) this.f79723c;
                            searchResults.suggestions.addAll(((p80.a) i.f79735c).W(i5, searchResults.queryTerm));
                            break;
                        }
                    } catch (Throwable th2) {
                        t2.c.m(th2);
                        return null;
                    }
                }
                break;
            default:
                List[] listArr = (List[]) objArr;
                LauncherWallpaperPickerActivity launcherWallpaperPickerActivity = (LauncherWallpaperPickerActivity) this.f79723c;
                n2 n2Var = (n2) this.f79724d;
                boolean z11 = n2Var.f80031f;
                int i11 = n2Var.f80030e;
                int i12 = n2Var.f80029d;
                if (z11) {
                    PackageManager packageManager = launcherWallpaperPickerActivity.getApplicationContext().getPackageManager();
                    List list = listArr[0];
                    Collections.sort(list, new v(packageManager));
                    Iterator it = list.iterator();
                    while (true) {
                        if (!it.hasNext()) {
                            publishProgress(null);
                            break;
                        } else {
                            ResolveInfo resolveInfo = (ResolveInfo) it.next();
                            if (!n2Var.f80031f) {
                                break;
                            } else {
                                try {
                                    WallpaperInfo wallpaperInfo = new WallpaperInfo(launcherWallpaperPickerActivity, resolveInfo);
                                    try {
                                        nVar = wallpaperInfo.loadThumbnail(packageManager);
                                    } catch (Throwable th3) {
                                        th3.printStackTrace();
                                        nVar = null;
                                    }
                                    if ((nVar instanceof BitmapDrawable) && (bitmap = ((BitmapDrawable) nVar).getBitmap()) != null && bitmap.getWidth() > i12 && bitmap.getHeight() > i11) {
                                        float fMax = Math.max(i12 / bitmap.getWidth(), i11 / bitmap.getHeight());
                                        nVar = new n(Bitmap.createScaledBitmap(bitmap, (int) (bitmap.getWidth() * fMax), (int) (fMax * bitmap.getHeight()), true), 0, false);
                                    }
                                    new Intent("android.service.wallpaper.WallpaperService").setClassName(wallpaperInfo.getPackageName(), wallpaperInfo.getServiceName());
                                    m2 m2Var = new m2();
                                    m2Var.f79991c = nVar;
                                    m2Var.f79992d = wallpaperInfo;
                                    publishProgress(m2Var);
                                } catch (IOException e3) {
                                    mc0.b bVar = mc0.d.f76206a;
                                    bVar.r("LiveWallListAdptr.Elip");
                                    bVar.p(e3, "Skipping wallpaper %s", resolveInfo.serviceInfo);
                                } catch (XmlPullParserException e11) {
                                    mc0.b bVar2 = mc0.d.f76206a;
                                    bVar2.r("LiveWallListAdptr.Elip");
                                    bVar2.p(e11, "Skipping wallpaper %s", resolveInfo.serviceInfo);
                                }
                            }
                        }
                    }
                }
                break;
        }
        return null;
    }

    @Override // android.os.AsyncTask
    public void onPostExecute(Object obj) {
        switch (this.f79721a) {
            case 0:
                try {
                    ((SuggestOnComplete) this.f79724d).onComplete((SearchResults) this.f79723c);
                    break;
                } catch (Throwable th2) {
                    t2.c.m(th2);
                    return;
                }
            default:
                super.onPostExecute(obj);
                break;
        }
    }

    @Override // android.os.AsyncTask
    public void onProgressUpdate(Object[] objArr) {
        switch (this.f79721a) {
            case 1:
                m2[] m2VarArr = (m2[]) objArr;
                n2 n2Var = (n2) this.f79724d;
                boolean z11 = n2Var.f80031f;
                ArrayList arrayList = n2Var.f80028c;
                if (z11) {
                    for (m2 m2Var : m2VarArr) {
                        if (m2Var == null) {
                            n2Var.notifyDataSetChanged();
                            break;
                        } else {
                            Drawable drawable = m2Var.f79991c;
                            if (drawable != null) {
                                drawable.setDither(true);
                            }
                            if (this.f79722b < arrayList.size()) {
                                arrayList.set(this.f79722b, m2Var);
                            } else {
                                arrayList.add(m2Var);
                            }
                            this.f79722b++;
                        }
                    }
                    break;
                }
                break;
            default:
                super.onProgressUpdate(objArr);
                break;
        }
    }

    public e(n2 n2Var, LauncherWallpaperPickerActivity launcherWallpaperPickerActivity) {
        this.f79721a = 1;
        this.f79724d = n2Var;
        this.f79723c = launcherWallpaperPickerActivity;
        this.f79722b = 0;
    }
}
