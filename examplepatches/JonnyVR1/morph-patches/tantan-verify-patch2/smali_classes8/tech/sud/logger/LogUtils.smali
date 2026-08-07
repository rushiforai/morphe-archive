.class public final Ltech/sud/logger/LogUtils;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final A:I = 0x7

.field public static final D:I = 0x3

.field public static final E:I = 0x6

.field public static final I:I = 0x4

.field public static final LINE_SEP:Ljava/lang/String;

.field public static final Sudbyte:Ljava/util/concurrent/ExecutorService;

.field public static final Sudcase:Landroid/util/ArrayMap;

.field public static final Suddo:[C

.field public static final Sudfor:Ltech/sud/logger/Sudcase;

.field public static final Sudif:Ljava/lang/String;

.field public static Sudint:Z = false

.field public static Sudnew:Ljava/text/SimpleDateFormat; = null

.field public static final Sudtry:I

.field public static final V:I = 0x2

.field public static final W:I = 0x5


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x6

    .line 2
    new-array v0, v0, [C

    .line 3
    .line 4
    fill-array-data v0, :array_0

    .line 5
    .line 6
    .line 7
    sput-object v0, Ltech/sud/logger/LogUtils;->Suddo:[C

    .line 8
    .line 9
    const-string v0, "file.separator"

    .line 10
    .line 11
    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Ltech/sud/logger/LogUtils;->Sudif:Ljava/lang/String;

    .line 16
    .line 17
    const-string v0, "line.separator"

    .line 18
    .line 19
    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sput-object v0, Ltech/sud/logger/LogUtils;->LINE_SEP:Ljava/lang/String;

    .line 24
    .line 25
    new-instance v0, Ltech/sud/logger/Sudcase;

    .line 26
    .line 27
    invoke-direct {v0}, Ltech/sud/logger/Sudcase;-><init>()V

    .line 28
    .line 29
    .line 30
    sput-object v0, Ltech/sud/logger/LogUtils;->Sudfor:Ltech/sud/logger/Sudcase;

    .line 31
    .line 32
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    sput v0, Ltech/sud/logger/LogUtils;->Sudtry:I

    .line 37
    .line 38
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    sput-object v0, Ltech/sud/logger/LogUtils;->Sudbyte:Ljava/util/concurrent/ExecutorService;

    .line 43
    .line 44
    new-instance v0, Landroid/util/ArrayMap;

    .line 45
    .line 46
    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    .line 47
    .line 48
    .line 49
    sput-object v0, Ltech/sud/logger/LogUtils;->Sudcase:Landroid/util/ArrayMap;

    .line 50
    .line 51
    invoke-static {}, Ltech/sud/logger/LogUtils;->Suddo()V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :array_0
    .array-data 2
        0x56s
        0x44s
        0x49s
        0x57s
        0x45s
        0x41s
    .end array-data
.end method

.method public static Suddo(Ljava/lang/Object;)Ljava/lang/String;
    .locals 5

    if-nez p0, :cond_0

    .line 193
    const-string p0, "null"

    return-object p0

    .line 194
    :cond_0
    sget-object v0, Ltech/sud/logger/LogUtils;->Sudcase:Landroid/util/ArrayMap;

    invoke-virtual {v0}, Landroid/util/ArrayMap;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_9

    .line 195
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    .line 196
    invoke-virtual {v1}, Ljava/lang/Class;->isAnonymousClass()Z

    move-result v2

    if-nez v2, :cond_1

    invoke-virtual {v1}, Ljava/lang/Class;->isSynthetic()Z

    move-result v2

    if-eqz v2, :cond_7

    .line 197
    :cond_1
    invoke-virtual {v1}, Ljava/lang/Class;->getGenericInterfaces()[Ljava/lang/reflect/Type;

    move-result-object v2

    .line 198
    array-length v3, v2

    const/4 v4, 0x1

    if-ne v3, v4, :cond_3

    const/4 v3, 0x0

    .line 199
    aget-object v2, v2, v3

    .line 200
    :goto_0
    instance-of v3, v2, Ljava/lang/reflect/ParameterizedType;

    if-eqz v3, :cond_2

    .line 201
    check-cast v2, Ljava/lang/reflect/ParameterizedType;

    invoke-interface {v2}, Ljava/lang/reflect/ParameterizedType;->getRawType()Ljava/lang/reflect/Type;

    move-result-object v2

    goto :goto_0

    .line 202
    :cond_2
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_2

    .line 203
    :cond_3
    invoke-virtual {v1}, Ljava/lang/Class;->getGenericSuperclass()Ljava/lang/reflect/Type;

    move-result-object v2

    .line 204
    :goto_1
    instance-of v3, v2, Ljava/lang/reflect/ParameterizedType;

    if-eqz v3, :cond_4

    .line 205
    check-cast v2, Ljava/lang/reflect/ParameterizedType;

    invoke-interface {v2}, Ljava/lang/reflect/ParameterizedType;->getRawType()Ljava/lang/reflect/Type;

    move-result-object v2

    goto :goto_1

    .line 206
    :cond_4
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 207
    :goto_2
    const-string v3, "class "

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    const/4 v3, 0x6

    .line 208
    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_3

    .line 209
    :cond_5
    const-string v3, "interface "

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_6

    const/16 v3, 0xa

    .line 210
    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 211
    :cond_6
    :goto_3
    :try_start_0
    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_4

    :catch_0
    move-exception v2

    .line 212
    invoke-virtual {v2}, Ljava/lang/Throwable;->printStackTrace()V

    .line 213
    :cond_7
    :goto_4
    invoke-virtual {v0, v1}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_8

    goto :goto_5

    .line 214
    :cond_8
    new-instance p0, Ljava/lang/ClassCastException;

    invoke-direct {p0}, Ljava/lang/ClassCastException;-><init>()V

    throw p0

    :cond_9
    :goto_5
    const/4 v0, -0x1

    .line 215
    invoke-static {v0, p0}, Ltech/sud/logger/Sudchar;->Suddo(ILjava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static Suddo(Ljava/lang/StackTraceElement;)Ljava/lang/String;
    .locals 2

    .line 238
    invoke-virtual {p0}, Ljava/lang/StackTraceElement;->getFileName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    .line 239
    :cond_0
    invoke-virtual {p0}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object p0

    .line 240
    const-string v0, "\\."

    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 241
    array-length v1, v0

    if-lez v1, :cond_1

    .line 242
    array-length p0, v0

    add-int/lit8 p0, p0, -0x1

    aget-object p0, v0, p0

    :cond_1
    const/16 v0, 0x24

    .line 243
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_2

    const/4 v1, 0x0

    .line 244
    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 245
    :cond_2
    const-string v0, ".java"

    invoke-virtual {p0, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static Suddo()V
    .locals 4

    .line 246
    invoke-static {}, Ltech/sud/base/utils/Utils;->getApp()Landroid/app/Application;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_3

    .line 247
    :cond_0
    invoke-static {}, Ltech/sud/logger/LogUtils;->getConfig()Ltech/sud/logger/Sudcase;

    move-result-object v1

    if-eqz v1, :cond_4

    const/4 v2, 0x0

    .line 248
    iput-boolean v2, v1, Ltech/sud/logger/Sudcase;->Sudint:Z

    const/4 v3, 0x5

    .line 249
    iput v3, v1, Ltech/sud/logger/Sudcase;->Sudbyte:I

    .line 250
    iput-boolean v2, v1, Ltech/sud/logger/Sudcase;->Sudnew:Z

    .line 251
    iput-boolean v2, v1, Ltech/sud/logger/Sudcase;->Sudtry:Z

    .line 252
    invoke-static {v0}, Ltech/sud/logger/LogUtils;->getLogDirPath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 253
    invoke-static {v0}, Ltech/sud/base/utils/UtilsBridge;->isSpace(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v0, 0x0

    .line 254
    iput-object v0, v1, Ltech/sud/logger/Sudcase;->Sudif:Ljava/lang/String;

    goto :goto_1

    .line 255
    :cond_1
    sget-object v2, Ltech/sud/logger/LogUtils;->Sudif:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    goto :goto_0

    :cond_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    iput-object v0, v1, Ltech/sud/logger/Sudcase;->Sudif:Ljava/lang/String;

    .line 256
    :goto_1
    const-string v0, "SudMGP"

    invoke-static {v0}, Ltech/sud/base/utils/UtilsBridge;->isSpace(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 257
    const-string v0, "util"

    iput-object v0, v1, Ltech/sud/logger/Sudcase;->Sudfor:Ljava/lang/String;

    goto :goto_2

    .line 258
    :cond_3
    iput-object v0, v1, Ltech/sud/logger/Sudcase;->Sudfor:Ljava/lang/String;

    :goto_2
    const-wide/32 v2, 0x1400000

    .line 259
    iput-wide v2, v1, Ltech/sud/logger/Sudcase;->Sudgoto:J

    const/4 v0, 0x4

    .line 260
    iput v0, v1, Ltech/sud/logger/Sudcase;->Sudlong:I

    const/4 v0, 0x1

    .line 261
    sput-boolean v0, Ltech/sud/logger/LogUtils;->Sudint:Z

    :cond_4
    :goto_3
    return-void
.end method

.method public static Suddo(Ljava/lang/String;)V
    .locals 6

    .line 225
    sget-object v0, Ltech/sud/logger/LogUtils;->Sudfor:Ltech/sud/logger/Sudcase;

    iget v0, v0, Ltech/sud/logger/Sudcase;->Sudlong:I

    const/4 v1, 0x1

    if-ge v0, v1, :cond_0

    goto :goto_2

    .line 226
    :cond_0
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 227
    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object p0

    .line 228
    new-instance v1, Ltech/sud/logger/Sudfor;

    invoke-direct {v1}, Ltech/sud/logger/Sudfor;-><init>()V

    invoke-virtual {p0, v1}, Ljava/io/File;->listFiles(Ljava/io/FilenameFilter;)[Ljava/io/File;

    move-result-object p0

    if-eqz p0, :cond_4

    .line 229
    array-length v1, p0

    if-gtz v1, :cond_1

    goto :goto_2

    .line 230
    :cond_1
    array-length v1, p0

    if-ge v1, v0, :cond_2

    goto :goto_2

    .line 231
    :cond_2
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 232
    array-length v2, p0

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    if-ge v4, v2, :cond_3

    aget-object v5, p0, v4

    .line 233
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 234
    :cond_3
    new-instance p0, Ltech/sud/logger/Sudint;

    invoke-direct {p0}, Ltech/sud/logger/Sudint;-><init>()V

    invoke-static {v1, p0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 235
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result p0

    sub-int/2addr p0, v0

    :goto_1
    if-ge v3, p0, :cond_4

    .line 236
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    .line 237
    sget-object v2, Ltech/sud/logger/LogUtils;->Sudbyte:Ljava/util/concurrent/ExecutorService;

    new-instance v4, Ltech/sud/logger/Sudnew;

    invoke-direct {v4, v0}, Ltech/sud/logger/Sudnew;-><init>(Ljava/io/File;)V

    invoke-interface {v2, v4}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_4
    :goto_2
    return-void
.end method

.method public static Suddo(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 5

    .line 1
    sget-object v0, Ltech/sud/logger/LogUtils;->Sudfor:Ltech/sud/logger/Sudcase;

    .line 2
    .line 3
    iget-boolean v0, v0, Ltech/sud/logger/Sudcase;->Sudelse:Z

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_3

    .line 7
    .line 8
    if-eqz p2, :cond_2

    .line 9
    .line 10
    sget-object p2, Ll/avg0;->a:Ljava/util/HashMap;

    .line 11
    .line 12
    const-string p2, "AES"

    .line 13
    .line 14
    invoke-static {p2}, Ljavax/crypto/KeyGenerator;->getInstance(Ljava/lang/String;)Ljavax/crypto/KeyGenerator;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    const/16 v0, 0x100

    .line 19
    .line 20
    invoke-virtual {p2, v0}, Ljavax/crypto/KeyGenerator;->init(I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p2}, Ljavax/crypto/KeyGenerator;->generateKey()Ljavax/crypto/SecretKey;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-interface {p2}, Ljava/security/Key;->getEncoded()[B

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    new-instance v0, Ll/epg0;

    .line 32
    .line 33
    invoke-direct {v0}, Ll/epg0;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object p2, v0, Ll/epg0;->a:[B

    .line 37
    .line 38
    sget-object v2, Ll/avg0;->a:Ljava/util/HashMap;

    .line 39
    .line 40
    invoke-virtual {v2, p0, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    array-length v0, p2

    .line 44
    new-array v2, v0, [B

    .line 45
    .line 46
    const/4 v3, 0x0

    .line 47
    :goto_0
    if-ge v3, v0, :cond_0

    .line 48
    .line 49
    aget-byte v4, p2, v3

    .line 50
    .line 51
    aput-byte v4, v2, v3

    .line 52
    .line 53
    xor-int/lit8 v4, v4, 0x2

    .line 54
    .line 55
    int-to-byte v4, v4

    .line 56
    aput-byte v4, v2, v3

    .line 57
    .line 58
    add-int/lit8 v3, v3, 0x1

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 62
    .line 63
    const-string v3, "key_aes_key_prefix_"

    .line 64
    .line 65
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-static {v2}, Ll/amg0;->a([B)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-static {}, Ll/qlg0;->a()Ll/qlg0;

    .line 80
    .line 81
    .line 82
    move-result-object v3

    .line 83
    iget-object v3, v3, Ll/qlg0;->a:Landroid/content/SharedPreferences;

    .line 84
    .line 85
    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    invoke-interface {v3, v0, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 90
    .line 91
    .line 92
    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 93
    .line 94
    .line 95
    const-string v0, "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA84624QluMte2OQf27WRmq4q3nVjVCQX0o+2lZm3ktKHG2PZf5AjxjZiCuNjqfWSo1gJDsyJZC4FSubhhjDSXrPcJRKS6lXt5DKuhABWWqgkUhcJX3/loigHG4Abyi/+b0NkKPaqTbJ64j9jylyXvO6fj1TMmOw+5zJ/6rV0FMVHosyTUX0zTCt6T5OooGiSt+wCvxlj1IT6vqJ4k8EyM6zYhPzQMK7xZniUyYfdl4OeS9NMT1wW62scuEQ5y2VVeHxFSeauGw9CaQLMIjZl2yj87N8gEtsRj5+hQWmG2kEQOZMv9jRwLGpsH0JoBdJwiThf0fYdB3T1jtgL5eyUnewIDAQAB"

    .line 96
    .line 97
    invoke-static {v0}, Ll/amg0;->b(Ljava/lang/String;)[B

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    new-instance v2, Ljava/security/spec/X509EncodedKeySpec;

    .line 102
    .line 103
    invoke-direct {v2, v0}, Ljava/security/spec/X509EncodedKeySpec;-><init>([B)V

    .line 104
    .line 105
    .line 106
    const-string v0, "RSA"

    .line 107
    .line 108
    invoke-static {v0}, Ljava/security/KeyFactory;->getInstance(Ljava/lang/String;)Ljava/security/KeyFactory;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-virtual {v0, v2}, Ljava/security/KeyFactory;->generatePublic(Ljava/security/spec/KeySpec;)Ljava/security/PublicKey;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    array-length v2, p2

    .line 117
    if-nez v2, :cond_1

    .line 118
    .line 119
    const/4 p2, 0x0

    .line 120
    goto :goto_1

    .line 121
    :cond_1
    const-string v2, "RSA/None/PKCS1Padding"

    .line 122
    .line 123
    invoke-static {v2}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    .line 124
    .line 125
    .line 126
    move-result-object v2

    .line 127
    invoke-virtual {v2, v1, v0}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 128
    .line 129
    .line 130
    invoke-virtual {v2, p2}, Ljavax/crypto/Cipher;->doFinal([B)[B

    .line 131
    .line 132
    .line 133
    move-result-object p2

    .line 134
    :goto_1
    invoke-static {p2}, Ll/amg0;->a([B)Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object p2

    .line 138
    new-instance v0, Ljava/lang/StringBuilder;

    .line 139
    .line 140
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 141
    .line 142
    .line 143
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    sget-object p2, Ltech/sud/logger/LogUtils;->LINE_SEP:Ljava/lang/String;

    .line 147
    .line 148
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object p2

    .line 155
    sget-object v0, Ltech/sud/logger/LogUtils;->Sudfor:Ltech/sud/logger/Sudcase;

    .line 156
    .line 157
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 158
    .line 159
    .line 160
    invoke-static {p0, p2, v1}, Ltech/sud/base/utils/UtilsBridge;->writeFileFromString(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 161
    .line 162
    .line 163
    :cond_2
    new-instance p2, Ljava/lang/StringBuilder;

    .line 164
    .line 165
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 166
    .line 167
    .line 168
    invoke-static {p0, p1}, Ll/avg0;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    sget-object p1, Ltech/sud/logger/LogUtils;->LINE_SEP:Ljava/lang/String;

    .line 176
    .line 177
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    :cond_3
    sget-object p2, Ltech/sud/logger/LogUtils;->Sudfor:Ltech/sud/logger/Sudcase;

    .line 185
    .line 186
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 187
    .line 188
    .line 189
    invoke-static {p0, p1, v1}, Ltech/sud/base/utils/UtilsBridge;->writeFileFromString(Ljava/lang/String;Ljava/lang/String;Z)Z

    .line 190
    .line 191
    .line 192
    return-void
.end method

.method public static Suddo(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 4

    .line 216
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 217
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result p0

    return p0

    .line 218
    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    invoke-static {v1}, Ltech/sud/base/utils/UtilsBridge;->createOrExistsDir(Ljava/io/File;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 219
    :cond_1
    :try_start_0
    invoke-static {p0}, Ltech/sud/logger/LogUtils;->Suddo(Ljava/lang/String;)V

    .line 220
    invoke-static {p0, p1}, Ltech/sud/logger/LogUtils;->Sudif(Ljava/lang/String;Ljava/lang/String;)V

    .line 221
    invoke-virtual {v0}, Ljava/io/File;->createNewFile()Z

    move-result v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 222
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    :goto_0
    if-eqz v2, :cond_2

    .line 223
    sget-object v0, Ltech/sud/logger/LogUtils;->Sudfor:Ltech/sud/logger/Sudcase;

    iget-object v1, v0, Ltech/sud/logger/Sudcase;->Sudchar:Ltech/sud/base/utils/UtilsBridge$FileHead;

    const-string v3, "Date of Log"

    invoke-virtual {v1, v3, p1}, Ltech/sud/base/utils/UtilsBridge$FileHead;->addFirst(Ljava/lang/String;Ljava/lang/String;)V

    .line 224
    iget-object p1, v0, Ltech/sud/logger/Sudcase;->Sudchar:Ltech/sud/base/utils/UtilsBridge$FileHead;

    invoke-virtual {p1}, Ltech/sud/base/utils/UtilsBridge$FileHead;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Ltech/sud/logger/LogUtils;->Suddo(Ljava/lang/String;Ljava/lang/String;Z)V

    :cond_2
    return v2
.end method

.method public static Sudif(Ljava/lang/String;Ljava/lang/String;)V
    .locals 8

    .line 1
    sget-object v0, Ltech/sud/logger/LogUtils;->Sudfor:Ltech/sud/logger/Sudcase;

    .line 2
    .line 3
    iget v1, v0, Ltech/sud/logger/Sudcase;->Sudbyte:I

    .line 4
    .line 5
    if-gtz v1, :cond_0

    .line 6
    .line 7
    goto/16 :goto_2

    .line 8
    .line 9
    :cond_0
    new-instance v1, Ljava/io/File;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    new-instance v1, Ltech/sud/logger/Sudtry;

    .line 19
    .line 20
    invoke-direct {v1}, Ltech/sud/logger/Sudtry;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v1}, Ljava/io/File;->listFiles(Ljava/io/FilenameFilter;)[Ljava/io/File;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    if-eqz p0, :cond_4

    .line 28
    .line 29
    array-length v1, p0

    .line 30
    if-gtz v1, :cond_1

    .line 31
    .line 32
    goto :goto_2

    .line 33
    :cond_1
    new-instance v1, Ljava/text/SimpleDateFormat;

    .line 34
    .line 35
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 36
    .line 37
    const-string v3, "yyyy_MM_dd"

    .line 38
    .line 39
    invoke-direct {v1, v3, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 40
    .line 41
    .line 42
    :try_start_0
    invoke-virtual {v1, p1}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    .line 47
    .line 48
    .line 49
    move-result-wide v2

    .line 50
    iget p1, v0, Ltech/sud/logger/Sudcase;->Sudbyte:I

    .line 51
    .line 52
    int-to-long v4, p1

    .line 53
    const-wide/32 v6, 0x5265c00

    .line 54
    .line 55
    .line 56
    mul-long/2addr v4, v6

    .line 57
    sub-long/2addr v2, v4

    .line 58
    array-length p1, p0

    .line 59
    const/4 v0, 0x0

    .line 60
    :goto_0
    if-ge v0, p1, :cond_4

    .line 61
    .line 62
    aget-object v4, p0, v0

    .line 63
    .line 64
    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v5

    .line 68
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 69
    .line 70
    .line 71
    const-string v6, "[0-9]{4}_[0-9]{2}_[0-9]{2}"

    .line 72
    .line 73
    invoke-static {v6}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 74
    .line 75
    .line 76
    move-result-object v6

    .line 77
    invoke-virtual {v6, v5}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 78
    .line 79
    .line 80
    move-result-object v5

    .line 81
    invoke-virtual {v5}, Ljava/util/regex/Matcher;->find()Z

    .line 82
    .line 83
    .line 84
    move-result v6

    .line 85
    if-eqz v6, :cond_2

    .line 86
    .line 87
    invoke-virtual {v5}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v5

    .line 91
    goto :goto_1

    .line 92
    :cond_2
    const-string v5, ""

    .line 93
    .line 94
    :goto_1
    invoke-virtual {v1, v5}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    .line 95
    .line 96
    .line 97
    move-result-object v5

    .line 98
    invoke-virtual {v5}, Ljava/util/Date;->getTime()J

    .line 99
    .line 100
    .line 101
    move-result-wide v5

    .line 102
    cmp-long v5, v5, v2

    .line 103
    .line 104
    if-gtz v5, :cond_3

    .line 105
    .line 106
    sget-object v5, Ltech/sud/logger/LogUtils;->Sudbyte:Ljava/util/concurrent/ExecutorService;

    .line 107
    .line 108
    new-instance v6, Ltech/sud/logger/Sudbyte;

    .line 109
    .line 110
    invoke-direct {v6, v4}, Ltech/sud/logger/Sudbyte;-><init>(Ljava/io/File;)V

    .line 111
    .line 112
    .line 113
    invoke-interface {v5, v6}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 114
    .line 115
    .line 116
    :cond_3
    add-int/lit8 v0, v0, 0x1

    .line 117
    .line 118
    goto :goto_0

    .line 119
    :catch_0
    move-exception p0

    .line 120
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 121
    .line 122
    .line 123
    :cond_4
    :goto_2
    return-void
.end method

.method public static varargs a([Ljava/lang/Object;)V
    .locals 2

    .line 1
    sget-object v0, Ltech/sud/logger/LogUtils;->Sudfor:Ltech/sud/logger/Sudcase;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    const-string v0, ""

    .line 7
    .line 8
    invoke-static {v0}, Ltech/sud/base/utils/UtilsBridge;->isSpace(Ljava/lang/String;)Z

    .line 9
    .line 10
    .line 11
    const/4 v1, 0x7

    .line 12
    invoke-static {v1, v0, p0}, Ltech/sud/logger/LogUtils;->log(ILjava/lang/String;[Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static varargs aTag(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 1

    .line 1
    const/4 v0, 0x7

    .line 2
    invoke-static {v0, p0, p1}, Ltech/sud/logger/LogUtils;->log(ILjava/lang/String;[Ljava/lang/Object;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static buildField(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "  "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string p0, "\uff1a"

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public static varargs d([Ljava/lang/Object;)V
    .locals 2

    .line 1
    sget-object v0, Ltech/sud/logger/LogUtils;->Sudfor:Ltech/sud/logger/Sudcase;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    const-string v0, ""

    .line 7
    .line 8
    invoke-static {v0}, Ltech/sud/base/utils/UtilsBridge;->isSpace(Ljava/lang/String;)Z

    .line 9
    .line 10
    .line 11
    const/4 v1, 0x3

    .line 12
    invoke-static {v1, v0, p0}, Ltech/sud/logger/LogUtils;->log(ILjava/lang/String;[Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static varargs dTag(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 1

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-static {v0, p0, p1}, Ltech/sud/logger/LogUtils;->log(ILjava/lang/String;[Ljava/lang/Object;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static varargs e([Ljava/lang/Object;)V
    .locals 2

    .line 1
    sget-object v0, Ltech/sud/logger/LogUtils;->Sudfor:Ltech/sud/logger/Sudcase;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    const-string v0, ""

    .line 7
    .line 8
    invoke-static {v0}, Ltech/sud/base/utils/UtilsBridge;->isSpace(Ljava/lang/String;)Z

    .line 9
    .line 10
    .line 11
    const/4 v1, 0x6

    .line 12
    invoke-static {v1, v0, p0}, Ltech/sud/logger/LogUtils;->log(ILjava/lang/String;[Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static varargs eTag(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 1

    .line 1
    const/4 v0, 0x6

    .line 2
    invoke-static {v0, p0, p1}, Ltech/sud/logger/LogUtils;->log(ILjava/lang/String;[Ljava/lang/Object;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static file(ILjava/lang/Object;)V
    .locals 1

    or-int/lit8 p0, p0, 0x10

    .line 21
    sget-object v0, Ltech/sud/logger/LogUtils;->Sudfor:Ltech/sud/logger/Sudcase;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 22
    const-string v0, ""

    invoke-static {v0}, Ltech/sud/base/utils/UtilsBridge;->isSpace(Ljava/lang/String;)Z

    .line 23
    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {p0, v0, p1}, Ltech/sud/logger/LogUtils;->log(ILjava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method public static file(ILjava/lang/String;Ljava/lang/Object;)V
    .locals 0

    or-int/lit8 p0, p0, 0x10

    .line 25
    filled-new-array {p2}, [Ljava/lang/Object;

    move-result-object p2

    invoke-static {p0, p1, p2}, Ltech/sud/logger/LogUtils;->log(ILjava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method public static file(Ljava/lang/Object;)V
    .locals 2

    .line 1
    sget-object v0, Ltech/sud/logger/LogUtils;->Sudfor:Ltech/sud/logger/Sudcase;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    const-string v0, ""

    .line 7
    .line 8
    invoke-static {v0}, Ltech/sud/base/utils/UtilsBridge;->isSpace(Ljava/lang/String;)Z

    .line 9
    .line 10
    .line 11
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const/16 v1, 0x13

    .line 16
    .line 17
    invoke-static {v1, v0, p0}, Ltech/sud/logger/LogUtils;->log(ILjava/lang/String;[Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static file(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    .line 24
    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    const/16 v0, 0x13

    invoke-static {v0, p0, p1}, Ltech/sud/logger/LogUtils;->log(ILjava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method public static getConfig()Ltech/sud/logger/Sudcase;
    .locals 1

    .line 1
    sget-object v0, Ltech/sud/logger/LogUtils;->Sudfor:Ltech/sud/logger/Sudcase;

    .line 2
    .line 3
    return-object v0
.end method

.method public static getErrorInfo(Ljava/lang/Throwable;)Ljava/lang/String;
    .locals 4

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const-string p0, ""

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    new-instance v0, Ljava/lang/StringBuffer;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 9
    .line 10
    .line 11
    new-instance v1, Ljava/io/StringWriter;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/io/StringWriter;-><init>()V

    .line 14
    .line 15
    .line 16
    new-instance v2, Ljava/io/PrintWriter;

    .line 17
    .line 18
    invoke-direct {v2, v1}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v2}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    :goto_0
    if-eqz v3, :cond_1

    .line 29
    .line 30
    invoke-virtual {v3, v2}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v3}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    goto :goto_0

    .line 38
    :cond_1
    invoke-virtual {v2}, Ljava/io/PrintWriter;->close()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 46
    .line 47
    .line 48
    new-instance v1, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    const-string v2, "\n"

    .line 51
    .line 52
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    invoke-static {p0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    return-object p0
.end method

.method public static getLogDirPath(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    invoke-static {}, Ltech/sud/base/utils/UtilsBridge;->isSDCardEnableByEnvironment()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    goto :goto_0

    .line 22
    :cond_1
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    :goto_0
    if-nez p0, :cond_2

    .line 27
    .line 28
    return-object v0

    .line 29
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    sget-object p0, Ljava/io/File;->separator:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string p0, "SudMGPLogs"

    .line 47
    .line 48
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    return-object p0
.end method

.method public static getLogFiles()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Ltech/sud/logger/LogUtils;->Sudfor:Ltech/sud/logger/Sudcase;

    .line 2
    .line 3
    iget-object v1, v0, Ltech/sud/logger/Sudcase;->Sudif:Ljava/lang/String;

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    iget-object v1, v0, Ltech/sud/logger/Sudcase;->Suddo:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    new-instance v0, Ljava/io/File;

    .line 10
    .line 11
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-nez v1, :cond_1

    .line 19
    .line 20
    new-instance v0, Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 23
    .line 24
    .line 25
    return-object v0

    .line 26
    :cond_1
    new-instance v1, Ltech/sud/logger/Sudif;

    .line 27
    .line 28
    invoke-direct {v1}, Ltech/sud/logger/Sudif;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/io/File;->listFiles(Ljava/io/FilenameFilter;)[Ljava/io/File;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-static {v1, v0}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    return-object v1
.end method

.method public static varargs i([Ljava/lang/Object;)V
    .locals 2

    .line 1
    sget-object v0, Ltech/sud/logger/LogUtils;->Sudfor:Ltech/sud/logger/Sudcase;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    const-string v0, ""

    .line 7
    .line 8
    invoke-static {v0}, Ltech/sud/base/utils/UtilsBridge;->isSpace(Ljava/lang/String;)Z

    .line 9
    .line 10
    .line 11
    const/4 v1, 0x4

    .line 12
    invoke-static {v1, v0, p0}, Ltech/sud/logger/LogUtils;->log(ILjava/lang/String;[Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static varargs iTag(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 1

    .line 1
    const/4 v0, 0x4

    .line 2
    invoke-static {v0, p0, p1}, Ltech/sud/logger/LogUtils;->log(ILjava/lang/String;[Ljava/lang/Object;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static json(ILjava/lang/Object;)V
    .locals 1

    or-int/lit8 p0, p0, 0x20

    .line 21
    sget-object v0, Ltech/sud/logger/LogUtils;->Sudfor:Ltech/sud/logger/Sudcase;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 22
    const-string v0, ""

    invoke-static {v0}, Ltech/sud/base/utils/UtilsBridge;->isSpace(Ljava/lang/String;)Z

    .line 23
    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {p0, v0, p1}, Ltech/sud/logger/LogUtils;->log(ILjava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method public static json(ILjava/lang/String;Ljava/lang/Object;)V
    .locals 0

    or-int/lit8 p0, p0, 0x20

    .line 25
    filled-new-array {p2}, [Ljava/lang/Object;

    move-result-object p2

    invoke-static {p0, p1, p2}, Ltech/sud/logger/LogUtils;->log(ILjava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method public static json(Ljava/lang/Object;)V
    .locals 2

    .line 1
    sget-object v0, Ltech/sud/logger/LogUtils;->Sudfor:Ltech/sud/logger/Sudcase;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    const-string v0, ""

    .line 7
    .line 8
    invoke-static {v0}, Ltech/sud/base/utils/UtilsBridge;->isSpace(Ljava/lang/String;)Z

    .line 9
    .line 10
    .line 11
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const/16 v1, 0x23

    .line 16
    .line 17
    invoke-static {v1, v0, p0}, Ltech/sud/logger/LogUtils;->log(ILjava/lang/String;[Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static json(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    .line 24
    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    const/16 v0, 0x23

    invoke-static {v0, p0, p1}, Ltech/sud/logger/LogUtils;->log(ILjava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method public static varargs log(ILjava/lang/String;[Ljava/lang/Object;)V
    .locals 16

    .line 1
    move/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    sget-boolean v2, Ltech/sud/logger/LogUtils;->Sudint:Z

    .line 6
    .line 7
    if-nez v2, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ltech/sud/logger/LogUtils;->Suddo()V

    .line 10
    .line 11
    .line 12
    :cond_0
    sget-object v2, Ltech/sud/logger/LogUtils;->Sudfor:Ltech/sud/logger/Sudcase;

    .line 13
    .line 14
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    and-int/lit8 v4, v0, 0xf

    .line 18
    .line 19
    and-int/lit16 v0, v0, 0xf0

    .line 20
    .line 21
    iget-boolean v3, v2, Ltech/sud/logger/Sudcase;->Sudint:Z

    .line 22
    .line 23
    const/16 v5, 0x10

    .line 24
    .line 25
    if-nez v3, :cond_1

    .line 26
    .line 27
    if-ne v0, v5, :cond_1e

    .line 28
    .line 29
    :cond_1
    const/4 v3, 0x2

    .line 30
    if-ge v4, v3, :cond_2

    .line 31
    .line 32
    if-ge v4, v3, :cond_2

    .line 33
    .line 34
    goto/16 :goto_e

    .line 35
    .line 36
    :cond_2
    new-instance v6, Ljava/lang/Throwable;

    .line 37
    .line 38
    invoke-direct {v6}, Ljava/lang/Throwable;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v6}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    .line 42
    .line 43
    .line 44
    move-result-object v6

    .line 45
    const/4 v7, 0x0

    .line 46
    const-string v8, ": "

    .line 47
    .line 48
    const/4 v9, 0x0

    .line 49
    const/4 v10, 0x1

    .line 50
    if-eqz v6, :cond_a

    .line 51
    .line 52
    array-length v11, v6

    .line 53
    if-nez v11, :cond_3

    .line 54
    .line 55
    goto/16 :goto_2

    .line 56
    .line 57
    :cond_3
    array-length v11, v6

    .line 58
    const/4 v12, -0x1

    .line 59
    const/16 v13, 0x2e

    .line 60
    .line 61
    const/4 v14, 0x3

    .line 62
    if-lt v14, v11, :cond_6

    .line 63
    .line 64
    array-length v2, v6

    .line 65
    sub-int/2addr v2, v10

    .line 66
    aget-object v2, v6, v2

    .line 67
    .line 68
    invoke-static {v2}, Ltech/sud/logger/LogUtils;->Suddo(Ljava/lang/StackTraceElement;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-static/range {p1 .. p1}, Ltech/sud/base/utils/UtilsBridge;->isSpace(Ljava/lang/String;)Z

    .line 73
    .line 74
    .line 75
    move-result v6

    .line 76
    if-eqz v6, :cond_5

    .line 77
    .line 78
    invoke-virtual {v2, v13}, Ljava/lang/String;->indexOf(I)I

    .line 79
    .line 80
    .line 81
    move-result v6

    .line 82
    if-ne v6, v12, :cond_4

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_4
    invoke-virtual {v2, v9, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    goto :goto_0

    .line 90
    :cond_5
    move-object/from16 v2, p1

    .line 91
    .line 92
    :goto_0
    new-instance v6, Ltech/sud/logger/Sudelse;

    .line 93
    .line 94
    invoke-direct {v6, v2, v8, v7}, Ltech/sud/logger/Sudelse;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    goto/16 :goto_3

    .line 98
    .line 99
    :cond_6
    aget-object v6, v6, v14

    .line 100
    .line 101
    invoke-static {v6}, Ltech/sud/logger/LogUtils;->Suddo(Ljava/lang/StackTraceElement;)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v11

    .line 105
    invoke-static/range {p1 .. p1}, Ltech/sud/base/utils/UtilsBridge;->isSpace(Ljava/lang/String;)Z

    .line 106
    .line 107
    .line 108
    move-result v14

    .line 109
    if-eqz v14, :cond_8

    .line 110
    .line 111
    invoke-virtual {v11, v13}, Ljava/lang/String;->indexOf(I)I

    .line 112
    .line 113
    .line 114
    move-result v13

    .line 115
    if-ne v13, v12, :cond_7

    .line 116
    .line 117
    move-object v12, v11

    .line 118
    goto :goto_1

    .line 119
    :cond_7
    invoke-virtual {v11, v9, v13}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v12

    .line 123
    goto :goto_1

    .line 124
    :cond_8
    move-object/from16 v12, p1

    .line 125
    .line 126
    :goto_1
    iget-boolean v2, v2, Ltech/sud/logger/Sudcase;->Sudnew:Z

    .line 127
    .line 128
    if-eqz v2, :cond_9

    .line 129
    .line 130
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 131
    .line 132
    .line 133
    move-result-object v2

    .line 134
    invoke-virtual {v2}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v2

    .line 138
    new-instance v7, Ljava/util/Formatter;

    .line 139
    .line 140
    invoke-direct {v7}, Ljava/util/Formatter;-><init>()V

    .line 141
    .line 142
    .line 143
    invoke-virtual {v6}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v8

    .line 147
    invoke-virtual {v6}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v13

    .line 151
    invoke-virtual {v6}, Ljava/lang/StackTraceElement;->getLineNumber()I

    .line 152
    .line 153
    .line 154
    move-result v6

    .line 155
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 156
    .line 157
    .line 158
    move-result-object v6

    .line 159
    filled-new-array {v2, v8, v13, v11, v6}, [Ljava/lang/Object;

    .line 160
    .line 161
    .line 162
    move-result-object v2

    .line 163
    const-string v6, "%s, %s.%s(%s:%d)"

    .line 164
    .line 165
    invoke-virtual {v7, v6, v2}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    .line 166
    .line 167
    .line 168
    move-result-object v2

    .line 169
    invoke-virtual {v2}, Ljava/util/Formatter;->toString()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v2

    .line 173
    new-instance v6, Ljava/lang/StringBuilder;

    .line 174
    .line 175
    const-string v7, " ["

    .line 176
    .line 177
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    const-string v7, "]: "

    .line 184
    .line 185
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object v6

    .line 192
    new-instance v7, Ltech/sud/logger/Sudelse;

    .line 193
    .line 194
    filled-new-array {v2}, [Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v2

    .line 198
    invoke-direct {v7, v12, v6, v2}, Ltech/sud/logger/Sudelse;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    move-object v6, v7

    .line 202
    goto :goto_3

    .line 203
    :cond_9
    new-instance v6, Ltech/sud/logger/Sudelse;

    .line 204
    .line 205
    invoke-direct {v6, v12, v8, v7}, Ltech/sud/logger/Sudelse;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 206
    .line 207
    .line 208
    goto :goto_3

    .line 209
    :cond_a
    :goto_2
    new-instance v6, Ltech/sud/logger/Sudelse;

    .line 210
    .line 211
    move-object/from16 v2, p1

    .line 212
    .line 213
    invoke-direct {v6, v2, v8, v7}, Ltech/sud/logger/Sudelse;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 214
    .line 215
    .line 216
    :goto_3
    const-string v2, "null"

    .line 217
    .line 218
    if-eqz v1, :cond_10

    .line 219
    .line 220
    array-length v7, v1

    .line 221
    if-ne v7, v10, :cond_e

    .line 222
    .line 223
    aget-object v1, v1, v9

    .line 224
    .line 225
    if-nez v1, :cond_b

    .line 226
    .line 227
    goto :goto_5

    .line 228
    :cond_b
    const/16 v2, 0x20

    .line 229
    .line 230
    if-ne v0, v2, :cond_c

    .line 231
    .line 232
    invoke-static {v2, v1}, Ltech/sud/logger/Sudchar;->Suddo(ILjava/lang/Object;)Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object v2

    .line 236
    goto :goto_5

    .line 237
    :cond_c
    const/16 v2, 0x30

    .line 238
    .line 239
    if-ne v0, v2, :cond_d

    .line 240
    .line 241
    invoke-static {v2, v1}, Ltech/sud/logger/Sudchar;->Suddo(ILjava/lang/Object;)Ljava/lang/String;

    .line 242
    .line 243
    .line 244
    move-result-object v2

    .line 245
    goto :goto_5

    .line 246
    :cond_d
    invoke-static {v1}, Ltech/sud/logger/LogUtils;->Suddo(Ljava/lang/Object;)Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object v2

    .line 250
    goto :goto_5

    .line 251
    :cond_e
    new-instance v2, Ljava/lang/StringBuilder;

    .line 252
    .line 253
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 254
    .line 255
    .line 256
    array-length v7, v1

    .line 257
    move v8, v9

    .line 258
    :goto_4
    if-ge v8, v7, :cond_f

    .line 259
    .line 260
    aget-object v11, v1, v8

    .line 261
    .line 262
    const-string v12, "args["

    .line 263
    .line 264
    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 265
    .line 266
    .line 267
    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 268
    .line 269
    .line 270
    const-string v12, "] = "

    .line 271
    .line 272
    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 273
    .line 274
    .line 275
    invoke-static {v11}, Ltech/sud/logger/LogUtils;->Suddo(Ljava/lang/Object;)Ljava/lang/String;

    .line 276
    .line 277
    .line 278
    move-result-object v11

    .line 279
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 280
    .line 281
    .line 282
    sget-object v11, Ltech/sud/logger/LogUtils;->LINE_SEP:Ljava/lang/String;

    .line 283
    .line 284
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 285
    .line 286
    .line 287
    add-int/lit8 v8, v8, 0x1

    .line 288
    .line 289
    goto :goto_4

    .line 290
    :cond_f
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 291
    .line 292
    .line 293
    move-result-object v2

    .line 294
    :cond_10
    :goto_5
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 295
    .line 296
    .line 297
    move-result v1

    .line 298
    if-nez v1, :cond_11

    .line 299
    .line 300
    const-string v2, "log nothing"

    .line 301
    .line 302
    :cond_11
    sget-object v1, Ltech/sud/logger/LogUtils;->Sudfor:Ltech/sud/logger/Sudcase;

    .line 303
    .line 304
    iget-boolean v7, v1, Ltech/sud/logger/Sudcase;->Sudint:Z

    .line 305
    .line 306
    if-eqz v7, :cond_1c

    .line 307
    .line 308
    if-eq v0, v5, :cond_1c

    .line 309
    .line 310
    if-lt v4, v3, :cond_1c

    .line 311
    .line 312
    iget-object v7, v6, Ltech/sud/logger/Sudelse;->Suddo:Ljava/lang/String;

    .line 313
    .line 314
    iget-object v8, v6, Ltech/sud/logger/Sudelse;->Sudif:[Ljava/lang/String;

    .line 315
    .line 316
    new-instance v11, Ljava/lang/StringBuilder;

    .line 317
    .line 318
    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    .line 319
    .line 320
    .line 321
    iget-boolean v1, v1, Ltech/sud/logger/Sudcase;->Sudtry:Z

    .line 322
    .line 323
    const-string v12, "\u2514\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500"

    .line 324
    .line 325
    const-string v13, "\u250c\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500"

    .line 326
    .line 327
    const-string v14, "\u2502 "

    .line 328
    .line 329
    const-string v15, " "

    .line 330
    .line 331
    if-eqz v1, :cond_15

    .line 332
    .line 333
    invoke-virtual {v11, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 334
    .line 335
    .line 336
    sget-object v1, Ltech/sud/logger/LogUtils;->LINE_SEP:Ljava/lang/String;

    .line 337
    .line 338
    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 339
    .line 340
    .line 341
    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 342
    .line 343
    .line 344
    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 345
    .line 346
    .line 347
    if-eqz v8, :cond_13

    .line 348
    .line 349
    array-length v1, v8

    .line 350
    move v10, v9

    .line 351
    :goto_6
    if-ge v10, v1, :cond_12

    .line 352
    .line 353
    aget-object v3, v8, v10

    .line 354
    .line 355
    invoke-virtual {v11, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 356
    .line 357
    .line 358
    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 359
    .line 360
    .line 361
    sget-object v3, Ltech/sud/logger/LogUtils;->LINE_SEP:Ljava/lang/String;

    .line 362
    .line 363
    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 364
    .line 365
    .line 366
    add-int/lit8 v10, v10, 0x1

    .line 367
    .line 368
    const/4 v3, 0x2

    .line 369
    goto :goto_6

    .line 370
    :cond_12
    const-string v1, "\u251c\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504\u2504"

    .line 371
    .line 372
    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 373
    .line 374
    .line 375
    sget-object v1, Ltech/sud/logger/LogUtils;->LINE_SEP:Ljava/lang/String;

    .line 376
    .line 377
    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 378
    .line 379
    .line 380
    :cond_13
    sget-object v1, Ltech/sud/logger/LogUtils;->LINE_SEP:Ljava/lang/String;

    .line 381
    .line 382
    invoke-virtual {v2, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 383
    .line 384
    .line 385
    move-result-object v1

    .line 386
    array-length v3, v1

    .line 387
    move v8, v9

    .line 388
    :goto_7
    if-ge v8, v3, :cond_14

    .line 389
    .line 390
    aget-object v10, v1, v8

    .line 391
    .line 392
    invoke-virtual {v11, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 393
    .line 394
    .line 395
    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 396
    .line 397
    .line 398
    sget-object v10, Ltech/sud/logger/LogUtils;->LINE_SEP:Ljava/lang/String;

    .line 399
    .line 400
    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 401
    .line 402
    .line 403
    add-int/lit8 v8, v8, 0x1

    .line 404
    .line 405
    goto :goto_7

    .line 406
    :cond_14
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 407
    .line 408
    .line 409
    goto :goto_9

    .line 410
    :cond_15
    if-eqz v8, :cond_16

    .line 411
    .line 412
    invoke-virtual {v11, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 413
    .line 414
    .line 415
    sget-object v1, Ltech/sud/logger/LogUtils;->LINE_SEP:Ljava/lang/String;

    .line 416
    .line 417
    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 418
    .line 419
    .line 420
    array-length v1, v8

    .line 421
    move v3, v9

    .line 422
    :goto_8
    if-ge v3, v1, :cond_16

    .line 423
    .line 424
    aget-object v10, v8, v3

    .line 425
    .line 426
    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 427
    .line 428
    .line 429
    sget-object v10, Ltech/sud/logger/LogUtils;->LINE_SEP:Ljava/lang/String;

    .line 430
    .line 431
    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 432
    .line 433
    .line 434
    add-int/lit8 v3, v3, 0x1

    .line 435
    .line 436
    goto :goto_8

    .line 437
    :cond_16
    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 438
    .line 439
    .line 440
    :goto_9
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 441
    .line 442
    .line 443
    move-result-object v1

    .line 444
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 445
    .line 446
    .line 447
    move-result v3

    .line 448
    sget-object v8, Ltech/sud/logger/LogUtils;->Sudfor:Ltech/sud/logger/Sudcase;

    .line 449
    .line 450
    iget-boolean v8, v8, Ltech/sud/logger/Sudcase;->Sudtry:Z

    .line 451
    .line 452
    const/16 v10, 0x44c

    .line 453
    .line 454
    if-eqz v8, :cond_17

    .line 455
    .line 456
    add-int/lit8 v11, v3, -0x71

    .line 457
    .line 458
    div-int/2addr v11, v10

    .line 459
    goto :goto_a

    .line 460
    :cond_17
    div-int/lit16 v11, v3, 0x44c

    .line 461
    .line 462
    :goto_a
    if-lez v11, :cond_1b

    .line 463
    .line 464
    if-eqz v8, :cond_19

    .line 465
    .line 466
    new-instance v8, Ljava/lang/StringBuilder;

    .line 467
    .line 468
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 469
    .line 470
    .line 471
    invoke-virtual {v1, v9, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 472
    .line 473
    .line 474
    move-result-object v9

    .line 475
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 476
    .line 477
    .line 478
    sget-object v9, Ltech/sud/logger/LogUtils;->LINE_SEP:Ljava/lang/String;

    .line 479
    .line 480
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 481
    .line 482
    .line 483
    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 484
    .line 485
    .line 486
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 487
    .line 488
    .line 489
    move-result-object v8

    .line 490
    invoke-static {v4, v7, v8}, Landroid/util/Log;->println(ILjava/lang/String;Ljava/lang/String;)I

    .line 491
    .line 492
    .line 493
    move v8, v10

    .line 494
    const/4 v10, 0x1

    .line 495
    :goto_b
    if-ge v10, v11, :cond_18

    .line 496
    .line 497
    new-instance v9, Ljava/lang/StringBuilder;

    .line 498
    .line 499
    invoke-direct {v9, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 500
    .line 501
    .line 502
    sget-object v5, Ltech/sud/logger/LogUtils;->LINE_SEP:Ljava/lang/String;

    .line 503
    .line 504
    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 505
    .line 506
    .line 507
    invoke-virtual {v9, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 508
    .line 509
    .line 510
    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 511
    .line 512
    .line 513
    invoke-virtual {v9, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 514
    .line 515
    .line 516
    move-object/from16 p1, v2

    .line 517
    .line 518
    add-int/lit16 v2, v8, 0x44c

    .line 519
    .line 520
    invoke-virtual {v1, v8, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 521
    .line 522
    .line 523
    move-result-object v8

    .line 524
    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 525
    .line 526
    .line 527
    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 528
    .line 529
    .line 530
    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 531
    .line 532
    .line 533
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 534
    .line 535
    .line 536
    move-result-object v5

    .line 537
    invoke-static {v4, v7, v5}, Landroid/util/Log;->println(ILjava/lang/String;Ljava/lang/String;)I

    .line 538
    .line 539
    .line 540
    sget-object v5, Ltech/sud/logger/LogUtils;->Sudfor:Ltech/sud/logger/Sudcase;

    .line 541
    .line 542
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 543
    .line 544
    .line 545
    add-int/lit8 v10, v10, 0x1

    .line 546
    .line 547
    move v8, v2

    .line 548
    const/16 v5, 0x10

    .line 549
    .line 550
    move-object/from16 v2, p1

    .line 551
    .line 552
    goto :goto_b

    .line 553
    :cond_18
    move-object/from16 p1, v2

    .line 554
    .line 555
    add-int/lit8 v2, v3, -0x71

    .line 556
    .line 557
    if-eq v8, v2, :cond_1d

    .line 558
    .line 559
    new-instance v2, Ljava/lang/StringBuilder;

    .line 560
    .line 561
    invoke-direct {v2, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 562
    .line 563
    .line 564
    sget-object v5, Ltech/sud/logger/LogUtils;->LINE_SEP:Ljava/lang/String;

    .line 565
    .line 566
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 567
    .line 568
    .line 569
    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 570
    .line 571
    .line 572
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 573
    .line 574
    .line 575
    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 576
    .line 577
    .line 578
    invoke-virtual {v1, v8, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 579
    .line 580
    .line 581
    move-result-object v1

    .line 582
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 583
    .line 584
    .line 585
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 586
    .line 587
    .line 588
    move-result-object v1

    .line 589
    invoke-static {v4, v7, v1}, Landroid/util/Log;->println(ILjava/lang/String;Ljava/lang/String;)I

    .line 590
    .line 591
    .line 592
    sget-object v1, Ltech/sud/logger/LogUtils;->Sudfor:Ltech/sud/logger/Sudcase;

    .line 593
    .line 594
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 595
    .line 596
    .line 597
    goto :goto_d

    .line 598
    :cond_19
    move-object/from16 p1, v2

    .line 599
    .line 600
    invoke-virtual {v1, v9, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 601
    .line 602
    .line 603
    move-result-object v2

    .line 604
    invoke-static {v4, v7, v2}, Landroid/util/Log;->println(ILjava/lang/String;Ljava/lang/String;)I

    .line 605
    .line 606
    .line 607
    move v2, v10

    .line 608
    const/4 v10, 0x1

    .line 609
    :goto_c
    if-ge v10, v11, :cond_1a

    .line 610
    .line 611
    new-instance v5, Ljava/lang/StringBuilder;

    .line 612
    .line 613
    invoke-direct {v5, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 614
    .line 615
    .line 616
    sget-object v8, Ltech/sud/logger/LogUtils;->LINE_SEP:Ljava/lang/String;

    .line 617
    .line 618
    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 619
    .line 620
    .line 621
    add-int/lit16 v8, v2, 0x44c

    .line 622
    .line 623
    invoke-virtual {v1, v2, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 624
    .line 625
    .line 626
    move-result-object v2

    .line 627
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 628
    .line 629
    .line 630
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 631
    .line 632
    .line 633
    move-result-object v2

    .line 634
    invoke-static {v4, v7, v2}, Landroid/util/Log;->println(ILjava/lang/String;Ljava/lang/String;)I

    .line 635
    .line 636
    .line 637
    sget-object v2, Ltech/sud/logger/LogUtils;->Sudfor:Ltech/sud/logger/Sudcase;

    .line 638
    .line 639
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 640
    .line 641
    .line 642
    add-int/lit8 v10, v10, 0x1

    .line 643
    .line 644
    move v2, v8

    .line 645
    goto :goto_c

    .line 646
    :cond_1a
    if-eq v2, v3, :cond_1d

    .line 647
    .line 648
    new-instance v5, Ljava/lang/StringBuilder;

    .line 649
    .line 650
    invoke-direct {v5, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 651
    .line 652
    .line 653
    sget-object v8, Ltech/sud/logger/LogUtils;->LINE_SEP:Ljava/lang/String;

    .line 654
    .line 655
    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 656
    .line 657
    .line 658
    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 659
    .line 660
    .line 661
    move-result-object v1

    .line 662
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 663
    .line 664
    .line 665
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 666
    .line 667
    .line 668
    move-result-object v1

    .line 669
    invoke-static {v4, v7, v1}, Landroid/util/Log;->println(ILjava/lang/String;Ljava/lang/String;)I

    .line 670
    .line 671
    .line 672
    sget-object v1, Ltech/sud/logger/LogUtils;->Sudfor:Ltech/sud/logger/Sudcase;

    .line 673
    .line 674
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 675
    .line 676
    .line 677
    goto :goto_d

    .line 678
    :cond_1b
    move-object/from16 p1, v2

    .line 679
    .line 680
    invoke-static {v4, v7, v1}, Landroid/util/Log;->println(ILjava/lang/String;Ljava/lang/String;)I

    .line 681
    .line 682
    .line 683
    goto :goto_d

    .line 684
    :cond_1c
    move-object/from16 p1, v2

    .line 685
    .line 686
    :cond_1d
    :goto_d
    sget-object v1, Ltech/sud/logger/LogUtils;->Sudfor:Ltech/sud/logger/Sudcase;

    .line 687
    .line 688
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 689
    .line 690
    .line 691
    const/16 v1, 0x10

    .line 692
    .line 693
    if-ne v0, v1, :cond_1e

    .line 694
    .line 695
    const/4 v0, 0x2

    .line 696
    if-lt v4, v0, :cond_1e

    .line 697
    .line 698
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 699
    .line 700
    .line 701
    move-result-object v0

    .line 702
    invoke-virtual {v0}, Ljava/lang/Thread;->getId()J

    .line 703
    .line 704
    .line 705
    move-result-wide v7

    .line 706
    invoke-virtual {v0}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    .line 707
    .line 708
    .line 709
    move-result-object v9

    .line 710
    sget-object v0, Ltech/sud/logger/LogUtils;->Sudbyte:Ljava/util/concurrent/ExecutorService;

    .line 711
    .line 712
    new-instance v3, Ltech/sud/logger/Suddo;

    .line 713
    .line 714
    move-object v5, v6

    .line 715
    move-object/from16 v6, p1

    .line 716
    .line 717
    invoke-direct/range {v3 .. v9}, Ltech/sud/logger/Suddo;-><init>(ILtech/sud/logger/Sudelse;Ljava/lang/String;JLjava/lang/String;)V

    .line 718
    .line 719
    .line 720
    invoke-interface {v0, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 721
    .line 722
    .line 723
    :cond_1e
    :goto_e
    return-void
.end method

.method public static varargs v([Ljava/lang/Object;)V
    .locals 2

    .line 1
    sget-object v0, Ltech/sud/logger/LogUtils;->Sudfor:Ltech/sud/logger/Sudcase;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    const-string v0, ""

    .line 7
    .line 8
    invoke-static {v0}, Ltech/sud/base/utils/UtilsBridge;->isSpace(Ljava/lang/String;)Z

    .line 9
    .line 10
    .line 11
    const/4 v1, 0x2

    .line 12
    invoke-static {v1, v0, p0}, Ltech/sud/logger/LogUtils;->log(ILjava/lang/String;[Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static varargs vTag(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-static {v0, p0, p1}, Ltech/sud/logger/LogUtils;->log(ILjava/lang/String;[Ljava/lang/Object;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static varargs w([Ljava/lang/Object;)V
    .locals 2

    .line 1
    sget-object v0, Ltech/sud/logger/LogUtils;->Sudfor:Ltech/sud/logger/Sudcase;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    const-string v0, ""

    .line 7
    .line 8
    invoke-static {v0}, Ltech/sud/base/utils/UtilsBridge;->isSpace(Ljava/lang/String;)Z

    .line 9
    .line 10
    .line 11
    const/4 v1, 0x5

    .line 12
    invoke-static {v1, v0, p0}, Ltech/sud/logger/LogUtils;->log(ILjava/lang/String;[Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static varargs wTag(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 1

    .line 1
    const/4 v0, 0x5

    .line 2
    invoke-static {v0, p0, p1}, Ltech/sud/logger/LogUtils;->log(ILjava/lang/String;[Ljava/lang/Object;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static xml(ILjava/lang/String;)V
    .locals 1

    or-int/lit8 p0, p0, 0x30

    .line 21
    sget-object v0, Ltech/sud/logger/LogUtils;->Sudfor:Ltech/sud/logger/Sudcase;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 22
    const-string v0, ""

    invoke-static {v0}, Ltech/sud/base/utils/UtilsBridge;->isSpace(Ljava/lang/String;)Z

    .line 23
    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {p0, v0, p1}, Ltech/sud/logger/LogUtils;->log(ILjava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method public static xml(ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    or-int/lit8 p0, p0, 0x30

    .line 25
    filled-new-array {p2}, [Ljava/lang/Object;

    move-result-object p2

    invoke-static {p0, p1, p2}, Ltech/sud/logger/LogUtils;->log(ILjava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method public static xml(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Ltech/sud/logger/LogUtils;->Sudfor:Ltech/sud/logger/Sudcase;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    const-string v0, ""

    .line 7
    .line 8
    invoke-static {v0}, Ltech/sud/base/utils/UtilsBridge;->isSpace(Ljava/lang/String;)Z

    .line 9
    .line 10
    .line 11
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const/16 v1, 0x33

    .line 16
    .line 17
    invoke-static {v1, v0, p0}, Ltech/sud/logger/LogUtils;->log(ILjava/lang/String;[Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static xml(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 24
    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    const/16 v0, 0x33

    invoke-static {v0, p0, p1}, Ltech/sud/logger/LogUtils;->log(ILjava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method
