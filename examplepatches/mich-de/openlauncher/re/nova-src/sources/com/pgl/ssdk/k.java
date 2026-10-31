package com.pgl.ssdk;

import com.pgl.ssdk.ces.out.DungeonFlag;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.cert.Certificate;
import java.security.cert.CertificateException;
import java.security.cert.CertificateFactory;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

/* loaded from: classes4.dex */
public class k {
    @DungeonFlag
    public static List<e> a(File file) throws Throwable {
        CertificateFactory certificateFactory;
        FileInputStream fileInputStream;
        ZipInputStream zipInputStream = null;
        try {
            certificateFactory = CertificateFactory.getInstance("X.509");
        } catch (CertificateException unused) {
            certificateFactory = null;
        }
        if (certificateFactory == null) {
            return null;
        }
        ArrayList arrayList = new ArrayList();
        try {
            fileInputStream = new FileInputStream(file);
            try {
                ZipInputStream zipInputStream2 = new ZipInputStream(fileInputStream);
                while (true) {
                    try {
                        ZipEntry nextEntry = zipInputStream2.getNextEntry();
                        if (nextEntry != null) {
                            String name = nextEntry.getName();
                            if (name.startsWith("META-INF/")) {
                                if (name.endsWith(".RSA") || name.endsWith(".DSA") || name.endsWith(".EC")) {
                                    try {
                                        for (Certificate certificate : certificateFactory.generateCertificates(new ByteArrayInputStream(a(zipInputStream2)))) {
                                            if (certificate instanceof X509Certificate) {
                                                arrayList.add(new e(String.valueOf(((X509Certificate) certificate).getSubjectDN()), certificate.getEncoded()));
                                            }
                                        }
                                    } catch (CertificateException unused2) {
                                    }
                                } else {
                                    zipInputStream2.closeEntry();
                                }
                            }
                        } else {
                            try {
                                break;
                            } catch (IOException unused3) {
                            }
                        }
                    } catch (IOException unused4) {
                        zipInputStream = zipInputStream2;
                        if (zipInputStream != null) {
                            try {
                                zipInputStream.close();
                            } catch (IOException unused5) {
                            }
                        }
                        if (fileInputStream != null) {
                            fileInputStream.close();
                        }
                        return arrayList;
                    } catch (Throwable th2) {
                        zipInputStream = zipInputStream2;
                        th = th2;
                        if (zipInputStream != null) {
                            try {
                                zipInputStream.close();
                            } catch (IOException unused6) {
                            }
                        }
                        if (fileInputStream == null) {
                            throw th;
                        }
                        try {
                            fileInputStream.close();
                            throw th;
                        } catch (IOException unused7) {
                            throw th;
                        }
                    }
                }
                zipInputStream2.close();
            } catch (IOException unused8) {
            } catch (Throwable th3) {
                th = th3;
            }
        } catch (IOException unused9) {
            fileInputStream = null;
        } catch (Throwable th4) {
            th = th4;
            fileInputStream = null;
        }
        try {
            fileInputStream.close();
        } catch (IOException unused10) {
        }
        return arrayList;
    }

    private static byte[] a(InputStream inputStream) throws IOException {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        byte[] bArr = new byte[1024];
        while (true) {
            int i5 = inputStream.read(bArr);
            if (i5 == -1) {
                return byteArrayOutputStream.toByteArray();
            }
            byteArrayOutputStream.write(bArr, 0, i5);
        }
    }
}
