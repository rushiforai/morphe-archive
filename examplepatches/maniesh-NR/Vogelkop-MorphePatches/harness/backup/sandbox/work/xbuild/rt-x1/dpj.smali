.class public final Ldpj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw7e;
.implements Llmn;
.implements Lm1p;
.implements Lq8p;
.implements Ldjp;
.implements Lec8;
.implements Lee5;
.implements Lcom/google/android/gms/tasks/OnFailureListener;


# static fields
.field public static b:Ldpj;

.field public static c:Ldpj;

.field public static final synthetic d:Ldpj;


# instance fields
.field public final synthetic a:B


# direct methods
.method public static synthetic constructor <clinit>()V
    .registers 2

    new-instance v0, Ldpj;

    const/16 v1, 0x11

    invoke-direct {v0, v1}, Ldpj;-><init>(B)V

    sput-object v0, Ldpj;->d:Ldpj;

    return-void
.end method

.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Ldpj;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static h(J)Lads_mobile_sdk/st3;
    .registers 3

    new-instance v0, Lads_mobile_sdk/rs3;

    invoke-direct {v0, p0, p1}, Lads_mobile_sdk/rs3;-><init>(J)V

    invoke-static {v0}, Lads_mobile_sdk/st3;->a(Lg9p;)Lads_mobile_sdk/st3;

    move-result-object p0

    return-object p0
.end method

.method public static i(JLads_mobile_sdk/e7;Z)V
    .registers 28

    const/16 v0, 0x9

    new-array v0, v0, [J

    fill-array-data v0, :array_7c

    const/4 v1, 0x0

    aget-wide v2, v0, v1

    const/4 v4, 0x1

    aget-wide v5, v0, v4

    const/4 v7, 0x2

    aget-wide v7, v0, v7

    const/4 v9, 0x3

    aget-wide v9, v0, v9

    const/4 v11, 0x4

    aget-wide v11, v0, v11

    const/4 v13, 0x5

    aget-wide v13, v0, v13

    const/4 v15, 0x6

    aget-wide v15, v0, v15

    const/16 v17, 0x7

    aget-wide v18, v0, v17

    const/16 v20, 0x8

    aget-wide v20, v0, v20

    move v0, v4

    move-wide/from16 v22, v5

    not-long v4, v2

    and-long v4, v4, v22

    or-long/2addr v4, v7

    and-long/2addr v2, v9

    or-long/2addr v2, v11

    add-long/2addr v4, v2

    sub-long/2addr v4, v13

    add-long/2addr v4, v15

    rem-long v18, v18, v20

    xor-long v4, v4, v18

    const v2, 0x3d38552f

    const v3, 0x42de3ff7

    const v6, 0x7d050988

    const v7, 0x168ac66

    invoke-static {v2, v3, v6, v7}, Lu0h;->a(IIII)I

    move-result v2

    const v3, 0x47a381c

    xor-int/2addr v2, v3

    if-eqz p3, :cond_52

    shl-long v6, p0, v0

    const/16 v3, 0x3f

    shr-long v8, p0, v3

    xor-long/2addr v6, v8

    goto :goto_54

    :cond_52
    move-wide/from16 v6, p0

    :goto_54
    move v3, v0

    :goto_55
    and-long v8, v6, v4

    ushr-long v6, v6, v17

    const-wide/16 v10, 0x0

    cmp-long v10, v6, v10

    if-nez v10, :cond_63

    if-ltz v3, :cond_63

    move v10, v1

    goto :goto_64

    :cond_63
    move v10, v0

    :goto_64
    long-to-int v8, v8

    if-eqz v10, :cond_6b

    or-int/lit16 v8, v8, 0x80

    shl-int/2addr v8, v2

    shr-int/2addr v8, v2

    :cond_6b
    int-to-byte v8, v8

    move-object/from16 v9, p2

    iget-object v11, v9, Lads_mobile_sdk/e7;->a:Ljava/lang/Object;

    check-cast v11, Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v11, v8}, Ljava/io/OutputStream;->write(I)V

    if-nez v10, :cond_78

    return-void

    :cond_78
    add-int/lit8 v3, v3, 0x1

    goto :goto_55

    nop

    :array_7c
    .array-data 8
        0x773d0e7b
        0x5802553e
        0x6d512429
        0x10065116
        0x6da40c08
        0x1045d6a1eL
        0x1acca918
        0x62823856
        0x611b7818
    .end array-data
.end method

.method public static k(Landroid/content/Context;)Lfpj;
    .registers 4

    invoke-static {p0}, Lr9n;->i(Landroid/content/Context;)Landroid/graphics/Rect;

    move-result-object v0

    new-instance v1, Landroid/util/Size;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v2

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    invoke-direct {v1, v2, v0}, Landroid/util/Size;-><init>(II)V

    sget-object v0, Lfpj;->a:Ldpj;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1}, Landroid/util/Size;->getHeight()I

    move-result v0

    invoke-static {v0, p0}, Lddh;->s(ILandroid/content/Context;)Lgpj;

    move-result-object v0

    sget-object v2, Lgpj;->a:Lgpj;

    invoke-virtual {v0}, Lgpj;->d()Z

    move-result v0

    if-eqz v0, :cond_29

    sget-object p0, Lfpj;->b:Lfpj;

    return-object p0

    :cond_29
    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v0

    invoke-static {v0, p0}, Lddh;->t(ILandroid/content/Context;)Lhpj;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    if-eqz p0, :cond_4e

    const/4 v0, 0x1

    if-eq p0, v0, :cond_4b

    const/4 v0, 0x2

    if-eq p0, v0, :cond_48

    const/4 v0, 0x3

    if-ne p0, v0, :cond_43

    sget-object p0, Lfpj;->f:Lfpj;

    return-object p0

    :cond_43
    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    return-object p0

    :cond_48
    sget-object p0, Lfpj;->e:Lfpj;

    return-object p0

    :cond_4b
    sget-object p0, Lfpj;->d:Lfpj;

    return-object p0

    :cond_4e
    sget-object p0, Lfpj;->c:Lfpj;

    return-object p0
.end method


# virtual methods
.method public final a(I)Ljava/lang/Object;
    .registers 3

    sget-object p0, Lads_mobile_sdk/g40;->b:Lads_mobile_sdk/g40;

    if-eqz p1, :cond_24

    const/4 v0, 0x1

    if-eq p1, v0, :cond_21

    const/4 v0, 0x2

    if-eq p1, v0, :cond_1e

    const/4 v0, 0x3

    if-eq p1, v0, :cond_1b

    const/4 v0, 0x4

    if-eq p1, v0, :cond_18

    const/4 v0, 0x5

    if-eq p1, v0, :cond_15

    const/4 p1, 0x0

    goto :goto_25

    :cond_15
    sget-object p1, Lads_mobile_sdk/g40;->g:Lads_mobile_sdk/g40;

    goto :goto_25

    :cond_18
    sget-object p1, Lads_mobile_sdk/g40;->f:Lads_mobile_sdk/g40;

    goto :goto_25

    :cond_1b
    sget-object p1, Lads_mobile_sdk/g40;->e:Lads_mobile_sdk/g40;

    goto :goto_25

    :cond_1e
    sget-object p1, Lads_mobile_sdk/g40;->d:Lads_mobile_sdk/g40;

    goto :goto_25

    :cond_21
    sget-object p1, Lads_mobile_sdk/g40;->c:Lads_mobile_sdk/g40;

    goto :goto_25

    :cond_24
    move-object p1, p0

    :goto_25
    if-nez p1, :cond_28

    return-object p0

    :cond_28
    return-object p1
.end method

.method public final b()V
    .registers 1

    return-void
.end method

.method public final c()V
    .registers 1

    return-void
.end method

.method public final d(Lqjn;)V
    .registers 2

    return-void
.end method

.method public final e(Laln;)V
    .registers 2

    return-void
.end method

.method public final f()V
    .registers 1

    return-void
.end method

.method public final g(Landroid/webkit/WebView;)V
    .registers 2

    return-void
.end method

.method public final j(Landroid/content/Context;)Lc0l;
    .registers 6

    monitor-enter p0

    :try_start_1
    sget-object v0, Lc0l;->f:Lc0l;

    if-nez v0, :cond_14

    new-instance v0, Lc0l;

    sget-object v1, Lvml;->d:Lumi;

    new-instance v2, Lydj;

    const/4 v3, 0x1

    invoke-direct {v2, p1, v3}, Lydj;-><init>(Landroid/content/Context;B)V

    invoke-direct {v0, v1, v2}, Lc0l;-><init>(Lumi;Lydj;)V

    sput-object v0, Lc0l;->f:Lc0l;
    :try_end_14
    .catchall {:try_start_1 .. :try_end_14} :catchall_16

    :cond_14
    monitor-exit p0

    return-object v0

    :catchall_16
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public final onFailure(Ljava/lang/Exception;)V
    .registers 2

    return-void
.end method

.method public final r(Lx79;)Ljava/lang/Object;
    .registers 3

    new-instance p0, Lmg8;

    const-class v0, Lm3e;

    invoke-virtual {p1, v0}, Lx79;->k(Ljava/lang/Class;)Ll7h;

    move-result-object p1

    invoke-direct {p0, p1}, Lmg8;-><init>(Ll7h;)V

    return-object p0
.end method

.method public final w(Ld5o;)Lv7e;
    .registers 4

    iget-byte p0, p0, Ldpj;->a:B

    packed-switch p0, :pswitch_data_24

    new-instance p0, Lnhk;

    const-class v0, Lxy9;

    const-class v1, Ljava/io/InputStream;

    invoke-virtual {p1, v0, v1}, Ld5o;->r(Ljava/lang/Class;Ljava/lang/Class;)Lv7e;

    move-result-object p1

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lnhk;-><init>(Lv7e;B)V

    return-object p0

    :pswitch_14
    new-instance p0, Lnhk;

    const-class v0, Landroid/net/Uri;

    const-class v1, Landroid/os/ParcelFileDescriptor;

    invoke-virtual {p1, v0, v1}, Ld5o;->r(Ljava/lang/Class;Ljava/lang/Class;)Lv7e;

    move-result-object p1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lnhk;-><init>(Lv7e;B)V

    return-object p0

    nop

    :pswitch_data_24
    .packed-switch 0x2
        :pswitch_14
    .end packed-switch
.end method
