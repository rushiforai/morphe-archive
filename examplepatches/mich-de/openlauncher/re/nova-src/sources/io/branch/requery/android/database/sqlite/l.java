package io.branch.requery.android.database.sqlite;

import java.io.File;
import java.io.FileFilter;

/* loaded from: classes4.dex */
public final class l implements FileFilter {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ String f61853a;

    public l(String str) {
        this.f61853a = str;
    }

    @Override // java.io.FileFilter
    public final boolean accept(File file) {
        return file.getName().startsWith(this.f61853a);
    }
}
