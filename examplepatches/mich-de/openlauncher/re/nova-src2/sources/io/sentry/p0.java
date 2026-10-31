package io.sentry;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.OutputStream;
import java.io.Reader;

/* loaded from: classes4.dex */
public interface p0 {
    void a(e3 e3Var, OutputStream outputStream);

    e3 b(BufferedInputStream bufferedInputStream);

    Object c(BufferedReader bufferedReader, Class cls, x0 x0Var);

    Object d(Reader reader, Class cls);

    void e(Object obj, BufferedWriter bufferedWriter);
}
