.class public Lwth;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lim5;
.implements Lqo3;
.implements Lbs;
.implements Lbcf;
.implements Lgy1;
.implements Lvlf;
.implements Lp4g;
.implements Lhti;
.implements Lg1j;
.implements Lcom/google/android/gms/cast/framework/SessionManagerListener;
.implements Lte;
.implements Li35;
.implements Lfog;


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/Object;


# direct methods
.method public constructor <init>(B)V
    .registers 3

    iput-byte p1, p0, Lwth;->a:B

    packed-switch p1, :pswitch_data_24

    .line 77
    :pswitch_5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    new-instance p1, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v0, 0x0

    invoke-direct {p1, v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lwth;->b:Ljava/lang/Object;

    return-void

    .line 79
    :pswitch_11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    new-instance p1, Ldfe;

    const/16 v0, 0x10

    new-array v0, v0, [Ljq5;

    invoke-direct {p1, v0}, Ldfe;-><init>([Ljava/lang/Object;)V

    .line 81
    iput-object p1, p0, Lwth;->b:Ljava/lang/Object;

    return-void

    .line 82
    :pswitch_20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void

    :pswitch_data_24
    .packed-switch 0x10
        :pswitch_20
        :pswitch_5
        :pswitch_11
    .end packed-switch
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 5

    const/16 v0, 0x1c

    iput-byte v0, p0, Lwth;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    new-instance v2, Landroid/graphics/Matrix;

    new-instance v2, Lz9h;

    invoke-direct {v2}, Lz9h;-><init>()V

    iput-object v2, p0, Lwth;->b:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const/high16 p1, 0x40800000    # 4.0f

    invoke-static {p1, p0}, Lfan;->a(FLandroid/content/res/Resources;)I

    const p1, 0x7f070884

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    const p1, 0x7f070885

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    const p1, 0x7f070889

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    const p1, 0x7f07088a

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    const p1, 0x7f070888

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/BrowserActivity;)V
    .registers 3

    const/16 v0, 0x13

    iput-byte v0, p0, Lwth;->a:B

    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 86
    iget-object p1, p1, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    .line 87
    iget-object p1, p1, Ltw3;->K:Lhw3;

    .line 88
    iput-object p1, p0, Lwth;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 83
    iput-byte p2, p0, Lwth;->a:B

    iput-object p1, p0, Lwth;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/util/Set;)V
    .registers 5

    const/4 v0, 0x0

    iput-byte v0, p0, Lwth;->a:B

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lwth;->b:Ljava/lang/Object;

    .line 66
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_11
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2c

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lvth;

    iget-object v1, p0, Lwth;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/HashMap;

    .line 67
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-class v2, Lq66;

    .line 68
    iget-object v0, v0, Lvth;->a:Ll7h;

    .line 69
    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_11

    :cond_2c
    return-void
.end method

.method public constructor <init>(Ljb;Ljava/lang/String;)V
    .registers 3

    const/4 p2, 0x3

    iput-byte p2, p0, Lwth;->a:B

    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lwth;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lpde;La64;)V
    .registers 5

    const/4 v0, 0x4

    iput-byte v0, p0, Lwth;->a:B

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    invoke-static {p1}, Lxf8;->t(Lekc;)Lf99;

    move-result-object v0

    .line 72
    invoke-static {v0}, Lqbe;->t(Lf99;)Lf99;

    move-result-object v0

    .line 73
    sget-object v1, Laej;->b:Lauj;

    .line 74
    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    .line 75
    invoke-static {v0, p2, v1, p1}, La26;->o0(Lf99;Lnx5;Lbej;Ljava/lang/Object;)Lrlh;

    move-result-object p1

    .line 76
    iput-object p1, p0, Lwth;->b:Ljava/lang/Object;

    return-void
.end method

.method public static E(I)I
    .registers 2

    const/16 v0, 0x80

    if-ge p0, v0, :cond_6

    const/4 p0, 0x1

    return p0

    :cond_6
    const/4 v0, 0x2

    :goto_7
    ushr-int/lit8 p0, p0, 0x8

    if-eqz p0, :cond_e

    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    :cond_e
    return v0
.end method

.method public static F(IZ)I
    .registers 3

    invoke-static {p0}, Lwth;->E(I)I

    move-result v0

    add-int/2addr v0, p1

    add-int/2addr v0, p0

    return v0
.end method

.method public static G(I)I
    .registers 2

    const/16 v0, 0x1f

    if-ge p0, v0, :cond_6

    const/4 p0, 0x1

    return p0

    :cond_6
    const/4 v0, 0x2

    :goto_7
    ushr-int/lit8 p0, p0, 0x7

    if-eqz p0, :cond_e

    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    :cond_e
    return v0
.end method


# virtual methods
.method public final A(Ljava/util/Collection;Lkotlin/jvm/functions/Function1;)V
    .registers 8

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Ld12;

    check-cast p1, Ljava/lang/Iterable;

    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0xa

    invoke-static {p1, v1}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_15
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_37

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->longValue()J

    move-result-wide v1

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "chat/"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_15

    :cond_37
    new-instance p1, Lra;

    const/4 v1, 0x2

    invoke-direct {p1, p2, v1}, Lra;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-interface {p0, v0, p1}, Ld12;->f(Ljava/util/ArrayList;Lra;)V

    return-void
.end method

.method public final B(Lw3g;)V
    .registers 3

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Ld83;

    if-nez p0, :cond_7

    return-void

    :cond_7
    iget-object p0, p0, Ld83;->f:Ljava/lang/Object;

    check-cast p0, Ljh3;

    iget-object p0, p0, Ljh3;->F:Ly73;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Lb83;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lb83;-><init>(Ly73;B)V

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {p1, p0}, LJ/N;->MwwLnzkg(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public C()Lr86;
    .registers 3

    new-instance v0, Lr86;

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Ljava/io/OutputStream;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lwth;-><init>(Ljava/lang/Object;B)V

    return-object v0
.end method

.method public D()Ls96;
    .registers 3

    new-instance v0, Ls96;

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Ljava/io/OutputStream;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lwth;-><init>(Ljava/lang/Object;B)V

    return-object v0
.end method

.method public final H()J
    .registers 3

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;

    iget-object v0, p0, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;->c:Lbuh;

    invoke-virtual {v0}, Lc93;->g()Z

    move-result v0

    if-nez v0, :cond_f

    const-wide/16 v0, 0x0

    return-wide v0

    :cond_f
    iget-object p0, p0, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;->c:Lbuh;

    iget-object p0, p0, Lbuh;->f:Lm89;

    invoke-virtual {p0}, Lm89;->a()J

    move-result-wide v0

    return-wide v0
.end method

.method public final I(FFFF)V
    .registers 13

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Ld5o;

    invoke-virtual {p0}, Ld5o;->A()Lsh4;

    move-result-object v0

    invoke-virtual {p0}, Ld5o;->D()J

    move-result-wide v1

    const/16 v3, 0x20

    shr-long/2addr v1, v3

    long-to-int v1, v1

    invoke-static {v1}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v1

    add-float/2addr p3, p1

    sub-float/2addr v1, p3

    invoke-virtual {p0}, Ld5o;->D()J

    move-result-wide v4

    const-wide v6, 0xffffffffL

    and-long/2addr v4, v6

    long-to-int p3, v4

    invoke-static {p3}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result p3

    add-float/2addr p4, p2

    sub-float/2addr p3, p4

    invoke-static {v1}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result p4

    int-to-long v1, p4

    invoke-static {p3}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result p3

    int-to-long p3, p3

    shl-long/2addr v1, v3

    and-long/2addr p3, v6

    or-long/2addr v1, p3

    shr-long p3, v1, v3

    long-to-int p3, p3

    invoke-static {p3}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result p3

    const/4 p4, 0x0

    cmpl-float p3, p3, p4

    if-ltz p3, :cond_4a

    and-long/2addr v6, v1

    long-to-int p3, v6

    invoke-static {p3}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result p3

    cmpl-float p3, p3, p4

    if-gez p3, :cond_4f

    :cond_4a
    const-string p3, "Width and height must be greater than or equal to zero"

    invoke-static {p3}, Lz7b;->a(Ljava/lang/String;)V

    :cond_4f
    invoke-virtual {p0, v1, v2}, Ld5o;->K(J)V

    invoke-interface {v0, p1, p2}, Lsh4;->e(FF)V

    return-void
.end method

.method public final J()V
    .registers 9

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Llw4;

    iget-object v0, p0, Llw4;->f:Ljava/lang/Object;

    check-cast v0, Liw4;

    iget v1, v0, Liw4;->o:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "on connect callback, pid=%d"

    invoke-static {v2, v1}, Lwxe;->t(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v1, p0, Llw4;->a:Ljava/lang/Object;

    check-cast v1, Lpjn;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v2, v0, Liw4;->o:I

    if-lez v2, :cond_95

    sget-object v3, Lorg/chromium/content/browser/ChildProcessLauncherHelperImpl;->p:Ljava/util/HashMap;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget-object v4, v1, Lpjn;->b:Ljava/lang/Object;

    check-cast v4, Lorg/chromium/content/browser/ChildProcessLauncherHelperImpl;

    invoke-virtual {v3, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v2, v1, Lpjn;->b:Ljava/lang/Object;

    check-cast v2, Lorg/chromium/content/browser/ChildProcessLauncherHelperImpl;

    iget-object v3, v2, Lorg/chromium/content/browser/ChildProcessLauncherHelperImpl;->a:Lsw4;

    if-eqz v3, :cond_71

    iget-boolean v2, v2, Lorg/chromium/content/browser/ChildProcessLauncherHelperImpl;->k:Z

    iget-object v4, v1, Lpjn;->b:Ljava/lang/Object;

    check-cast v4, Lorg/chromium/content/browser/ChildProcessLauncherHelperImpl;

    iget-byte v4, v4, Lorg/chromium/content/browser/ChildProcessLauncherHelperImpl;->i:B

    iget-object v5, v3, Lsw4;->c:Ljava/util/ArrayList;

    iget v6, v3, Lsw4;->b:I

    const/4 v7, -0x1

    if-eq v6, v7, :cond_5c

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-lt v7, v6, :cond_5c

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result p0

    const-string v0, "mRankings.size:"

    const-string v1, " mMaxSize:"

    invoke-static {p0, v6, v0, v1}, Lsko;->h(IILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lh9o;->r(Ljava/lang/String;)V

    return-void

    :cond_5c
    new-instance v6, Lpw4;

    invoke-direct {v6, v0, v2, v4}, Lpw4;-><init>(Liw4;ZI)V

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v3, v2}, Lsw4;->e(I)V

    iget-object v2, v1, Lpjn;->b:Ljava/lang/Object;

    check-cast v2, Lorg/chromium/content/browser/ChildProcessLauncherHelperImpl;

    :cond_71
    iget-boolean v2, v2, Lorg/chromium/content/browser/ChildProcessLauncherHelperImpl;->b:Z

    if-eqz v2, :cond_80

    invoke-static {}, Ls14;->y()Ls14;

    move-result-object v2

    iget-object v2, v2, Ls14;->c:Ljava/lang/Object;

    check-cast v2, Lt72;

    invoke-virtual {v2, v0}, Lt72;->add(Ljava/lang/Object;)Z

    :cond_80
    iget-object v2, v1, Lpjn;->b:Ljava/lang/Object;

    check-cast v2, Lorg/chromium/content/browser/ChildProcessLauncherHelperImpl;

    iget-boolean v2, v2, Lorg/chromium/content/browser/ChildProcessLauncherHelperImpl;->c:Z

    if-eqz v2, :cond_95

    invoke-static {}, Lorg/chromium/base/ApplicationStatus;->hasVisibleActivities()Z

    move-result v2

    if-nez v2, :cond_95

    iget-object v2, v1, Lpjn;->b:Ljava/lang/Object;

    check-cast v2, Lorg/chromium/content/browser/ChildProcessLauncherHelperImpl;

    invoke-virtual {v2}, Lorg/chromium/content/browser/ChildProcessLauncherHelperImpl;->a()V

    :cond_95
    iget-object v2, v1, Lpjn;->b:Ljava/lang/Object;

    check-cast v2, Lorg/chromium/content/browser/ChildProcessLauncherHelperImpl;

    iget-wide v2, v2, Lorg/chromium/content/browser/ChildProcessLauncherHelperImpl;->g:J

    const-wide/16 v4, 0x0

    cmp-long v6, v2, v4

    if-eqz v6, :cond_a6

    iget v0, v0, Liw4;->o:I

    invoke-static {v2, v3, v0}, LJ/N;->MXR$KaDS(JI)V

    :cond_a6
    iget-object v0, v1, Lpjn;->b:Ljava/lang/Object;

    check-cast v0, Lorg/chromium/content/browser/ChildProcessLauncherHelperImpl;

    iput-wide v4, v0, Lorg/chromium/content/browser/ChildProcessLauncherHelperImpl;->g:J

    :try_start_ac
    iget-object p0, p0, Llw4;->c:Ljava/lang/Object;

    check-cast p0, [Lorg/chromium/base/process_launcher/IFileDescriptorInfo;

    array-length v0, p0

    const/4 v1, 0x0

    :goto_b2
    if-ge v1, v0, :cond_be

    aget-object v2, p0, v1

    iget-object v2, v2, Lorg/chromium/base/process_launcher/IFileDescriptorInfo;->b:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_bb
    .catch Ljava/io/IOException; {:try_start_ac .. :try_end_bb} :catch_be

    add-int/lit8 v1, v1, 0x1

    goto :goto_b2

    :catch_be
    :cond_be
    return-void
.end method

.method public final K(Ljava/lang/String;IZIZLeri;)V
    .registers 33

    move/from16 v1, p2

    move-object/from16 v2, p0

    iget-object v2, v2, Lwth;->b:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/BrowserActivity;

    invoke-static/range {p1 .. p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    move-object/from16 v4, p1

    move-object v0, v2

    sget-object v2, Llqm;->b:Llqm;

    if-eqz v3, :cond_1d

    const/4 v4, 0x1

    const/4 v5, 0x1

    move/from16 v1, p4

    move-object/from16 v3, p6

    invoke-virtual/range {v0 .. v5}, Lcom/opera/android/BrowserActivity;->k1(ILlqm;Leri;ZZ)V

    return-void

    :cond_1d
    move-object v3, v2

    move-object v2, v0

    move/from16 v0, p4

    sget v5, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v2}, Lcom/opera/android/BrowserActivity;->B1()V

    invoke-virtual {v2}, Lcom/opera/android/BrowserActivity;->w0()Lb2l;

    move-result-object v5

    if-eqz v5, :cond_235

    move-object v6, v5

    check-cast v6, Ld7l;

    iget-object v7, v6, Ld7l;->j:Le7l;

    invoke-interface {v7}, Lb9l;->m()Z

    move-result v7

    const/4 v8, 0x2

    const/4 v9, 0x3

    if-ne v0, v8, :cond_3b

    const/4 v14, 0x1

    goto :goto_40

    :cond_3b
    if-ne v0, v9, :cond_3f

    const/4 v14, 0x0

    goto :goto_40

    :cond_3f
    move v14, v7

    :goto_40
    iget-object v7, v6, Ld7l;->j:Le7l;

    invoke-interface {v7}, Lb9l;->m()Z

    move-result v7

    if-eq v14, v7, :cond_4a

    const/4 v7, 0x1

    goto :goto_4b

    :cond_4a
    const/4 v7, 0x0

    :goto_4b
    if-nez p6, :cond_89

    if-nez p3, :cond_70

    if-nez v7, :cond_70

    sget-object v8, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v2}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v8

    check-cast v8, Lcom/opera/android/OperaApplication;

    invoke-virtual {v8}, Lcom/opera/android/OperaApplication;->I()Lq6e;

    move-result-object v8

    invoke-virtual {v6}, Ld7l;->j0()J

    move-result-wide v12

    invoke-virtual {v8, v12, v13}, Lq6e;->c(J)Ll6e;

    move-result-object v8

    if-nez v8, :cond_8b

    invoke-virtual {v2}, Ldx3;->M()Llg;

    move-result-object v8

    invoke-virtual {v8}, Llg;->b()Leri;

    move-result-object v8

    goto :goto_8b

    :cond_70
    sget-object v8, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v2}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v8

    check-cast v8, Lcom/opera/android/OperaApplication;

    iget-object v8, v8, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v8, v8, Lxv1;->y:Lj4c;

    invoke-virtual {v8}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lize;

    invoke-virtual {v8}, Lekc;->g()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Leri;

    goto :goto_8b

    :cond_89
    move-object/from16 v8, p6

    :cond_8b
    :goto_8b
    sget-object v12, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v2}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v12

    check-cast v12, Lcom/opera/android/OperaApplication;

    invoke-virtual {v12}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v12

    iget-object v12, v12, Ld6j;->c:Lx5f;

    iget-object v13, v12, Lx5f;->d:Lzpa;

    invoke-static {v1}, Lvep;->A(I)I

    move-result v15

    packed-switch v15, :pswitch_data_236

    invoke-static {}, Lh9o;->p()V

    return-void

    :pswitch_a6
    invoke-interface {v8}, Leri;->l()Ljava/lang/String;

    move-result-object v15

    const/16 p0, 0x0

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v10

    iget-boolean v9, v12, Lx5f;->h:Z

    if-nez v9, :cond_b7

    move-object/from16 v16, v2

    goto :goto_d7

    :cond_b7
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v9

    new-instance v11, Lck0;

    invoke-direct {v11, v13, v9}, Lck0;-><init>(Lzpa;Lx56;)V

    invoke-virtual {v11}, Lck0;->d()Ltd0;

    move-result-object v11

    new-instance v0, Lr95;

    move-object/from16 v16, v2

    const/4 v2, 0x5

    invoke-direct {v0, v2, v10}, Lr95;-><init>(BI)V

    invoke-virtual {v11, v15, v0}, Ltd0;->e(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v12, v9}, Lx5f;->U0(Lx56;)V

    goto :goto_d7

    :pswitch_d3
    move-object/from16 v16, v2

    const/16 p0, 0x0

    :goto_d7
    if-eqz p5, :cond_e2

    invoke-interface {v8}, Leri;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0, v4}, Lzg;->o(ILjava/lang/String;Ljava/lang/String;)Lzg;

    move-result-object v0

    goto :goto_ea

    :cond_e2
    invoke-interface {v8}, Leri;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0, v4}, Lzg;->n(ILjava/lang/String;Ljava/lang/String;)Lzg;

    move-result-object v0

    :goto_ea
    if-nez v0, :cond_f8

    const/4 v4, 0x1

    const/4 v5, 0x1

    move-object v2, v3

    const/4 v3, 0x0

    move/from16 v1, p4

    move-object/from16 v0, v16

    invoke-virtual/range {v0 .. v5}, Lcom/opera/android/BrowserActivity;->k1(ILlqm;Leri;ZZ)V

    return-void

    :cond_f8
    move-object/from16 v2, v16

    const/4 v9, 0x1

    new-array v10, v9, [Z

    aput-boolean p0, v10, p0

    const/4 v9, 0x3

    if-ne v1, v9, :cond_10c

    if-nez p5, :cond_156

    new-instance v4, Ljfd;

    invoke-direct {v4, v8}, Ljfd;-><init>(Leri;)V

    move/from16 v16, v7

    goto :goto_15a

    :cond_10c
    if-nez p5, :cond_156

    sget-object v9, Loy0;->a:Lkotlin/text/Regex;

    invoke-static {v4}, Lkotlin/text/StringsKt;->l0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    const/16 v9, 0xa

    invoke-static {v4, v9}, Lkotlin/text/StringsKt;->g0(Ljava/lang/String;C)Ljava/lang/String;

    move-result-object v4

    sget-object v9, Loy0;->a:Lkotlin/text/Regex;

    invoke-static {v9, v4}, Lkotlin/text/Regex;->d(Lkotlin/text/Regex;Ljava/lang/CharSequence;)Lucd;

    move-result-object v9

    if-eqz v9, :cond_156

    invoke-virtual {v9}, Lucd;->b()Lkotlin/ranges/IntRange;

    move-result-object v9

    new-instance v11, Lkotlin/ranges/IntRange;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v15

    move-object/from16 p1, v4

    const/4 v4, 0x1

    sub-int/2addr v15, v4

    move/from16 v16, v7

    move/from16 v7, p0

    invoke-direct {v11, v7, v15, v4}, Lkotlin/ranges/a;-><init>(III)V

    invoke-static {v9, v11}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_149

    invoke-static/range {p1 .. p1}, Lpik;->B(Ljava/lang/CharSequence;)C

    move-result v4

    const/16 v7, 0x3f

    if-ne v4, v7, :cond_158

    :cond_149
    new-instance v4, Ljfd;

    new-instance v7, Loc2;

    const/16 v9, 0x14

    invoke-direct {v7, v10, v9}, Loc2;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v4, v8, v7}, Ljfd;-><init>(Leri;Loc2;)V

    goto :goto_15a

    :cond_156
    move/from16 v16, v7

    :cond_158
    sget-object v4, Lcti;->a:Lhv5;

    :goto_15a
    if-eqz v14, :cond_15f

    sget-object v7, Lp6l;->b:Lp6l;

    goto :goto_161

    :cond_15f
    sget-object v7, Lp6l;->a:Lp6l;

    :goto_161
    invoke-static {v0, v8, v4, v7}, Lcti;->a(Lzg;Leri;Lbti;Lp6l;)Ljava/lang/String;

    move-result-object v4

    const/4 v7, 0x0

    invoke-static {v4, v7, v3}, Lwqm;->f(Ljava/lang/String;Lsqh;Llqm;)Llsc;

    move-result-object v3

    if-nez p3, :cond_175

    if-nez v16, :cond_175

    invoke-virtual {v6, v3}, Ld7l;->Z(Llsc;)V

    move-object v3, v12

    move-object v4, v13

    const/4 v11, 0x1

    goto :goto_1bd

    :cond_175
    invoke-virtual {v2}, Lcom/opera/android/BrowserActivity;->H0()Lcom/opera/android/settings/SettingsManager;

    move-result-object v4

    const-string v9, "tab_auto_grouping"

    invoke-virtual {v4, v9}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v4

    invoke-virtual {v2}, Ldx3;->P()Lcom/opera/android/browser/BrowserFragment;

    move-result-object v9

    iget-object v9, v9, Lcom/opera/android/browser/BrowserFragment;->h:Lxbf;

    iget-object v6, v6, Ld7l;->j:Le7l;

    invoke-interface {v6}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object v6

    if-eqz v4, :cond_192

    iget v4, v6, Lcom/opera/android/browser/TabInfo;->d:I

    move/from16 v21, v4

    goto :goto_194

    :cond_192
    const/16 v21, 0x0

    :goto_194
    new-instance v19, Lcom/opera/android/browser/TabInfo;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v22

    const-wide/16 v24, 0x0

    const/16 v20, 0x0

    invoke-direct/range {v19 .. v25}, Lcom/opera/android/browser/TabInfo;-><init>(IIJJ)V

    invoke-static {v1}, Leti;->e(I)Llqm;

    move-result-object v15

    const/16 v17, 0x1

    const/16 v18, 0x0

    move-object/from16 v16, v3

    move-object v3, v12

    move-object v4, v13

    move-object/from16 v13, v19

    move-object v12, v9

    invoke-virtual/range {v12 .. v18}, Lxbf;->v(Lcom/opera/android/browser/TabInfo;ZLlqm;Llsc;ZLjava/util/List;)Ld7l;

    move-result-object v6

    iget-object v9, v2, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-nez v9, :cond_1b9

    move-object v9, v7

    :cond_1b9
    const/4 v11, 0x1

    invoke-virtual {v9, v5, v6, v11}, Lk6l;->f(Lb2l;Ld7l;Z)V

    :goto_1bd
    new-instance v5, Lwu5;

    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    invoke-static {v5}, Lac8;->a(Ljava/lang/Object;)V

    const/4 v5, 0x0

    aget-boolean v6, v10, v5

    if-ne v6, v11, :cond_1cc

    const-string v7, "Google AI mode"

    :cond_1cc
    if-nez v7, :cond_1d2

    invoke-interface {v8}, Leri;->l()Ljava/lang/String;

    move-result-object v7

    :cond_1d2
    iget-boolean v5, v3, Lx5f;->h:Z

    if-eqz v5, :cond_20a

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v5

    invoke-virtual {v5, v4}, Lx56;->G(Lzpa;)Lok0;

    move-result-object v4

    const/4 v9, 0x1

    invoke-virtual {v4, v9}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map;

    if-eqz v6, :cond_1f3

    invoke-interface {v6}, Ljava/util/Map;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_1f3

    new-instance v10, Lif0;

    invoke-direct {v10, v4, v9, v6}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_200

    :cond_1f3
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v4, v9, v9, v6}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v10, Lif0;

    invoke-direct {v10, v4, v9, v6}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_200
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v10, v7, v4}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v3, v5}, Lx5f;->U0(Lx56;)V

    :cond_20a
    iget-object v2, v2, Lcom/opera/android/BrowserActivity;->O:Ls28;

    if-eqz v2, :cond_235

    if-nez v14, :cond_235

    const/4 v9, 0x3

    if-eq v1, v9, :cond_235

    const/4 v3, 0x4

    if-eq v1, v3, :cond_235

    instance-of v1, v8, Ll42;

    if-nez v1, :cond_235

    iget-object v0, v0, Lzg;->b:Ljava/lang/Object;

    check-cast v0, Lsre;

    invoke-virtual {v0}, Lsre;->a()Ljava/lang/String;

    move-result-object v0

    iget-boolean v1, v2, Ls28;->d:Z

    if-eqz v1, :cond_235

    new-instance v1, Lwr9;

    const/16 v3, 0xf

    const/4 v5, 0x0

    invoke-direct {v1, v3, v2, v0, v5}, Lwr9;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    iget-object v0, v2, Ls28;->h:Ljava/lang/Object;

    check-cast v0, Lko7;

    invoke-virtual {v0, v1}, Lldk;->f(Ljava/lang/Runnable;)V

    :cond_235
    return-void

    :pswitch_data_236
    .packed-switch 0x0
        :pswitch_d3
        :pswitch_d3
        :pswitch_d3
        :pswitch_d3
        :pswitch_a6
        :pswitch_a6
        :pswitch_d3
        :pswitch_d3
        :pswitch_d3
        :pswitch_d3
    .end packed-switch
.end method

.method public final L()V
    .registers 6

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Ldfe;

    const/4 v0, 0x0

    iget v1, p0, Ldfe;->c:I

    invoke-static {v0, v1}, Ldjh;->j(II)Lkotlin/ranges/IntRange;

    move-result-object v0

    iget v1, v0, Lkotlin/ranges/a;->a:I

    iget v0, v0, Lkotlin/ranges/a;->b:I

    if-gt v1, v0, :cond_25

    :goto_11
    iget-object v2, p0, Ldfe;->a:[Ljava/lang/Object;

    aget-object v2, v2, v1

    check-cast v2, Ljq5;

    iget-object v2, v2, Ljq5;->b:Lnh4;

    sget-object v3, Lkotlin/Unit;->a:Lkotlin/Unit;

    sget-object v4, Lt0i;->b:Lp0i;

    invoke-virtual {v2, v3}, Lnh4;->resumeWith(Ljava/lang/Object;)V

    if-eq v1, v0, :cond_25

    add-int/lit8 v1, v1, 0x1

    goto :goto_11

    :cond_25
    invoke-virtual {p0}, Ldfe;->h()V

    return-void
.end method

.method public final M(JF)V
    .registers 8

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Ld5o;

    invoke-virtual {p0}, Ld5o;->A()Lsh4;

    move-result-object p0

    const/16 v0, 0x20

    shr-long v0, p1, v0

    long-to-int v0, v0

    invoke-static {v0}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v1

    const-wide v2, 0xffffffffL

    and-long/2addr p1, v2

    long-to-int p1, p1

    invoke-static {p1}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result p2

    invoke-interface {p0, v1, p2}, Lsh4;->e(FF)V

    invoke-interface {p0, p3}, Lsh4;->i(F)V

    invoke-static {v0}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result p2

    neg-float p2, p2

    invoke-static {p1}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result p1

    neg-float p1, p1

    invoke-interface {p0, p2, p1}, Lsh4;->e(FF)V

    return-void
.end method

.method public final N(FFJ)V
    .registers 9

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Ld5o;

    invoke-virtual {p0}, Ld5o;->A()Lsh4;

    move-result-object p0

    const/16 v0, 0x20

    shr-long v0, p3, v0

    long-to-int v0, v0

    invoke-static {v0}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v1

    const-wide v2, 0xffffffffL

    and-long/2addr p3, v2

    long-to-int p3, p3

    invoke-static {p3}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result p4

    invoke-interface {p0, v1, p4}, Lsh4;->e(FF)V

    invoke-interface {p0, p1, p2}, Lsh4;->a(FF)V

    invoke-static {v0}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result p1

    neg-float p1, p1

    invoke-static {p3}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result p2

    neg-float p2, p2

    invoke-interface {p0, p1, p2}, Lsh4;->e(FF)V

    return-void
.end method

.method public final O(J)V
    .registers 4

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;

    iget-object v0, p0, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;->c:Lbuh;

    invoke-virtual {v0}, Lc93;->g()Z

    move-result v0

    if-nez v0, :cond_d

    return-void

    :cond_d
    invoke-virtual {p0}, Lorg/chromium/components/media_router/caf/remoting/CafExpandedControllerActivity;->s()Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;

    move-result-object p0

    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;->seek(J)Lcom/google/android/gms/common/api/PendingResult;

    return-void
.end method

.method public final P(FF)V
    .registers 3

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Ld5o;

    invoke-virtual {p0}, Ld5o;->A()Lsh4;

    move-result-object p0

    invoke-interface {p0, p1, p2}, Lsh4;->e(FF)V

    return-void
.end method

.method public final Q(I)V
    .registers 2

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Ljava/io/OutputStream;

    invoke-virtual {p0, p1}, Ljava/io/OutputStream;->write(I)V

    return-void
.end method

.method public final R([BII)V
    .registers 4

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Ljava/io/OutputStream;

    invoke-virtual {p0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    return-void
.end method

.method public final S(I)V
    .registers 7

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Ljava/io/OutputStream;

    const/16 v0, 0x80

    if-ge p1, v0, :cond_c

    invoke-virtual {p0, p1}, Ljava/io/OutputStream;->write(I)V

    return-void

    :cond_c
    const/4 v1, 0x5

    new-array v2, v1, [B

    :goto_f
    add-int/lit8 v3, v1, -0x1

    int-to-byte v4, p1

    aput-byte v4, v2, v3

    ushr-int/lit8 p1, p1, 0x8

    if-nez p1, :cond_26

    rsub-int/lit8 p1, v3, 0x5

    add-int/lit8 v1, v1, -0x2

    or-int/2addr p1, v0

    int-to-byte p1, p1

    aput-byte p1, v2, v1

    rsub-int/lit8 p1, v3, 0x6

    invoke-virtual {p0, v2, v1, p1}, Ljava/io/OutputStream;->write([BII)V

    return-void

    :cond_26
    move v1, v3

    goto :goto_f
.end method

.method public T([Lx;)V
    .registers 6

    array-length v0, p1

    const/4 v1, 0x0

    :goto_2
    if-ge v1, v0, :cond_11

    aget-object v2, p1, v1

    invoke-interface {v2}, Lx;->e()Lz0;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v2, p0, v3}, Lz0;->j(Lwth;Z)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_11
    return-void
.end method

.method public final U([BIZ)V
    .registers 4

    invoke-virtual {p0, p2, p3}, Lwth;->X(IZ)V

    array-length p2, p1

    invoke-virtual {p0, p2}, Lwth;->S(I)V

    const/4 p2, 0x0

    array-length p3, p1

    invoke-virtual {p0, p1, p2, p3}, Lwth;->R([BII)V

    return-void
.end method

.method public final V(ZI[Lx;)V
    .registers 4

    invoke-virtual {p0, p2, p1}, Lwth;->X(IZ)V

    const/16 p1, 0x80

    invoke-virtual {p0, p1}, Lwth;->Q(I)V

    invoke-virtual {p0, p3}, Lwth;->T([Lx;)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lwth;->Q(I)V

    invoke-virtual {p0, p1}, Lwth;->Q(I)V

    return-void
.end method

.method public final W(II)V
    .registers 7

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Ljava/io/OutputStream;

    const/16 v0, 0x1f

    if-ge p2, v0, :cond_d

    or-int/2addr p1, p2

    invoke-virtual {p0, p1}, Ljava/io/OutputStream;->write(I)V

    return-void

    :cond_d
    const/4 v1, 0x6

    new-array v1, v1, [B

    and-int/lit8 v2, p2, 0x7f

    int-to-byte v2, v2

    const/4 v3, 0x5

    aput-byte v2, v1, v3

    :goto_16
    const/16 v2, 0x7f

    if-le p2, v2, :cond_26

    ushr-int/lit8 p2, p2, 0x7

    add-int/lit8 v3, v3, -0x1

    and-int/lit8 v2, p2, 0x7f

    or-int/lit16 v2, v2, 0x80

    int-to-byte v2, v2

    aput-byte v2, v1, v3

    goto :goto_16

    :cond_26
    add-int/lit8 v3, v3, -0x1

    or-int/2addr p1, v0

    int-to-byte p1, p1

    aput-byte p1, v1, v3

    rsub-int/lit8 p1, v3, 0x6

    invoke-virtual {p0, v1, v3, p1}, Ljava/io/OutputStream;->write([BII)V

    return-void
.end method

.method public final X(IZ)V
    .registers 3

    if-eqz p2, :cond_5

    invoke-virtual {p0, p1}, Lwth;->Q(I)V

    :cond_5
    return-void
.end method

.method public Y(Lz0;)V
    .registers 3

    const/4 v0, 0x1

    invoke-virtual {p1, p0, v0}, Lz0;->j(Lwth;Z)V

    return-void
.end method

.method public Z([Lz0;)V
    .registers 6

    array-length v0, p1

    const/4 v1, 0x0

    :goto_2
    if-ge v1, v0, :cond_d

    aget-object v2, p1, v1

    const/4 v3, 0x1

    invoke-virtual {v2, p0, v3}, Lz0;->j(Lwth;Z)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_d
    return-void
.end method

.method public final a(Lis;)V
    .registers 5

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Lss;

    invoke-virtual {p0}, Lss;->G0()Lxs;

    move-result-object p0

    iget-object p0, p0, Lxs;->e:Ltr8;

    iget-object p1, p1, Lis;->c:Lst;

    iget-object v0, p1, Lst;->b:Ljava/lang/String;

    iget-object p1, p1, Lst;->g:Ljava/lang/String;

    filled-new-array {v0, p1}, [Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p1

    iget-object v0, p0, Ltr8;->a:Lumi;

    new-instance v1, Lrml;

    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v1, v2, v0}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v0, Lry7;

    const/4 v2, 0x7

    invoke-direct {v0, p0, p1, v2}, Lry7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1, v0}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    invoke-virtual {p0}, Lplk;->l()Loml;

    return-void
.end method

.method public final a0()V
    .registers 3

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Lp35;

    invoke-virtual {p0}, Lp35;->H0()V

    iget-object p0, p0, Lp35;->r:Ljava/util/ArrayList;

    new-instance v0, Lqg2;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lqg2;-><init>(B)V

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->forEach(Ljava/util/function/Consumer;)V

    return-void
.end method

.method public final b(Lccb;JLd2c;J)J
    .registers 14

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Lkotlin/jvm/functions/Function0;

    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lybb;

    iget-wide v0, p0, Lybb;->a:J

    iget p0, p1, Lccb;->a:I

    const/16 v2, 0x20

    shr-long v3, v0, v2

    long-to-int v3, v3

    add-int/2addr p0, v3

    shr-long v3, p5, v2

    long-to-int v3, v3

    shr-long v4, p2, v2

    long-to-int v4, v4

    sget-object v5, Ld2c;->a:Ld2c;

    const/4 v6, 0x1

    if-ne p4, v5, :cond_21

    move p4, v6

    goto :goto_22

    :cond_21
    const/4 p4, 0x0

    :goto_22
    invoke-static {p0, v3, v4, p4}, Lj14;->j(IIIZ)I

    move-result p0

    iget p1, p1, Lccb;->b:I

    const-wide v3, 0xffffffffL

    and-long/2addr v0, v3

    long-to-int p4, v0

    add-int/2addr p1, p4

    and-long/2addr p5, v3

    long-to-int p4, p5

    and-long/2addr p2, v3

    long-to-int p2, p2

    invoke-static {p1, p4, p2, v6}, Lj14;->j(IIIZ)I

    move-result p1

    int-to-long p2, p0

    shl-long/2addr p2, v2

    int-to-long p0, p1

    and-long/2addr p0, v3

    or-long/2addr p2, p0

    return-wide p2
.end method

.method public final c(Ljy1;)V
    .registers 5

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Ls62;

    iget-object p0, p0, Ls62;->v:Lu02;

    iget-object p0, p0, Lu02;->o:Ljava/lang/Object;

    check-cast p0, Lzz1;

    if-eqz p0, :cond_23

    iget-object p0, p0, Lzz1;->d:Lmlj;

    new-instance v0, Lrxh;

    const v1, 0x7f140168

    invoke-direct {v0, v1}, Lrxh;-><init>(I)V

    new-instance v1, Lrxh;

    const v2, 0x7f14007e

    invoke-direct {v1, v2}, Lrxh;-><init>(I)V

    const/16 v2, 0x9c4

    invoke-virtual {p0, v0, v2, v1, p1}, Lmlj;->b(Lrxh;ILrxh;Lkotlin/jvm/functions/Function0;)V

    :cond_23
    return-void
.end method

.method public final d()I
    .registers 1

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Lnz4;

    iget-object p0, p0, Lnz4;->c:Lysl;

    invoke-interface {p0}, Lysl;->A()I

    move-result p0

    return p0
.end method

.method public final e(Ljava/util/concurrent/CancellationException;)V
    .registers 7

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Ldfe;

    iget v0, p0, Ldfe;->c:I

    new-array v1, v0, [Lmh4;

    const/4 v2, 0x0

    move v3, v2

    :goto_a
    if-ge v3, v0, :cond_19

    iget-object v4, p0, Ldfe;->a:[Ljava/lang/Object;

    aget-object v4, v4, v3

    check-cast v4, Ljq5;

    iget-object v4, v4, Ljq5;->b:Lnh4;

    aput-object v4, v1, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_a

    :cond_19
    :goto_19
    if-ge v2, v0, :cond_23

    aget-object v3, v1, v2

    invoke-interface {v3, p1}, Lmh4;->d(Ljava/lang/Throwable;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_19

    :cond_23
    iget p0, p0, Ldfe;->c:I

    if-nez p0, :cond_28

    return-void

    :cond_28
    const-string p0, "uncancelled requests present"

    invoke-static {p0}, Ld8b;->c(Ljava/lang/String;)V

    return-void
.end method

.method public final f()Lcom/opera/android/StatusBarDrawingFrameLayout;
    .registers 1

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Lss;

    iget-object p0, p0, Lltl;->k:Lcom/opera/android/StatusBarDrawingFrameLayout;

    return-object p0
.end method

.method public final g(Lorg/chromium/google_apis/gaia/GoogleServiceAuthError;)V
    .registers 2

    return-void
.end method

.method public final h()Z
    .registers 2

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Lhw3;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lf1j;

    invoke-virtual {v0}, Lf1j;->b()Z

    move-result v0

    if-eqz v0, :cond_1e

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lf1j;

    invoke-virtual {p0}, Lf1j;->a()Z

    move-result p0

    if-eqz p0, :cond_1e

    const/4 p0, 0x1

    return p0

    :cond_1e
    const/4 p0, 0x0

    return p0
.end method

.method public final i()I
    .registers 1

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Lnz4;

    iget-object p0, p0, Lnz4;->f:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->B:I

    return p0
.end method

.method public final isEnabled()Z
    .registers 1

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Lhw3;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lf1j;

    invoke-virtual {p0}, Lf1j;->b()Z

    move-result p0

    return p0
.end method

.method public final j(Lb8;)V
    .registers 2

    return-void
.end method

.method public final k(Ljava/lang/String;)V
    .registers 2

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Lhw3;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lf1j;

    invoke-virtual {p0, p1}, Lf1j;->f(Ljava/lang/String;)V

    return-void
.end method

.method public final l()V
    .registers 3

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Lp35;

    iget-object p0, p0, Lp35;->r:Ljava/util/ArrayList;

    new-instance v0, Lqg2;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lqg2;-><init>(B)V

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->forEach(Ljava/util/function/Consumer;)V

    return-void
.end method

.method public final l0(Landroid/view/View;Lg3o;)Lg3o;
    .registers 14

    invoke-virtual {p2}, Lg3o;->d()I

    move-result v0

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Lxp1;

    invoke-virtual {p2}, Lg3o;->d()I

    move-result v1

    iget-object v2, p0, Lxp1;->v:Landroidx/appcompat/widget/ActionBarContextView;

    if-eqz v2, :cond_de

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    instance-of v2, v2, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v2, :cond_de

    iget-object v2, p0, Lxp1;->v:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup$MarginLayoutParams;

    iget-object v3, p0, Lxp1;->v:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {v3}, Landroid/view/View;->isShown()Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_d7

    iget-object v3, p0, Lxp1;->b0:Landroid/graphics/Rect;

    if-nez v3, :cond_3b

    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    iput-object v3, p0, Lxp1;->b0:Landroid/graphics/Rect;

    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    iput-object v3, p0, Lxp1;->c0:Landroid/graphics/Rect;

    :cond_3b
    iget-object v3, p0, Lxp1;->b0:Landroid/graphics/Rect;

    iget-object v5, p0, Lxp1;->c0:Landroid/graphics/Rect;

    invoke-virtual {p2}, Lg3o;->b()I

    move-result v6

    invoke-virtual {p2}, Lg3o;->d()I

    move-result v7

    invoke-virtual {p2}, Lg3o;->c()I

    move-result v8

    invoke-virtual {p2}, Lg3o;->a()I

    move-result v9

    invoke-virtual {v3, v6, v7, v8, v9}, Landroid/graphics/Rect;->set(IIII)V

    const/4 v6, 0x2

    iget-object v7, p2, Lg3o;->a:Ld3o;

    invoke-virtual {v7, v6}, Ld3o;->i(I)Lr9b;

    move-result-object v6

    iget-object v7, p0, Lxp1;->A:Landroid/view/ViewGroup;

    new-instance v8, Landroid/view/WindowInsets$Builder;

    invoke-direct {v8}, Landroid/view/WindowInsets$Builder;-><init>()V

    invoke-static {v3}, Landroid/graphics/Insets;->of(Landroid/graphics/Rect;)Landroid/graphics/Insets;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/view/WindowInsets$Builder;->setSystemWindowInsets(Landroid/graphics/Insets;)Landroid/view/WindowInsets$Builder;

    move-result-object v8

    invoke-virtual {v8}, Landroid/view/WindowInsets$Builder;->build()Landroid/view/WindowInsets;

    move-result-object v8

    invoke-virtual {v7, v8, v5}, Landroid/view/View;->computeSystemWindowInsets(Landroid/view/WindowInsets;Landroid/graphics/Rect;)Landroid/view/WindowInsets;

    move-result-object v7

    invoke-virtual {v7}, Landroid/view/WindowInsets;->getSystemWindowInsets()Landroid/graphics/Insets;

    move-result-object v7

    iget v8, v7, Landroid/graphics/Insets;->left:I

    iget v9, v7, Landroid/graphics/Insets;->top:I

    iget v10, v7, Landroid/graphics/Insets;->right:I

    iget v7, v7, Landroid/graphics/Insets;->bottom:I

    invoke-virtual {v3, v8, v9, v10, v7}, Landroid/graphics/Rect;->set(IIII)V

    iget v7, v5, Landroid/graphics/Rect;->left:I

    iget v8, v5, Landroid/graphics/Rect;->top:I

    iget v9, v5, Landroid/graphics/Rect;->right:I

    iget v5, v5, Landroid/graphics/Rect;->bottom:I

    iget v10, v6, Lr9b;->a:I

    sub-int/2addr v10, v7

    invoke-static {v4, v10}, Ljava/lang/Math;->max(II)I

    move-result v7

    iget v10, v6, Lr9b;->b:I

    sub-int/2addr v10, v8

    invoke-static {v4, v10}, Ljava/lang/Math;->max(II)I

    move-result v8

    iget v10, v6, Lr9b;->c:I

    sub-int/2addr v10, v9

    invoke-static {v4, v10}, Ljava/lang/Math;->max(II)I

    move-result v9

    iget v6, v6, Lr9b;->d:I

    sub-int/2addr v6, v5

    invoke-static {v4, v6}, Ljava/lang/Math;->max(II)I

    move-result v5

    invoke-static {v7, v8, v9, v5}, Lr9b;->c(IIII)Lr9b;

    move-result-object v5

    iget v6, v5, Lr9b;->c:I

    iget v7, v2, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    iget v5, v5, Lr9b;->a:I

    if-ne v7, v5, :cond_b5

    iget v7, v2, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    if-ne v7, v6, :cond_b5

    move v7, v4

    goto :goto_ba

    :cond_b5
    iput v5, v2, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    iput v6, v2, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    const/4 v7, 0x1

    :goto_ba
    iget-object v8, p0, Lxp1;->v:Landroidx/appcompat/widget/ActionBarContextView;

    iget v9, v3, Landroid/graphics/Rect;->left:I

    sub-int/2addr v9, v5

    iget v5, v3, Landroid/graphics/Rect;->top:I

    iget v10, v3, Landroid/graphics/Rect;->right:I

    sub-int/2addr v10, v6

    iput v9, v8, Landroidx/appcompat/widget/ActionBarContextView;->u:I

    iput v5, v8, Landroidx/appcompat/widget/ActionBarContextView;->v:I

    iput v10, v8, Landroidx/appcompat/widget/ActionBarContextView;->w:I

    invoke-virtual {v8}, Landroidx/appcompat/widget/ActionBarContextView;->k()V

    iget-boolean v5, p0, Lxp1;->G:Z

    if-nez v5, :cond_d6

    iget v3, v3, Landroid/graphics/Rect;->top:I

    if-lez v3, :cond_d6

    move v1, v4

    :cond_d6
    move v4, v7

    :cond_d7
    if-eqz v4, :cond_de

    iget-object p0, p0, Lxp1;->v:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {p0, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_de
    if-eq v0, v1, :cond_130

    invoke-virtual {p2}, Lg3o;->b()I

    move-result p0

    invoke-virtual {p2}, Lg3o;->c()I

    move-result v0

    invoke-virtual {p2}, Lg3o;->a()I

    move-result v2

    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x24

    if-lt v3, v4, :cond_f8

    new-instance v3, Lt2o;

    invoke-direct {v3, p2}, Lt2o;-><init>(Lg3o;)V

    goto :goto_125

    :cond_f8
    const/16 v4, 0x23

    if-lt v3, v4, :cond_102

    new-instance v3, Ls2o;

    invoke-direct {v3, p2}, Ls2o;-><init>(Lg3o;)V

    goto :goto_125

    :cond_102
    const/16 v4, 0x22

    if-lt v3, v4, :cond_10c

    new-instance v3, Lr2o;

    invoke-direct {v3, p2}, Lr2o;-><init>(Lg3o;)V

    goto :goto_125

    :cond_10c
    const/16 v4, 0x1f

    if-lt v3, v4, :cond_116

    new-instance v3, Lq2o;

    invoke-direct {v3, p2}, Lq2o;-><init>(Lg3o;)V

    goto :goto_125

    :cond_116
    const/16 v4, 0x1e

    if-lt v3, v4, :cond_120

    new-instance v3, Lp2o;

    invoke-direct {v3, p2}, Lp2o;-><init>(Lg3o;)V

    goto :goto_125

    :cond_120
    new-instance v3, Lo2o;

    invoke-direct {v3, p2}, Lo2o;-><init>(Lg3o;)V

    :goto_125
    invoke-static {p0, v1, v0, v2}, Lr9b;->c(IIII)Lr9b;

    move-result-object p0

    invoke-virtual {v3, p0}, Lo2o;->h(Lr9b;)V

    invoke-virtual {v3}, Lo2o;->b()Lg3o;

    move-result-object p2

    :cond_130
    invoke-static {p1, p2}, Lr5n;->h(Landroid/view/View;Lg3o;)Lg3o;

    move-result-object p0

    return-object p0
.end method

.method public final m()Llak;
    .registers 1

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Lrlh;

    return-object p0
.end method

.method public final n(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Lhw3;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lf1j;

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    sget-object v0, Laik;->a:[Ljava/lang/String;

    if-nez p2, :cond_14

    const-string p2, ""

    :cond_14
    invoke-virtual {p0}, Lf1j;->a()Z

    move-result v0

    if-nez v0, :cond_25

    new-instance v0, Ljbd;

    const/16 v1, 0x10

    invoke-direct {v0, p0, p1, p2, v1}, Ljbd;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, v0}, Lf1j;->h(Ljava/lang/Runnable;)V

    return-void

    :cond_25
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/opera/android/browser/BrowserUtils;->getExternalUrlWithFallback(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1, p2}, Lf1j;->g(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public final o(I)V
    .registers 3

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Ls62;

    iget-object p0, p0, Ls62;->v:Lu02;

    iget-object p0, p0, Lu02;->o:Ljava/lang/Object;

    check-cast p0, Lzz1;

    if-eqz p0, :cond_18

    iget-object p0, p0, Lzz1;->d:Lmlj;

    new-instance v0, Lrxh;

    invoke-direct {v0, p1}, Lrxh;-><init>(I)V

    const/16 p1, 0x9c4

    invoke-virtual {p0, v0, p1}, Lmlj;->a(Lrxh;I)V

    :cond_18
    return-void
.end method

.method public final onSessionEnded(Lcom/google/android/gms/cast/framework/Session;I)V
    .registers 3

    check-cast p1, Lcom/google/android/gms/cast/framework/CastSession;

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Lzo4;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lzo4;->G0(Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;)V

    return-void
.end method

.method public final onSessionEnding(Lcom/google/android/gms/cast/framework/Session;)V
    .registers 2

    check-cast p1, Lcom/google/android/gms/cast/framework/CastSession;

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Lzo4;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lzo4;->G0(Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;)V

    return-void
.end method

.method public final onSessionResumeFailed(Lcom/google/android/gms/cast/framework/Session;I)V
    .registers 3

    check-cast p1, Lcom/google/android/gms/cast/framework/CastSession;

    return-void
.end method

.method public final onSessionResumed(Lcom/google/android/gms/cast/framework/Session;Z)V
    .registers 3

    check-cast p1, Lcom/google/android/gms/cast/framework/CastSession;

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Lzo4;

    invoke-virtual {p1}, Lcom/google/android/gms/cast/framework/CastSession;->getRemoteMediaClient()Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;

    move-result-object p1

    invoke-virtual {p0, p1}, Lzo4;->G0(Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;)V

    return-void
.end method

.method public final onSessionResuming(Lcom/google/android/gms/cast/framework/Session;Ljava/lang/String;)V
    .registers 3

    check-cast p1, Lcom/google/android/gms/cast/framework/CastSession;

    return-void
.end method

.method public final onSessionStartFailed(Lcom/google/android/gms/cast/framework/Session;I)V
    .registers 3

    check-cast p1, Lcom/google/android/gms/cast/framework/CastSession;

    return-void
.end method

.method public final onSessionStarted(Lcom/google/android/gms/cast/framework/Session;Ljava/lang/String;)V
    .registers 3

    check-cast p1, Lcom/google/android/gms/cast/framework/CastSession;

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Lzo4;

    invoke-virtual {p1}, Lcom/google/android/gms/cast/framework/CastSession;->getRemoteMediaClient()Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;

    move-result-object p1

    invoke-virtual {p0, p1}, Lzo4;->G0(Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;)V

    return-void
.end method

.method public final onSessionStarting(Lcom/google/android/gms/cast/framework/Session;)V
    .registers 2

    check-cast p1, Lcom/google/android/gms/cast/framework/CastSession;

    return-void
.end method

.method public final onSessionSuspended(Lcom/google/android/gms/cast/framework/Session;I)V
    .registers 3

    check-cast p1, Lcom/google/android/gms/cast/framework/CastSession;

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Lzo4;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lzo4;->G0(Lcom/google/android/gms/cast/framework/media/RemoteMediaClient;)V

    return-void
.end method

.method public final p(Ljava/lang/String;)V
    .registers 2

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Lim3;

    iget-object p0, p0, Lim3;->x:Lgn3;

    invoke-virtual {p0, p1}, Lgn3;->i(Ljava/lang/String;)V

    return-void
.end method

.method public final q(FFFFI)V
    .registers 12

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Ld5o;

    invoke-virtual {p0}, Ld5o;->A()Lsh4;

    move-result-object v0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-interface/range {v0 .. v5}, Lsh4;->d(FFFFI)V

    return-void
.end method

.method public final r(Lis;)V
    .registers 5

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Lss;

    invoke-virtual {p0}, Lss;->G0()Lxs;

    move-result-object v0

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    iget-object v1, v0, Lxs;->b:Lqb7;

    iget-object v2, p1, Lis;->c:Lst;

    invoke-virtual {v1, p0, v2}, Lqb7;->u(Landroid/content/res/Resources;Lst;)Lst;

    move-result-object p0

    iget-object v1, v0, Lxs;->h:[Lst;

    iget-object p1, p1, Lis;->c:Lst;

    invoke-static {p1, v1}, Le82;->u(Ljava/lang/Object;[Ljava/lang/Object;)I

    move-result p1

    aput-object p0, v1, p1

    iget-object p1, v0, Lxs;->i:Lkq8;

    if-eqz p1, :cond_4c

    iget-object v1, v0, Lxs;->c:Ltw2;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-boolean p0, p0, Lst;->k:Z

    iget-object v1, v1, Ltw2;->b:Ljava/lang/Object;

    check-cast v1, Lorm;

    const/4 v2, 0x1

    if-eqz p0, :cond_3e

    invoke-static {p1}, Ltw2;->w(Lkq8;)Ljava/lang/String;

    move-result-object p0

    check-cast v1, Lx5f;

    iget-boolean p1, v1, Lx5f;->h:Z

    if-eqz p1, :cond_4c

    invoke-virtual {v1, v2, p0, v2}, Lx5f;->j(ILjava/lang/String;Z)V

    goto :goto_4c

    :cond_3e
    invoke-static {p1}, Ltw2;->w(Lkq8;)Ljava/lang/String;

    move-result-object p0

    check-cast v1, Lx5f;

    iget-boolean p1, v1, Lx5f;->h:Z

    if-eqz p1, :cond_4c

    const/4 p1, 0x2

    invoke-virtual {v1, p1, p0, v2}, Lx5f;->j(ILjava/lang/String;Z)V

    :cond_4c
    :goto_4c
    invoke-virtual {v0}, Lxs;->f()V

    return-void
.end method

.method public final run()Lb8;
    .registers 3

    sget-object v0, Ltjj;->c:Lp74;

    invoke-virtual {v0}, Lp74;->b()Z

    move-result v0

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Ljb;

    iget-object p0, p0, Ljb;->d:Ljava/lang/Object;

    check-cast p0, La4f;

    const/4 v1, 0x0

    if-eqz v0, :cond_15

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object v1

    :cond_15
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string p0, "NullAccountManagerDelegate does not implement invalidateAccessToken"

    invoke-static {p0}, Lyt7;->k(Ljava/lang/String;)V

    return-object v1
.end method

.method public final s(Lw3g;)V
    .registers 5

    iget-object v0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast v0, Ld83;

    if-nez v0, :cond_7

    return-void

    :cond_7
    iget-object v1, v0, Ld83;->c:Ljava/util/List;

    if-eqz v1, :cond_2e

    invoke-static {v1, p1}, Lw3g;->a(Ljava/util/List;Lw3g;)I

    move-result v1

    iget-object v2, v0, Ld83;->c:Ljava/util/List;

    invoke-interface {v2, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/d;->notifyItemRemoved(I)V

    iget-object p1, v0, Ld83;->f:Ljava/lang/Object;

    check-cast p1, Ljh3;

    iget-object p1, p1, Ljh3;->F:Ly73;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lb83;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lb83;-><init>(Ly73;B)V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v0, p1}, LJ/N;->MwwLnzkg(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_2e
    const/4 p1, 0x0

    iput-object p1, p0, Lwth;->b:Ljava/lang/Object;

    return-void
.end method

.method public final t(Lre7;)V
    .registers 2

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Lhw3;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lf1j;

    invoke-virtual {p0, p1}, Lf1j;->d(Lre7;)V

    return-void
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    iget-byte v0, p0, Lwth;->a:B

    packed-switch v0, :pswitch_data_22

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_a
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "ResolvedFeatureGroup(features="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/LinkedHashSet;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 p0, 0x29

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_data_22
    .packed-switch 0x1
        :pswitch_a
    .end packed-switch
.end method

.method public final u(Lcom/opera/android/ui/catalog/widget/OperaListItem;Z)V
    .registers 3

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Lqc2;

    iget-object p0, p0, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    const-string p1, "ai_assistant_menu_shortcut"

    invoke-virtual {p0, p2, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void
.end method

.method public final v(Ljava/lang/String;)V
    .registers 2

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Lim3;

    invoke-virtual {p0}, Lim3;->K0()V

    iget-object p0, p0, Lim3;->x:Lgn3;

    invoke-virtual {p0, p1}, Lgn3;->i(Ljava/lang/String;)V

    return-void
.end method

.method public final w(Lcom/opera/api/Callback;)V
    .registers 4

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-static {p0}, Le3j;->t(Landroid/content/Context;)Le3j;

    move-result-object p0

    new-instance v0, Lp1;

    const/4 v1, 0x3

    invoke-direct {v0, p0, p1, v1}, Lp1;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, v0}, Lno7;->g(Lmo7;)V

    return-void
.end method

.method public final x(Lhs;)V
    .registers 2

    return-void
.end method

.method public final y(JLkotlin/jvm/functions/Function1;)V
    .registers 5

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Ld12;

    const-string v0, "chat/"

    invoke-static {p1, p2, v0}, Lp3p;->l(JLjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    new-instance p2, Lra;

    const/4 v0, 0x5

    invoke-direct {p2, p3, v0}, Lra;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-interface {p0, p1, p2}, Ld12;->e(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    return-void
.end method

.method public final z(JJLkotlin/jvm/functions/Function1;)V
    .registers 8

    iget-object p0, p0, Lwth;->b:Ljava/lang/Object;

    check-cast p0, Ld12;

    const-string v0, "chat/"

    const-string v1, "/item/"

    invoke-static {p1, p2, v0, v1}, Lp3p;->q(JLjava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Lra;

    const/4 p3, 0x3

    invoke-direct {p2, p5, p3}, Lra;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-interface {p0, p1, p2}, Ld12;->e(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    return-void
.end method
