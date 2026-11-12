.class public final Lcom/opera/android/browser/obml/Platform;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Landroid/content/Context; = null

.field public static b:B = -0x1t

.field public static c:Z

.field public static d:B

.field public static final e:Ljava/util/ArrayList;

.field public static volatile f:Ljava/lang/String;

.field public static g:Ljava/lang/String;

.field public static final h:Lceg;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/opera/android/browser/obml/Platform;->e:Ljava/util/ArrayList;

    new-instance v0, Lceg;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lceg;-><init>(Landroid/os/Looper;B)V

    sput-object v0, Lcom/opera/android/browser/obml/Platform;->h:Lceg;

    return-void
.end method

.method public static a(Ljava/nio/IntBuffer;Ljava/nio/ByteBuffer;Ljava/nio/IntBuffer;ILjava/lang/String;Ljava/lang/String;)Z
    .registers 9

    const/4 v0, 0x0

    if-eq p5, p4, :cond_6d

    invoke-virtual {p0, p3}, Ljava/nio/IntBuffer;->put(I)Ljava/nio/IntBuffer;

    invoke-virtual {p5}, Ljava/lang/String;->length()I

    move-result p0

    const/4 p3, 0x1

    if-eq p0, p3, :cond_62

    const/4 p4, 0x2

    if-eq p0, p4, :cond_50

    const/4 v1, 0x3

    if-eq p0, v1, :cond_37

    const/4 v2, 0x4

    if-eq p0, v2, :cond_17

    return p3

    :cond_17
    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    invoke-virtual {p5, v0}, Ljava/lang/String;->charAt(I)C

    move-result p0

    invoke-virtual {p2, p0}, Ljava/nio/IntBuffer;->put(I)Ljava/nio/IntBuffer;

    invoke-virtual {p5, p3}, Ljava/lang/String;->charAt(I)C

    move-result p0

    invoke-virtual {p2, p0}, Ljava/nio/IntBuffer;->put(I)Ljava/nio/IntBuffer;

    invoke-virtual {p5, p4}, Ljava/lang/String;->charAt(I)C

    move-result p0

    invoke-virtual {p2, p0}, Ljava/nio/IntBuffer;->put(I)Ljava/nio/IntBuffer;

    invoke-virtual {p5, v1}, Ljava/lang/String;->charAt(I)C

    move-result p0

    invoke-virtual {p2, p0}, Ljava/nio/IntBuffer;->put(I)Ljava/nio/IntBuffer;

    return p3

    :cond_37
    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    invoke-virtual {p5, v0}, Ljava/lang/String;->charAt(I)C

    move-result p0

    invoke-virtual {p2, p0}, Ljava/nio/IntBuffer;->put(I)Ljava/nio/IntBuffer;

    invoke-virtual {p5, p3}, Ljava/lang/String;->charAt(I)C

    move-result p0

    invoke-virtual {p2, p0}, Ljava/nio/IntBuffer;->put(I)Ljava/nio/IntBuffer;

    invoke-virtual {p5, p4}, Ljava/lang/String;->charAt(I)C

    move-result p0

    invoke-virtual {p2, p0}, Ljava/nio/IntBuffer;->put(I)Ljava/nio/IntBuffer;

    return p3

    :cond_50
    invoke-virtual {p1, p4}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    invoke-virtual {p5, v0}, Ljava/lang/String;->charAt(I)C

    move-result p0

    invoke-virtual {p2, p0}, Ljava/nio/IntBuffer;->put(I)Ljava/nio/IntBuffer;

    invoke-virtual {p5, p3}, Ljava/lang/String;->charAt(I)C

    move-result p0

    invoke-virtual {p2, p0}, Ljava/nio/IntBuffer;->put(I)Ljava/nio/IntBuffer;

    return p3

    :cond_62
    invoke-virtual {p1, p3}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    invoke-virtual {p5, v0}, Ljava/lang/String;->charAt(I)C

    move-result p0

    invoke-virtual {p2, p0}, Ljava/nio/IntBuffer;->put(I)Ljava/nio/IntBuffer;

    return p3

    :cond_6d
    return v0
.end method

.method public static b(Ljava/nio/IntBuffer;Ljava/nio/ByteBuffer;Ljava/nio/IntBuffer;II[C)V
    .registers 13

    move v3, p3

    :goto_1
    if-gt v3, p4, :cond_4e

    int-to-char p3, v3

    const/4 v0, 0x0

    aput-char p3, p5, v0

    const-string p3, "\u00df\u0130\u0149\u01f0\u0390\u03b0\u0587\u1e96\u1e97\u1e98\u1e99\u1e9a\u1e9e\u1f50\u1f52\u1f54\u1f56\u1f80\u1f81\u1f82\u1f83\u1f84\u1f85\u1f86\u1f87\u1f88\u1f89\u1f8a\u1f8b\u1f8c\u1f8d\u1f8e\u1f8f\u1f90\u1f91\u1f92\u1f93\u1f94\u1f95\u1f96\u1f97\u1f98\u1f99\u1f9a\u1f9b\u1f9c\u1f9d\u1f9e\u1f9f\u1fa0\u1fa1\u1fa2\u1fa3\u1fa4\u1fa5\u1fa6\u1fa7\u1fa8\u1fa9\u1faa\u1fab\u1fac\u1fad\u1fae\u1faf\u1fb2\u1fb3\u1fb4\u1fb6\u1fb7\u1fbc\u1fc2\u1fc3\u1fc4\u1fc6\u1fc7\u1fcc\u1fd2\u1fd3\u1fd6\u1fd7\u1fe2\u1fe3\u1fe4\u1fe6\u1fe7\u1ff2\u1ff3\u1ff4\u1ff6\u1ff7\u1ffc\ufb00\ufb01\ufb02\ufb03\ufb04\ufb05\ufb06\ufb13\ufb14\ufb15\ufb16\ufb17"

    invoke-virtual {p3, v3}, Ljava/lang/String;->indexOf(I)I

    move-result p3

    const/4 v6, 0x1

    if-gez p3, :cond_25

    aget-char p3, p5, v0

    invoke-static {p3}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v0

    if-eq v0, p3, :cond_21

    invoke-virtual {p0, v3}, Ljava/nio/IntBuffer;->put(I)Ljava/nio/IntBuffer;

    invoke-virtual {p1, v6}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    invoke-virtual {p2, v0}, Ljava/nio/IntBuffer;->put(I)Ljava/nio/IntBuffer;

    :cond_21
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    goto :goto_48

    :cond_25
    new-instance v4, Ljava/lang/String;

    invoke-direct {v4, p5}, Ljava/lang/String;-><init>([C)V

    sget-object p3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v4, p3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v5

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-static/range {v0 .. v5}, Lcom/opera/android/browser/obml/Platform;->a(Ljava/nio/IntBuffer;Ljava/nio/ByteBuffer;Ljava/nio/IntBuffer;ILjava/lang/String;Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_48

    invoke-virtual {v4, p3}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v5

    if-eq v5, v4, :cond_48

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result p0

    if-le p0, v6, :cond_48

    invoke-static/range {v0 .. v5}, Lcom/opera/android/browser/obml/Platform;->a(Ljava/nio/IntBuffer;Ljava/nio/ByteBuffer;Ljava/nio/IntBuffer;ILjava/lang/String;Ljava/lang/String;)Z

    :cond_48
    :goto_48
    add-int/lit8 v3, v3, 0x1

    move-object p0, v0

    move-object p1, v1

    move-object p2, v2

    goto :goto_1

    :cond_4e
    return-void
.end method

.method public static c()Ljava/lang/String;
    .registers 3

    sget-object v0, Lf8a;->h:Lf8a;

    sget-object v1, Lcom/opera/android/browser/obml/Platform;->f:Ljava/lang/String;

    if-eqz v1, :cond_26

    const-string v1, "Cookies"

    const-string v2, "Client"

    invoke-static {v1, v2}, LJ/N;->MQ$xB7I2(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    sget-object v2, Lcom/opera/android/browser/obml/Platform;->a:Landroid/content/Context;

    if-eqz v2, :cond_21

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_21

    const-string v0, "Empty cookie"

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    :goto_1f
    const/4 v0, 0x0

    return-object v0

    :cond_21
    invoke-virtual {v0, v1}, Lf8a;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_26
    const-string v0, "Platform base path not initialized"

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_1f
.end method

.method public static d(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    sget-object v0, Lcom/opera/android/browser/obml/Platform;->f:Ljava/lang/String;

    if-eqz v0, :cond_10

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/opera/android/browser/obml/Platform;->f:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Lz1m;->l(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_10
    const-string p0, "Platform base path not initialized"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static e(Z)V
    .registers 3

    sget-byte v0, Lcom/opera/android/browser/obml/Platform;->d:B

    const/4 v1, 0x1

    if-nez v0, :cond_7

    move v0, v1

    goto :goto_8

    :cond_7
    const/4 v0, 0x0

    :goto_8
    if-eqz p0, :cond_b

    const/4 v1, 0x2

    :cond_b
    sput-byte v1, Lcom/opera/android/browser/obml/Platform;->d:B

    sget-object v1, Lcom/opera/android/browser/obml/Platform;->a:Landroid/content/Context;

    if-eqz v1, :cond_23

    invoke-static {p0}, LJ/N;->MurTvRR9(Z)V

    if-eqz v0, :cond_23

    sget-byte p0, Lcom/opera/android/browser/obml/Platform;->d:B

    if-eqz p0, :cond_23

    sget-boolean p0, Lcom/opera/android/browser/obml/Platform;->c:Z

    if-eqz p0, :cond_23

    const/16 p0, 0x8

    invoke-static {p0}, Lcak;->a(I)V

    :cond_23
    return-void
.end method

.method public static f()V
    .registers 3

    sget-object v0, Lcom/opera/android/browser/obml/Platform;->a:Landroid/content/Context;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->I()Z

    move-result v1

    if-nez v1, :cond_16

    const/4 v1, 0x1

    goto :goto_1a

    :cond_16
    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->M()Z

    move-result v1

    :goto_1a
    const-string v2, "personalized_ads"

    invoke-virtual {v0, v2}, Lcom/opera/android/settings/SettingsManager;->u(Ljava/lang/String;)Z

    move-result v0

    invoke-static {v0, v1}, LJ/N;->MNOKrXtU(ZZ)V

    return-void
.end method

.method public static getAbGroup()Ljava/lang/String;
    .registers 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    sget-object v0, Lcom/opera/android/browser/obml/Platform;->a:Landroid/content/Context;

    invoke-static {v0}, Lv1;->u(Landroid/content/Context;)Lv1;

    move-result-object v0

    invoke-virtual {v0}, Lv1;->x()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getAdvertisingId()Ljava/lang/String;
    .registers 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    sget-object v0, Lcom/opera/android/browser/obml/Platform;->a:Landroid/content/Context;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->d()Le00;

    move-result-object v0

    invoke-virtual {v0}, Le00;->b()Lc00;

    move-result-object v0

    iget-object v0, v0, Lc00;->a:Ljava/lang/String;

    return-object v0
.end method

.method public static getAndroidApiVersion()B
    .registers 1

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    int-to-byte v0, v0

    return v0
.end method

.method public static getCaseFolding()[Ljava/nio/Buffer;
    .registers 9
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    const/4 v0, 0x1

    new-array v6, v0, [C

    const/16 v1, 0x1450

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->asIntBuffer()Ljava/nio/IntBuffer;

    move-result-object v2

    const/16 v3, 0x514

    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v3

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->asIntBuffer()Ljava/nio/IntBuffer;

    move-result-object v1

    const/4 v7, 0x0

    invoke-virtual {v2, v7}, Ljava/nio/IntBuffer;->put(I)Ljava/nio/IntBuffer;

    invoke-virtual {v1, v7}, Ljava/nio/IntBuffer;->put(I)Ljava/nio/IntBuffer;

    const/16 v4, 0x41

    const/16 v5, 0x5a

    move-object v8, v3

    move-object v3, v1

    move-object v1, v2

    move-object v2, v8

    invoke-static/range {v1 .. v6}, Lcom/opera/android/browser/obml/Platform;->b(Ljava/nio/IntBuffer;Ljava/nio/ByteBuffer;Ljava/nio/IntBuffer;II[C)V

    const/16 v4, 0xb5

    const/16 v5, 0xb5

    invoke-static/range {v1 .. v6}, Lcom/opera/android/browser/obml/Platform;->b(Ljava/nio/IntBuffer;Ljava/nio/ByteBuffer;Ljava/nio/IntBuffer;II[C)V

    const/16 v4, 0xc0

    const/16 v5, 0xdf

    invoke-static/range {v1 .. v6}, Lcom/opera/android/browser/obml/Platform;->b(Ljava/nio/IntBuffer;Ljava/nio/ByteBuffer;Ljava/nio/IntBuffer;II[C)V

    const/16 v4, 0x100

    const/16 v5, 0x24e

    invoke-static/range {v1 .. v6}, Lcom/opera/android/browser/obml/Platform;->b(Ljava/nio/IntBuffer;Ljava/nio/ByteBuffer;Ljava/nio/IntBuffer;II[C)V

    const/16 v4, 0x345

    const/16 v5, 0x345

    invoke-static/range {v1 .. v6}, Lcom/opera/android/browser/obml/Platform;->b(Ljava/nio/IntBuffer;Ljava/nio/ByteBuffer;Ljava/nio/IntBuffer;II[C)V

    const/16 v4, 0x370

    const/16 v5, 0x42f

    invoke-static/range {v1 .. v6}, Lcom/opera/android/browser/obml/Platform;->b(Ljava/nio/IntBuffer;Ljava/nio/ByteBuffer;Ljava/nio/IntBuffer;II[C)V

    const/16 v4, 0x460

    const/16 v5, 0x587

    invoke-static/range {v1 .. v6}, Lcom/opera/android/browser/obml/Platform;->b(Ljava/nio/IntBuffer;Ljava/nio/ByteBuffer;Ljava/nio/IntBuffer;II[C)V

    const/16 v4, 0x10a0

    const/16 v5, 0x10c5

    invoke-static/range {v1 .. v6}, Lcom/opera/android/browser/obml/Platform;->b(Ljava/nio/IntBuffer;Ljava/nio/ByteBuffer;Ljava/nio/IntBuffer;II[C)V

    const/16 v4, 0x1e00

    const/16 v5, 0x1ffd

    invoke-static/range {v1 .. v6}, Lcom/opera/android/browser/obml/Platform;->b(Ljava/nio/IntBuffer;Ljava/nio/ByteBuffer;Ljava/nio/IntBuffer;II[C)V

    const/16 v4, 0x2126

    const/16 v5, 0x2132

    invoke-static/range {v1 .. v6}, Lcom/opera/android/browser/obml/Platform;->b(Ljava/nio/IntBuffer;Ljava/nio/ByteBuffer;Ljava/nio/IntBuffer;II[C)V

    const/16 v4, 0x2160

    const/16 v5, 0x2183

    invoke-static/range {v1 .. v6}, Lcom/opera/android/browser/obml/Platform;->b(Ljava/nio/IntBuffer;Ljava/nio/ByteBuffer;Ljava/nio/IntBuffer;II[C)V

    const/16 v4, 0x24b6

    const/16 v5, 0x24cf

    invoke-static/range {v1 .. v6}, Lcom/opera/android/browser/obml/Platform;->b(Ljava/nio/IntBuffer;Ljava/nio/ByteBuffer;Ljava/nio/IntBuffer;II[C)V

    const/16 v4, 0x2c00

    const/16 v5, 0x2ced

    invoke-static/range {v1 .. v6}, Lcom/opera/android/browser/obml/Platform;->b(Ljava/nio/IntBuffer;Ljava/nio/ByteBuffer;Ljava/nio/IntBuffer;II[C)V

    const v4, 0xa640

    const v5, 0xa696

    invoke-static/range {v1 .. v6}, Lcom/opera/android/browser/obml/Platform;->b(Ljava/nio/IntBuffer;Ljava/nio/ByteBuffer;Ljava/nio/IntBuffer;II[C)V

    const v4, 0xa722

    const v5, 0xa78b

    invoke-static/range {v1 .. v6}, Lcom/opera/android/browser/obml/Platform;->b(Ljava/nio/IntBuffer;Ljava/nio/ByteBuffer;Ljava/nio/IntBuffer;II[C)V

    const v4, 0xfb00

    const v5, 0xfb17

    invoke-static/range {v1 .. v6}, Lcom/opera/android/browser/obml/Platform;->b(Ljava/nio/IntBuffer;Ljava/nio/ByteBuffer;Ljava/nio/IntBuffer;II[C)V

    const v4, 0xff21

    const v5, 0xff3a

    invoke-static/range {v1 .. v6}, Lcom/opera/android/browser/obml/Platform;->b(Ljava/nio/IntBuffer;Ljava/nio/ByteBuffer;Ljava/nio/IntBuffer;II[C)V

    invoke-virtual {v1}, Ljava/nio/Buffer;->position()I

    move-result v4

    sub-int/2addr v4, v0

    invoke-virtual {v1, v7, v4}, Ljava/nio/IntBuffer;->put(II)Ljava/nio/IntBuffer;

    invoke-virtual {v3}, Ljava/nio/Buffer;->position()I

    move-result v4

    sub-int/2addr v4, v0

    invoke-virtual {v3, v7, v4}, Ljava/nio/IntBuffer;->put(II)Ljava/nio/IntBuffer;

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/nio/Buffer;

    aput-object v1, v4, v7

    aput-object v2, v4, v0

    const/4 v0, 0x2

    aput-object v3, v4, v0

    return-object v4
.end method

.method public static getConfigBundle()Ljava/lang/String;
    .registers 3
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    sget-object v0, Lcom/opera/android/browser/obml/Platform;->a:Landroid/content/Context;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->i()Ljk5;

    move-result-object v0

    iget-object v1, v0, Ljk5;->d:Ljava/lang/Object;

    monitor-enter v1

    :try_start_11
    iget-object v2, v0, Ljk5;->e:Ljava/lang/String;
    :try_end_13
    .catchall {:try_start_11 .. :try_end_13} :catchall_1c

    monitor-exit v1

    if-nez v2, :cond_1b

    invoke-virtual {v0}, Ljk5;->a()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_1b
    return-object v2

    :catchall_1c
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static getCountry()Ljava/lang/String;
    .registers 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getLanguage()Ljava/lang/String;
    .registers 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-static {v0}, Lsfe;->b0(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getLimitAdTracking()Z
    .registers 2

    sget-object v0, Lcom/opera/android/browser/obml/Platform;->a:Landroid/content/Context;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->d()Le00;

    move-result-object v0

    invoke-virtual {v0}, Le00;->b()Lc00;

    move-result-object v0

    iget-boolean v0, v0, Lc00;->b:Z

    return v0
.end method

.method public static getPlatformName()B
    .registers 1

    invoke-static {}, Li0l;->g()Z

    move-result v0

    if-eqz v0, :cond_9

    const/16 v0, 0x63

    return v0

    :cond_9
    const/16 v0, 0x61

    return v0
.end method

.method public static getSimMCC()Ljava/lang/String;
    .registers 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    sget-object v0, Lcom/opera/android/browser/obml/Platform;->a:Landroid/content/Context;

    invoke-static {v0}, Li0l;->d(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getSimMNC()Ljava/lang/String;
    .registers 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    sget-object v0, Lcom/opera/android/browser/obml/Platform;->a:Landroid/content/Context;

    invoke-static {v0}, Li0l;->e(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getUniquePlatformId()Ljava/lang/String;
    .registers 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    sget-object v0, Lcom/opera/android/browser/obml/Platform;->a:Landroid/content/Context;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    const-string v1, "onboarding_deleted"

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_18

    const/4 v0, 0x0

    return-object v0

    :cond_18
    sget-object v0, Lcom/opera/android/browser/obml/Platform;->a:Landroid/content/Context;

    invoke-static {v0}, Lzi4;->A(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getUserStats()Ljava/lang/String;
    .registers 10
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    sget-object v0, Lcom/opera/android/browser/obml/Platform;->a:Landroid/content/Context;

    invoke-static {v0}, Loji;->y(Landroid/content/Context;)Loji;

    move-result-object v0

    iget-object v0, v0, Loji;->a:Ljava/lang/Object;

    check-cast v0, Lb59;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/SharedPreferences;

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const/4 v3, 0x7

    invoke-static {v3}, Lvep;->B(I)[I

    move-result-object v3

    array-length v4, v3

    const/4 v5, 0x0

    move v6, v5

    :goto_21
    if-ge v6, v4, :cond_5f

    aget v7, v3, v6

    invoke-static {v7}, Lfki;->g(I)C

    move-result v8

    if-eqz v8, :cond_5c

    invoke-static {v7}, Lfki;->t(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/content/SharedPreferences;

    invoke-interface {v9, v8, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v8

    if-eqz v8, :cond_5c

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v9

    if-lez v9, :cond_46

    const/16 v9, 0x2c

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_46
    invoke-static {v7}, Lfki;->g(I)C

    move-result v9

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/16 v9, 0x2f

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-static {v7}, Lfki;->t(I)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v2, v7, v5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    :cond_5c
    add-int/lit8 v6, v6, 0x1

    goto :goto_21

    :cond_5f
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-lez v0, :cond_68

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_68
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-lez v0, :cond_73

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_73
    const/4 v0, 0x0

    return-object v0
.end method

.method public static getWebpQuality()B
    .registers 2

    sget-byte v0, Lcom/opera/android/browser/obml/Platform;->b:B

    if-gez v0, :cond_20

    sget-object v0, Lcom/opera/android/browser/obml/Platform;->a:Landroid/content/Context;

    invoke-static {v0}, Lnr8;->e(Landroid/content/Context;)I

    move-result v0

    add-int/lit8 v0, v0, -0x50

    const/4 v1, 0x0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    mul-int/lit8 v0, v0, 0xf

    div-int/lit8 v0, v0, -0x3c

    add-int/lit8 v0, v0, 0x5a

    const/16 v1, 0x4b

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    int-to-byte v0, v0

    sput-byte v0, Lcom/opera/android/browser/obml/Platform;->b:B

    :cond_20
    return v0
.end method

.method public static isConfigBundlePending()Z
    .registers 2

    sget-object v0, Lcom/opera/android/browser/obml/Platform;->a:Landroid/content/Context;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->i()Ljk5;

    move-result-object v0

    iget-object v1, v0, Ljk5;->d:Ljava/lang/Object;

    monitor-enter v1

    :try_start_11
    iget-object v0, v0, Ljk5;->e:Ljava/lang/String;
    :try_end_13
    .catchall {:try_start_11 .. :try_end_13} :catchall_1a

    if-eqz v0, :cond_17

    const/4 v0, 0x1

    goto :goto_18

    :cond_17
    const/4 v0, 0x0

    :goto_18
    monitor-exit v1

    return v0

    :catchall_1a
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static isRequestingHomeCountryReset()Z
    .registers 2

    sget-object v0, Lcom/opera/android/browser/obml/Platform;->a:Landroid/content/Context;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    const-string v1, "ongoing_installation_location_reset"

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static onSettingChanged(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    sget-object p2, Lcom/opera/android/browser/obml/Platform;->e:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_7
    if-ge v1, v0, :cond_15

    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Lagg;

    invoke-interface {v2, p0, p1}, Lagg;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_7

    :cond_15
    return-void
.end method

.method public static readProxyConfig()Ljava/lang/String;
    .registers 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    sget-object v0, Lcom/opera/android/browser/obml/Platform;->a:Landroid/content/Context;

    if-eqz v0, :cond_2e

    :try_start_4
    new-instance v0, Ljava/net/URI;

    const-string v1, "http://www.opera.com"

    invoke-direct {v0, v1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lb8h;->g(Ljava/net/URI;)Lcm;

    move-result-object v0
    :try_end_f
    .catch Ljava/net/URISyntaxException; {:try_start_4 .. :try_end_f} :catch_10

    goto :goto_11

    :catch_10
    const/4 v0, 0x0

    :goto_11
    if-eqz v0, :cond_2e

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    iget-object v1, v0, Lcm;->c:Ljava/lang/String;

    iget v0, v0, Lcm;->b:I

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ":"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_30

    :cond_2e
    const-string v0, ""

    :goto_30
    return-object v0
.end method

.method public static requestSlice(I)V
    .registers 5

    sget-object v0, Lcom/opera/android/browser/obml/Platform;->h:Lceg;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v1

    const/4 v2, 0x1

    iput v2, v1, Landroid/os/Message;->what:I

    invoke-virtual {v1, v2}, Landroid/os/Message;->setAsynchronous(Z)V

    int-to-long v2, p0

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    return-void
.end method

.method public static setHost(Ljava/lang/String;)V
    .registers 2
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    sput-object p0, Lcom/opera/android/browser/obml/Platform;->g:Ljava/lang/String;

    const/16 v0, 0x28

    invoke-static {v0, p0}, Lks3;->I(ILjava/lang/String;)V

    return-void
.end method
