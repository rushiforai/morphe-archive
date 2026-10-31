package io.branch.search.internal;

import android.content.ContentValues;
import android.database.SQLException;
import com.tiktok.util.TTConst;
import io.branch.search.ui.BranchEntity;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* renamed from: io.branch.search.internal.m, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3256m extends Lambda implements Function1<C3336qb, Unit> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ C3273n f65070a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ BranchEntity f65071b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3256m(C3273n c3273n, BranchEntity.App app) {
        super(1);
        this.f65070a = c3273n;
        this.f65071b = app;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) throws SQLException {
        C3189i c3189i;
        String str;
        C3336qb inWriteTransaction = (C3336qb) obj;
        Intrinsics.g(inWriteTransaction, "$this$inWriteTransaction");
        C3273n c3273n = this.f65070a;
        BranchEntity branchEntity = this.f65071b;
        c3273n.getClass();
        b50.a aVarF = branchEntity.getF66462a().f();
        if (aVarF == null || (str = aVarF.f17556a) == null) {
            c3189i = null;
        } else {
            int f66466e = branchEntity.getF66466e();
            String strA = f66466e != 0 ? b50.e.a(f66466e) : null;
            if (strA == null) {
                strA = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
            c3189i = new C3189i(str, strA);
        }
        if (c3189i == null) {
            return null;
        }
        C3239l c3239lI = inWriteTransaction.f65567a.i();
        c3239lI.getClass();
        C3178h5 writableDatabase = c3239lI.f64935a.getWritableDatabase();
        ContentValues contentValues = new ContentValues();
        contentValues.put("package_name", c3189i.f64692a);
        contentValues.put(TTConst.TRACK_TYPE, c3189i.f64693b);
        writableDatabase.f64647a.insert("ads_blacklist", 4, contentValues);
        return Unit.f71706a;
    }
}
