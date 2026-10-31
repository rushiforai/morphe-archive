package io.branch.search.internal;

import android.database.Cursor;
import android.database.SQLException;
import android.util.TimingLogger;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CancellationException;
import java.util.concurrent.locks.ReentrantLock;
import kotlin.Deprecated;
import kotlin.ExceptionsKt;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import org.jetbrains.annotations.NotNull;

@Deprecated
/* renamed from: io.branch.search.internal.rb, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3352rb {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final C3336qb f65631a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final ReentrantLock f65632b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final String f65633c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final String f65634d;

    /* renamed from: io.branch.search.internal.rb$a */
    public static final class a {
    }

    /* renamed from: io.branch.search.internal.rb$b */
    public static final class b extends Lambda implements Function1<C3336qb, Unit> {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ String f65635a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ String[] f65636b;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ w4.d f65637c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ TimingLogger f65638d;

        /* renamed from: e, reason: collision with root package name */
        public final /* synthetic */ InterfaceC3167gb<T, R> f65639e;

        /* renamed from: f, reason: collision with root package name */
        public final /* synthetic */ String f65640f;

        /* renamed from: g, reason: collision with root package name */
        public final /* synthetic */ List<T> f65641g;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public b(String str, String[] strArr, w4.d dVar, TimingLogger timingLogger, InterfaceC3167gb interfaceC3167gb, String str2, ArrayList arrayList) {
            super(1);
            this.f65635a = str;
            this.f65636b = strArr;
            this.f65637c = dVar;
            this.f65638d = timingLogger;
            this.f65639e = interfaceC3167gb;
            this.f65640f = str2;
            this.f65641g = arrayList;
        }

        @Override // kotlin.jvm.functions.Function1
        public final Object invoke(Object obj) throws IOException {
            boolean z11;
            C3336qb inReadTransaction = (C3336qb) obj;
            Intrinsics.g(inReadTransaction, "$this$inReadTransaction");
            Cursor cursorA = ((C3178h5) inReadTransaction.q()).a(this.f65635a, this.f65636b, this.f65637c);
            TimingLogger timingLogger = this.f65638d;
            w4.d dVar = this.f65637c;
            InterfaceC3167gb<T, R> interfaceC3167gb = this.f65639e;
            String str = this.f65640f;
            List<T> list = this.f65641g;
            try {
                timingLogger.addSplit("Create cursor");
                while (cursorA.moveToNext()) {
                    Intrinsics.g(dVar, "<this>");
                    synchronized (dVar) {
                        z11 = dVar.f93744a;
                    }
                    if (z11) {
                        throw new CancellationException();
                    }
                    Object objA = interfaceC3167gb.a(cursorA, str);
                    if (objA != null) {
                        list.add(objA);
                    }
                }
                timingLogger.addSplit("Iter over rows");
                Unit unit = Unit.f71706a;
                cursorA.close();
                return unit;
            } finally {
            }
        }
    }

    /* renamed from: io.branch.search.internal.rb$c */
    public static final class c extends Lambda implements Function1<C3336qb, Unit> {

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ List<String> f65643b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public c(List<String> list) {
            super(1);
            this.f65643b = list;
        }

        @Override // kotlin.jvm.functions.Function1
        public final Object invoke(Object obj) {
            C3336qb inWriteTransaction = (C3336qb) obj;
            Intrinsics.g(inWriteTransaction, "$this$inWriteTransaction");
            InterfaceC3365s7 interfaceC3365s7Q = C3352rb.this.f65631a.q();
            List<String> statements = this.f65643b;
            Intrinsics.g(statements, "statements");
            ((C3178h5) interfaceC3365s7Q).f64647a.definePrioritySql(statements);
            return Unit.f71706a;
        }
    }

    public C3352rb(@NotNull C3336qb rawDatabase) {
        Intrinsics.g(rawDatabase, "rawDatabase");
        this.f65631a = rawDatabase;
        this.f65632b = new ReentrantLock();
        this.f65633c = rawDatabase.getName();
        this.f65634d = rawDatabase.getName();
    }

    public static Exception a(C3352rb c3352rb, Function1 func) {
        c3352rb.getClass();
        Intrinsics.g(func, "func");
        InterfaceC3365s7 interfaceC3365s7Q = c3352rb.f65631a.q();
        try {
            ((C3178h5) interfaceC3365s7Q).f64647a.beginTransaction(false);
            func.invoke(interfaceC3365s7Q);
            ((C3178h5) interfaceC3365s7Q).f64647a.setTransactionSuccessful();
            try {
                if (((C3178h5) interfaceC3365s7Q).f64647a.isOpen() && ((C3178h5) interfaceC3365s7Q).f64647a.inTransaction()) {
                    ((C3178h5) interfaceC3365s7Q).f64647a.endTransaction();
                }
                return null;
            } catch (Exception e3) {
                return e3;
            }
        } catch (Exception e11) {
            try {
                if (((C3178h5) interfaceC3365s7Q).f64647a.isOpen() && ((C3178h5) interfaceC3365s7Q).f64647a.inTransaction()) {
                    ((C3178h5) interfaceC3365s7Q).f64647a.endTransaction();
                }
                return e11;
            } catch (Exception e12) {
                ExceptionsKt.a(e12, e11);
                return e12;
            }
        } catch (Throwable th2) {
            try {
                if (((C3178h5) interfaceC3365s7Q).f64647a.isOpen() && ((C3178h5) interfaceC3365s7Q).f64647a.inTransaction()) {
                    ((C3178h5) interfaceC3365s7Q).f64647a.endTransaction();
                }
            } catch (Exception unused) {
            }
            throw th2;
        }
    }

    public final void b(@NotNull Function1 func) {
        Intrinsics.g(func, "func");
        C3336qb c3336qb = this.f65631a;
        c3336qb.getClass();
        c3336qb.a(false, func);
    }

    public final <T, R> R a(@NotNull String sessionId, @NotNull String query, @NotNull String[] params, @NotNull InterfaceC3167gb<T, R> accum, @NotNull N1 branchCancellationSignal) throws SQLException {
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(query, "query");
        Intrinsics.g(params, "params");
        Intrinsics.g(accum, "accum");
        Intrinsics.g(branchCancellationSignal, "branchCancellationSignal");
        TimingLogger timingLogger = new TimingLogger("BRANCH_RawSQLiteDB", "doQuery");
        timingLogger.addSplit("Got DB");
        ArrayList arrayList = new ArrayList();
        w4.d dVar = new w4.d();
        O1 o12 = new O1(dVar);
        branchCancellationSignal.f62958a.add(o12);
        if (branchCancellationSignal.f62959b.get()) {
            o12.invoke();
        }
        a(new b(query, params, dVar, timingLogger, accum, sessionId, arrayList));
        timingLogger.dumpToLog();
        return (R) accum.a(sessionId, arrayList);
    }

    public final <O> O a(@NotNull Function1<? super C3336qb, ? extends O> func) {
        Intrinsics.g(func, "func");
        C3336qb c3336qb = this.f65631a;
        c3336qb.getClass();
        return (O) c3336qb.a(true, func);
    }

    public final void a(@NotNull List<String> statements) {
        Intrinsics.g(statements, "statements");
        if (this.f65631a.f65567a.a() < statements.size()) {
            C3309p1.b(EnumC3131e9.Database, "Max cache size to low, to fit prioritized statements " + this.f65631a.f65567a.a() + ' ' + statements.size());
        }
        b(new c(statements));
    }
}
