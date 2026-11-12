.class public final La3p;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# static fields
.field public static final h0:Ljava/util/Map;


# instance fields
.field public A:I

.field public final B:Landroid/graphics/Rect;

.field public final C:Landroid/graphics/Rect;

.field public final D:Lfr;

.field public final E:Lfr;

.field public volatile F:Landroid/net/Uri;

.field public G:Z

.field public H:Z

.field public I:Z

.field public J:Z

.field public K:Z

.field public L:Z

.field public M:Z

.field public N:Landroid/view/View;

.field public O:Ljava/lang/Integer;

.field public P:Z

.field public Q:Z

.field public R:Z

.field public S:Ljava/lang/Integer;

.field public T:Ljava/lang/Boolean;

.field public U:Ljava/lang/Boolean;

.field public V:Ljava/lang/Boolean;

.field public final W:I

.field public final a:Ljava/io/File;

.field public a0:Z

.field public final b:Lsm;

.field public b0:Ljava/lang/String;

.field public final c:Lbpo;

.field public c0:Ljava/lang/String;

.field public final d:Lm1p;

.field public d0:Z

.field public final e:I

.field public final e0:Lkgo;

.field public final f:I

.field public volatile f0:J

.field public final g:Lp7p;

.field public final g0:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public final h:Z

.field public final i:Lkotlin/jvm/functions/Function0;

.field public j:Lbxk;

.field public final k:Z

.field public final l:Ljava/lang/String;

.field public final m:Lzyk;

.field public final n:Ljava/util/concurrent/ConcurrentHashMap$KeySetView;

.field public o:Lj2p;

.field public p:Lj2p;

.field public q:Lj2p;

.field public r:Landroid/widget/RelativeLayout;

.field public s:Landroid/widget/ImageButton;

.field public final t:Landroid/app/Activity;

.field public final u:Landroid/view/GestureDetector;

.field public v:Ln2p;

.field public w:Z

.field public x:Z

.field public final y:Lca2;

.field public final z:Ldvj;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lkotlin/Pair;

    const-string v1, "Cache-Control"

    const-string v2, "no-cache, no-store, must-revalidate"

    invoke-direct {v0, v1, v2}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v1, Lkotlin/Pair;

    const-string v2, "Pragma"

    const-string v3, "no-cache"

    invoke-direct {v1, v2, v3}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    filled-new-array {v0, v1}, [Lkotlin/Pair;

    move-result-object v0

    invoke-static {v0}, Lrbd;->c([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, La3p;->h0:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/io/File;Lsm;Lbpo;Lm1p;IILp7p;ZLkotlin/jvm/functions/Function0;Lbxk;I)V
    .registers 15

    and-int/lit8 v0, p12, 0x20

    const/4 v1, -0x1

    if-eqz v0, :cond_6

    move p6, v1

    :cond_6
    and-int/lit8 v0, p12, 0x40

    if-eqz v0, :cond_b

    move p7, v1

    :cond_b
    and-int/lit16 p12, p12, 0x400

    const/4 v0, 0x0

    if-eqz p12, :cond_11

    move-object p11, v0

    :cond_11
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, La3p;->a:Ljava/io/File;

    iput-object p3, p0, La3p;->b:Lsm;

    iput-object p4, p0, La3p;->c:Lbpo;

    iput-object p5, p0, La3p;->d:Lm1p;

    iput p6, p0, La3p;->e:I

    iput p7, p0, La3p;->f:I

    iput-object p8, p0, La3p;->g:Lp7p;

    iput-boolean p9, p0, La3p;->h:Z

    iput-object p10, p0, La3p;->i:Lkotlin/jvm/functions/Function0;

    iput-object p11, p0, La3p;->j:Lbxk;

    invoke-virtual {p3}, Lsm;->d()Z

    move-result p3

    iput-boolean p3, p0, La3p;->k:Z

    sget-object p3, Lr8p;->a:Ljava/util/List;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p3

    const-string p4, "com.opera.ads.demo"

    invoke-static {p3, p4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p3

    const/4 p4, 0x0

    const/16 p5, 0x2d

    if-eqz p3, :cond_75

    sget-object p3, Lr8p;->a:Ljava/util/List;

    sget-object p6, Lynh;->e:Ljava/lang/String;

    invoke-interface {p3, p6}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_75

    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p2

    sget-object p3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-static {p2, p3}, Lkotlin/text/StringsKt;->U(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    sget-char p3, Ljava/io/File;->separatorChar:C

    invoke-static {p3, p2, p2}, Lkotlin/text/StringsKt;->f0(CLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p3

    if-lez p3, :cond_75

    move p3, p4

    :goto_60
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p6

    if-ge p3, p6, :cond_76

    invoke-virtual {p2, p3}, Ljava/lang/String;->charAt(I)C

    move-result p6

    invoke-static {p6}, Ljava/lang/Character;->isLetterOrDigit(C)Z

    move-result p7

    if-nez p7, :cond_72

    if-ne p6, p5, :cond_75

    :cond_72
    add-int/lit8 p3, p3, 0x1

    goto :goto_60

    :cond_75
    move-object p2, v0

    :cond_76
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object p3

    invoke-virtual {p3}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object p3

    if-eqz p2, :cond_98

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p6

    if-eqz p6, :cond_98

    new-instance p6, Ljava/lang/StringBuilder;

    invoke-direct {p6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p6, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p6, p5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    :cond_98
    iput-object p3, p0, La3p;->l:Ljava/lang/String;

    new-instance p2, Lm53;

    const/16 p3, 0x1d

    invoke-direct {p2, p0, p1, p3}, Lm53;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p2}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p2

    iput-object p2, p0, La3p;->m:Lzyk;

    invoke-static {}, Ljava/util/concurrent/ConcurrentHashMap;->newKeySet()Ljava/util/concurrent/ConcurrentHashMap$KeySetView;

    move-result-object p2

    iput-object p2, p0, La3p;->n:Ljava/util/concurrent/ConcurrentHashMap$KeySetView;

    :goto_ad
    instance-of p2, p1, Landroid/content/ContextWrapper;

    if-eqz p2, :cond_c0

    instance-of p2, p1, Landroid/app/Activity;

    if-eqz p2, :cond_b9

    move-object v0, p1

    check-cast v0, Landroid/app/Activity;

    goto :goto_c0

    :cond_b9
    check-cast p1, Landroid/content/ContextWrapper;

    invoke-virtual {p1}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object p1

    goto :goto_ad

    :cond_c0
    :goto_c0
    iput-object v0, p0, La3p;->t:Landroid/app/Activity;

    sget-object p1, Ln2p;->b:Ln2p;

    iput-object p1, p0, La3p;->v:Ln2p;

    new-instance p1, Lca2;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    const/4 p2, 0x1

    iput-boolean p2, p1, Lca2;->a:Z

    const/4 p3, 0x2

    iput-byte p3, p1, Lca2;->b:B

    iput-object p1, p0, La3p;->y:Lca2;

    new-instance p1, Ldvj;

    const/16 p5, 0xd

    invoke-direct {p1, p5}, Ldvj;-><init>(B)V

    iput-object p1, p0, La3p;->z:Ldvj;

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, La3p;->B:Landroid/graphics/Rect;

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, La3p;->C:Landroid/graphics/Rect;

    new-instance p1, Lfr;

    const/16 p5, 0x1c

    invoke-direct {p1, p5, p4}, Lfr;-><init>(BZ)V

    iput-object p1, p0, La3p;->D:Lfr;

    new-instance p1, Lfr;

    invoke-direct {p1, p5, p4}, Lfr;-><init>(BZ)V

    iput-object p1, p0, La3p;->E:Lfr;

    const-string p1, ""

    iput-object p1, p0, La3p;->b0:Ljava/lang/String;

    new-instance p1, Lkgo;

    invoke-direct {p1, p0, p2}, Lkgo;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, La3p;->e0:Lkgo;

    const-wide/16 p1, -0x1

    iput-wide p1, p0, La3p;->f0:J

    new-instance p1, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {p1, p4}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object p1, p0, La3p;->g0:Ljava/util/concurrent/atomic/AtomicBoolean;

    if-eqz v0, :cond_116

    invoke-virtual {v0}, Landroid/app/Activity;->getRequestedOrientation()I

    move-result v1

    :cond_116
    iput v1, p0, La3p;->W:I

    sget-object p1, Lito;->a:[Lito;

    new-instance p1, Landroid/view/GestureDetector;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    new-instance p4, Lmz4;

    invoke-direct {p4, p3}, Lmz4;-><init>(B)V

    invoke-direct {p1, p2, p4}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object p1, p0, La3p;->u:Landroid/view/GestureDetector;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p0, p1}, La3p;->c(Landroid/content/Context;)Lj2p;

    move-result-object p1

    iput-object p1, p0, La3p;->o:Lj2p;

    iput-object p1, p0, La3p;->q:Lj2p;

    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 5

    iget-object p0, p0, La3p;->s:Landroid/widget/ImageButton;

    if-eqz p0, :cond_35

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lbcp;->c:Lbcp;

    invoke-virtual {v1, v0}, Lbcp;->d(Landroid/content/Context;)Landroid/graphics/drawable/BitmapDrawable;

    move-result-object v1

    sget-object v2, Lbcp;->d:Lbcp;

    invoke-virtual {v2, v0}, Lbcp;->d(Landroid/content/Context;)Landroid/graphics/drawable/BitmapDrawable;

    move-result-object v0

    new-instance v2, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    const v3, -0x10100a7

    filled-new-array {v3}, [I

    move-result-object v3

    invoke-virtual {v2, v3, v1}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    const v1, 0x10100a7

    filled-new-array {v1}, [I

    move-result-object v1

    invoke-virtual {v2, v1, v0}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    sget-object v0, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    :cond_35
    return-void
.end method

.method public final b()V
    .registers 6

    iget-boolean v0, p0, La3p;->I:Z

    if-eqz v0, :cond_55

    iget-boolean v0, p0, La3p;->G:Z

    if-eqz v0, :cond_55

    iget-boolean v0, p0, La3p;->a0:Z

    if-nez v0, :cond_55

    iget-object v0, p0, La3p;->c0:Ljava/lang/String;

    if-eqz v0, :cond_55

    invoke-static {v0}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_18

    move-object v0, v2

    :cond_18
    if-eqz v0, :cond_55

    const/4 v1, 0x1

    iput-boolean v1, p0, La3p;->a0:Z

    iget-object v1, p0, La3p;->g:Lp7p;

    if-eqz v1, :cond_3f

    iget-object v3, v1, Lp7p;->a:Lvoo;

    instance-of v4, v3, Lylp;

    if-eqz v4, :cond_2a

    move-object v2, v3

    check-cast v2, Lylp;

    :cond_2a
    if-eqz v2, :cond_3b

    iget-object v2, v2, Lylp;->D:Lzyk;

    invoke-virtual {v2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    iget-object v3, v1, Lp7p;->b:Ljava/util/LinkedHashSet;

    const-string v4, "on_adm_injected"

    invoke-static {v4, v2, v3}, Lp7p;->c(Ljava/lang/String;Ljava/util/List;Ljava/util/LinkedHashSet;)V

    :cond_3b
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lp7p;->a(I)V

    :cond_3f
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "window.operaBridge.notifyReadyEvent("

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v0, 0x29

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, La3p;->g(Ljava/lang/String;)V

    :cond_55
    return-void
.end method

.method public final c(Landroid/content/Context;)Lj2p;
    .registers 6

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    iget v1, v1, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v1, v1, 0x2

    const/4 v2, 0x1

    if-nez v1, :cond_27

    sget-object v1, Lr8p;->a:Ljava/util/List;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.opera.ads.demo"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2a

    sget-object v0, Lr8p;->a:Ljava/util/List;

    sget-object v1, Lynh;->e:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2a

    :cond_27
    invoke-static {v2}, Landroid/webkit/WebView;->setWebContentsDebuggingEnabled(Z)V

    :cond_2a
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    :try_start_2e
    sget-object v0, Lt0i;->b:Lp0i;

    new-instance v0, Lj2p;

    invoke-direct {v0, p0, p1}, Lj2p;-><init>(La3p;Landroid/content/Context;)V
    :try_end_35
    .catchall {:try_start_2e .. :try_end_35} :catchall_36

    goto :goto_3f

    :catchall_36
    move-exception v0

    sget-object v1, Lt0i;->b:Lp0i;

    new-instance v1, Lq0i;

    invoke-direct {v1, v0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object v0, v1

    :goto_3f
    invoke-static {v0}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_7a

    :try_start_45
    instance-of v0, v1, Ljava/lang/RuntimeException;

    if-eqz v0, :cond_71

    move-object v0, v1

    check-cast v0, Ljava/lang/RuntimeException;

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_71

    const-string v3, "theme="

    invoke-static {v0, v3, v2}, Lkotlin/text/StringsKt;->E(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Z

    move-result v3

    if-nez v3, :cond_62

    const-string v3, "Can\'t convert value"

    invoke-static {v0, v3, v2}, Lkotlin/text/StringsKt;->E(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Z

    move-result v0

    if-eqz v0, :cond_71

    :cond_62
    new-instance v0, Landroid/view/ContextThemeWrapper;

    const v1, 0x1030237

    invoke-direct {v0, p1, v1}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    new-instance p1, Lj2p;

    invoke-direct {p1, p0, v0}, Lj2p;-><init>(La3p;Landroid/content/Context;)V

    move-object v0, p1

    goto :goto_7a

    :cond_71
    throw v1
    :try_end_72
    .catchall {:try_start_45 .. :try_end_72} :catchall_72

    :catchall_72
    move-exception p1

    sget-object v0, Lt0i;->b:Lp0i;

    new-instance v0, Lq0i;

    invoke-direct {v0, p1}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    :cond_7a
    :goto_7a
    invoke-static {v0}, Lybh;->y(Ljava/lang/Object;)V

    check-cast v0, Lj2p;

    new-instance p1, Landroid/widget/RelativeLayout$LayoutParams;

    iget v1, p0, La3p;->e:I

    iget v3, p0, La3p;->f:I

    invoke-direct {p1, v1, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    new-instance p1, Lmyo;

    invoke-direct {p1, p0, v2}, Lmyo;-><init>(Landroid/view/ViewGroup;B)V

    invoke-virtual {v0, p1}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    new-instance p1, Lc5d;

    const/4 v1, 0x4

    invoke-direct {p1, p0, v1}, Lc5d;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, p1}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    new-instance p0, Lk2p;

    invoke-direct {p0}, Landroid/webkit/WebViewRenderProcessClient;-><init>()V

    invoke-virtual {v0, p0}, Landroid/webkit/WebView;->setWebViewRenderProcessClient(Landroid/webkit/WebViewRenderProcessClient;)V

    return-object v0
.end method

.method public final d(Ljava/lang/String;Lnt5;)Ljava/io/Serializable;
    .registers 8

    instance-of v0, p2, Lq2p;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lq2p;

    iget v1, v0, Lq2p;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lq2p;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lq2p;

    invoke-direct {v0, p0, p2}, Lq2p;-><init>(La3p;Lnt5;)V

    :goto_18
    iget-object p0, v0, Lq2p;->t:Ljava/lang/Object;

    sget-object p2, Lpx5;->a:Lpx5;

    iget v1, v0, Lq2p;->v:I

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_2e

    if-ne v1, v3, :cond_28

    :try_start_24
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_27
    .catchall {:try_start_24 .. :try_end_27} :catchall_4c

    goto :goto_47

    :cond_28
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v2

    :cond_2e
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    :try_start_31
    sget-object p0, Lt0i;->b:Lp0i;

    sget-object p0, Lbb7;->a:Lcv6;

    sget-object p0, Lmr6;->b:Lmr6;

    new-instance v1, Lhmo;

    const/16 v4, 0x8

    invoke-direct {v1, v4, v2, p1}, Lhmo;-><init>(BLmt5;Ljava/lang/Object;)V

    iput v3, v0, Lq2p;->v:I

    invoke-static {p0, v1, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, p2, :cond_47

    return-object p2

    :cond_47
    :goto_47
    check-cast p0, Ljava/lang/String;

    sget-object p1, Lt0i;->b:Lp0i;
    :try_end_4b
    .catchall {:try_start_31 .. :try_end_4b} :catchall_4c

    goto :goto_55

    :catchall_4c
    move-exception p0

    sget-object p1, Lt0i;->b:Lp0i;

    new-instance p1, Lq0i;

    invoke-direct {p1, p0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object p0, p1

    :goto_55
    instance-of p1, p0, Lq0i;

    if-nez p1, :cond_5a

    move-object v2, p0

    :cond_5a
    return-object v2
.end method

.method public final e(Landroid/net/Uri;)Ljava/lang/String;
    .registers 4

    invoke-virtual {p1}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v0

    const-string v1, "appassets.androidplatform.net"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_29

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, La3p;->l:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 p0, 0x2f

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lkotlin/text/StringsKt;->T(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_29
    const/4 p0, 0x0

    return-object p0
.end method

.method public final f(Lj2p;)V
    .registers 10

    iget-object v0, p0, La3p;->t:Landroid/app/Activity;

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x1

    iget-boolean v4, p0, La3p;->k:Z

    if-nez v4, :cond_120

    sget-object v5, Ln2p;->d:Ln2p;

    iput-object v5, p0, La3p;->v:Ln2p;

    sget-object v5, Lito;->a:[Lito;

    if-eqz v0, :cond_120

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v5

    iget v5, v5, Landroid/view/WindowManager$LayoutParams;->flags:I

    and-int/lit16 v6, v5, 0x400

    if-eqz v6, :cond_21

    move v6, v3

    goto :goto_22

    :cond_21
    move v6, v2

    :goto_22
    iput-boolean v6, p0, La3p;->Q:Z

    and-int/lit16 v5, v5, 0x800

    if-eqz v5, :cond_2a

    move v5, v3

    goto :goto_2b

    :cond_2a
    move v5, v2

    :goto_2b
    iput-boolean v5, p0, La3p;->R:Z

    invoke-virtual {v0}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v5

    if-eqz v5, :cond_3f

    invoke-virtual {v5}, Landroid/app/ActionBar;->isShowing()Z

    move-result v6

    iput-boolean v6, p0, La3p;->P:Z

    invoke-virtual {v5}, Landroid/app/ActionBar;->hide()V

    sget-object v5, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_40

    :cond_3f
    move-object v5, v1

    :goto_40
    if-nez v5, :cond_81

    :try_start_42
    sget-object v5, Lt0i;->b:Lp0i;

    const v5, 0x1020016

    invoke-virtual {v0, v5}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_52

    invoke-virtual {v5}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v5

    goto :goto_53

    :cond_52
    move-object v5, v1

    :goto_53
    instance-of v6, v5, Landroid/view/View;

    if-eqz v6, :cond_5a

    check-cast v5, Landroid/view/View;
    :try_end_59
    .catchall {:try_start_42 .. :try_end_59} :catchall_5c

    goto :goto_65

    :cond_5a
    move-object v5, v1

    goto :goto_65

    :catchall_5c
    move-exception v5

    sget-object v6, Lt0i;->b:Lp0i;

    new-instance v6, Lq0i;

    invoke-direct {v6, v5}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object v5, v6

    :goto_65
    instance-of v6, v5, Lq0i;

    if-eqz v6, :cond_6a

    move-object v5, v1

    :cond_6a
    check-cast v5, Landroid/view/View;

    if-eqz v5, :cond_7e

    invoke-virtual {v5}, Landroid/view/View;->getVisibility()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    iput-object v6, p0, La3p;->O:Ljava/lang/Integer;

    const/16 v6, 0x8

    invoke-virtual {v5, v6}, Landroid/view/View;->setVisibility(I)V

    goto :goto_7f

    :cond_7e
    move-object v5, v1

    :goto_7f
    iput-object v5, p0, La3p;->N:Landroid/view/View;

    :cond_81
    sget-object v5, Lito;->a:[Lito;

    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x1e

    if-lt v5, v6, :cond_fc

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v6

    invoke-virtual {v6}, Landroid/view/View;->getRootWindowInsets()Landroid/view/WindowInsets;

    move-result-object v6

    if-eqz v6, :cond_a4

    invoke-static {}, Landroid/view/WindowInsets$Type;->statusBars()I

    move-result v7

    invoke-virtual {v6, v7}, Landroid/view/WindowInsets;->isVisible(I)Z

    move-result v7

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    goto :goto_a5

    :cond_a4
    move-object v7, v1

    :goto_a5
    iput-object v7, p0, La3p;->T:Ljava/lang/Boolean;

    if-eqz v6, :cond_b6

    invoke-static {}, Landroid/view/WindowInsets$Type;->navigationBars()I

    move-result v7

    invoke-virtual {v6, v7}, Landroid/view/WindowInsets;->isVisible(I)Z

    move-result v6

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    goto :goto_b7

    :cond_b6
    move-object v6, v1

    :goto_b7
    iput-object v6, p0, La3p;->U:Ljava/lang/Boolean;

    :try_start_b9
    sget-object v6, Lt0i;->b:Lp0i;

    const-class v6, Landroid/view/Window;

    const-string v7, "getDecorFitsSystemWindows"

    invoke-virtual {v6, v7, v1}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    invoke-virtual {v6, v5, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    instance-of v7, v6, Ljava/lang/Boolean;

    if-eqz v7, :cond_d1

    check-cast v6, Ljava/lang/Boolean;
    :try_end_d0
    .catchall {:try_start_b9 .. :try_end_d0} :catchall_d3

    goto :goto_dc

    :cond_d1
    move-object v6, v1

    goto :goto_dc

    :catchall_d3
    move-exception v6

    sget-object v7, Lt0i;->b:Lp0i;

    new-instance v7, Lq0i;

    invoke-direct {v7, v6}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object v6, v7

    :goto_dc
    instance-of v7, v6, Lq0i;

    if-eqz v7, :cond_e1

    move-object v6, v1

    :cond_e1
    check-cast v6, Ljava/lang/Boolean;

    iput-object v6, p0, La3p;->V:Ljava/lang/Boolean;

    sget-object v6, Lito;->a:[Lito;

    invoke-virtual {v5, v2}, Landroid/view/Window;->setDecorFitsSystemWindows(Z)V

    invoke-virtual {v5}, Landroid/view/Window;->getInsetsController()Landroid/view/WindowInsetsController;

    move-result-object v5

    if-eqz v5, :cond_10e

    invoke-static {}, Landroid/view/WindowInsets$Type;->systemBars()I

    move-result v6

    invoke-interface {v5, v6}, Landroid/view/WindowInsetsController;->hide(I)V

    const/4 v6, 0x2

    invoke-interface {v5, v6}, Landroid/view/WindowInsetsController;->setSystemBarsBehavior(I)V

    goto :goto_10e

    :cond_fc
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/View;->getSystemUiVisibility()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    iput-object v5, p0, La3p;->S:Ljava/lang/Integer;

    :cond_10e
    :goto_10e
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v5

    const/16 v6, 0x1706

    invoke-virtual {v5, v6}, Landroid/view/View;->setSystemUiVisibility(I)V

    iget-boolean v5, p0, La3p;->Q:Z

    xor-int/2addr v5, v3

    iput-boolean v5, p0, La3p;->J:Z

    :cond_120
    invoke-virtual {p1}, Landroid/view/View;->hasFocus()Z

    move-result v5

    if-nez v5, :cond_12f

    invoke-virtual {p1, v3}, Landroid/view/View;->setFocusable(Z)V

    invoke-virtual {p1, v3}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    :cond_12f
    new-instance v5, Landroid/widget/RelativeLayout;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-direct {v5, v6}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    const/4 v6, -0x1

    invoke-virtual {v5, p1, v6, v6}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    iput-object v5, p0, La3p;->r:Landroid/widget/RelativeLayout;

    if-nez v4, :cond_195

    new-instance p1, Landroid/widget/ImageButton;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-direct {p1, v7}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    invoke-virtual {p1, v2}, Landroid/view/View;->setBackgroundColor(I)V

    new-instance v2, Lcno;

    const/16 v7, 0x9

    invoke-direct {v2, p0, v7}, Lcno;-><init>(Ljava/lang/Object;B)V

    new-instance v7, Loep;

    invoke-direct {v7, v2}, Loep;-><init>(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {p1, v7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object p1, p0, La3p;->s:Landroid/widget/ImageButton;

    if-nez v4, :cond_16c

    iget-object p1, p0, La3p;->v:Ln2p;

    sget-object v2, Ln2p;->d:Ln2p;

    if-ne p1, v2, :cond_16c

    iget-boolean p1, p0, La3p;->x:Z

    if-nez p1, :cond_16c

    invoke-virtual {p0}, La3p;->a()V

    :cond_16c
    iget-object p1, p0, La3p;->s:Landroid/widget/ImageButton;

    invoke-virtual {v5, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const/high16 v2, 0x42480000    # 50.0f

    invoke-static {p1, v2}, Lnxg;->d(Landroid/content/Context;F)I

    move-result p1

    new-instance v2, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v2, p1, p1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    iget-object p1, p0, La3p;->r:Landroid/widget/RelativeLayout;

    if-ne v5, p1, :cond_18e

    const/16 p1, 0xa

    invoke-virtual {v2, p1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    const/16 p1, 0xb

    invoke-virtual {v2, p1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    :cond_18e
    iget-object p1, p0, La3p;->s:Landroid/widget/ImageButton;

    if-eqz p1, :cond_195

    invoke-virtual {p1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_195
    invoke-static {v0, p0}, Laoh;->c(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;

    move-result-object p1

    instance-of v0, p1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_1a0

    move-object v1, p1

    check-cast v1, Landroid/view/ViewGroup;

    :cond_1a0
    if-eqz v1, :cond_1ac

    iget-object p1, p0, La3p;->r:Landroid/widget/RelativeLayout;

    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v0, v6, v6}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v1, p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_1ac
    iput-boolean v3, p0, La3p;->K:Z

    if-eqz v4, :cond_1c7

    iput-boolean v3, p0, La3p;->H:Z

    sget-object p1, Ln2p;->c:Ln2p;

    iput-object p1, p0, La3p;->v:Ln2p;

    invoke-virtual {p0}, La3p;->r()V

    sget-object p1, Lito;->a:[Lito;

    const-string p1, "mraid.fireReadyEvent();"

    invoke-virtual {p0, p1}, La3p;->g(Ljava/lang/String;)V

    iget-boolean p1, p0, La3p;->w:Z

    if-eqz p1, :cond_1c7

    invoke-virtual {p0}, La3p;->s()V

    :cond_1c7
    return-void
.end method

.method public final g(Ljava/lang/String;)V
    .registers 4

    iget-object p0, p0, La3p;->q:Lj2p;

    if-eqz p0, :cond_15

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_15

    sget-object v0, Lito;->a:[Lito;

    new-instance v0, Lz4d;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lz4d;-><init>(B)V

    invoke-virtual {p0, p1, v0}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    :cond_15
    return-void
.end method

.method public final h(Ljava/lang/String;Ljava/util/Map;)V
    .registers 7

    const-string v0, "endCard"

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_c

    iput-boolean v1, p0, La3p;->d0:Z

    goto :goto_14

    :cond_c
    const-string v0, "endCardClick"

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d6

    :goto_14
    iget-object v0, p0, La3p;->j:Lbxk;

    if-eqz v0, :cond_9c

    iget-object v0, v0, Lbxk;->b:Ljava/lang/Object;

    check-cast v0, Lo7p;

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v2

    sparse-switch v2, :sswitch_data_d8

    goto/16 :goto_9c

    :sswitch_25
    const-string v1, "start"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9c

    new-instance v1, Lbw1;

    const/16 v2, 0xe

    invoke-direct {v1, v0, v2}, Lbw1;-><init>(Ljava/lang/Object;B)V

    invoke-static {v1}, Lpfp;->a(Ljava/lang/Runnable;)V

    goto :goto_9c

    :sswitch_38
    const-string v1, "pause"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9c

    new-instance v1, Lbw1;

    const/16 v2, 0xc

    invoke-direct {v1, v0, v2}, Lbw1;-><init>(Ljava/lang/Object;B)V

    invoke-static {v1}, Lpfp;->a(Ljava/lang/Runnable;)V

    goto :goto_9c

    :sswitch_4b
    const-string v2, "muted"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5c

    goto :goto_9c

    :sswitch_54
    const-string v2, "mute"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9c

    :cond_5c
    new-instance v2, Lbw1;

    invoke-direct {v2, v0, v1}, Lbw1;-><init>(Lo7p;Z)V

    invoke-static {v2}, Lpfp;->a(Ljava/lang/Runnable;)V

    goto :goto_9c

    :sswitch_65
    const-string v1, "complete"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9c

    new-instance v1, Lbw1;

    const/16 v2, 0xa

    invoke-direct {v1, v0, v2}, Lbw1;-><init>(Ljava/lang/Object;B)V

    invoke-static {v1}, Lpfp;->a(Ljava/lang/Runnable;)V

    goto :goto_9c

    :sswitch_78
    const-string v1, "unmute"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9c

    new-instance v1, Lbw1;

    const/4 v2, 0x0

    invoke-direct {v1, v0, v2}, Lbw1;-><init>(Lo7p;Z)V

    invoke-static {v1}, Lpfp;->a(Ljava/lang/Runnable;)V

    goto :goto_9c

    :sswitch_8a
    const-string v1, "resume"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9c

    new-instance v1, Lbw1;

    const/16 v2, 0xd

    invoke-direct {v1, v0, v2}, Lbw1;-><init>(Ljava/lang/Object;B)V

    invoke-static {v1}, Lpfp;->a(Ljava/lang/Runnable;)V

    :cond_9c
    :goto_9c
    iget-object p0, p0, La3p;->g:Lp7p;

    if-eqz p0, :cond_d6

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_ad
    :goto_ad
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_d3

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const-string v3, "evt"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_ad

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_ad

    :cond_d3
    invoke-virtual {p0, p1, v0}, Lp7p;->d(Ljava/lang/String;Ljava/util/Map;)V

    :cond_d6
    return-void

    nop

    :sswitch_data_d8
    .sparse-switch
        -0x37b237d3 -> :sswitch_8a
        -0x321793ce -> :sswitch_78
        -0x23bacec7 -> :sswitch_65
        0x335219 -> :sswitch_54
        0x636f16b -> :sswitch_4b
        0x65825f6 -> :sswitch_38
        0x68ac462 -> :sswitch_25
    .end sparse-switch
.end method

.method public final i(Z)V
    .registers 10

    const/4 v0, 0x2

    new-array v0, v0, [I

    if-eqz p1, :cond_a

    iget-object v1, p0, La3p;->q:Lj2p;

    if-nez v1, :cond_b

    goto :goto_56

    :cond_a
    move-object v1, p0

    :cond_b
    invoke-virtual {v1, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    const/4 v2, 0x0

    aget v2, v0, v2

    const/4 v3, 0x1

    aget v0, v0, v3

    sget-object v3, Lito;->a:[Lito;

    iget v3, p0, La3p;->A:I

    sub-int/2addr v0, v3

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v3

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v1

    iget-object v4, p0, La3p;->C:Landroid/graphics/Rect;

    iget-object v5, p0, La3p;->B:Landroid/graphics/Rect;

    if-eqz p1, :cond_29

    move-object v6, v5

    goto :goto_2a

    :cond_29
    move-object v6, v4

    :goto_2a
    iget v7, v6, Landroid/graphics/Rect;->left:I

    if-ne v2, v7, :cond_3e

    iget v7, v6, Landroid/graphics/Rect;->top:I

    if-ne v0, v7, :cond_3e

    invoke-virtual {v6}, Landroid/graphics/Rect;->width()I

    move-result v7

    if-ne v3, v7, :cond_3e

    invoke-virtual {v6}, Landroid/graphics/Rect;->height()I

    move-result v6

    if-eq v1, v6, :cond_56

    :cond_3e
    add-int/2addr v3, v2

    add-int/2addr v1, v0

    if-eqz p1, :cond_46

    invoke-virtual {v5, v2, v0, v3, v1}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_49

    :cond_46
    invoke-virtual {v4, v2, v0, v3, v1}, Landroid/graphics/Rect;->set(IIII)V

    :goto_49
    iget-boolean v0, p0, La3p;->G:Z

    if-eqz v0, :cond_56

    if-eqz p1, :cond_53

    invoke-virtual {p0}, La3p;->v()V

    return-void

    :cond_53
    invoke-virtual {p0}, La3p;->w()V

    :cond_56
    :goto_56
    return-void
.end method

.method public final j(I)I
    .registers 2

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p1}, Lnxg;->f(Landroid/content/Context;I)I

    move-result p0

    return p0
.end method

.method public final k(Landroid/net/Uri;)V
    .registers 11

    invoke-static {p1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    sget-object v0, Lito;->a:[Lito;

    sget-object v0, Lgko;->c:Ltmj;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    invoke-virtual {p1}, Landroid/net/Uri;->isHierarchical()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_22

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    const-string v2, "mraid"

    invoke-virtual {v2, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_22

    move-object v0, p1

    goto :goto_23

    :cond_22
    move-object v0, v1

    :goto_23
    if-nez v0, :cond_28

    :goto_25
    move-object v0, v1

    goto/16 :goto_9b

    :cond_28
    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_97

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-gtz v3, :cond_35

    move-object v2, v1

    :cond_35
    if-eqz v2, :cond_97

    sget-object v3, Lgko;->t:Lh58;

    invoke-static {v3, v3}, Lsko;->e(Lh58;Lh58;)Lw4;

    move-result-object v3

    :cond_3d
    invoke-virtual {v3}, Lw4;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_53

    invoke-virtual {v3}, Lw4;->next()Ljava/lang/Object;

    move-result-object v4

    move-object v5, v4

    check-cast v5, Lgko;

    iget-object v5, v5, Lgko;->a:Ljava/lang/String;

    invoke-static {v5, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3d

    goto :goto_54

    :cond_53
    move-object v4, v1

    :goto_54
    check-cast v4, Lgko;

    if-eqz v4, :cond_97

    new-instance v2, Ljava/util/LinkedHashMap;

    invoke-direct {v2}, Ljava/util/LinkedHashMap;-><init>()V

    invoke-virtual {v0}, Landroid/net/Uri;->getQueryParameterNames()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :catch_65
    :goto_65
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_7d

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    :try_start_71
    invoke-virtual {v0, v5}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-nez v6, :cond_79

    const-string v6, ""

    :cond_79
    invoke-interface {v2, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_7c
    .catch Ljava/lang/Exception; {:try_start_71 .. :try_end_7c} :catch_65

    goto :goto_65

    :cond_7d
    iget-object v0, v4, Lgko;->b:Ljava/util/Set;

    if-eqz v0, :cond_91

    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3, v0}, Ljava/util/Set;->containsAll(Ljava/util/Collection;)Z

    move-result v0

    if-nez v0, :cond_91

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    :goto_8e
    sget-object v0, Lito;->a:[Lito;

    goto :goto_25

    :cond_91
    new-instance v0, Lkotlin/Pair;

    invoke-direct {v0, v4, v2}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_9b

    :cond_97
    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    goto :goto_8e

    :goto_9b
    if-nez v0, :cond_ac

    iget-object p0, p0, La3p;->g:Lp7p;

    if-eqz p0, :cond_2e9

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    const/16 v0, 0x238e

    invoke-virtual {p0, v0, p1}, Lp7p;->g(ILjava/lang/String;)V

    goto/16 :goto_2e9

    :cond_ac
    iget-object p1, v0, Lkotlin/Pair;->a:Ljava/lang/Object;

    check-cast p1, Lgko;

    iget-object v0, v0, Lkotlin/Pair;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/Map;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v2, Liho;->a:[I

    iget-object v3, p0, La3p;->b:Lsm;

    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    move-result v4

    aget v2, v2, v4

    const/4 v4, 0x1

    packed-switch v2, :pswitch_data_2ea

    invoke-static {}, Lh9o;->p()V

    return-void

    :pswitch_c9
    move v2, v4

    goto :goto_d1

    :pswitch_cb
    sget-object v2, Lgko;->d:Ljava/util/EnumSet;

    invoke-virtual {v2, p1}, Ljava/util/AbstractCollection;->contains(Ljava/lang/Object;)Z

    move-result v2

    :goto_d1
    if-nez v2, :cond_d9

    invoke-static {v3}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    sget-object p0, Lito;->a:[Lito;

    return-void

    :cond_d9
    sget-object v2, Lo2p;->a:[I

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    aget p1, v2, p1

    const/4 v2, -0x1

    const/4 v5, 0x2

    iget-object v6, p0, La3p;->c:Lbpo;

    const/4 v7, 0x0

    const-string v8, "url"

    packed-switch p1, :pswitch_data_2fa

    :pswitch_eb
    goto/16 :goto_2e9

    :pswitch_ed
    sget-object p1, Lsm;->f:Lsm;

    if-eq v3, p1, :cond_f5

    sget-object p1, Lsm;->g:Lsm;

    if-ne v3, p1, :cond_2e9

    :cond_f5
    invoke-interface {v6}, Lbpo;->b()V

    const-string p1, "rewardGranted"

    invoke-virtual {p0, p1, v0}, La3p;->h(Ljava/lang/String;Ljava/util/Map;)V

    goto/16 :goto_2e9

    :pswitch_ff
    const-string p1, "evt"

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-eqz p1, :cond_2e9

    invoke-virtual {p0, p1, v0}, La3p;->h(Ljava/lang/String;Ljava/util/Map;)V

    goto/16 :goto_2e9

    :pswitch_10e
    invoke-interface {v0, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    sget-object v0, Lito;->a:[Lito;

    if-eqz p1, :cond_2e9

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_2e9

    invoke-static {p1}, Landroid/webkit/URLUtil;->isNetworkUrl(Ljava/lang/String;)Z

    sget-object v0, Lblp;->a:Ljava/util/Set;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-static {p0, p1}, Lblp;->c(Landroid/content/Context;Landroid/net/Uri;)Z

    goto/16 :goto_2e9

    :pswitch_130
    sget-object p0, Lito;->a:[Lito;

    invoke-interface {v6}, Lbpo;->a()V

    goto/16 :goto_2e9

    :pswitch_137
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object p0, p0, La3p;->b0:Ljava/lang/String;

    sget-object v0, Ljko;->a:Ljava/util/TreeSet;

    invoke-static {p0}, Lkotlin/text/StringsKt;->l0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_14e

    move-object v1, p0

    :cond_14e
    if-eqz v1, :cond_2e9

    invoke-static {p1, v7}, Ljko;->a(Landroid/content/Context;Z)V

    sget-object p0, Ljko;->a:Ljava/util/TreeSet;

    new-instance v0, Lqgo;

    invoke-direct {v0, v1, v7}, Lqgo;-><init>(Ljava/lang/String;B)V

    invoke-static {p0, v0, v4}, Lo95;->u(Ljava/lang/Iterable;Lkotlin/jvm/functions/Function1;Z)Z

    :goto_15d
    invoke-virtual {p0}, Ljava/util/TreeSet;->size()I

    move-result v0

    invoke-static {}, Laap;->f()Lz8p;

    move-result-object v2

    iget v2, v2, Lz8p;->E:I

    if-lt v0, v2, :cond_171

    invoke-virtual {p0}, Ljava/util/TreeSet;->first()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/util/TreeSet;->remove(Ljava/lang/Object;)Z

    goto :goto_15d

    :cond_171
    new-instance v0, Ltxo;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-direct {v0, v1, v2, v3}, Ltxo;-><init>(Ljava/lang/String;J)V

    invoke-virtual {p0, v0}, Ljava/util/TreeSet;->add(Ljava/lang/Object;)Z

    invoke-static {p1}, Ljko;->b(Landroid/content/Context;)V

    goto/16 :goto_2e9

    :pswitch_182
    const-string p1, "useCustomClose"

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    sget-object v0, Lito;->a:[Lito;

    invoke-static {p1}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result p1

    iget-boolean v0, p0, La3p;->x:Z

    if-eq v0, p1, :cond_2e9

    iput-boolean p1, p0, La3p;->x:Z

    if-eqz p1, :cond_1a4

    iget-object p0, p0, La3p;->s:Landroid/widget/ImageButton;

    if-eqz p0, :cond_2e9

    const p1, 0x106000d

    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_2e9

    :cond_1a4
    invoke-virtual {p0}, La3p;->a()V

    goto/16 :goto_2e9

    :pswitch_1a9
    const-string p1, "width"

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-eqz p1, :cond_1b6

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    :cond_1b6
    iget-object p0, p0, La3p;->z:Ldvj;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string p0, "height"

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    if-eqz p0, :cond_1c8

    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    :cond_1c8
    const-string p0, "offsetX"

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    if-eqz p0, :cond_1d5

    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    :cond_1d5
    const-string p0, "offsetY"

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    if-eqz p0, :cond_1e2

    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    :cond_1e2
    const-string p0, "customClosePosition"

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    if-eqz p0, :cond_23f

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p1

    sparse-switch p1, :sswitch_data_31c

    goto :goto_237

    :sswitch_1f4
    const-string p1, "top-center"

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_237

    const/4 v4, 0x6

    goto :goto_23a

    :sswitch_1fe
    const-string p1, "bottom-center"

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_237

    const/4 v4, 0x5

    goto :goto_23a

    :sswitch_208
    const-string p1, "bottom-right"

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_237

    const/4 v4, 0x4

    goto :goto_23a

    :sswitch_212
    const-string p1, "bottom-left"

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_237

    const/4 v4, 0x3

    goto :goto_23a

    :sswitch_21c
    const-string p1, "top-left"

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_237

    move v4, v5

    goto :goto_23a

    :sswitch_226
    const-string p1, "top-right"

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_23a

    goto :goto_237

    :sswitch_22f
    const-string p1, "center"

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_239

    :cond_237
    :goto_237
    move v4, v2

    goto :goto_23a

    :cond_239
    move v4, v7

    :cond_23a
    :goto_23a
    packed-switch v4, :pswitch_data_33a

    sget-object p0, Lito;->a:[Lito;

    :cond_23f
    :pswitch_23f
    const-string p0, "allowOffscreen"

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    sget-object p0, Lito;->a:[Lito;

    goto/16 :goto_2e9

    :pswitch_24b
    const-string p1, "allowOrientationChange"

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result p1

    const-string v1, "forceOrientation"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    sget-object v1, Lito;->a:[Lito;

    if-eqz v0, :cond_291

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v1

    sparse-switch v1, :sswitch_data_34c

    goto :goto_287

    :sswitch_26b
    const-string v1, "landscape"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_287

    move v0, v5

    goto :goto_28a

    :sswitch_275
    const-string v1, "portrait"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_287

    move v0, v4

    goto :goto_28a

    :sswitch_27f
    const-string v1, "none"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_289

    :cond_287
    :goto_287
    move v0, v2

    goto :goto_28a

    :cond_289
    move v0, v7

    :goto_28a
    packed-switch v0, :pswitch_data_35a

    goto :goto_291

    :pswitch_28e
    move v5, v4

    goto :goto_291

    :pswitch_290
    move v5, v7

    :cond_291
    :goto_291
    :pswitch_291
    iget-object v0, p0, La3p;->y:Lca2;

    iget-boolean v1, v0, Lca2;->a:Z

    if-ne v1, p1, :cond_29b

    iget-byte v1, v0, Lca2;->b:B

    if-eq v1, v5, :cond_2e9

    :cond_29b
    iput-boolean p1, v0, Lca2;->a:Z

    iput-byte v5, v0, Lca2;->b:B

    iget-boolean p1, p0, La3p;->k:Z

    if-nez p1, :cond_2a9

    iget-object p1, p0, La3p;->v:Ln2p;

    sget-object v1, Ln2p;->d:Ln2p;

    if-ne p1, v1, :cond_2e9

    :cond_2a9
    iget-object p1, p0, La3p;->t:Landroid/app/Activity;

    if-eqz p1, :cond_2e9

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p0

    iget p0, p0, Landroid/content/res/Configuration;->orientation:I

    if-ne p0, v4, :cond_2bb

    move p0, v4

    goto :goto_2bc

    :cond_2bb
    move p0, v7

    :goto_2bc
    iget-byte v1, v0, Lca2;->b:B

    if-eqz v1, :cond_2cb

    if-eq v1, v4, :cond_2ca

    iget-boolean v0, v0, Lca2;->a:Z

    if-eqz v0, :cond_2c8

    move v4, v2

    goto :goto_2cb

    :cond_2c8
    if-nez p0, :cond_2cb

    :cond_2ca
    move v4, v7

    :cond_2cb
    :goto_2cb
    invoke-virtual {p1, v4}, Landroid/app/Activity;->setRequestedOrientation(I)V

    goto :goto_2e9

    :pswitch_2cf
    sget-object p0, Lito;->a:[Lito;

    goto :goto_2e9

    :pswitch_2d2
    invoke-interface {v0, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, La3p;->n(Ljava/lang/String;)V

    goto :goto_2e9

    :pswitch_2dc
    invoke-interface {v0, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, La3p;->l(Ljava/lang/String;)V

    goto :goto_2e9

    :pswitch_2e6
    invoke-virtual {p0}, La3p;->t()V

    :cond_2e9
    :goto_2e9
    return-void

    :pswitch_data_2ea
    .packed-switch 0x1
        :pswitch_cb
        :pswitch_c9
        :pswitch_c9
        :pswitch_c9
        :pswitch_c9
        :pswitch_c9
    .end packed-switch

    :pswitch_data_2fa
    .packed-switch 0x1
        :pswitch_2e6
        :pswitch_eb
        :pswitch_2dc
        :pswitch_2d2
        :pswitch_eb
        :pswitch_2cf
        :pswitch_24b
        :pswitch_1a9
        :pswitch_eb
        :pswitch_182
        :pswitch_137
        :pswitch_130
        :pswitch_10e
        :pswitch_ff
        :pswitch_ed
    .end packed-switch

    :sswitch_data_31c
    .sparse-switch
        -0x514d33ab -> :sswitch_22f
        -0x4e5f7c5c -> :sswitch_226
        -0x3c587281 -> :sswitch_21c
        -0x27103597 -> :sswitch_212
        0x455fe3fa -> :sswitch_208
        0x4ccee637 -> :sswitch_1fe
        0x68a23bcd -> :sswitch_1f4
    .end sparse-switch

    :pswitch_data_33a
    .packed-switch 0x0
        :pswitch_23f
        :pswitch_23f
        :pswitch_23f
        :pswitch_23f
        :pswitch_23f
        :pswitch_23f
        :pswitch_23f
    .end packed-switch

    :sswitch_data_34c
    .sparse-switch
        0x33af38 -> :sswitch_27f
        0x2b77bb9b -> :sswitch_275
        0x5545f2bb -> :sswitch_26b
    .end sparse-switch

    :pswitch_data_35a
    .packed-switch 0x0
        :pswitch_291
        :pswitch_290
        :pswitch_28e
    .end packed-switch
.end method

.method public final l(Ljava/lang/String;)V
    .registers 6

    sget-object v0, Lito;->a:[Lito;

    iget-boolean v0, p0, La3p;->k:Z

    if-nez v0, :cond_10

    iget-object v1, p0, La3p;->v:Ln2p;

    sget-object v2, Ln2p;->c:Ln2p;

    if-eq v1, v2, :cond_10

    sget-object v2, Ln2p;->e:Ln2p;

    if-ne v1, v2, :cond_48

    :cond_10
    if-eqz v0, :cond_18

    iget-object v1, p0, La3p;->v:Ln2p;

    sget-object v2, Ln2p;->b:Ln2p;

    if-ne v1, v2, :cond_48

    :cond_18
    const/4 v1, 0x0

    if-eqz p1, :cond_2f

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_2f

    sget-object v0, Lw2p;->a:La64;

    new-instance v2, Lsto;

    const/16 v3, 0xe

    invoke-direct {v2, p0, p1, v1, v3}, Lsto;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    const/4 p0, 0x3

    invoke-static {v0, v1, v1, v2, p0}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    return-void

    :cond_2f
    iget-object p1, p0, La3p;->o:Lj2p;

    if-eqz p1, :cond_48

    if-nez v0, :cond_42

    iget-object v0, p0, La3p;->v:Ln2p;

    sget-object v2, Ln2p;->c:Ln2p;

    if-eq v0, v2, :cond_42

    sget-object v2, Ln2p;->e:Ln2p;

    if-ne v0, v2, :cond_45

    iput-object v1, p0, La3p;->s:Landroid/widget/ImageButton;

    goto :goto_45

    :cond_42
    invoke-static {p1}, Lxgh;->g(Landroid/view/View;)V

    :cond_45
    :goto_45
    invoke-virtual {p0, p1}, La3p;->f(Lj2p;)V

    :cond_48
    return-void
.end method

.method public final m()V
    .registers 5

    iget-object v0, p0, La3p;->t:Landroid/app/Activity;

    if-eqz v0, :cond_49

    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    sget-object v2, Lito;->a:[Lito;

    const v2, 0x1020002

    invoke-virtual {v0, v2}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v0

    iput v0, p0, La3p;->A:I

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v0

    iget-object v1, p0, La3p;->E:Lfr;

    iget v1, v1, Lfr;->c:I

    iget v2, p0, La3p;->A:I

    sub-int/2addr v1, v2

    iget-object v2, p0, La3p;->D:Lfr;

    iget v3, v2, Lfr;->b:I

    if-ne v0, v3, :cond_3e

    iget v3, v2, Lfr;->c:I

    if-eq v1, v3, :cond_49

    :cond_3e
    iput v0, v2, Lfr;->b:I

    iput v1, v2, Lfr;->c:I

    iget-boolean v0, p0, La3p;->G:Z

    if-eqz v0, :cond_49

    invoke-virtual {p0}, La3p;->x()V

    :cond_49
    return-void
.end method

.method public final n(Ljava/lang/String;)V
    .registers 7

    sget-object v0, Lito;->a:[Lito;

    iget-object v0, p0, La3p;->g0:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    if-eqz p1, :cond_f

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    goto :goto_10

    :cond_f
    const/4 v0, 0x0

    :goto_10
    iget-object v2, p0, La3p;->g:Lp7p;

    if-eqz v0, :cond_36

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/webkit/URLUtil;->isNetworkUrl(Ljava/lang/String;)Z

    move-result v3

    if-ne v3, v1, :cond_36

    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v3

    const-string v4, "appassets.androidplatform.net"

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_36

    if-eqz v2, :cond_74

    invoke-virtual {p0, v0}, La3p;->e(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p0

    const/16 p1, 0x2391

    invoke-virtual {v2, p1, p0}, Lp7p;->g(ILjava/lang/String;)V

    return-void

    :cond_36
    if-eqz p1, :cond_41

    const-string v0, "about:blank"

    const/4 v3, 0x0

    invoke-static {p1, v0, v3}, Lkotlin/text/c;->q(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-eq v0, v1, :cond_74

    :cond_41
    iget-object v0, p0, La3p;->c:Lbpo;

    invoke-interface {v0, p1}, Lbpo;->a(Ljava/lang/String;)V

    const-string p1, "window.operaBridge.notifyOnClicked()"

    invoke-virtual {p0, p1}, La3p;->g(Ljava/lang/String;)V

    iget-boolean p1, p0, La3p;->d0:Z

    if-eqz p1, :cond_58

    if-eqz v2, :cond_58

    sget-object p1, Ln08;->a:Ln08;

    const-string v0, "endCardClick"

    invoke-virtual {v2, v0, p1}, Lp7p;->d(Ljava/lang/String;Ljava/util/Map;)V

    :cond_58
    iget-object p1, p0, La3p;->q:Lj2p;

    if-eqz p1, :cond_63

    iget-object p1, p1, Lj2p;->b:Ljkp;

    if-eqz p1, :cond_63

    invoke-virtual {p1}, Ljkp;->a()V

    :cond_63
    iget-object p1, p0, La3p;->v:Ln2p;

    sget-object v0, Ln2p;->d:Ln2p;

    if-ne p1, v0, :cond_6d

    invoke-virtual {p0}, La3p;->p()V

    return-void

    :cond_6d
    sget-object v0, Ln2p;->e:Ln2p;

    if-ne p1, v0, :cond_74

    invoke-virtual {p0}, La3p;->q()V

    :cond_74
    return-void
.end method

.method public final o()V
    .registers 5

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    sget-object v0, Lito;->a:[Lito;

    sget-object v0, Lfap;->a:Lzyk;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lfap;->c(Landroid/content/Context;)Landroid/util/Size;

    move-result-object v0

    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    move-result v1

    invoke-virtual {v0}, Landroid/util/Size;->getHeight()I

    move-result v0

    iget-object v2, p0, La3p;->E:Lfr;

    iget v3, v2, Lfr;->b:I

    if-ne v1, v3, :cond_28

    iget v3, v2, Lfr;->c:I

    if-eq v0, v3, :cond_33

    :cond_28
    iput v1, v2, Lfr;->b:I

    iput v0, v2, Lfr;->c:I

    iget-boolean v0, p0, La3p;->G:Z

    if-eqz v0, :cond_33

    invoke-virtual {p0}, La3p;->y()V

    :cond_33
    return-void
.end method

.method public final onAttachedToWindow()V
    .registers 2

    sget-object v0, Lito;->a:[Lito;

    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    return-void
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 2

    invoke-super {p0, p1}, Landroid/view/View;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget p0, p1, Landroid/content/res/Configuration;->orientation:I

    sget-object p0, Lito;->a:[Lito;

    return-void
.end method

.method public final onDetachedFromWindow()V
    .registers 2

    sget-object v0, Lito;->a:[Lito;

    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    return-void
.end method

.method public final onLayout(ZIIII)V
    .registers 6

    invoke-super/range {p0 .. p5}, Landroid/widget/RelativeLayout;->onLayout(ZIIII)V

    iget-object p2, p0, La3p;->v:Ln2p;

    sget-object p3, Ln2p;->f:Ln2p;

    iget-boolean p4, p0, La3p;->k:Z

    if-ne p2, p3, :cond_10

    if-eqz p4, :cond_10

    sget-object p0, Lito;->a:[Lito;

    return-void

    :cond_10
    invoke-static {p2}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    sget-object p2, Lito;->a:[Lito;

    iget-boolean p2, p0, La3p;->J:Z

    if-nez p2, :cond_72

    iget-object p2, p0, La3p;->v:Ln2p;

    sget-object p3, Ln2p;->d:Ln2p;

    if-eq p2, p3, :cond_23

    sget-object p3, Ln2p;->e:Ln2p;

    if-ne p2, p3, :cond_29

    :cond_23
    invoke-virtual {p0}, La3p;->o()V

    invoke-virtual {p0}, La3p;->m()V

    :cond_29
    iget-boolean p2, p0, La3p;->M:Z

    const/4 p3, 0x0

    if-eqz p2, :cond_3b

    iput-boolean p3, p0, La3p;->M:Z

    iget-object p2, p0, La3p;->B:Landroid/graphics/Rect;

    iget-object p3, p0, La3p;->C:Landroid/graphics/Rect;

    invoke-virtual {p2, p3}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    invoke-virtual {p0}, La3p;->v()V

    goto :goto_3e

    :cond_3b
    invoke-virtual {p0, p3}, La3p;->i(Z)V

    :goto_3e
    iget-object p2, p0, La3p;->v:Ln2p;

    sget-object p3, Ln2p;->e:Ln2p;

    if-ne p2, p3, :cond_50

    if-eqz p1, :cond_50

    new-instance p1, Lbw1;

    const/16 p2, 0x9

    invoke-direct {p1, p0, p2}, Lbw1;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lpfp;->a(Ljava/lang/Runnable;)V

    :cond_50
    const/4 p1, 0x1

    iput-boolean p1, p0, La3p;->H:Z

    iget-object p1, p0, La3p;->v:Ln2p;

    sget-object p2, Ln2p;->b:Ln2p;

    if-ne p1, p2, :cond_72

    iget-boolean p1, p0, La3p;->G:Z

    if-eqz p1, :cond_72

    if-nez p4, :cond_72

    sget-object p1, Ln2p;->c:Ln2p;

    iput-object p1, p0, La3p;->v:Ln2p;

    invoke-virtual {p0}, La3p;->r()V

    const-string p1, "mraid.fireReadyEvent();"

    invoke-virtual {p0, p1}, La3p;->g(Ljava/lang/String;)V

    iget-boolean p1, p0, La3p;->w:Z

    if-eqz p1, :cond_72

    invoke-virtual {p0}, La3p;->s()V

    :cond_72
    return-void
.end method

.method public final onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 3

    iget-object v0, p0, La3p;->u:Landroid/view/GestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_18

    invoke-static {p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object p1

    const/4 v0, 0x3

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->setAction(I)V

    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    invoke-virtual {p1}, Landroid/view/MotionEvent;->recycle()V

    const/4 p0, 0x1

    return p0

    :cond_18
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public final onVisibilityChanged(Landroid/view/View;I)V
    .registers 4

    invoke-super {p0, p1, p2}, Landroid/view/View;->onVisibilityChanged(Landroid/view/View;I)V

    sget-object p1, Lito;->a:[Lito;

    iget-object p1, p0, La3p;->q:Lj2p;

    if-eqz p1, :cond_f

    iget-boolean p1, p1, Lf2p;->a:Z

    const/4 v0, 0x1

    if-ne p1, v0, :cond_f

    return-void

    :cond_f
    invoke-virtual {p0, p2}, La3p;->u(I)V

    return-void
.end method

.method public final onWindowVisibilityChanged(I)V
    .registers 4

    invoke-super {p0, p1}, Landroid/view/View;->onWindowVisibilityChanged(I)V

    sget-object v0, Lito;->a:[Lito;

    iget-object v0, p0, La3p;->q:Lj2p;

    if-eqz v0, :cond_f

    iget-boolean v0, v0, Lf2p;->a:Z

    const/4 v1, 0x1

    if-ne v0, v1, :cond_f

    return-void

    :cond_f
    invoke-virtual {p0, p1}, La3p;->u(I)V

    return-void
.end method

.method public final p()V
    .registers 10

    iget-object v0, p0, La3p;->v:Ln2p;

    sget-object v1, Ln2p;->c:Ln2p;

    iget-boolean v2, p0, La3p;->k:Z

    if-ne v0, v1, :cond_f

    if-eqz v2, :cond_f

    sget-object v0, Ln2p;->f:Ln2p;

    iput-object v0, p0, La3p;->v:Ln2p;

    goto :goto_19

    :cond_f
    sget-object v3, Ln2p;->d:Ln2p;

    if-eq v0, v3, :cond_17

    sget-object v3, Ln2p;->e:Ln2p;

    if-ne v0, v3, :cond_19

    :cond_17
    iput-object v1, p0, La3p;->v:Ln2p;

    :cond_19
    :goto_19
    const/4 v0, 0x1

    iput-boolean v0, p0, La3p;->M:Z

    const/4 v1, 0x0

    if-nez v2, :cond_117

    const/4 v2, 0x0

    iget-object v3, p0, La3p;->t:Landroid/app/Activity;

    if-eqz v3, :cond_d8

    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x1e

    if-lt v4, v5, :cond_78

    invoke-virtual {v3}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v4

    iget-object v5, p0, La3p;->V:Ljava/lang/Boolean;

    if-eqz v5, :cond_39

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    invoke-virtual {v4, v5}, Landroid/view/Window;->setDecorFitsSystemWindows(Z)V

    :cond_39
    invoke-virtual {v4}, Landroid/view/Window;->getInsetsController()Landroid/view/WindowInsetsController;

    move-result-object v4

    if-eqz v4, :cond_a9

    invoke-static {}, Landroid/view/WindowInsets$Type;->statusBars()I

    move-result v5

    iget-object v6, p0, La3p;->T:Ljava/lang/Boolean;

    sget-object v7, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-static {v6, v7}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_51

    invoke-interface {v4, v5}, Landroid/view/WindowInsetsController;->show(I)V

    goto :goto_5c

    :cond_51
    sget-object v8, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-static {v6, v8}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5c

    invoke-interface {v4, v5}, Landroid/view/WindowInsetsController;->hide(I)V

    :cond_5c
    :goto_5c
    invoke-static {}, Landroid/view/WindowInsets$Type;->navigationBars()I

    move-result v5

    iget-object v6, p0, La3p;->U:Ljava/lang/Boolean;

    invoke-static {v6, v7}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_6c

    invoke-interface {v4, v5}, Landroid/view/WindowInsetsController;->show(I)V

    goto :goto_a9

    :cond_6c
    sget-object v7, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-static {v6, v7}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_a9

    invoke-interface {v4, v5}, Landroid/view/WindowInsetsController;->hide(I)V

    goto :goto_a9

    :cond_78
    invoke-virtual {v3}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v4

    iget-object v5, p0, La3p;->S:Ljava/lang/Integer;

    if-eqz v5, :cond_8b

    invoke-virtual {v5}, Ljava/lang/Number;->intValue()I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/view/View;->setSystemUiVisibility(I)V

    :cond_8b
    invoke-virtual {v3}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v4

    iget-boolean v5, p0, La3p;->Q:Z

    const/16 v6, 0x400

    if-eqz v5, :cond_99

    invoke-virtual {v4, v6}, Landroid/view/Window;->addFlags(I)V

    goto :goto_9c

    :cond_99
    invoke-virtual {v4, v6}, Landroid/view/Window;->clearFlags(I)V

    :goto_9c
    iget-boolean v5, p0, La3p;->R:Z

    const/16 v6, 0x800

    if-eqz v5, :cond_a6

    invoke-virtual {v4, v6}, Landroid/view/Window;->addFlags(I)V

    goto :goto_a9

    :cond_a6
    invoke-virtual {v4, v6}, Landroid/view/Window;->clearFlags(I)V

    :cond_a9
    :goto_a9
    iget-boolean v4, p0, La3p;->P:Z

    if-eqz v4, :cond_b7

    invoke-virtual {v3}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v3

    if-eqz v3, :cond_c6

    invoke-virtual {v3}, Landroid/app/ActionBar;->show()V

    goto :goto_c6

    :cond_b7
    iget-object v3, p0, La3p;->O:Ljava/lang/Integer;

    if-eqz v3, :cond_c6

    invoke-virtual {v3}, Ljava/lang/Number;->intValue()I

    move-result v3

    iget-object v4, p0, La3p;->N:Landroid/view/View;

    if-eqz v4, :cond_c6

    invoke-virtual {v4, v3}, Landroid/view/View;->setVisibility(I)V

    :cond_c6
    :goto_c6
    iput-boolean v1, p0, La3p;->Q:Z

    iput-boolean v1, p0, La3p;->J:Z

    iput-object v2, p0, La3p;->N:Landroid/view/View;

    iput-object v2, p0, La3p;->O:Ljava/lang/Integer;

    iput-boolean v1, p0, La3p;->P:Z

    iput-object v2, p0, La3p;->S:Ljava/lang/Integer;

    iput-object v2, p0, La3p;->T:Ljava/lang/Boolean;

    iput-object v2, p0, La3p;->U:Ljava/lang/Boolean;

    iput-object v2, p0, La3p;->V:Ljava/lang/Boolean;

    :cond_d8
    iget-object v3, p0, La3p;->r:Landroid/widget/RelativeLayout;

    if-eqz v3, :cond_e2

    invoke-virtual {v3}, Landroid/view/ViewGroup;->removeAllViews()V

    invoke-static {v3}, Lxgh;->g(Landroid/view/View;)V

    :cond_e2
    iput-object v2, p0, La3p;->r:Landroid/widget/RelativeLayout;

    iput-object v2, p0, La3p;->s:Landroid/widget/ImageButton;

    iget-object v3, p0, La3p;->p:Lj2p;

    if-nez v3, :cond_fb

    iget-object v0, p0, La3p;->o:Lj2p;

    if-eqz v0, :cond_117

    new-instance v2, Landroid/view/ViewGroup$LayoutParams;

    iget v3, p0, La3p;->e:I

    iget v4, p0, La3p;->f:I

    invoke-direct {v2, v3, v4}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_117

    :cond_fb
    invoke-virtual {v3}, Lf2p;->destroy()V

    iput-object v2, p0, La3p;->p:Lj2p;

    iget-object v2, p0, La3p;->o:Lj2p;

    if-eqz v2, :cond_117

    new-instance v3, Lmyo;

    invoke-direct {v3, p0, v0}, Lmyo;-><init>(Landroid/view/ViewGroup;B)V

    invoke-virtual {v2, v3}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    new-instance v0, Lc5d;

    const/4 v3, 0x4

    invoke-direct {v0, p0, v3}, Lc5d;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v2, v0}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    iput-object v2, p0, La3p;->q:Lj2p;

    :cond_117
    :goto_117
    new-instance v0, Lp2p;

    invoke-direct {v0, p0, v1}, Lp2p;-><init>(La3p;B)V

    invoke-static {v0}, Lpfp;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final q()V
    .registers 6

    sget-object v0, Ln2p;->c:Ln2p;

    iput-object v0, p0, La3p;->v:Ln2p;

    const/4 v0, 0x1

    iput-boolean v0, p0, La3p;->M:Z

    const/4 v1, 0x0

    iput-object v1, p0, La3p;->s:Landroid/widget/ImageButton;

    iget-object v1, p0, La3p;->o:Lj2p;

    if-eqz v1, :cond_1a

    new-instance v2, Landroid/view/ViewGroup$LayoutParams;

    iget v3, p0, La3p;->e:I

    iget v4, p0, La3p;->f:I

    invoke-direct {v2, v3, v4}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_1a
    new-instance v1, Lp2p;

    invoke-direct {v1, p0, v0}, Lp2p;-><init>(La3p;B)V

    invoke-static {v1}, Lpfp;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final r()V
    .registers 3

    sget-object v0, Lito;->a:[Lito;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "mraid.fireStateChangeEvent(\'"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, La3p;->v:Ln2p;

    iget-object v1, v1, Ln2p;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\');"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, La3p;->g(Ljava/lang/String;)V

    return-void
.end method

.method public final s()V
    .registers 3

    sget-object v0, Lito;->a:[Lito;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "mraid.fireViewableChangeEvent("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v1, p0, La3p;->w:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ");"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, La3p;->g(Ljava/lang/String;)V

    return-void
.end method

.method public final t()V
    .registers 3

    sget-object v0, Lito;->a:[Lito;

    iget-object v0, p0, La3p;->v:Ln2p;

    sget-object v1, Lo2p;->b:[I

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    aget v0, v1, v0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_25

    const/4 v1, 0x3

    if-eq v0, v1, :cond_25

    const/4 v1, 0x4

    if-eq v0, v1, :cond_16

    return-void

    :cond_16
    iget-object v0, p0, La3p;->q:Lj2p;

    if-eqz v0, :cond_21

    iget-object v0, v0, Lj2p;->b:Ljkp;

    if-eqz v0, :cond_21

    invoke-virtual {v0}, Ljkp;->a()V

    :cond_21
    invoke-virtual {p0}, La3p;->q()V

    return-void

    :cond_25
    iget-object v0, p0, La3p;->q:Lj2p;

    if-eqz v0, :cond_30

    iget-object v0, v0, Lj2p;->b:Ljkp;

    if-eqz v0, :cond_30

    invoke-virtual {v0}, Ljkp;->a()V

    :cond_30
    invoke-virtual {p0}, La3p;->p()V

    iget-object p0, p0, La3p;->c:Lbpo;

    invoke-interface {p0}, Lbpo;->c()V

    return-void
.end method

.method public final u(I)V
    .registers 3

    if-nez p1, :cond_4

    const/4 p1, 0x1

    goto :goto_5

    :cond_4
    const/4 p1, 0x0

    :goto_5
    iget-boolean v0, p0, La3p;->w:Z

    if-eq p1, v0, :cond_16

    iput-boolean p1, p0, La3p;->w:Z

    iget-boolean p1, p0, La3p;->G:Z

    if-eqz p1, :cond_16

    iget-boolean p1, p0, La3p;->H:Z

    if-eqz p1, :cond_16

    invoke-virtual {p0}, La3p;->s()V

    :cond_16
    return-void
.end method

.method public final v()V
    .registers 7

    iget-object v0, p0, La3p;->B:Landroid/graphics/Rect;

    iget v1, v0, Landroid/graphics/Rect;->left:I

    iget v2, v0, Landroid/graphics/Rect;->top:I

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v3

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    sget-object v4, Lito;->a:[Lito;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "mraid.setCurrentPosition("

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1}, La3p;->j(I)I

    move-result v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v1, 0x2c

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v2}, La3p;->j(I)I

    move-result v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v3}, La3p;->j(I)I

    move-result v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v0}, La3p;->j(I)I

    move-result v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ");"

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, La3p;->g(Ljava/lang/String;)V

    return-void
.end method

.method public final w()V
    .registers 7

    iget-object v0, p0, La3p;->C:Landroid/graphics/Rect;

    iget v1, v0, Landroid/graphics/Rect;->left:I

    iget v2, v0, Landroid/graphics/Rect;->top:I

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v3

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    sget-object v4, Lito;->a:[Lito;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "mraid.setDefaultPosition("

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1}, La3p;->j(I)I

    move-result v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v1, 0x2c

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v2}, La3p;->j(I)I

    move-result v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v3}, La3p;->j(I)I

    move-result v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v0}, La3p;->j(I)I

    move-result v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ");"

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, La3p;->g(Ljava/lang/String;)V

    return-void
.end method

.method public final x()V
    .registers 5

    iget-object v0, p0, La3p;->D:Lfr;

    iget v1, v0, Lfr;->b:I

    iget v0, v0, Lfr;->c:I

    sget-object v2, Lito;->a:[Lito;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "mraid.setMaxSize("

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1}, La3p;->j(I)I

    move-result v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v1, 0x2c

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v0}, La3p;->j(I)I

    move-result v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ");"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, La3p;->g(Ljava/lang/String;)V

    return-void
.end method

.method public final y()V
    .registers 5

    iget-object v0, p0, La3p;->E:Lfr;

    iget v1, v0, Lfr;->b:I

    iget v0, v0, Lfr;->c:I

    sget-object v2, Lito;->a:[Lito;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "mraid.setScreenSize("

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1}, La3p;->j(I)I

    move-result v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v1, 0x2c

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v0}, La3p;->j(I)I

    move-result v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ");"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, La3p;->g(Ljava/lang/String;)V

    return-void
.end method
