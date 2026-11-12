.class public final Lnxo;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final t:Lt72;


# instance fields
.field public final a:Landroid/widget/FrameLayout;

.field public final b:Lix5;

.field public final c:Lrwo;

.field public final d:Lujo;

.field public final e:Ljava/util/ArrayList;

.field public final f:Ljava/util/ArrayList;

.field public g:Lfzo;

.field public h:Lha6;

.field public i:Lxup;

.field public j:Landroid/widget/FrameLayout;

.field public k:Ljava/lang/Object;

.field public l:Lbm;

.field public m:I

.field public n:I

.field public o:Ljava/lang/String;

.field public p:Z

.field public q:Ljava/lang/ref/WeakReference;

.field public r:Z

.field public s:Lcom/opera/ad/view/VolumeMutableButton;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lt72;

    const/4 v1, 0x2

    new-array v1, v1, [Lvim;

    sget-object v2, Lvim;->a:Lcom/google/ads/interactivemedia/v3/impl/data/zzcc;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    sget-object v2, Lvim;->b:Lcom/google/ads/interactivemedia/v3/impl/data/zzcc;

    const/4 v4, 0x1

    aput-object v2, v1, v4

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v3}, Lt72;-><init>(I)V

    if-eqz v1, :cond_1b

    invoke-virtual {v0, v1}, Lt72;->addAll(Ljava/util/Collection;)Z

    :cond_1b
    sput-object v0, Lnxo;->t:Lt72;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Z)V
    .registers 14

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lnxo;->e:Ljava/util/ArrayList;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lnxo;->f:Ljava/util/ArrayList;

    sget-object v2, Lz4o;->q:[I

    const/4 v3, 0x0

    aget v4, v2, v3

    iput v4, p0, Lnxo;->m:I

    aget v2, v2, v1

    iput v2, p0, Lnxo;->n:I

    new-instance v2, Landroid/widget/FrameLayout;

    invoke-direct {v2, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lnxo;->a:Landroid/widget/FrameLayout;

    sget-object v4, Lix5;->b:Lix5;

    if-nez v4, :cond_31

    new-instance v4, Lix5;

    const/16 v5, 0xd

    invoke-direct {v4, v5}, Lix5;-><init>(B)V

    sput-object v4, Lix5;->b:Lix5;

    :cond_31
    iput-object v4, p0, Lnxo;->b:Lix5;

    new-instance v8, Lcom/google/ads/interactivemedia/v3/impl/ImaSdkSettingsImpl;

    invoke-direct {v8}, Lcom/google/ads/interactivemedia/v3/impl/ImaSdkSettingsImpl;-><init>()V

    invoke-interface {v8, v3}, Lhva;->setAutoPlayAdBreaks(Z)V

    const/4 v4, 0x5

    invoke-interface {v8, v4}, Lhva;->setMaxRedirects(I)V

    new-instance v4, Lrwo;

    invoke-direct {v4, p0}, Lrwo;-><init>(Lnxo;)V

    iput-object v4, p0, Lnxo;->c:Lrwo;

    new-instance v5, Lujo;

    new-instance v6, Lkvo;

    invoke-direct {v6, p0}, Lkvo;-><init>(Lnxo;)V

    invoke-direct {v5, p1, v6}, Lujo;-><init>(Landroid/content/Context;Lkvo;)V

    iput-object v5, p0, Lnxo;->d:Lujo;

    new-instance v6, Lt9l;

    invoke-direct {v6}, Ljava/lang/Object;-><init>()V

    new-instance v7, Ln9h;

    const/16 v9, 0xf

    invoke-direct {v7, v9}, Ln9h;-><init>(B)V

    iput-object v7, v6, Lt9l;->d:Ljava/lang/Object;

    iput-object v5, v6, Lt9l;->b:Ljava/lang/Object;

    iput-object v7, v5, Lujo;->d:Ln9h;

    const-string v5, "audio"

    invoke-virtual {p1, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/media/AudioManager;

    new-instance v9, Ldrp;

    invoke-direct {v9, v2, v6}, Ldrp;-><init>(Landroid/widget/FrameLayout;Lt9l;)V

    new-instance v6, Lmbi;

    invoke-direct {v6, p0, p1}, Lmbi;-><init>(Lnxo;Landroid/content/Context;)V

    invoke-static {}, Ljava/util/concurrent/Executors;->newCachedThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v10

    invoke-interface {v8}, Lhva;->isDebugMode()Z

    move-result v2

    if-eqz v2, :cond_84

    sget-object v2, Llpp;->b:Landroid/net/Uri;

    :goto_82
    move-object v7, v2

    goto :goto_87

    :cond_84
    sget-object v2, Llpp;->a:Landroid/net/Uri;

    goto :goto_82

    :goto_87
    new-instance v5, Lha6;

    invoke-direct/range {v5 .. v10}, Lha6;-><init>(Lmbi;Landroid/net/Uri;Lcom/google/ads/interactivemedia/v3/impl/ImaSdkSettingsImpl;Ldrp;Ljava/util/concurrent/ExecutorService;)V

    iget-object v2, v5, Lha6;->c:Ljava/lang/Object;

    check-cast v2, Lwpp;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    iput-wide v6, v2, Lwpp;->r:J

    iget-object v6, v2, Lwpp;->i:Lplk;

    iget-object v7, v2, Lwpp;->h:Ljava/lang/String;

    iget-object v6, v6, Lplk;->a:Ljava/lang/Object;

    check-cast v6, Landroid/webkit/WebView;

    invoke-virtual {v6, v7}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    iget-object v2, v2, Lwpp;->o:Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-virtual {v2}, Lcom/google/android/gms/tasks/TaskCompletionSource;->getTask()Lcom/google/android/gms/tasks/Task;

    move-result-object v2

    new-instance v6, Lbxk;

    const/16 v7, 0x16

    invoke-direct {v6, v5, v7}, Lbxk;-><init>(Ljava/lang/Object;B)V

    iget-object v7, v5, Lha6;->o:Ljava/lang/Object;

    check-cast v7, Lcom/google/ads/interactivemedia/v3/internal/zzsx;

    invoke-virtual {v2, v7, v6}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    iput-object v5, p0, Lnxo;->h:Lha6;

    iget-object v2, v5, Lha6;->e:Ljava/lang/Object;

    check-cast v2, Ln9h;

    iget-object v2, v2, Ln9h;->b:Ljava/lang/Object;

    check-cast v2, Ljava/util/ArrayList;

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object p0, p0, Lnxo;->h:Lha6;

    iget-object p0, p0, Lha6;->f:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    if-eqz p2, :cond_12a

    new-instance p0, Landroid/widget/LinearLayout;

    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 p1, 0x8

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    new-instance p1, Lwvo;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setOnHierarchyChangeListener(Landroid/view/ViewGroup$OnHierarchyChangeListener;)V

    new-instance p1, Lyop;

    invoke-direct {p1}, Lyop;-><init>()V

    iput-object p0, p1, Lyop;->c:Landroid/widget/LinearLayout;

    const/16 p0, 0x12c

    iput-short p0, p1, Lyop;->a:S

    const/16 p0, 0xfa

    iput-short p0, p1, Lyop;->b:S

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance p0, Lcom/google/ads/interactivemedia/v3/internal/zzpw;

    invoke-direct {p0}, Lcom/google/ads/interactivemedia/v3/internal/zzpw;-><init>()V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p1

    :cond_100
    :goto_100
    if-ge v3, p1, :cond_124

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    add-int/lit8 v3, v3, 0x1

    check-cast p2, Lyop;

    if-eqz p2, :cond_100

    sget v1, Ldrp;->f:I

    add-int/lit8 v2, v1, 0x1

    sput v2, Ldrp;->f:I

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v4, "compSlot_"

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, p2}, Lcom/google/ads/interactivemedia/v3/internal/zzpw;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_100

    :cond_124
    invoke-virtual {p0}, Lcom/google/ads/interactivemedia/v3/internal/zzpw;->b()Lcom/google/ads/interactivemedia/v3/internal/zzpx;

    move-result-object p0

    iput-object p0, v9, Ldrp;->b:Lcom/google/ads/interactivemedia/v3/internal/zzpx;

    :cond_12a
    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)V
    .registers 4

    iget-object v0, p0, Lnxo;->i:Lxup;

    if-eqz v0, :cond_9

    sget-object v1, Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;->click:Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;

    invoke-virtual {v0, v1}, Lxup;->g(Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;)V

    :cond_9
    iget-object v0, p0, Lnxo;->g:Lfzo;

    if-eqz v0, :cond_16

    iget-object v0, v0, Lk8;->a:Ljava/lang/Object;

    check-cast v0, Lwm;

    if-eqz v0, :cond_16

    invoke-interface {v0}, Lwm;->onAdClicked()V

    :cond_16
    iget-object v0, p0, Lnxo;->o:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_33

    new-instance v0, Landroid/content/Intent;

    iget-object p0, p0, Lnxo;->o:Ljava/lang/String;

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1, p0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const/high16 p0, 0x10000000

    invoke-virtual {v0, p0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    :cond_33
    return-void
.end method

.method public final b(Landroid/widget/FrameLayout;Landroid/widget/LinearLayout;)V
    .registers 13

    invoke-virtual {p0}, Lnxo;->d()Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    :cond_7
    new-instance v0, Lbno;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lbno;-><init>(Ljava/lang/Object;B)V

    new-instance v2, Landroid/view/TextureView;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/view/TextureView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v0}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    new-instance v3, Lhvo;

    invoke-direct {v3, p0, v2, v0, p1}, Lhvo;-><init>(Lnxo;Landroid/view/TextureView;Lbno;Landroid/widget/FrameLayout;)V

    iget-object v0, p0, Lnxo;->f:Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v3, p0, Lnxo;->a:Landroid/widget/FrameLayout;

    invoke-static {v3}, Lupj;->j(Landroid/view/View;)V

    iget-object v4, p0, Lnxo;->d:Lujo;

    iput-object v2, v4, Lujo;->f:Landroid/view/TextureView;

    iget-object v5, v4, Lujo;->a:Lqi8;

    invoke-virtual {v5, v2}, Lqi8;->setVideoTextureView(Landroid/view/TextureView;)V

    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v6, -0x1

    const/16 v7, 0x11

    invoke-direct {v5, v6, v6, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {p1, v2, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p1, v3, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-boolean v2, v4, Lujo;->b:Z

    iget-object v3, p0, Lnxo;->s:Lcom/opera/ad/view/VolumeMutableButton;

    const/high16 v4, 0x3f000000    # 0.5f

    const/4 v5, 0x0

    if-nez v3, :cond_aa

    new-instance v3, Lcom/opera/ad/view/VolumeMutableButton;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-direct {v3, v8, v5}, Lcom/opera/ad/view/VolumeMutableButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput-object v3, p0, Lnxo;->s:Lcom/opera/ad/view/VolumeMutableButton;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->density:F

    const/high16 v8, 0x41a00000    # 20.0f

    mul-float/2addr v3, v8

    add-float/2addr v3, v4

    float-to-int v3, v3

    new-instance v8, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v8, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    div-int/lit8 v3, v3, 0x2

    invoke-virtual {v8, v3}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V

    div-int/lit8 v3, v3, 0x2

    iput v3, v8, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    const v3, 0x800055

    iput v3, v8, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    iget-object v3, p0, Lnxo;->s:Lcom/opera/ad/view/VolumeMutableButton;

    sget-object v9, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v3, v9}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    iget-object v3, p0, Lnxo;->s:Lcom/opera/ad/view/VolumeMutableButton;

    const v9, 0x7f0801c4

    invoke-virtual {v3, v9}, Landroid/view/View;->setBackgroundResource(I)V

    iget-object v3, p0, Lnxo;->s:Lcom/opera/ad/view/VolumeMutableButton;

    invoke-virtual {p1, v3, v8}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v3, p0, Lnxo;->s:Lcom/opera/ad/view/VolumeMutableButton;

    new-instance v8, Lkvo;

    invoke-direct {v8, p0}, Lkvo;-><init>(Lnxo;)V

    iput-boolean v2, v3, Lcom/opera/ad/view/VolumeMutableButton;->c:Z

    iput-object v8, v3, Lcom/opera/ad/view/VolumeMutableButton;->d:Lecn;

    if-eqz v2, :cond_9d

    iget-object v2, v3, Lcom/opera/ad/view/VolumeMutableButton;->a:Landroid/graphics/drawable/Drawable;

    goto :goto_9f

    :cond_9d
    iget-object v2, v3, Lcom/opera/ad/view/VolumeMutableButton;->b:Landroid/graphics/drawable/Drawable;

    :goto_9f
    invoke-virtual {v3, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    new-instance v2, Llvo;

    invoke-direct {v2, p0}, Llvo;-><init>(Lnxo;)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_aa
    iget-object v0, p0, Lnxo;->e:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lt v2, v1, :cond_ba

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Lyop;

    :cond_ba
    if-eqz v5, :cond_de

    if-eqz p2, :cond_de

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    iget-short v1, v5, Lyop;->b:S

    int-to-float v1, v1

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v2, v1

    add-float/2addr v2, v4

    float-to-int v1, v2

    invoke-direct {v0, v6, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iput v7, v0, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    iget-object v1, v5, Lyop;->c:Landroid/widget/LinearLayout;

    invoke-virtual {p2, v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_de
    iput-object p1, p0, Lnxo;->j:Landroid/widget/FrameLayout;

    return-void
.end method

.method public final c(Lfzo;)V
    .registers 3

    iget-object v0, p0, Lnxo;->g:Lfzo;

    if-nez v0, :cond_2d

    iput-object p1, p0, Lnxo;->g:Lfzo;

    invoke-virtual {p0}, Lnxo;->d()Z

    move-result p1

    if-eqz p1, :cond_18

    iget-object p0, p0, Lnxo;->g:Lfzo;

    iget-object p0, p0, Lk8;->b:Ljava/lang/Object;

    check-cast p0, Ldn;

    if-eqz p0, :cond_2d

    invoke-interface {p0}, Ldn;->i()V

    return-void

    :cond_18
    iget-object p1, p0, Lnxo;->l:Lbm;

    sget-object v0, Lbm;->e:Lbm;

    if-eq p1, v0, :cond_22

    sget-object v0, Lbm;->d:Lbm;

    if-ne p1, v0, :cond_2d

    :cond_22
    iget-object p0, p0, Lnxo;->g:Lfzo;

    iget-object p0, p0, Lk8;->b:Ljava/lang/Object;

    check-cast p0, Ldn;

    if-eqz p0, :cond_2d

    invoke-interface {p0, p1}, Ldn;->p(Lbm;)V

    :cond_2d
    return-void
.end method

.method public final d()Z
    .registers 2

    iget-object v0, p0, Lnxo;->k:Ljava/lang/Object;

    if-nez v0, :cond_a

    iget-object p0, p0, Lnxo;->i:Lxup;

    if-eqz p0, :cond_a

    const/4 p0, 0x1

    return p0

    :cond_a
    const/4 p0, 0x0

    return p0
.end method

.method public final e()V
    .registers 3

    invoke-virtual {p0}, Lnxo;->d()Z

    move-result v0

    if-eqz v0, :cond_21

    iget-boolean v0, p0, Lnxo;->p:Z

    if-nez v0, :cond_21

    iget-object p0, p0, Lnxo;->d:Lujo;

    iget-boolean v0, p0, Lujo;->b:Z

    if-nez v0, :cond_21

    iget-object v0, p0, Lujo;->a:Lqi8;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lqi8;->setVolume(F)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lujo;->b:Z

    iget-object p0, p0, Lujo;->d:Ln9h;

    if-eqz p0, :cond_21

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ln9h;->c(I)V

    :cond_21
    return-void
.end method

.method public final f()V
    .registers 3

    iget-boolean v0, p0, Lnxo;->r:Z

    if-nez v0, :cond_18

    invoke-virtual {p0}, Lnxo;->d()Z

    move-result v0

    if-eqz v0, :cond_18

    iget-boolean v0, p0, Lnxo;->p:Z

    if-nez v0, :cond_18

    iget-object v0, p0, Lnxo;->i:Lxup;

    sget-object v1, Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;->pause:Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;

    invoke-virtual {v0, v1}, Lxup;->g(Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lnxo;->r:Z

    :cond_18
    return-void
.end method

.method public final g()V
    .registers 3

    invoke-virtual {p0}, Lnxo;->d()Z

    move-result v0

    if-eqz v0, :cond_14

    iget-boolean v0, p0, Lnxo;->p:Z

    if-nez v0, :cond_14

    iget-object v0, p0, Lnxo;->i:Lxup;

    sget-object v1, Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;->resume:Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;

    invoke-virtual {v0, v1}, Lxup;->g(Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lnxo;->r:Z

    :cond_14
    return-void
.end method

.method public final h()V
    .registers 3

    invoke-virtual {p0}, Lnxo;->d()Z

    move-result v0

    if-eqz v0, :cond_23

    iget-boolean v0, p0, Lnxo;->p:Z

    if-nez v0, :cond_23

    iget-object p0, p0, Lnxo;->d:Lujo;

    iget-boolean v0, p0, Lujo;->b:Z

    if-eqz v0, :cond_23

    iget-object v0, p0, Lujo;->a:Lqi8;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Lqi8;->setVolume(F)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lujo;->b:Z

    iget-object p0, p0, Lujo;->d:Ln9h;

    if-eqz p0, :cond_23

    const/16 v0, 0x64

    invoke-virtual {p0, v0}, Ln9h;->c(I)V

    :cond_23
    return-void
.end method
