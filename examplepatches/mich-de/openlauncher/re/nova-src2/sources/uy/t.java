package uy;

import android.content.Intent;
import android.os.Bundle;
import android.view.MenuItem;
import android.view.View;
import android.widget.PopupMenu;
import androidx.fragment.app.h1;
import com.teslacoilsw.launcher.drawer.drawergroups.DialogAddDrawerGroupFragment;
import com.teslacoilsw.launcher.drawer.drawergroups.DrawerTabSetupActivity;
import com.teslacoilsw.launcher.drawer.drawergroups.GroupAppListActivity;
import java.util.ArrayList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final /* synthetic */ class t implements View.OnClickListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f91758a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ y f91759b;

    public /* synthetic */ t(y yVar, int i5) {
        this.f91758a = i5;
        this.f91759b = yVar;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        switch (this.f91758a) {
            case 0:
                Object tag = view.getTag();
                Intrinsics.e(tag, "null cannot be cast to non-null type com.teslacoilsw.launcher.drawer.drawergroups.DrawerGroup");
                final s sVar = (s) tag;
                PopupMenu popupMenu = new PopupMenu(view.getContext(), view);
                popupMenu.inflate(2131755013);
                if (sVar instanceof l) {
                    popupMenu.getMenu().findItem(2131428349).setTitle(2132017985);
                    popupMenu.getMenu().removeItem(2131428350);
                    if (sVar.f91751c != n0.f91730b) {
                        popupMenu.getMenu().removeItem(2131428352);
                    } else if (!((l) sVar).d()) {
                        popupMenu.getMenu().clear();
                        popupMenu.getMenu().add(0, 2131428352, 0, 2132017793);
                    }
                } else if (sVar.e()) {
                    if (sVar instanceof j) {
                        popupMenu.getMenu().add(0, 2131428960, 0, 2132017684);
                    } else {
                        popupMenu.getMenu().add(0, 2131428960, 0, 2132017685);
                    }
                    if (!sVar.d()) {
                        popupMenu.getMenu().clear();
                        popupMenu.getMenu().add(0, 2131428352, 0, 2132017793);
                    }
                    popupMenu.getMenu().removeItem(2131428350);
                } else {
                    popupMenu.getMenu().removeItem(2131428352);
                }
                final y yVar = this.f91759b;
                popupMenu.setOnMenuItemClickListener(new PopupMenu.OnMenuItemClickListener() { // from class: uy.u
                    @Override // android.widget.PopupMenu.OnMenuItemClickListener
                    public final boolean onMenuItemClick(MenuItem menuItem) {
                        y yVar2 = yVar;
                        ArrayList arrayList = yVar2.f91776e;
                        DrawerTabSetupActivity drawerTabSetupActivity = yVar2.f91772a;
                        int itemId = menuItem.getItemId();
                        s sVar2 = sVar;
                        if (itemId == 2131428351) {
                            h1 supportFragmentManager = drawerTabSetupActivity.getSupportFragmentManager();
                            supportFragmentManager.getClass();
                            androidx.fragment.app.a aVar = new androidx.fragment.app.a(supportFragmentManager);
                            androidx.fragment.app.h0 h0VarE = drawerTabSetupActivity.getSupportFragmentManager().E("dialog");
                            if (h0VarE != null) {
                                aVar.s(h0VarE);
                            }
                            aVar.d();
                            DialogAddDrawerGroupFragment.o(sVar2).show(aVar, "dialog");
                            return true;
                        }
                        if (itemId == 2131428350) {
                            h1 supportFragmentManager2 = drawerTabSetupActivity.getSupportFragmentManager();
                            supportFragmentManager2.getClass();
                            androidx.fragment.app.a aVar2 = new androidx.fragment.app.a(supportFragmentManager2);
                            androidx.fragment.app.h0 h0VarE2 = drawerTabSetupActivity.getSupportFragmentManager().E("dialog");
                            if (h0VarE2 != null) {
                                aVar2.s(h0VarE2);
                            }
                            aVar2.d();
                            Bundle bundle = new Bundle();
                            bundle.putInt("id", sVar2.f91753e);
                            bundle.putString("title", sVar2.f91749a);
                            bundle.putString("tabType", sVar2.f91751c.toString());
                            DrawerTabSetupActivity.RemoveDialogFragment removeDialogFragment = new DrawerTabSetupActivity.RemoveDialogFragment();
                            removeDialogFragment.setArguments(bundle);
                            removeDialogFragment.show(aVar2, "dialog");
                            return true;
                        }
                        if (itemId == 2131428349) {
                            Intent intent = new Intent(drawerTabSetupActivity, (Class<?>) GroupAppListActivity.class);
                            if (sVar2 instanceof l) {
                                intent.putExtra("groupId", -1);
                            } else {
                                intent.putExtra("groupId", sVar2.f91753e);
                            }
                            drawerTabSetupActivity.startActivity(intent);
                            return true;
                        }
                        if (itemId == 2131428352) {
                            ps.i0.q(drawerTabSetupActivity, sVar2, !sVar2.d());
                            yVar2.notifyItemChanged(arrayList.indexOf(sVar2));
                            return true;
                        }
                        if (itemId != 2131428960) {
                            return false;
                        }
                        n0 n0Var = sVar2.f91751c;
                        l0 l0Var = n0.f91731c;
                        m0 m0Var = n0.f91732d;
                        n0 n0Var2 = n0Var == m0Var ? l0Var : m0Var;
                        if (n0Var2 != m0Var && n0Var2 != l0Var) {
                            throw new IllegalArgumentException("Cannot convert to type " + n0Var2);
                        }
                        if (n0Var != m0Var && n0Var != l0Var) {
                            throw new IllegalArgumentException("Cannot convert type of item " + sVar2);
                        }
                        sVar2.f91751c = n0Var2;
                        d0 d0Var = d0.f91699e;
                        s sVarH = d0Var.h(sVar2.f91753e);
                        sVarH.f91751c = n0Var2;
                        o oVarA = sVarH.a();
                        oVarA.f91740g = sVarH.f91751c;
                        oVarA.c(drawerTabSetupActivity.getContentResolver(), true);
                        d0Var.r(drawerTabSetupActivity);
                        yVar2.notifyItemChanged(arrayList.indexOf(sVar2));
                        return true;
                    }
                });
                popupMenu.show();
                break;
            case 1:
                this.f91759b.f91772a.b0(n0.f91731c);
                break;
            default:
                this.f91759b.f91772a.b0(n0.f91732d);
                break;
        }
    }
}
