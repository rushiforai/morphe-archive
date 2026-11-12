.class public final synthetic Lroj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lvlf;
.implements Ln5o;
.implements Lm94;
.implements Lykj;
.implements Lh6f;
.implements Lyyk;
.implements Led2;
.implements Lyjj;
.implements Lxk7;
.implements Lfua;
.implements Lv2p;
.implements Lg94;
.implements Lgjo;
.implements Lcom/google/android/gms/tasks/OnCompleteListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    iput-byte p3, p0, Lroj;->a:B

    iput-object p1, p0, Lroj;->b:Ljava/lang/Object;

    iput-object p2, p0, Lroj;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(I)V
    .registers 3

    iget-object v0, p0, Lroj;->b:Ljava/lang/Object;

    check-cast v0, Lqjo;

    iget-object p0, p0, Lroj;->c:Ljava/lang/Object;

    check-cast p0, Lp12;

    iget-object p0, p0, Lp12;->d:Ljava/lang/Object;

    check-cast p0, Lgjo;

    invoke-interface {p0, p1}, Lgjo;->a(I)V

    iget-object p0, v0, Ln1;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/ad/interstitial/AdActivity;

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public final accept(Ljava/lang/Object;)V
    .registers 9

    iget-object v0, p0, Lroj;->b:Ljava/lang/Object;

    check-cast v0, Ln9h;

    iget-object p0, p0, Lroj;->c:Ljava/lang/Object;

    check-cast p0, Ll4n;

    check-cast p1, Lvsp;

    iget-object v0, v0, Ln9h;->c:Ljava/lang/Object;

    check-cast v0, Ljn;

    iget-object v1, p1, Lvsp;->a:Ljava/util/HashMap;

    iget-boolean v2, p1, Lvsp;->c:Z

    if-eqz v2, :cond_41

    iget-wide v2, p0, Ll4n;->b:J

    long-to-float v2, v2

    const/high16 v3, 0x447a0000    # 1000.0f

    div-float/2addr v2, v3

    const/4 v4, 0x0

    cmpl-float v2, v2, v4

    if-lez v2, :cond_41

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_38

    iget-wide v5, p0, Ll4n;->a:J

    long-to-float v2, v5

    div-float/2addr v2, v3

    cmpl-float v2, v2, v4

    if-lez v2, :cond_38

    sget-object v2, Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;->start:Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;

    const/4 v3, 0x0

    invoke-virtual {p1, v2, v0, v3}, Lvsp;->a(Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;Ljn;Ljava/lang/Object;)V

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_38
    sget-object v1, Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;->timeupdate:Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;

    invoke-static {p0}, Lcom/google/ads/interactivemedia/v3/impl/data/zzca;->a(Ll4n;)Lcom/google/ads/interactivemedia/v3/impl/data/zzca;

    move-result-object p0

    invoke-virtual {p1, v1, v0, p0}, Lvsp;->a(Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;Ljn;Ljava/lang/Object;)V

    :cond_41
    return-void
.end method

.method public final apply(Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;
    .registers 6

    iget-object v0, p0, Lroj;->b:Ljava/lang/Object;

    check-cast v0, Llr;

    iget-object p0, p0, Lroj;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    check-cast p1, Ljava/lang/Void;

    iget-object p1, v0, Llr;->d:Ljava/lang/Object;

    check-cast p1, Ltxi;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lai4;

    iget-object v1, v1, Lai4;->b:Lwrf;

    sget-object v2, Lai4;->g:Lan2;

    const/16 v3, 0x64

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lwrf;->b(Lan2;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lai4;

    iget-object p0, p0, Lai4;->b:Lwrf;

    sget-object v2, Lai4;->f:Lan2;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v2, v0}, Lwrf;->b(Lan2;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    iget-object p1, p1, Ltxi;->b:Ljava/lang/Object;

    check-cast p1, Lfgk;

    iget-object p1, p1, Lfgk;->w:Lghf;

    if-eqz p1, :cond_58

    iget-object p1, p1, Lghf;->b:Ljava/lang/Object;

    check-cast p1, Lwtk;

    invoke-interface {p1, v1, p0}, Lwtk;->a(II)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object p0

    return-object p0

    :cond_58
    new-instance p0, Ljava/lang/Exception;

    const-string p1, "Failed to take picture: pipeline is not ready."

    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    new-instance p1, Lq0b;

    const/4 v0, 0x1

    invoke-direct {p1, p0, v0}, Lq0b;-><init>(Ljava/lang/Object;B)V

    return-object p1
.end method

.method public final attachCompleter(Ll94;)Ljava/lang/Object;
    .registers 7

    iget-byte v0, p0, Lroj;->a:B

    iget-object v1, p0, Lroj;->c:Ljava/lang/Object;

    iget-object p0, p0, Lroj;->b:Ljava/lang/Object;

    sparse-switch v0, :sswitch_data_7c

    check-cast p0, Ljava/util/concurrent/ExecutorService;

    check-cast v1, Lkotlin/jvm/functions/Function0;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v2, 0x0

    invoke-direct {v0, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    new-instance v2, Lvic;

    const/4 v3, 0x1

    invoke-direct {v2, v0, v3}, Lvic;-><init>(Ljava/util/concurrent/atomic/AtomicBoolean;B)V

    sget-object v3, Ll97;->a:Ll97;

    invoke-virtual {p1, v2, v3}, Ll94;->a(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    new-instance v2, Lh4m;

    const/16 v3, 0xb

    invoke-direct {v2, v0, p1, v1, v3}, Lh4m;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {p0, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :sswitch_2b
    check-cast p0, Lall;

    check-cast v1, Landroid/view/Surface;

    iget-object v0, p0, Lall;->h:Lbuk;

    invoke-static {}, Ln97;->a()Ln97;

    move-result-object v2

    new-instance v3, Lip1;

    const/16 v4, 0x9

    invoke-direct {v3, p1, v4}, Lip1;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1, v2, v3}, Lbuk;->a(Landroid/view/Surface;Ljava/util/concurrent/Executor;Lqp5;)V

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "provideSurface[request="

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lall;->h:Lbuk;

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, " surface="

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, "]"

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :sswitch_5d
    check-cast p0, Lbuk;

    check-cast v1, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "SurfaceRequest-surface-recreation("

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :sswitch_data_7c
    .sparse-switch
        0x2 -> :sswitch_5d
        0x5 -> :sswitch_2b
    .end sparse-switch
.end method

.method public final b(I)Z
    .registers 3

    iget-object v0, p0, Lroj;->b:Ljava/lang/Object;

    check-cast v0, Lvkn;

    iget-object p0, p0, Lroj;->c:Ljava/lang/Object;

    check-cast p0, Lqln;

    iget-object v0, v0, Lvkn;->a:Lujn;

    invoke-virtual {p0}, Lqln;->i()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Lujn;->P(Ljava/lang/String;)I

    move-result p0

    if-eq p0, p1, :cond_26

    iget-object p0, v0, Ldt1;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lmkb;

    invoke-virtual {p0}, Lmkb;->a()Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_26

    const/4 p0, 0x1

    return p0

    :cond_26
    const/4 p0, 0x0

    return p0
.end method

.method public final c(Landroid/view/ViewGroup;)Landroidx/recyclerview/widget/i;
    .registers 14

    iget-byte v0, p0, Lroj;->a:B

    const/4 v1, 0x0

    const-string v2, "Missing required view with ID: "

    const/4 v3, 0x0

    iget-object v4, p0, Lroj;->c:Ljava/lang/Object;

    iget-object p0, p0, Lroj;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_ca

    check-cast p0, Lyw;

    check-cast v4, Lesk;

    const v0, 0x7f0d048c

    invoke-static {p1, v0, p1, v3}, Lj7c;->n(Landroid/view/ViewGroup;ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const v0, 0x7f0a02ef

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_52

    new-instance v0, Lb98;

    check-cast v3, Landroid/widget/FrameLayout;

    const/4 v5, 0x5

    invoke-direct {v0, v3, v5}, Lb98;-><init>(Landroid/widget/FrameLayout;B)V

    const v3, 0x7f0a0571

    invoke-static {v3, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    if-eqz v5, :cond_51

    new-instance v1, Lq5g;

    check-cast p1, Landroid/widget/FrameLayout;

    const/16 v2, 0x10

    invoke-direct {v1, p1, v0, v5, v2}, Lq5g;-><init>(Landroid/view/ViewGroup;Ljava/lang/Object;Ljava/lang/Object;B)V

    const/4 p1, 0x1

    invoke-virtual {v5, p1}, Landroid/view/View;->setClipToOutline(Z)V

    sget-object p1, Landroid/view/ViewOutlineProvider;->BACKGROUND:Landroid/view/ViewOutlineProvider;

    invoke-virtual {v5, p1}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    new-instance p1, Lwqn;

    iget-object p0, p0, Lyw;->e:Ljava/lang/Object;

    check-cast p0, Lz4k;

    invoke-direct {p1, v1, p0, v4}, Lwqn;-><init>(Lq5g;Lz4k;Lesk;)V

    move-object v1, p1

    goto :goto_61

    :cond_51
    move v0, v3

    :cond_52
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_61
    return-object v1

    :pswitch_62
    check-cast p0, Lujn;

    check-cast v4, Lcom/opera/android/settings/SettingsManager;

    new-instance v0, Lt6n;

    const v5, 0x7f0d0478

    invoke-static {p1, v5, p1, v3}, Lj7c;->n(Landroid/view/ViewGroup;ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const v3, 0x7f0a0429

    invoke-static {v3, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object v8, v5

    check-cast v8, Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;

    if-eqz v8, :cond_b9

    const v3, 0x7f0a073b

    invoke-static {v3, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object v9, v5

    check-cast v9, Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;

    if-eqz v9, :cond_b9

    const v3, 0x7f0a0b92

    invoke-static {v3, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/LinearLayout;

    if-eqz v5, :cond_b9

    const v3, 0x7f0a0cc7

    invoke-static {v3, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object v10, v5

    check-cast v10, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v10, :cond_b9

    const v3, 0x7f0a0cc8

    invoke-static {v3, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object v11, v5

    check-cast v11, Landroid/widget/LinearLayout;

    if-eqz v11, :cond_b9

    new-instance v6, Lfbl;

    move-object v7, p1

    check-cast v7, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-direct/range {v6 .. v11}, Lfbl;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;Lcom/opera/android/ui/catalog/widget/OperaListItem;Landroid/widget/LinearLayout;)V

    iget-object p0, p0, Lujn;->g:Ltjn;

    invoke-direct {v0, v6, p0, v4}, Lt6n;-><init>(Lfbl;Ltjn;Lcom/opera/android/settings/SettingsManager;)V

    move-object v1, v0

    goto :goto_c8

    :cond_b9
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v3}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_c8
    return-object v1

    nop

    :pswitch_data_ca
    .packed-switch 0xb
        :pswitch_62
    .end packed-switch
.end method

.method public final d(ZZ)V
    .registers 5

    iget-object v0, p0, Lroj;->b:Ljava/lang/Object;

    check-cast v0, Lpom;

    iget-object p0, p0, Lroj;->c:Ljava/lang/Object;

    check-cast p0, Lgt0;

    iget-object v0, v0, Lpom;->c:Lx5f;

    iget-boolean v1, v0, Lx5f;->h:Z

    if-nez v1, :cond_f

    return-void

    :cond_f
    invoke-virtual {v0, p0, p1, p2}, Lx5f;->Z(Lgt0;ZZ)V

    return-void
.end method

.method public final execute()Ljava/lang/Object;
    .registers 8

    iget-byte v0, p0, Lroj;->a:B

    const/4 v1, 0x0

    iget-object v2, p0, Lroj;->c:Ljava/lang/Object;

    iget-object p0, p0, Lroj;->b:Ljava/lang/Object;

    check-cast p0, Lks3;

    packed-switch v0, :pswitch_data_68

    check-cast v2, Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_16
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    iget-object v3, p0, Lks3;->i:Ljava/lang/Object;

    check-cast v3, Lydi;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    int-to-long v4, v4

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    sget-object v6, Lxyc;->g:Lxyc;

    invoke-virtual {v3, v4, v5, v6, v2}, Lydi;->n(JLxyc;Ljava/lang/String;)V

    goto :goto_16

    :cond_3d
    return-object v1

    :pswitch_3e
    check-cast v2, Ljava/util/ArrayList;

    iget-object p0, p0, Lks3;->c:Ljava/lang/Object;

    check-cast p0, Lydi;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_66

    invoke-static {v2}, Lydi;->p(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "DELETE FROM events WHERE _id in "

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lydi;->h()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object p0

    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteStatement;->execute()V

    :cond_66
    return-object v1

    nop

    :pswitch_data_68
    .packed-switch 0x7
        :pswitch_3e
    .end packed-switch
.end method

.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 12

    iget-byte v0, p0, Lroj;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x0

    iget-object v3, p0, Lroj;->c:Ljava/lang/Object;

    iget-object p0, p0, Lroj;->b:Ljava/lang/Object;

    sparse-switch v0, :sswitch_data_e6

    check-cast p0, Lcom/opera/android/BrowserActivity;

    check-cast v3, Lru9;

    check-cast p1, Lkotlin/Unit;

    sget-object p1, Lsyn;->a:Ljava/util/concurrent/atomic/AtomicBoolean;

    :try_start_13
    invoke-static {p0}, Lsyn;->b(Lcom/opera/android/BrowserActivity;)Z

    move-result p0

    if-eqz p0, :cond_29

    invoke-virtual {v3}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object v0, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/SharedPreferences$Editor;

    const-string v2, "webapp_shortcut_migration_pending"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V
    :try_end_29
    .catchall {:try_start_13 .. :try_end_29} :catchall_2f

    :cond_29
    invoke-virtual {p1, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :catchall_2f
    move-exception p0

    invoke-virtual {p1, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    throw p0

    :sswitch_34
    check-cast p0, Ls14;

    check-cast v3, Ljava/lang/Runnable;

    check-cast p1, Ljava/util/List;

    iget-object v0, p0, Ls14;->f:Ljava/lang/Object;

    check-cast v0, Lkze;

    invoke-virtual {v0, p1}, Lekc;->r(Ljava/lang/Object;)V

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    move v0, v1

    :cond_46
    :goto_46
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_70

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Laln;

    invoke-interface {v4}, Laln;->getId()Ljava/lang/String;

    move-result-object v5

    const-string v6, "FILE_user_wallpaper_"

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_61

    add-int/lit8 v1, v1, 0x1

    goto :goto_46

    :cond_61
    invoke-interface {v4}, Laln;->getId()Ljava/lang/String;

    move-result-object v4

    const-string v5, "FILE_storefront_wallpaper_"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_46

    add-int/lit8 v0, v0, 0x1

    goto :goto_46

    :cond_70
    iget-object p1, p0, Ls14;->e:Ljava/lang/Object;

    check-cast p1, Lonn;

    iget-object p1, p1, Lonn;->d:Lx5f;

    iget-boolean v4, p1, Lx5f;->h:Z

    const/4 v5, 0x1

    if-eqz v4, :cond_94

    iget-object v4, p1, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v6

    invoke-virtual {v6, v4}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v4

    const/16 v7, 0x43

    int-to-long v8, v1

    invoke-virtual {v4, v7, v5, v8, v9}, Ljf0;->p(IIJ)V

    const/16 v1, 0x44

    int-to-long v7, v0

    invoke-virtual {v4, v1, v5, v7, v8}, Ljf0;->p(IIJ)V

    invoke-virtual {p1, v6}, Lx5f;->U0(Lx56;)V

    :cond_94
    iput-boolean v5, p0, Ls14;->b:Z

    invoke-interface {v3}, Ljava/lang/Runnable;->run()V

    return-object v2

    :sswitch_9a
    check-cast p0, Ls14;

    check-cast v3, Lj12;

    check-cast p1, Lkln;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v3, p1}, Lj12;->run(Ljava/lang/Object;)V

    new-instance p1, Lrl;

    const/4 v0, 0x4

    invoke-direct {p1, v0}, Lrl;-><init>(B)V

    invoke-virtual {p0, p1}, Ls14;->G(Ljava/lang/Runnable;)V

    return-object v2

    :sswitch_b0
    check-cast p0, Ls14;

    check-cast v3, Ljava/lang/String;

    check-cast p1, Ljava/io/File;

    :try_start_b6
    invoke-virtual {p0, v3}, Ls14;->B(Ljava/lang/String;)Ljava/io/File;

    move-result-object p0

    new-instance p1, Ljava/lang/String;

    invoke-static {p0}, Ls29;->h(Ljava/io/File;)[B

    move-result-object p0

    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {p1, p0, v0}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    invoke-static {p1}, Lkln;->h(Ljava/lang/String;)Lkln;

    move-result-object v2
    :try_end_c9
    .catch Ljava/io/IOException; {:try_start_b6 .. :try_end_c9} :catch_c9
    .catch Lorg/json/JSONException; {:try_start_b6 .. :try_end_c9} :catch_c9

    :catch_c9
    return-object v2

    :sswitch_ca
    check-cast p0, Landroid/graphics/Bitmap;

    check-cast v3, Lilm;

    check-cast p1, Lgkn;

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    invoke-virtual {v3, p1}, Lilm;->run(Ljava/lang/Object;)V

    return-object v2

    :sswitch_d7
    check-cast p0, Lkuj;

    check-cast v3, Landroid/net/Uri;

    iget-object p0, p0, Lkuj;->z:Landroid/net/Uri;

    invoke-static {p0, v3}, Lqyn;->v(Landroid/net/Uri;Landroid/net/Uri;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :sswitch_data_e6
    .sparse-switch
        0x1 -> :sswitch_d7
        0xc -> :sswitch_ca
        0xe -> :sswitch_b0
        0xf -> :sswitch_9a
        0x10 -> :sswitch_34
    .end sparse-switch
.end method

.method public final i()Landroid/graphics/drawable/Drawable;
    .registers 3

    iget-object v0, p0, Lroj;->b:Ljava/lang/Object;

    check-cast v0, Lv4g;

    iget-object p0, p0, Lroj;->c:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    new-instance v1, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    iget-object v0, v0, Lv4g;->e:Ljava/lang/Object;

    check-cast v0, Landroid/graphics/Bitmap;

    invoke-direct {v1, p0, v0}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    return-object v1
.end method

.method public final k(Lg3d;)Ljava/lang/Object;
    .registers 3

    iget-object p1, p0, Lroj;->b:Ljava/lang/Object;

    check-cast p1, Landroid/content/Context;

    iget-object p0, p0, Lroj;->c:Ljava/lang/Object;

    check-cast p0, Li3d;

    iget p0, p0, Li3d;->b:I

    const v0, 0x7f06063b

    invoke-static {p0, p1, v0}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public final l(Ljava/lang/Object;)V
    .registers 5

    iget-byte v0, p0, Lroj;->a:B

    iget-object v1, p0, Lroj;->c:Ljava/lang/Object;

    iget-object p0, p0, Lroj;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_78

    :pswitch_9
    check-cast p0, Ljava/lang/String;

    check-cast v1, Ljava/io/File;

    check-cast p1, Lqio;

    new-instance v0, Lh4m;

    const/16 v2, 0xe

    invoke-direct {v0, p1, p0, v1, v2}, Lh4m;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v0}, Lgxo;->a(Ljava/lang/Runnable;)V

    return-void

    :pswitch_1a
    check-cast p0, Lbzo;

    check-cast v1, Lpqo;

    check-cast p1, Lqio;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    instance-of v0, p1, Llio;

    if-nez v0, :cond_42

    move-object v0, p1

    check-cast v0, Lmio;

    iget-object v0, v0, Lmio;->a:Ljava/lang/Object;

    check-cast v0, Lvho;

    invoke-virtual {p0, v0, v1}, Lbzo;->b(Lvho;Lpqo;)Z

    move-result v0

    iget-object v1, p0, Lbzo;->b:Lbn;

    if-eqz v0, :cond_3d

    invoke-interface {v1}, Lbn;->i()V

    goto :goto_42

    :cond_3d
    sget-object v0, Lbm;->d:Lbm;

    invoke-interface {v1, v0}, Lbn;->m(Lbm;)V

    :cond_42
    :goto_42
    new-instance v0, Ldgo;

    const/4 v1, 0x7

    invoke-direct {v0, p0, v1}, Ldgo;-><init>(Ljava/lang/Object;B)V

    instance-of p0, p1, Llio;

    if-eqz p0, :cond_53

    check-cast p1, Llio;

    iget-object p0, p1, Llio;->a:Ljava/lang/Exception;

    invoke-interface {v0, p0}, Lg94;->l(Ljava/lang/Object;)V

    :cond_53
    return-void

    :pswitch_54
    check-cast p0, Llro;

    check-cast v1, Lxbf;

    check-cast p1, Landroid/view/View;

    iget-object v0, p0, Llro;->s:Lqb7;

    if-eqz v0, :cond_61

    invoke-virtual {v0}, Lqb7;->onAdClicked()V

    :cond_61
    invoke-virtual {v1, p1}, Lxbf;->a(Landroid/view/View;)V

    const/4 p1, 0x4

    invoke-virtual {p0, p1}, Llro;->s0(I)V

    return-void

    :pswitch_69
    check-cast p0, Ljava/lang/String;

    check-cast v1, Lwci;

    check-cast p1, Ljava/io/File;

    new-instance v0, Ljro;

    invoke-direct {v0, p0, p1, v1}, Ljro;-><init>(Ljava/lang/String;Ljava/io/File;Lwci;)V

    invoke-static {v0}, Lhyg;->c(Ljro;)V

    return-void

    :pswitch_data_78
    .packed-switch 0x16
        :pswitch_69
        :pswitch_54
        :pswitch_9
        :pswitch_1a
    .end packed-switch
.end method

.method public final onComplete(Lcom/google/android/gms/tasks/Task;)V
    .registers 3

    iget-object p1, p0, Lroj;->b:Ljava/lang/Object;

    check-cast p1, Lads_mobile_sdk/u13;

    iget-object p0, p0, Lroj;->c:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/gms/tasks/TaskCompletionSource;

    iget-object v0, p1, Lads_mobile_sdk/u13;->f:Ljava/lang/Object;

    monitor-enter v0

    :try_start_b
    iget-object p1, p1, Lads_mobile_sdk/u13;->e:Ljava/util/HashSet;

    invoke-virtual {p1, p0}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    monitor-exit v0

    return-void

    :goto_12
    monitor-exit v0
    :try_end_13
    .catchall {:try_start_b .. :try_end_13} :catchall_14

    throw p0

    :catchall_14
    move-exception p0

    goto :goto_12
.end method

.method public final u(Lcom/opera/android/ui/catalog/widget/OperaListItem;Z)V
    .registers 5

    iget-object p1, p0, Lroj;->b:Ljava/lang/Object;

    check-cast p1, Luoj;

    iget-object p0, p0, Lroj;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    sget-object v0, Ls9g;->h:Ls9g;

    iget-object v1, p1, Luoj;->t:Llag;

    if-eqz p2, :cond_11

    sget-object p2, Lkag;->d:Lkag;

    goto :goto_13

    :cond_11
    sget-object p2, Lkag;->c:Lkag;

    :goto_13
    invoke-virtual {v0, v1, p2}, Ls9g;->p(Llag;Lkag;)V

    invoke-virtual {p1, p0}, Luoj;->I0(Lcom/opera/android/ui/catalog/widget/OperaListItem;)V

    return-void
.end method
