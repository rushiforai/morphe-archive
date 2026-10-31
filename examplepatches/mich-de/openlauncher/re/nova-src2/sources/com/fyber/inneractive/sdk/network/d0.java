package com.fyber.inneractive.sdk.network;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.AssetFileDescriptor;
import com.fyber.inneractive.sdk.util.IAlog;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

/* loaded from: classes.dex */
public class d0 {

    /* renamed from: a, reason: collision with root package name */
    public final Context f28698a;

    /* renamed from: b, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.cache.a f28699b;

    /* renamed from: c, reason: collision with root package name */
    public SharedPreferences f28700c;

    public d0(Context context, com.fyber.inneractive.sdk.cache.a aVar) {
        this.f28698a = context;
        this.f28699b = aVar;
    }

    public com.fyber.inneractive.sdk.cache.n a() throws Throwable {
        try {
            if (!this.f28699b.d()) {
                new c0();
                return new com.fyber.inneractive.sdk.cache.n();
            }
            Object objA = this.f28699b.a(a(this.f28699b.c()));
            if (this.f28700c == null) {
                this.f28700c = this.f28698a.getSharedPreferences("IAConfigurationPreferences", 0);
            }
            return new com.fyber.inneractive.sdk.cache.n(objA, this.f28700c.getString(this.f28699b.b(), null));
        } catch (Exception unused) {
            b();
            return new com.fyber.inneractive.sdk.cache.n();
        }
    }

    public final void b(String str) {
        if (this.f28700c == null) {
            this.f28700c = this.f28698a.getSharedPreferences("IAConfigurationPreferences", 0);
        }
        this.f28700c.edit().putString(this.f28699b.b(), str).apply();
    }

    public final void b() {
        if (this.f28700c == null) {
            this.f28700c = this.f28698a.getSharedPreferences("IAConfigurationPreferences", 0);
        }
        this.f28700c.edit().remove(this.f28699b.b()).apply();
    }

    public boolean a(String str, String str2) throws IOException {
        boolean z11;
        IAlog.a("caching file %s", str);
        FileOutputStream fileOutputStreamOpenFileOutput = null;
        boolean z12 = false;
        try {
            try {
                fileOutputStreamOpenFileOutput = this.f28698a.openFileOutput(str, 0);
                fileOutputStreamOpenFileOutput.write(str2.getBytes());
                z11 = true;
            } finally {
                if (fileOutputStreamOpenFileOutput != null) {
                    try {
                        fileOutputStreamOpenFileOutput.close();
                    } catch (Exception e3) {
                        IAlog.f("Failed closing cache file: %s", e3.getMessage());
                    }
                }
            }
        } catch (Exception e11) {
            e = e11;
        }
        try {
            IAlog.a("File cached successfully", new Object[0]);
            try {
                fileOutputStreamOpenFileOutput.close();
            } catch (Exception e12) {
                IAlog.f("Failed closing cache file: %s", e12.getMessage());
            }
        } catch (Exception e13) {
            e = e13;
            z12 = true;
            IAlog.f("Failed caching file: %s", e.getMessage());
            z11 = z12;
            return z11;
        }
        return z11;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:39:0x0072 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final String a(String str) throws Throwable {
        FileInputStream fileInputStreamOpenFileInput;
        IAlog.a("reading local file: %s", str);
        AssetFileDescriptor.AutoCloseInputStream autoCloseInputStream = 0;
        str = null;
        str = null;
        String str2 = null;
        try {
            try {
                fileInputStreamOpenFileInput = this.f28698a.openFileInput(str);
                try {
                    byte[] bArr = new byte[fileInputStreamOpenFileInput.available()];
                    fileInputStreamOpenFileInput.read(bArr);
                    String str3 = new String(bArr, "UTF-8");
                    try {
                        fileInputStreamOpenFileInput.close();
                    } catch (Exception e3) {
                        IAlog.f("Failed closing local file: %s", e3.getMessage());
                    }
                    str2 = str3;
                } catch (Exception e11) {
                    e = e11;
                    if (!(e instanceof FileNotFoundException)) {
                        IAlog.a("Failed reading local file: %s", e.getMessage());
                        if (fileInputStreamOpenFileInput != null) {
                            try {
                                fileInputStreamOpenFileInput.close();
                            } catch (Exception e12) {
                                IAlog.f("Failed closing local file: %s", e12.getMessage());
                            }
                        }
                        IAlog.a("local file %s read successfully", str);
                        return str2;
                    }
                    throw new FileNotFoundException();
                }
            } catch (Throwable th2) {
                th = th2;
                autoCloseInputStream = "reading local file: %s";
                if (autoCloseInputStream != 0) {
                    try {
                        autoCloseInputStream.close();
                    } catch (Exception e13) {
                        IAlog.f("Failed closing local file: %s", e13.getMessage());
                    }
                }
                throw th;
            }
        } catch (Exception e14) {
            e = e14;
            fileInputStreamOpenFileInput = null;
        } catch (Throwable th3) {
            th = th3;
            if (autoCloseInputStream != 0) {
            }
            throw th;
        }
        IAlog.a("local file %s read successfully", str);
        return str2;
    }
}
