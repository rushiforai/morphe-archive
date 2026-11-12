.class public final synthetic Lwa;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/chromium/base/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lwa;->a:B

    iput-object p1, p0, Lwa;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onResult(Ljava/lang/Object;)V
    .registers 8

    iget-byte v0, p0, Lwa;->a:B

    const/4 v1, 0x0

    const-wide/16 v2, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x1

    iget-object p0, p0, Lwa;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_232

    check-cast p0, Lcom/opera/android/browser/b;

    check-cast p1, Ljava/lang/Integer;

    iget-boolean p1, p0, Lcom/opera/android/browser/b;->d:Z

    if-nez p1, :cond_1b

    iput-boolean v5, p0, Lcom/opera/android/browser/b;->d:Z

    iget-object p0, p0, Lcom/opera/android/browser/b;->b:Lzun;

    invoke-interface {p0, v1}, Lzun;->f(Z)V

    :cond_1b
    return-void

    :pswitch_1c
    check-cast p0, Lnml;

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void

    :pswitch_24
    check-cast p0, Lxnj;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, v4}, Lxnj;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_2c
    check-cast p0, Lorg/chromium/content/browser/input/SelectPopup;

    check-cast p1, [I

    invoke-virtual {p0, p1}, Lorg/chromium/content/browser/input/SelectPopup;->b([I)V

    return-void

    :pswitch_34
    check-cast p0, Ljava/util/function/Consumer;

    check-cast p1, Landroid/graphics/Rect;

    invoke-interface {p0, p1}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    return-void

    :pswitch_3c
    check-cast p0, Lz1h;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lz1h;->b(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_44
    check-cast p0, Lvve;

    check-cast p1, Landroid/app/Activity;

    invoke-virtual {p0}, Lvve;->o()V

    iput-object p1, p0, Lvve;->f:Landroid/app/Activity;

    invoke-virtual {p0}, Lvve;->q()V

    return-void

    :pswitch_51
    check-cast p0, Lorg/chromium/components/messages/MessageWrapper;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iget-wide v0, p0, Lorg/chromium/components/messages/MessageWrapper;->a:J

    cmp-long p0, v0, v2

    if-eqz p0, :cond_62

    invoke-static {v0, v1, p1}, LJ/N;->M6PkOWjr(JI)V

    :cond_62
    return-void

    :pswitch_63
    check-cast p0, Lorg/chromium/media/MediaDrmBridge;

    check-cast p1, Ljava/lang/Boolean;

    sget-object v0, Lorg/chromium/media/MediaDrmBridge;->n:Ljava/util/UUID;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-nez p1, :cond_73

    invoke-virtual {p0}, Lorg/chromium/media/MediaDrmBridge;->l()V

    goto :goto_76

    :cond_73
    invoke-virtual {p0}, Lorg/chromium/media/MediaDrmBridge;->b()Z

    :goto_76
    return-void

    :pswitch_77
    check-cast p0, Lg1d;

    check-cast p1, Landroid/graphics/Bitmap;

    iput-object p1, p0, Lg1d;->d:Landroid/graphics/Bitmap;

    if-eqz p1, :cond_82

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getAllocationByteCount()I

    :cond_82
    const/4 p1, 0x3

    invoke-virtual {p0, p1}, Lg1d;->b(I)V

    return-void

    :pswitch_87
    check-cast p0, Lvzk;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, p0, Lvzk;->b:Ljava/lang/Object;

    check-cast p0, Lwa;

    invoke-virtual {p0, p1}, Lwa;->onResult(Ljava/lang/Object;)V

    return-void

    :pswitch_96
    check-cast p0, Lorg/chromium/content_public/browser/NavigationHandle;

    check-cast p1, Ljava/lang/Boolean;

    sget-object v0, Lorg/chromium/components/navigation_interception/InterceptNavigationDelegate;->a:Ljava/util/HashMap;

    iget-object p0, p0, Lorg/chromium/content_public/browser/NavigationHandle;->x:Lorg/chromium/content_public/browser/WebContents;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-static {p0, p1}, LJ/N;->MyCmcUgV(Ljava/lang/Object;Z)V

    return-void

    :pswitch_a6
    check-cast p0, Lota;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-virtual {p0, p1}, Lota;->c(Z)V

    return-void

    :pswitch_b2
    check-cast p0, Lorg/chromium/components/embedder_support/delegate/HtmlColorPickerBridge;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iget-wide v0, p0, Lorg/chromium/components/embedder_support/delegate/HtmlColorPickerBridge;->a:J

    cmp-long p0, v0, v2

    if-eqz p0, :cond_c3

    invoke-static {v0, v1, p1}, LJ/N;->MQeIvBzp(JI)V

    :cond_c3
    return-void

    :pswitch_c4
    check-cast p0, Lcom/opera/android/history/e;

    check-cast p1, [Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;

    iget-object v0, p0, Lcom/opera/android/history/e;->j:Lesi;

    if-eqz v0, :cond_d1

    iget-object p0, p0, Lcom/opera/android/history/e;->f:Lode;

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    :cond_d1
    return-void

    :pswitch_d2
    check-cast p0, Lgv3;

    check-cast p1, Ljava/lang/String;

    const-string v0, "true"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_fb

    iget-object p0, p0, Lgv3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->J0()Lysj;

    move-result-object p0

    new-instance p1, Lglj;

    new-instance v0, Lrxh;

    const v1, 0x7f140803

    invoke-direct {v0, v1}, Lrxh;-><init>(I)V

    const/16 v1, 0x9c4

    invoke-direct {p1, v0, v1}, Lglj;-><init>(Lpxh;I)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lijm;->b:Lijm;

    invoke-virtual {p0, p1, v0}, Lr22;->b(Ljjm;Lijm;)V

    :cond_fb
    return-void

    :pswitch_fc
    check-cast p0, Ltm8;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    if-eq p1, v5, :cond_111

    iget-object p0, p0, Ltm8;->u:Ld23;

    if-eqz p0, :cond_111

    invoke-static {}, Lsm8;->c()Lsm8;

    move-result-object p1

    invoke-virtual {p0, p1}, Ld23;->onResult(Ljava/lang/Object;)V

    :cond_111
    return-void

    :pswitch_112
    check-cast p0, Lqp7;

    const v0, 0x7f0a0bcb

    check-cast p1, Liyh;

    invoke-virtual {p0, v0, p1}, Lczh;->b(ILiyh;)V

    return-void

    :pswitch_11d
    check-cast p0, Lg55;

    check-cast p1, Landroid/net/Uri;

    invoke-virtual {p0, p1}, Lg55;->e(Landroid/net/Uri;)V

    return-void

    :pswitch_125
    check-cast p0, Lnz4;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iget-object v0, p0, Lnz4;->i:Luz4;

    if-eqz v0, :cond_135

    invoke-virtual {v0, p1}, Luz4;->b(Z)V

    goto :goto_15e

    :cond_135
    if-eqz p1, :cond_15e

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    iget-object v0, p0, Lnz4;->f:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object v0, v0, Lcom/opera/android/browser/chromium/ChromiumContent;->J:Lxr5;

    const v1, 0x7f0d0412

    invoke-virtual {p1, v1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    const v0, 0x7f0a0b88

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/opera/android/widget/ThumbScroller;

    new-instance v0, Luz4;

    iget-object v1, p0, Lnz4;->f:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object v2, p0, Lnz4;->c:Lysl;

    invoke-direct {v0, p1, v1, v2}, Luz4;-><init>(Lcom/opera/android/widget/ThumbScroller;Lcom/opera/android/browser/chromium/ChromiumContent;Lysl;)V

    iput-object v0, p0, Lnz4;->i:Luz4;

    :cond_15e
    :goto_15e
    return-void

    :pswitch_15f
    check-cast p0, Laz3;

    check-cast p1, Ldtl;

    invoke-virtual {p0, p1}, Laz3;->M(Ldtl;)V

    return-void

    :pswitch_167
    check-cast p0, Lcom/opera/android/BrowserActivity;

    check-cast p1, Ldtl;

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object p0, p0, Lt5d;->v:Lb7f;

    invoke-virtual {p0, p1}, Lb7f;->d(Ljava/lang/Object;)V

    return-void

    :pswitch_173
    check-cast p0, Lng3;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    if-nez p1, :cond_187

    iget-object v0, p0, Lng3;->d:Lzg;

    iget-object v1, p0, Lng3;->a:Lvzk;

    iget-object v1, v1, Lvzk;->c:Ljava/lang/Object;

    check-cast v1, Landroid/util/Size;

    iput-object v1, v0, Lzg;->d:Ljava/lang/Object;

    :cond_187
    iget-object p0, p0, Lng3;->c:Lga6;

    iget-object p0, p0, Lga6;->b:Ljava/lang/Object;

    check-cast p0, Lr72;

    const/16 v0, 0xd

    if-eq p1, v0, :cond_1cd

    const/16 v0, 0xe

    if-eq p1, v0, :cond_1cd

    if-nez p1, :cond_1c8

    const/4 p1, 0x4

    invoke-virtual {p0, p1}, Lr72;->e(I)V

    iget-object p1, p0, Lr72;->c:Ljava/lang/Object;

    check-cast p1, Lng3;

    iget-object p1, p1, Lng3;->a:Lvzk;

    if-nez p1, :cond_1a5

    move-object v0, v4

    goto :goto_1a9

    :cond_1a5
    iget-object v0, p1, Lvzk;->c:Ljava/lang/Object;

    check-cast v0, Landroid/util/Size;

    :goto_1a9
    if-eqz p1, :cond_1b0

    iget-object p1, p1, Lvzk;->d:Ljava/lang/Object;

    move-object v4, p1

    check-cast v4, Landroid/graphics/Point;

    :cond_1b0
    iget-object p0, p0, Lr72;->d:Ljava/lang/Object;

    check-cast p0, Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_1b8
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_1d0

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lgoi;

    invoke-virtual {p1, v0, v4}, Lgoi;->a(Landroid/util/Size;Landroid/graphics/Point;)V

    goto :goto_1b8

    :cond_1c8
    const/4 p1, 0x2

    invoke-virtual {p0, p1}, Lr72;->e(I)V

    goto :goto_1d0

    :cond_1cd
    invoke-virtual {p0, v5}, Lr72;->e(I)V

    :cond_1d0
    :goto_1d0
    return-void

    :pswitch_1d1
    check-cast p0, Lcom/opera/api/Callback;

    check-cast p1, Ljava/lang/Integer;

    invoke-interface {p0, v4}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_1d9
    check-cast p0, Lu59;

    check-cast p1, Ljava/lang/Integer;

    new-instance p1, Lauj;

    const/16 v0, 0x8

    invoke-direct {p1, v0}, Lauj;-><init>(B)V

    iget-object p0, p0, Lu59;->b:Ljava/lang/Object;

    check-cast p0, Lb7f;

    invoke-virtual {p0, p1}, Lb7f;->d(Ljava/lang/Object;)V

    return-void

    :pswitch_1ec
    check-cast p0, Lkh;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    if-lez p1, :cond_1f7

    move v1, v5

    :cond_1f7
    invoke-virtual {p0, v1}, Lkh;->a(Z)V

    return-void

    :pswitch_1fb
    check-cast p0, Ljb;

    check-cast p1, Ljava/util/List;

    iget-object v0, p0, Ljb;->h:Ljava/io/Serializable;

    check-cast v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    sget-object p1, Ltjj;->c:Lp74;

    invoke-virtual {p1}, Lp74;->b()Z

    move-result p1

    if-eqz p1, :cond_212

    invoke-virtual {p0}, Ljb;->h()V

    goto :goto_225

    :cond_212
    iget-object p1, p0, Ljb;->f:Ljava/io/Serializable;

    check-cast p1, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_225

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_225

    invoke-virtual {p0}, Ljb;->a()V

    :cond_225
    :goto_225
    return-void

    :pswitch_226
    check-cast p0, Lorg/chromium/components/signin/AccountCapabilitiesFetcher;

    check-cast p1, Lorg/chromium/components/signin/base/AccountCapabilities;

    iget-wide v0, p0, Lorg/chromium/components/signin/AccountCapabilitiesFetcher;->b:J

    invoke-static {p1, v0, v1}, LJ/N;->M8lmDXtQ(Ljava/lang/Object;J)V

    iput-wide v2, p0, Lorg/chromium/components/signin/AccountCapabilitiesFetcher;->b:J

    return-void

    :pswitch_data_232
    .packed-switch 0x0
        :pswitch_226
        :pswitch_1fb
        :pswitch_1ec
        :pswitch_1d9
        :pswitch_1d1
        :pswitch_173
        :pswitch_167
        :pswitch_15f
        :pswitch_125
        :pswitch_11d
        :pswitch_112
        :pswitch_fc
        :pswitch_d2
        :pswitch_c4
        :pswitch_b2
        :pswitch_a6
        :pswitch_96
        :pswitch_87
        :pswitch_77
        :pswitch_63
        :pswitch_51
        :pswitch_44
        :pswitch_3c
        :pswitch_34
        :pswitch_2c
        :pswitch_24
        :pswitch_1c
    .end packed-switch
.end method
