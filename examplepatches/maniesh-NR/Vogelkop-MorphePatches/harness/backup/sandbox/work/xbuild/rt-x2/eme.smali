.class public final Leme;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lahf;
.implements Lgrj;
.implements Lsic;
.implements Lpya;
.implements Lbcf;
.implements Lf94;
.implements Lnj8;
.implements Lyxd;
.implements Lrj2;
.implements Lp4g;
.implements Lhti;
.implements La0n;
.implements Lgm8;
.implements Lw9l;
.implements Lysl;
.implements Li35;


# static fields
.field public static final b:[I


# instance fields
.field public final a:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const/16 v0, 0x23

    new-array v0, v0, [I

    fill-array-data v0, :array_a

    sput-object v0, Leme;->b:[I

    return-void

    :array_a
    .array-data 4
        0x1
        0x2
        0x3
        0x4
        0x5
        0x6
        0x7
        0x8
        0x9
        0xa
        0xb
        0xc
        0xd
        0xe
        0xf
        0x10
        0x11
        0x12
        0x13
        0x1f
        0x14
        0x15
        0x16
        0x17
        0x18
        0x19
        0x21
        0x1a
        0x22
        0x23
        0x1b
        0x1c
        0x1d
        0x1e
        0x20
    .end array-data
.end method

.method public constructor <init>(B)V
    .registers 7

    sparse-switch p1, :sswitch_data_6a

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Lorg/json/JSONArray;

    invoke-direct {p1}, Lorg/json/JSONArray;-><init>()V

    iput-object p1, p0, Leme;->a:Ljava/lang/Object;

    return-void

    :sswitch_e
    invoke-static {}, Lfee;->k()Lfee;

    move-result-object p1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Leme;->a:Ljava/lang/Object;

    sget-object v0, Lfcl;->Dp:Lan2;

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lwrf;->b(Lan2;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Class;

    const-class v3, Lwg4;

    if-eqz v2, :cond_32

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_32

    const-string p1, "Invalid target class configuration for "

    const-string v0, ": "

    invoke-static {p1, p0, v0, v2}, Lkp5;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    throw v1

    :cond_32
    invoke-virtual {p1, v0, v3}, Lfee;->s(Lan2;Ljava/lang/Object;)V

    sget-object p0, Lfcl;->Cp:Lan2;

    invoke-virtual {p1, p0, v1}, Lwrf;->b(Lan2;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_5c

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, p0, v0}, Lfee;->s(Lan2;Ljava/lang/Object;)V

    :cond_5c
    return-void

    :sswitch_5d
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v0, 0x0

    invoke-direct {p1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object p1, p0, Leme;->a:Ljava/lang/Object;

    return-void

    nop

    :sswitch_data_6a
    .sparse-switch
        0xc -> :sswitch_5d
        0x16 -> :sswitch_e
    .end sparse-switch
.end method

.method public constructor <init>(Lcig;)V
    .registers 4

    .line 125
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 126
    new-instance v0, Lnrl;

    const/16 v1, 0xb

    invoke-direct {v0, v1}, Lnrl;-><init>(B)V

    iput-object v0, p0, Leme;->a:Ljava/lang/Object;

    .line 127
    iget-object p0, p1, Lcig;->a:Lw69;

    .line 128
    invoke-virtual {v0, p0}, Lnrl;->c(Lw69;)V

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/BrowserActivity;)V
    .registers 3

    .line 129
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 130
    new-instance v0, Lv6d;

    .line 131
    iget-object p1, p1, Lcom/opera/android/BrowserActivity;->u1:Lqq6;

    .line 132
    invoke-direct {v0, p1}, Lv6d;-><init>(Lqq6;)V

    iput-object v0, p0, Leme;->a:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/bookmarks/h;Lvnj;)V
    .registers 4

    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Leme;->a:Ljava/lang/Object;

    .line 113
    new-instance p2, Ldl3;

    const/4 v0, 0x1

    invoke-direct {p2, p0, v0}, Ldl3;-><init>(Ljava/lang/Object;B)V

    .line 114
    invoke-virtual {p1, p2}, Lcom/opera/android/bookmarks/h;->a(Lql3;)V

    return-void
.end method

.method public constructor <init>(Ldb;Lcom/opera/api/Callback;)V
    .registers 3

    .line 124
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Leme;->a:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;)V
    .registers 2

    .line 123
    iput-object p1, p0, Leme;->a:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lkotlin/jvm/functions/Function1;)V
    .registers 8

    .line 106
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 107
    new-instance v0, Lu9d;

    invoke-direct {v0}, Lu9d;-><init>()V

    .line 108
    invoke-static {}, Lnle;->values()[Lnle;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    :goto_e
    if-ge v3, v2, :cond_1c

    aget-object v4, v1, v3

    .line 109
    invoke-interface {p1, v4}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Lu9d;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v3, v3, 0x1

    goto :goto_e

    .line 110
    :cond_1c
    invoke-virtual {v0}, Lu9d;->g()Lu9d;

    move-result-object p1

    .line 111
    iput-object p1, p0, Leme;->a:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lole;Lj06;)V
    .registers 3

    .line 115
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 116
    iput-object p1, p0, Leme;->a:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;)V
    .registers 3

    .line 120
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 121
    instance-of v0, p1, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;

    if-nez v0, :cond_8

    const/4 p1, 0x0

    .line 122
    :cond_8
    iput-object p1, p0, Leme;->a:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lx75;)V
    .registers 3

    .line 117
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 118
    sget-object v0, Ljfb;->a:Ljava/nio/charset/Charset;

    iput-object p1, p0, Leme;->a:Ljava/lang/Object;

    .line 119
    iput-object p0, p1, Lx75;->a:Leme;

    return-void
.end method

.method public static q0(Lpl3;)Lknj;
    .registers 7

    new-instance v0, Lknj;

    invoke-interface {p0}, Lpl3;->f()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Llnj;

    sget-object v3, Lmnj;->a:Lmnj;

    invoke-interface {p0}, Lal3;->getId()J

    move-result-wide v4

    invoke-direct {v2, v3, v4, v5}, Llnj;-><init>(Lmnj;J)V

    invoke-direct {v0, v1, v2}, Lknj;-><init>(Ljava/lang/String;Llnj;)V

    return-object v0
.end method


# virtual methods
.method public final A()I
    .registers 2

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Laz3;

    iget-object p0, p0, Laz3;->d:Lbz3;

    iget-object v0, p0, Lbz3;->g:Ljava/lang/Object;

    check-cast v0, Ldtl;

    iget v0, v0, Ldtl;->c:I

    iget p0, p0, Lbz3;->c:I

    sub-int/2addr v0, p0

    return v0
.end method

.method public final B(Lw3g;)V
    .registers 2

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Lx5g;

    iget-object p0, p0, Lx5g;->d:Lw4g;

    iget-object p0, p0, Lw4g;->a:Lvnj;

    invoke-static {p1}, Lw4g;->a(Lw3g;)Lknj;

    move-result-object p1

    invoke-virtual {p0, p1}, Lvnj;->m(Lknj;)V

    return-void
.end method

.method public final F()V
    .registers 1

    return-void
.end method

.method public final G(I)V
    .registers 5

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Landroid/view/Window;

    invoke-virtual {p0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    int-to-float p1, p1

    const/high16 v1, 0x42c80000    # 100.0f

    div-float/2addr p1, v1

    const v1, 0x3c23d70a    # 0.01f

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-static {p1, v1, v2}, Lnb6;->i(FFF)F

    move-result p1

    iput p1, v0, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    invoke-virtual {p0, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    return-void
.end method

.method public final H()I
    .registers 2

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Laz3;

    iget-object p0, p0, Laz3;->d:Lbz3;

    iget-object v0, p0, Lbz3;->g:Ljava/lang/Object;

    check-cast v0, Ldtl;

    iget v0, v0, Ldtl;->a:I

    iget p0, p0, Lbz3;->a:I

    sub-int/2addr v0, p0

    return v0
.end method

.method public final I(IILjava/lang/Object;)V
    .registers 4

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Landroidx/recyclerview/widget/d;

    invoke-virtual {p0, p1, p2, p3}, Landroidx/recyclerview/widget/d;->notifyItemRangeChanged(IILjava/lang/Object;)V

    return-void
.end method

.method public final J(Lcom/opera/android/browser/chromium/ChromiumContent;)V
    .registers 3

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Laz3;

    iget-object v0, p0, Laz3;->c:Lz4k;

    iput-object p1, v0, Lz4k;->b:Ljava/lang/Object;

    const/4 p1, 0x4

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Laz3;->N(IZ)Z

    move-result p1

    iget-object p0, p0, Laz3;->d:Lbz3;

    if-eqz p1, :cond_1b

    iget-boolean p1, p0, Lbz3;->d:Z

    if-eqz p1, :cond_22

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lbz3;->d(Z)V

    return-void

    :cond_1b
    iget-boolean p1, p0, Lbz3;->d:Z

    if-eqz p1, :cond_22

    invoke-virtual {p0, v0}, Lbz3;->d(Z)V

    :cond_22
    return-void
.end method

.method public final K()V
    .registers 1

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Lt42;

    iget-object p0, p0, Lt42;->w:Lei;

    iget-object p0, p0, Lei;->d:Landroid/view/View;

    check-cast p0, Lcom/opera/android/webaiassistant/WebAiAssistantSheetContentWrapper;

    invoke-virtual {p0}, Lgej;->e()V

    return-void
.end method

.method public final L(Ljava/lang/Long;)V
    .registers 3

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/BrowserActivity;

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->P0()Lgjm;

    move-result-object p0

    new-instance v0, Lxl3;

    invoke-direct {v0, p1}, Lxl3;-><init>(Ljava/lang/Long;)V

    const/4 p1, 0x0

    invoke-virtual {p0, v0, p1}, Lgjm;->e(Ln37;Z)V

    return-void
.end method

.method public final M()V
    .registers 2

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Laz3;

    iget-object p0, p0, Laz3;->d:Lbz3;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lbz3;->d:Z

    invoke-virtual {p0}, Lbz3;->f()V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lbz3;->d(Z)V

    return-void
.end method

.method public final Q(Ljava/lang/String;)Ljava/io/InputStream;
    .registers 3

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    :try_start_5
    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Landroid/content/res/AssetManager;

    invoke-virtual {p0, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p0
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_d} :catch_e

    return-object p0

    :catch_e
    const/4 p0, 0x0

    return-object p0
.end method

.method public final R()I
    .registers 1

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Landroid/media/Image$Plane;

    invoke-virtual {p0}, Landroid/media/Image$Plane;->getRowStride()I

    move-result p0

    return p0
.end method

.method public final S(II)V
    .registers 3

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Landroidx/recyclerview/widget/d;

    invoke-virtual {p0, p1, p2}, Landroidx/recyclerview/widget/d;->notifyItemMoved(II)V

    return-void
.end method

.method public final T(Lr22;)V
    .registers 2

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Laz3;

    iget-object p0, p0, Laz3;->d:Lbz3;

    iput-object p1, p0, Lbz3;->f:Ljava/lang/Object;

    invoke-virtual {p0}, Lbz3;->f()V

    return-void
.end method

.method public final U(F)V
    .registers 2

    return-void
.end method

.method public final V(Lcom/opera/android/oauth2/OperaAccessToken;)V
    .registers 2

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Lcom/opera/api/Callback;

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final W()V
    .registers 1

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Lt42;

    iget-object p0, p0, Lt42;->w:Lei;

    iget-object p0, p0, Lei;->d:Landroid/view/View;

    check-cast p0, Lcom/opera/android/webaiassistant/WebAiAssistantSheetContentWrapper;

    invoke-virtual {p0}, Lgej;->e()V

    return-void
.end method

.method public final Y()V
    .registers 1

    return-void
.end method

.method public final Z()V
    .registers 2

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Laz3;

    iget-object p0, p0, Laz3;->d:Lbz3;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lbz3;->d:Z

    invoke-virtual {p0}, Lbz3;->f()V

    return-void
.end method

.method public final a()I
    .registers 1

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Laz3;

    iget-object p0, p0, Laz3;->d:Lbz3;

    iget-object p0, p0, Lbz3;->g:Ljava/lang/Object;

    check-cast p0, Ldtl;

    iget p0, p0, Ldtl;->b:I

    return p0
.end method

.method public final a0()V
    .registers 3

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Le35;

    invoke-virtual {p0}, Le35;->J0()V

    iget-object p0, p0, Le35;->r:Ljava/util/ArrayList;

    new-instance v0, Lqg2;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lqg2;-><init>(B)V

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->forEach(Ljava/util/function/Consumer;)V

    return-void
.end method

.method public final b()V
    .registers 2

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Lcom/opera/api/Callback;

    const/4 v0, 0x0

    invoke-interface {p0, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final b0(Ljava/lang/Runnable;)V
    .registers 6

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Laz3;

    iget-object v0, p0, Laz3;->h:Lh7f;

    iget-object v1, p0, Laz3;->d:Lbz3;

    iget-object v2, v1, Lbz3;->e:Ljava/lang/Object;

    check-cast v2, Lbvl;

    if-eqz v2, :cond_18

    iget-object v2, v1, Lbz3;->g:Ljava/lang/Object;

    check-cast v2, Ldtl;

    iget v3, v2, Ldtl;->a:I

    iget v2, v2, Ldtl;->b:I

    if-gt v3, v2, :cond_28

    :cond_18
    iget-object v2, v1, Lbz3;->f:Ljava/lang/Object;

    check-cast v2, Lr22;

    if-eqz v2, :cond_44

    iget-object v2, v1, Lbz3;->g:Ljava/lang/Object;

    check-cast v2, Ldtl;

    iget v3, v2, Ldtl;->e:I

    iget v2, v2, Ldtl;->d:I

    if-le v3, v2, :cond_44

    :cond_28
    invoke-virtual {v1}, Lbz3;->c()Z

    move-result v1

    if-nez v1, :cond_44

    if-eqz p1, :cond_33

    invoke-virtual {v0, p1}, Lh7f;->b(Ljava/lang/Object;)Z

    :cond_33
    const/4 v1, 0x4

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Laz3;->N(IZ)Z

    move-result p0

    if-nez p0, :cond_49

    if-eqz p1, :cond_49

    invoke-virtual {v0, p1}, Lh7f;->c(Ljava/lang/Object;)Z

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    return-void

    :cond_44
    if-eqz p1, :cond_49

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    :cond_49
    return-void
.end method

.method public final c()I
    .registers 1

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Laz3;

    iget-object p0, p0, Laz3;->d:Lbz3;

    iget-object p0, p0, Lbz3;->g:Ljava/lang/Object;

    check-cast p0, Ldtl;

    iget p0, p0, Ldtl;->d:I

    return p0
.end method

.method public final c0()V
    .registers 2

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Lvj2;

    iget-object p0, p0, Lvj2;->e:Ljava/util/ArrayDeque;

    :goto_6
    invoke-virtual {p0}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1a

    invoke-virtual {p0}, Ljava/util/ArrayDeque;->removeFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Pair;

    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    goto :goto_6

    :cond_1a
    return-void
.end method

.method public final d()V
    .registers 2

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Lv6d;

    sget-object v0, Lt6d;->b:Lt6d;

    invoke-virtual {p0, v0}, Lv6d;->b(Lt6d;)V

    return-void
.end method

.method public final e()V
    .registers 2

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Lv6d;

    sget-object v0, Lt6d;->a:Lt6d;

    invoke-virtual {p0, v0}, Lv6d;->b(Lt6d;)V

    return-void
.end method

.method public final e0()Landroid/view/textclassifier/TextClassification;
    .registers 3

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;

    const/4 v0, 0x0

    if-nez p0, :cond_8

    return-object v0

    :cond_8
    iget-object p0, p0, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->L:Lvyi;

    if-nez p0, :cond_d

    return-object v0

    :cond_d
    iget-object p0, p0, Lvyi;->f:Landroid/view/textclassifier/TextClassification;

    if-nez p0, :cond_12

    return-object v0

    :cond_12
    invoke-virtual {p0}, Landroid/view/textclassifier/TextClassification;->getText()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_19

    return-object v0

    :cond_19
    return-object p0
.end method

.method public final f(II)V
    .registers 3

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Landroidx/recyclerview/widget/d;

    invoke-virtual {p0, p1, p2}, Landroidx/recyclerview/widget/d;->notifyItemRangeRemoved(II)V

    return-void
.end method

.method public final f0(Ljava/lang/Object;)V
    .registers 3

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Laz3;

    iget-object v0, p0, Laz3;->e:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_17

    invoke-virtual {v0}, Ljava/util/HashSet;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_17

    const/4 p1, 0x0

    const/4 v0, 0x3

    invoke-virtual {p0, v0, p1}, Laz3;->N(IZ)Z

    :cond_17
    return-void
.end method

.method public final g()I
    .registers 1

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Laz3;

    iget-object p0, p0, Laz3;->d:Lbz3;

    iget-object p0, p0, Lbz3;->g:Ljava/lang/Object;

    check-cast p0, Ldtl;

    iget p0, p0, Ldtl;->c:I

    return p0
.end method

.method public final h()I
    .registers 1

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Laz3;

    iget-object p0, p0, Laz3;->d:Lbz3;

    iget-object p0, p0, Lbz3;->g:Ljava/lang/Object;

    check-cast p0, Ldtl;

    iget p0, p0, Ldtl;->a:I

    return p0
.end method

.method public final h0(Lb2l;Lcom/opera/android/browser/TabInfo;)Lb2l;
    .registers 9

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    move-object v0, p0

    check-cast v0, Lcom/opera/android/BrowserActivity;

    move-object p0, p1

    check-cast p0, Ld7l;

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->m()Z

    move-result v1

    sget p0, Lcom/opera/android/BrowserActivity;->E1:I

    sget-object v4, Llqm;->l:Llqm;

    const/4 v3, 0x0

    move-object v2, p1

    move-object v5, p2

    invoke-virtual/range {v0 .. v5}, Lcom/opera/android/BrowserActivity;->i0(ZLb2l;ZLlqm;Lcom/opera/android/browser/TabInfo;)Ld7l;

    move-result-object p0

    return-object p0
.end method

.method public final i()I
    .registers 3

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Landroid/view/Window;

    invoke-virtual {p0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    iget v0, v0, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    const/high16 v1, -0x40800000    # -1.0f

    cmpl-float v1, v0, v1

    if-nez v1, :cond_46

    invoke-virtual {p0}, Landroid/view/Window;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    const-string v0, "screen_brightness_mode"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    if-eqz v0, :cond_3a

    const/4 v1, 0x1

    if-eq v0, v1, :cond_27

    const/high16 v0, 0x3f000000    # 0.5f

    goto :goto_46

    :cond_27
    const-string v0, "screen_auto_brightness_adj"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/provider/Settings$System;->getFloat(Landroid/content/ContentResolver;Ljava/lang/String;F)F

    move-result p0

    const v0, 0x3f4ccccd    # 0.8f

    mul-float/2addr p0, v0

    const/high16 v0, 0x3f800000    # 1.0f

    add-float/2addr p0, v0

    const/high16 v0, 0x40000000    # 2.0f

    :goto_37
    div-float v0, p0, v0

    goto :goto_46

    :cond_3a
    const-string v0, "screen_brightness"

    const/16 v1, 0x7f

    invoke-static {p0, v0, v1}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result p0

    int-to-float p0, p0

    const/high16 v0, 0x437f0000    # 255.0f

    goto :goto_37

    :cond_46
    :goto_46
    const/high16 p0, 0x42c80000    # 100.0f

    mul-float/2addr v0, p0

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result p0

    return p0
.end method

.method public final i0()I
    .registers 1

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Landroid/media/Image$Plane;

    invoke-virtual {p0}, Landroid/media/Image$Plane;->getPixelStride()I

    move-result p0

    return p0
.end method

.method public final j()Z
    .registers 1

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Laz3;

    iget-object p0, p0, Laz3;->d:Lbz3;

    iget-object p0, p0, Lbz3;->g:Ljava/lang/Object;

    check-cast p0, Ldtl;

    iget-boolean p0, p0, Ldtl;->g:Z

    return p0
.end method

.method public final j0(Lp6l;Lcom/opera/android/browser/TabInfo;)Lb2l;
    .registers 5

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/BrowserActivity;

    sget-object v0, Lp6l;->b:Lp6l;

    const/4 v1, 0x0

    if-ne p1, v0, :cond_b

    const/4 p1, 0x1

    goto :goto_c

    :cond_b
    move p1, v1

    :goto_c
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p0, p1, v1, p2}, Lcom/opera/android/BrowserActivity;->j1(ZZLcom/opera/android/browser/TabInfo;)Ld7l;

    move-result-object p0

    return-object p0
.end method

.method public final k(Lp6l;)Lb2l;
    .registers 8

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    move-object v0, p0

    check-cast v0, Lcom/opera/android/BrowserActivity;

    sget-object p0, Lp6l;->b:Lp6l;

    if-ne p1, p0, :cond_c

    const/4 p0, 0x1

    :goto_a
    move v1, p0

    goto :goto_e

    :cond_c
    const/4 p0, 0x0

    goto :goto_a

    :goto_e
    sget p0, Lcom/opera/android/BrowserActivity;->E1:I

    const/4 v3, 0x0

    sget-object v4, Llqm;->l:Llqm;

    const/4 v2, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/opera/android/BrowserActivity;->i0(ZLb2l;ZLlqm;Lcom/opera/android/browser/TabInfo;)Ld7l;

    move-result-object p0

    return-object p0
.end method

.method public final l()V
    .registers 3

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Le35;

    iget-object p0, p0, Le35;->r:Ljava/util/ArrayList;

    new-instance v0, Lqg2;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lqg2;-><init>(B)V

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->forEach(Ljava/util/function/Consumer;)V

    return-void
.end method

.method public final l0(Landroid/view/View;Lg3o;)Lg3o;
    .registers 4

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/material/appbar/AppBarLayout;

    invoke-virtual {p0}, Landroid/view/View;->getFitsSystemWindows()Z

    move-result p1

    if-eqz p1, :cond_c

    move-object p1, p2

    goto :goto_d

    :cond_c
    const/4 p1, 0x0

    :goto_d
    iget-object v0, p0, Lcom/google/android/material/appbar/AppBarLayout;->g:Lg3o;

    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2c

    iput-object p1, p0, Lcom/google/android/material/appbar/AppBarLayout;->g:Lg3o;

    iget-object p1, p0, Lcom/google/android/material/appbar/AppBarLayout;->x:Landroid/graphics/drawable/Drawable;

    const/4 v0, 0x1

    if-eqz p1, :cond_24

    invoke-virtual {p0}, Lcom/google/android/material/appbar/AppBarLayout;->g()I

    move-result p1

    if-lez p1, :cond_24

    move p1, v0

    goto :goto_25

    :cond_24
    const/4 p1, 0x0

    :goto_25
    xor-int/2addr p1, v0

    invoke-virtual {p0, p1}, Landroid/view/View;->setWillNotDraw(Z)V

    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    :cond_2c
    return-object p2
.end method

.method public final n()Z
    .registers 1

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Laz3;

    iget-object p0, p0, Laz3;->d:Lbz3;

    invoke-virtual {p0}, Lbz3;->c()Z

    move-result p0

    return p0
.end method

.method public final n0(F)V
    .registers 2

    return-void
.end method

.method public final onFailure(Lv84;Ljava/io/IOException;)V
    .registers 3

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Lnh4;

    sget-object p1, Lt0i;->b:Lp0i;

    new-instance p1, Lq0i;

    invoke-direct {p1, p2}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    invoke-virtual {p0, p1}, Lnh4;->resumeWith(Ljava/lang/Object;)V

    return-void
.end method

.method public final onResponse(Lv84;Lpzh;)V
    .registers 4

    iget-boolean p1, p2, Lpzh;->q:Z

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Lnh4;

    if-eqz p1, :cond_10

    sget-object p1, Lt0i;->b:Lp0i;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lnh4;->resumeWith(Ljava/lang/Object;)V

    return-void

    :cond_10
    sget-object p1, Lt0i;->b:Lp0i;

    new-instance p1, Ljava/io/IOException;

    iget p2, p2, Lpzh;->d:I

    const-string v0, "Error: "

    invoke-static {p2, v0}, Lsko;->i(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    new-instance p2, Lq0i;

    invoke-direct {p2, p1}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    invoke-virtual {p0, p2}, Lnh4;->resumeWith(Ljava/lang/Object;)V

    return-void
.end method

.method public final p(Ljava/lang/String;)V
    .registers 2

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Ljh3;

    iget-object p0, p0, Ljh3;->v:Ld83;

    invoke-virtual {p0}, Ld83;->getFilter()Landroid/widget/Filter;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/widget/Filter;->filter(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final q()Z
    .registers 2

    iget-object v0, p0, Leme;->a:Ljava/lang/Object;

    check-cast v0, Laz3;

    iget-object v0, v0, Laz3;->b:Leq9;

    invoke-virtual {v0}, Leq9;->c()Z

    move-result v0

    if-nez v0, :cond_1a

    invoke-virtual {p0}, Leme;->h()I

    move-result v0

    if-gtz v0, :cond_18

    invoke-virtual {p0}, Leme;->g()I

    move-result p0

    if-lez p0, :cond_1a

    :cond_18
    const/4 p0, 0x1

    return p0

    :cond_1a
    const/4 p0, 0x0

    return p0
.end method

.method public final r(Ljava/lang/Object;)V
    .registers 3

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Laz3;

    iget-object v0, p0, Laz3;->e:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_18

    invoke-virtual {v0}, Ljava/util/HashSet;->size()I

    move-result p1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_18

    const/4 p1, 0x0

    const/4 v0, 0x3

    invoke-virtual {p0, v0, p1}, Laz3;->N(IZ)Z

    :cond_18
    return-void
.end method

.method public final r0()V
    .registers 1

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Lzh5;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public final s(Lw3g;)V
    .registers 2

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Lx5g;

    iget-object p0, p0, Lx5g;->d:Lw4g;

    iget-object p0, p0, Lw4g;->a:Lvnj;

    invoke-static {p1}, Lw4g;->a(Lw3g;)Lknj;

    move-result-object p1

    invoke-virtual {p0, p1}, Lvnj;->j(Lknj;)V

    return-void
.end method

.method public final s0(Landroid/content/Context;Ljava/lang/String;Ljava/io/InputStream;Ljava/lang/String;Ljava/lang/String;)Ll3d;
    .registers 8

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Lole;

    if-nez p4, :cond_8

    const-string p4, "application/json"

    :cond_8
    const-string v0, "application/zip"

    invoke-virtual {p4, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_52

    const-string v0, "application/x-zip"

    invoke-virtual {p4, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_52

    const-string v0, "application/x-zip-compressed"

    invoke-virtual {p4, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p4

    if-nez p4, :cond_52

    const-string p4, "\\?"

    invoke-virtual {p2, p4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p4

    const/4 v0, 0x0

    aget-object p4, p4, v0

    const-string v0, ".lottie"

    invoke-virtual {p4, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p4

    if-nez p4, :cond_52

    invoke-static {}, Lizc;->a()V

    sget-object p1, Lf19;->b:Lf19;

    if-eqz p5, :cond_4d

    if-eqz p0, :cond_4d

    invoke-virtual {p0, p2, p3, p1}, Lole;->K(Ljava/lang/String;Ljava/io/InputStream;Lf19;)Ljava/io/File;

    move-result-object p3

    new-instance p4, Ljava/io/FileInputStream;

    invoke-virtual {p3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p3

    invoke-direct {p4, p3}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    invoke-static {p4, p2}, Lu2d;->c(Ljava/io/InputStream;Ljava/lang/String;)Ll3d;

    move-result-object p3

    goto :goto_7a

    :cond_4d
    invoke-static {p3, v1}, Lu2d;->c(Ljava/io/InputStream;Ljava/lang/String;)Ll3d;

    move-result-object p3

    goto :goto_7a

    :cond_52
    invoke-static {}, Lizc;->a()V

    sget-object p4, Lf19;->c:Lf19;

    if-eqz p5, :cond_6f

    if-eqz p0, :cond_6f

    invoke-virtual {p0, p2, p3, p4}, Lole;->K(Ljava/lang/String;Ljava/io/InputStream;Lf19;)Ljava/io/File;

    move-result-object p3

    new-instance v0, Ljava/util/zip/ZipInputStream;

    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v0, v1}, Ljava/util/zip/ZipInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-static {p1, v0, p2}, Lu2d;->g(Landroid/content/Context;Ljava/util/zip/ZipInputStream;Ljava/lang/String;)Ll3d;

    move-result-object p1

    :goto_6d
    move-object p3, p1

    goto :goto_79

    :cond_6f
    new-instance v0, Ljava/util/zip/ZipInputStream;

    invoke-direct {v0, p3}, Ljava/util/zip/ZipInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-static {p1, v0, v1}, Lu2d;->g(Landroid/content/Context;Ljava/util/zip/ZipInputStream;Ljava/lang/String;)Ll3d;

    move-result-object p1

    goto :goto_6d

    :goto_79
    move-object p1, p4

    :goto_7a
    if-eqz p5, :cond_d3

    iget-object p4, p3, Ll3d;->a:Ljava/lang/Object;

    if-eqz p4, :cond_d3

    if-eqz p0, :cond_d3

    const/4 p4, 0x1

    invoke-static {p2, p1, p4}, Lole;->p(Ljava/lang/String;Lf19;Z)Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/io/File;

    invoke-virtual {p0}, Lole;->A()Ljava/io/File;

    move-result-object p0

    invoke-direct {p2, p0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    const-string p1, ".temp"

    const-string p4, ""

    invoke-virtual {p0, p1, p4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/io/File;

    invoke-direct {p1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result p0

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    invoke-static {}, Lizc;->a()V

    if-nez p0, :cond_d3

    new-instance p0, Ljava/lang/StringBuilder;

    const-string p4, "Unable to rename cache file "

    invoke-direct {p0, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " to "

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "."

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lizc;->b(Ljava/lang/String;)V

    :cond_d3
    return-object p3
.end method

.method public final t(II)V
    .registers 3

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Landroidx/recyclerview/widget/d;

    invoke-virtual {p0, p1, p2}, Landroidx/recyclerview/widget/d;->notifyItemRangeInserted(II)V

    return-void
.end method

.method public final t0(Lnle;)Lwv;
    .registers 2

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Lu9d;

    invoke-virtual {p0, p1}, Lu9d;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_d

    check-cast p0, Lwv;

    return-object p0

    :cond_d
    const-string p0, "Required value was null."

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final u()Ljava/nio/ByteBuffer;
    .registers 1

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Landroid/media/Image$Plane;

    invoke-virtual {p0}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object p0

    return-object p0
.end method

.method public final u0(Lnle;)Lwv;
    .registers 2

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Lu9d;

    invoke-virtual {p0, p1}, Lu9d;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lwv;

    if-eqz p0, :cond_15

    sget-object p1, Lwv;->d:Lwv;

    invoke-virtual {p0, p1}, Lle3;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_15

    return-object p0

    :cond_15
    const/4 p0, 0x0

    return-object p0
.end method

.method public final v(Ljava/lang/String;)V
    .registers 2

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Ljh3;

    iget-object p0, p0, Ljh3;->v:Ld83;

    invoke-virtual {p0}, Ld83;->getFilter()Landroid/widget/Filter;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/widget/Filter;->filter(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final v0(I)V
    .registers 3

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Lnrl;

    iget-boolean v0, p0, Lnrl;->a:Z

    xor-int/lit8 v0, v0, 0x1

    invoke-static {v0}, Lz4o;->H(Z)V

    iget-object p0, p0, Lnrl;->b:Ljava/lang/Object;

    check-cast p0, Landroid/util/SparseBooleanArray;

    invoke-virtual {p0, p1}, Landroid/util/SparseBooleanArray;->delete(I)V

    return-void
.end method

.method public final w0(ILjava/lang/Object;Lbni;)V
    .registers 5

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Lx75;

    check-cast p2, Lx5;

    const/4 v0, 0x3

    invoke-virtual {p0, p1, v0}, Lx75;->A(II)V

    iget-object v0, p0, Lx75;->a:Leme;

    invoke-interface {p3, p2, v0}, Lbni;->b(Ljava/lang/Object;Leme;)V

    const/4 p2, 0x4

    invoke-virtual {p0, p1, p2}, Lx75;->A(II)V

    return-void
.end method

.method public final x(Lcom/opera/android/browser/chromium/ChromiumContent;)V
    .registers 2

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Laz3;

    iget-object p0, p0, Laz3;->c:Lz4k;

    invoke-virtual {p0, p1}, Lz4k;->f(Lcom/opera/android/browser/chromium/ChromiumContent;)Z

    move-result p1

    if-eqz p1, :cond_f

    const/4 p1, 0x0

    iput-object p1, p0, Lz4k;->b:Ljava/lang/Object;

    :cond_f
    return-void
.end method

.method public final y()V
    .registers 2

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/BrowserActivity;

    const-class v0, Ld8j;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {p0, v0}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Ld8j;

    const/4 v0, 0x0

    new-array v0, v0, [I

    check-cast p0, Lg8j;

    invoke-virtual {p0, v0}, Lg8j;->d([I)V

    return-void
.end method

.method public final z(Lbvl;)V
    .registers 2

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Laz3;

    iget-object p0, p0, Laz3;->d:Lbz3;

    iput-object p1, p0, Lbz3;->e:Ljava/lang/Object;

    return-void
.end method
