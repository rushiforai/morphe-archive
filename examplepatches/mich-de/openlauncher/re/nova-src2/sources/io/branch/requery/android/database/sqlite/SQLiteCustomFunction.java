package io.branch.requery.android.database.sqlite;

/* loaded from: classes4.dex */
public final class SQLiteCustomFunction {
    public final o callback;
    public final String name;
    public final int numArgs;

    public SQLiteCustomFunction(String str, int i5, o oVar) {
        if (str == null) {
            throw new IllegalArgumentException("name must not be null.");
        }
        this.name = str;
        this.numArgs = i5;
    }

    private String dispatchCallback(String[] strArr) {
        throw null;
    }
}
