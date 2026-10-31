package io.branch.requery.android.database.sqlite;

import b.c0;
import b.u4;
import java.util.Arrays;

/* loaded from: classes4.dex */
public abstract class t extends b implements d7.e {
    private static final String[] EMPTY_STRING_ARRAY = new String[0];
    private final Object[] mBindArgs;
    private final String[] mColumnNames;
    private final SQLiteDatabase mDatabase;
    private final int mNumParameters;
    private final boolean mReadOnly;
    private final String mSql;

    public t(SQLiteDatabase sQLiteDatabase, String str, Object[] objArr, w4.d dVar, boolean z11) {
        this.mDatabase = sQLiteDatabase;
        String strTrim = str.trim();
        this.mSql = strTrim;
        int iR = a.a.R(strTrim);
        if (iR == 4 || iR == 5 || iR == 6) {
            this.mReadOnly = z11;
            this.mColumnNames = EMPTY_STRING_ARRAY;
            this.mNumParameters = 0;
        } else {
            boolean z12 = true;
            if (iR != 1 && !z11) {
                z12 = false;
            }
            y yVar = new y();
            sQLiteDatabase.getThreadSession().l(strTrim, sQLiteDatabase.getThreadDefaultConnectionFlags(z12), dVar, yVar, z11);
            this.mReadOnly = yVar.f61880a;
            this.mColumnNames = (String[]) yVar.f61882c;
            this.mNumParameters = yVar.f61881b;
        }
        if (objArr != null && objArr.length > this.mNumParameters) {
            StringBuilder sb2 = new StringBuilder("Too many bind arguments.  ");
            sb2.append(objArr.length);
            sb2.append(" arguments were provided but the statement needs ");
            throw new IllegalArgumentException(c0.o(sb2, this.mNumParameters, " arguments."));
        }
        int i5 = this.mNumParameters;
        if (i5 == 0) {
            this.mBindArgs = null;
            return;
        }
        Object[] objArr2 = new Object[i5];
        this.mBindArgs = objArr2;
        if (objArr != null) {
            System.arraycopy(objArr, 0, objArr2, 0, objArr.length);
        }
    }

    public final void a(int i5, Object obj) {
        if (i5 < 1 || i5 > this.mNumParameters) {
            throw new IllegalArgumentException(c0.o(u4.j(i5, "Cannot bind argument at index ", " because the index is out of range.  The statement has "), this.mNumParameters, " parameters."));
        }
        this.mBindArgs[i5 - 1] = obj;
    }

    public void bindAllArgsAsStrings(String[] strArr) {
        if (strArr != null) {
            for (int length = strArr.length; length != 0; length--) {
                bindString(length, strArr[length - 1]);
            }
        }
    }

    @Override // d7.e
    public void bindBlob(int i5, byte[] bArr) {
        if (bArr == null) {
            throw new IllegalArgumentException(c0.i(i5, "the bind value at index ", " is null"));
        }
        a(i5, bArr);
    }

    @Override // d7.e
    public void bindDouble(int i5, double d5) {
        a(i5, Double.valueOf(d5));
    }

    @Override // d7.e
    public void bindLong(int i5, long j11) {
        a(i5, Long.valueOf(j11));
    }

    @Override // d7.e
    public void bindNull(int i5) {
        a(i5, null);
    }

    public void bindObject(int i5, Object obj) {
        if (obj == null) {
            bindNull(i5);
            return;
        }
        if ((obj instanceof Double) || (obj instanceof Float)) {
            bindDouble(i5, ((Number) obj).doubleValue());
            return;
        }
        if (obj instanceof Number) {
            bindLong(i5, ((Number) obj).longValue());
            return;
        }
        if (obj instanceof Boolean) {
            if (((Boolean) obj).booleanValue()) {
                bindLong(i5, 1L);
                return;
            } else {
                bindLong(i5, 0L);
                return;
            }
        }
        if (obj instanceof byte[]) {
            bindBlob(i5, (byte[]) obj);
        } else {
            bindString(i5, obj.toString());
        }
    }

    @Override // d7.e
    public void bindString(int i5, String str) {
        if (str == null) {
            throw new IllegalArgumentException(c0.i(i5, "the bind value at index ", " is null"));
        }
        a(i5, str);
    }

    public void clearBindings() {
        Object[] objArr = this.mBindArgs;
        if (objArr != null) {
            Arrays.fill(objArr, (Object) null);
        }
    }

    public final Object[] getBindArgs() {
        return this.mBindArgs;
    }

    public final String[] getColumnNames() {
        return this.mColumnNames;
    }

    public final int getConnectionFlags() {
        return this.mDatabase.getThreadDefaultConnectionFlags(this.mReadOnly);
    }

    public final SQLiteDatabase getDatabase() {
        return this.mDatabase;
    }

    public final x getSession() {
        return this.mDatabase.getThreadSession();
    }

    public final String getSql() {
        return this.mSql;
    }

    @Override // io.branch.requery.android.database.sqlite.b
    public void onAllReferencesReleased() {
        clearBindings();
    }

    public final void onCorruption() {
        this.mDatabase.onCorruption();
    }
}
