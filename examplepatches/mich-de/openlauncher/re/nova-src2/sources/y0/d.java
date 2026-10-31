package y0;

import android.app.ActivityOptions;
import android.app.PendingIntent;
import android.app.RemoteAction;
import android.content.Context;
import android.os.Build;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.textclassifier.TextClassification;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class d implements o {

    /* renamed from: a, reason: collision with root package name */
    public final e f96507a;

    /* renamed from: b, reason: collision with root package name */
    public final a f96508b;

    /* renamed from: c, reason: collision with root package name */
    public final a f96509c;

    /* renamed from: d, reason: collision with root package name */
    public final View f96510d;

    public d(e eVar, a aVar, a aVar2, View view) {
        this.f96507a = eVar;
        this.f96508b = aVar;
        this.f96509c = aVar2;
        this.f96510d = view;
    }

    public final boolean a(Menu menu) {
        int i5;
        w0.c cVar = (w0.c) this.f96508b.invoke();
        int i11 = 0;
        if (Intrinsics.b(cVar, null)) {
            return false;
        }
        menu.clear();
        List list = cVar.f93416a;
        int size = list.size();
        int i12 = 0;
        int i13 = 1;
        int i14 = 1;
        while (i12 < size) {
            w0.b bVar = (w0.b) list.get(i12);
            if (bVar instanceof w0.d) {
                i5 = i13 + 1;
                final w0.d dVar = (w0.d) bVar;
                MenuItem menuItemAdd = menu.add(i14, i13, i13, dVar.f93417b);
                menuItemAdd.setShowAsAction(2);
                final int i15 = 0;
                menuItemAdd.setOnMenuItemClickListener(new MenuItem.OnMenuItemClickListener() { // from class: y0.c
                    @Override // android.view.MenuItem.OnMenuItemClickListener
                    public final boolean onMenuItemClick(MenuItem menuItem) throws PendingIntent.CanceledException {
                        switch (i15) {
                            case 0:
                                ((w0.d) dVar).f93419d.invoke(((d) this).f96507a);
                                break;
                            default:
                                Context context = (Context) dVar;
                                TextClassification textClassification = (TextClassification) this;
                                String text = textClassification.getText();
                                PendingIntent activity = PendingIntent.getActivity(context, text != null ? text.hashCode() : 0, textClassification.getIntent(), 201326592);
                                if (Build.VERSION.SDK_INT < 34) {
                                    activity.send();
                                    break;
                                } else {
                                    try {
                                        activity.send(ActivityOptions.makeBasic().setPendingIntentBackgroundActivityStartMode(1).toBundle());
                                        break;
                                    } catch (PendingIntent.CanceledException e3) {
                                        Log.e("TextClassification", "error sending pendingIntent: " + activity + " error: " + e3);
                                        return true;
                                    }
                                }
                        }
                        return true;
                    }
                });
            } else {
                if (bVar instanceof w0.h) {
                    if (Build.VERSION.SDK_INT >= 28) {
                        i5 = i13 + 1;
                        final Context context = this.f96510d.getContext();
                        w0.h hVar = (w0.h) bVar;
                        final TextClassification textClassification = hVar.f93426b;
                        int i16 = hVar.f93427c;
                        if (i16 < 0) {
                            MenuItem menuItemAdd2 = menu.add(16908353, 16908353, i13, textClassification.getLabel());
                            menuItemAdd2.setShowAsAction(2);
                            menuItemAdd2.setIcon(textClassification.getIcon());
                            final int i17 = 1;
                            menuItemAdd2.setOnMenuItemClickListener(new MenuItem.OnMenuItemClickListener() { // from class: y0.c
                                @Override // android.view.MenuItem.OnMenuItemClickListener
                                public final boolean onMenuItemClick(MenuItem menuItem) throws PendingIntent.CanceledException {
                                    switch (i17) {
                                        case 0:
                                            ((w0.d) context).f93419d.invoke(((d) textClassification).f96507a);
                                            break;
                                        default:
                                            Context context2 = (Context) context;
                                            TextClassification textClassification2 = (TextClassification) textClassification;
                                            String text = textClassification2.getText();
                                            PendingIntent activity = PendingIntent.getActivity(context2, text != null ? text.hashCode() : 0, textClassification2.getIntent(), 201326592);
                                            if (Build.VERSION.SDK_INT < 34) {
                                                activity.send();
                                                break;
                                            } else {
                                                try {
                                                    activity.send(ActivityOptions.makeBasic().setPendingIntentBackgroundActivityStartMode(1).toBundle());
                                                    break;
                                                } catch (PendingIntent.CanceledException e3) {
                                                    Log.e("TextClassification", "error sending pendingIntent: " + activity + " error: " + e3);
                                                    return true;
                                                }
                                            }
                                    }
                                    return true;
                                }
                            });
                        } else {
                            int i18 = i16 == 0 ? 1 : i11;
                            final RemoteAction remoteAction = (RemoteAction) textClassification.getActions().get(i16);
                            MenuItem menuItemAdd3 = menu.add(16908353, i18 != 0 ? 16908353 : i11, i13, remoteAction.getTitle());
                            menuItemAdd3.setShowAsAction(i18 == 0 ? 0 : 2);
                            if (i18 != 0 || remoteAction.shouldShowIcon()) {
                                menuItemAdd3.setIcon(remoteAction.getIcon().loadDrawable(context));
                            }
                            menuItemAdd3.setOnMenuItemClickListener(new MenuItem.OnMenuItemClickListener() { // from class: y0.r
                                @Override // android.view.MenuItem.OnMenuItemClickListener
                                public final boolean onMenuItemClick(MenuItem menuItem) throws PendingIntent.CanceledException {
                                    PendingIntent actionIntent = remoteAction.getActionIntent();
                                    if (Build.VERSION.SDK_INT < 34) {
                                        actionIntent.send();
                                        return true;
                                    }
                                    try {
                                        actionIntent.send(ActivityOptions.makeBasic().setPendingIntentBackgroundActivityStartMode(1).toBundle());
                                    } catch (PendingIntent.CanceledException e3) {
                                        Log.e("TextClassification", "error sending pendingIntent: " + actionIntent + " error: " + e3);
                                    }
                                    return true;
                                }
                            });
                        }
                    }
                } else if (bVar instanceof w0.f) {
                    i14++;
                }
                i12++;
                i11 = 0;
            }
            i13 = i5;
            i12++;
            i11 = 0;
        }
        return true;
    }
}
