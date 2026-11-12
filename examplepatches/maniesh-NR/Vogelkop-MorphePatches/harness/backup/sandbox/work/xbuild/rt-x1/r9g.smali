.class public final synthetic Lr9g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lekj;
.implements Lm94;
.implements Lk37;
.implements Lfkj;
.implements Ln5o;
.implements Lvlk;
.implements Lcom/google/android/gms/tasks/OnSuccessListener;
.implements Lcom/google/android/gms/tasks/OnCompleteListener;
.implements Lm9n;
.implements Lvwh;
.implements Lurg;
.implements Lceb;
.implements Ldwa;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lijc;Lxrh;)V
    .registers 3

    const/16 p2, 0x16

    iput-byte p2, p0, Lr9g;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lr9g;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 10
    iput-byte p2, p0, Lr9g;->a:B

    iput-object p1, p0, Lr9g;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a([Lmkg;)V
    .registers 3

    iget-object p0, p0, Lr9g;->b:Ljava/lang/Object;

    check-cast p0, Lojg;

    iput-object p1, p0, Lojg;->b:[Lmkg;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lojg;->c:Z

    iget-object p0, p0, Lojg;->d:Ltjg;

    iget-object p0, p0, Ltjg;->s:Ljava/util/ArrayDeque;

    :goto_d
    invoke-virtual {p0}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_28

    invoke-virtual {p0}, Ljava/util/ArrayDeque;->getFirst()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lojg;

    iget-boolean v0, p1, Lojg;->c:Z

    if-eqz v0, :cond_28

    iget-object v0, p1, Lojg;->a:Lk37;

    iget-object p1, p1, Lojg;->b:[Lmkg;

    invoke-interface {v0, p1}, Lk37;->a([Lmkg;)V

    invoke-virtual {p0}, Ljava/util/ArrayDeque;->removeFirst()Ljava/lang/Object;

    goto :goto_d

    :cond_28
    return-void
.end method

.method public final attachCompleter(Ll94;)Ljava/lang/Object;
    .registers 6

    iget-byte v0, p0, Lr9g;->a:B

    iget-object p0, p0, Lr9g;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_36

    check-cast p0, Lmoh;

    iget-object v0, p0, Lmoh;->s:Lf28;

    new-instance v1, Ls6h;

    invoke-direct {v1, p0, p1}, Ls6h;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object p0, p0, Lmoh;->d:Lb2j;

    iget-object v2, v0, Lf28;->a:Ljava/lang/Object;

    monitor-enter v2

    :try_start_15
    iput-object v1, v0, Lf28;->s:Lv18;

    iput-object p0, v0, Lf28;->t:Ljava/util/concurrent/Executor;

    monitor-exit v2
    :try_end_1a
    .catchall {:try_start_15 .. :try_end_1a} :catchall_1f

    const-string p0, "videoEncodingFuture"

    return-object p0

    :goto_1d
    :try_start_1d
    monitor-exit v2
    :try_end_1e
    .catchall {:try_start_1d .. :try_end_1e} :catchall_1f

    throw p0

    :catchall_1f
    move-exception p0

    goto :goto_1d

    :pswitch_21
    check-cast p0, Lxf2;

    iget-object v0, p0, Lxf2;->g:Ljava/lang/Object;

    check-cast v0, La64;

    new-instance v1, Lfb9;

    const/16 v2, 0x12

    const/4 v3, 0x0

    invoke-direct {v1, p0, p1, v3, v2}, Lfb9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    const/4 p0, 0x3

    invoke-static {v0, v3, v3, v1, p0}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    const-string p0, "FetchData for PipeCameraPresence0"

    return-object p0

    :pswitch_data_36
    .packed-switch 0x2
        :pswitch_21
    .end packed-switch
.end method

.method public final b(Lhjm;)V
    .registers 2

    iget-object p0, p0, Lr9g;->b:Ljava/lang/Object;

    check-cast p0, Ltn;

    iget-boolean p1, p0, Ltn;->a:Z

    if-eqz p1, :cond_9

    return-void

    :cond_9
    iget-object p0, p0, Ltn;->d:Ljava/lang/Object;

    check-cast p0, Lbag;

    invoke-interface {p0}, Lbag;->s()V

    return-void
.end method

.method public final c(Landroid/view/MotionEvent;)V
    .registers 2

    iget-object p0, p0, Lr9g;->b:Ljava/lang/Object;

    check-cast p0, Lvzk;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    if-nez p1, :cond_11

    iget-object p0, p0, Lvzk;->c:Ljava/lang/Object;

    check-cast p0, Lnii;

    invoke-virtual {p0}, Lnii;->a()V

    :cond_11
    return-void
.end method

.method public final d()V
    .registers 2

    iget-object p0, p0, Lr9g;->b:Ljava/lang/Object;

    check-cast p0, Lpni;

    iget-object v0, p0, Lpni;->b:Ljava/lang/Object;

    monitor-enter v0

    :try_start_7
    invoke-virtual {p0}, Lpni;->c()V
    :try_end_a
    .catchall {:try_start_7 .. :try_end_a} :catchall_c

    monitor-exit v0

    return-void

    :catchall_c
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public final e(Lgkj;Lhjm;)V
    .registers 3

    iget-byte p2, p0, Lr9g;->a:B

    iget-object p0, p0, Lr9g;->b:Ljava/lang/Object;

    packed-switch p2, :pswitch_data_18

    check-cast p0, Lyvg;

    const/4 p1, 0x0

    iput-object p1, p0, Lyvg;->h:Lgkj;

    return-void

    :pswitch_d
    check-cast p0, Lga6;

    iget-object p0, p0, Lga6;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/HashSet;

    invoke-virtual {p0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    return-void

    nop

    :pswitch_data_18
    .packed-switch 0x4
        :pswitch_d
    .end packed-switch
.end method

.method public final f(Lo93;)V
    .registers 2

    iget-object p0, p0, Lr9g;->b:Ljava/lang/Object;

    check-cast p0, Liii;

    invoke-virtual {p0, p1}, Liji;->R(Lo93;)V

    return-void
.end method

.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    iget-byte v0, p0, Lr9g;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lr9g;->b:Ljava/lang/Object;

    sparse-switch v0, :sswitch_data_6e

    check-cast p0, Lrii;

    check-cast p1, Ljava/lang/String;

    iget-object p0, p0, Lrii;->b:Ljava/lang/Object;

    check-cast p0, Ltu;

    if-eqz p1, :cond_21

    sget v0, Lvqi;->h:I

    :try_start_14
    invoke-static {p1}, Lhn9;->n(Ljava/lang/String;)Lkqi;

    move-result-object p1

    iget-object p1, p1, Lkqi;->a:Ljava/util/ArrayList;
    :try_end_1a
    .catch Lorg/json/JSONException; {:try_start_14 .. :try_end_1a} :catch_1b

    goto :goto_1d

    :catch_1b
    sget-object p1, Ll08;->a:Ll08;

    :goto_1d
    invoke-virtual {p0, p1}, Ltu;->run(Ljava/lang/Object;)V

    goto :goto_26

    :cond_21
    sget-object p1, Ll08;->a:Ll08;

    invoke-virtual {p0, p1}, Ltu;->run(Ljava/lang/Object;)V

    :goto_26
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :sswitch_29
    check-cast p0, Lqe9;

    check-cast p1, Landroid/net/Uri;

    invoke-virtual {p0, p1}, Lqe9;->run(Ljava/lang/Object;)V

    return-object v1

    :sswitch_31
    check-cast p0, Lvuh;

    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p0, p1}, Lvuh;->run(Ljava/lang/Object;)V

    return-object v1

    :sswitch_39
    check-cast p0, Lglh;

    check-cast p1, Ljava/lang/Long;

    if-eqz p1, :cond_59

    iget-object p0, p0, Lglh;->b:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_45
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5c

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lclh;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-interface {v0, v2, v3}, Lclh;->b(J)V

    goto :goto_45

    :cond_59
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_5c
    return-object v1

    :sswitch_5d
    check-cast p0, Ls2g;

    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p0, p1}, Ls2g;->run(Ljava/lang/Object;)V

    return-object v1

    :sswitch_65
    check-cast p0, Lhu5;

    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1}, Lhu5;->run(Ljava/lang/Object;)V

    return-object v1

    nop

    :sswitch_data_6e
    .sparse-switch
        0x5 -> :sswitch_65
        0xf -> :sswitch_5d
        0x10 -> :sswitch_39
        0x11 -> :sswitch_31
        0x13 -> :sswitch_29
    .end sparse-switch
.end method

.method public final h(I)V
    .registers 6

    iget-object p0, p0, Lr9g;->b:Ljava/lang/Object;

    check-cast p0, Lnlh;

    iput p1, p0, Lnlh;->C:I

    iget-object v0, p0, Lnlh;->B:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "sort_order"

    invoke-static {p1}, Lfki;->j(I)B

    move-result v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    iget-object p0, p0, Lnlh;->F:Lblh;

    iget-object v0, p0, Lblh;->e:Lxvj;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const/4 v2, 0x0

    :goto_29
    iget v3, v0, Lxvj;->h:I

    if-ge v2, v3, :cond_39

    invoke-virtual {v0, v2}, Lxvj;->f(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lwkh;

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_29

    :cond_39
    iget-object p0, p0, Lblh;->g:Lxkh;

    iput p1, p0, Lxkh;->b:I

    invoke-virtual {v0}, Lxvj;->d()V

    invoke-virtual {v0, v1}, Lxvj;->c(Ljava/util/Collection;)V

    return-void
.end method

.method public final i(Lamk;)V
    .registers 14

    iget-object p0, p0, Lr9g;->b:Ljava/lang/Object;

    check-cast p0, Ltn;

    iget-boolean v0, p0, Ltn;->a:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_f

    const v0, 0x7f1413d1

    move v3, v2

    goto :goto_1e

    :cond_f
    iget-object v0, p1, Lamk;->c:Lxlk;

    iget-object v0, v0, Lxlk;->a:Lwlk;

    if-eqz v0, :cond_1a

    const v0, 0x7f1413c4

    :goto_18
    move v3, v1

    goto :goto_1e

    :cond_1a
    const v0, 0x7f1413d0

    goto :goto_18

    :goto_1e
    iget-object v4, p0, Ltn;->b:Ljava/lang/Object;

    check-cast v4, Lor2;

    iget-object v4, v4, Lor2;->b:Ljava/lang/Object;

    check-cast v4, Landroid/widget/TextView;

    const/4 v5, 0x0

    const/4 v6, 0x3

    const-string v7, "</terms>"

    const-string v8, "<terms>"

    if-eqz v3, :cond_52

    const/4 v3, 0x2

    new-array v3, v3, [Lowj;

    new-instance v9, Lowj;

    new-instance v10, Ljng;

    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v11

    invoke-direct {v10, v6, v11, v5}, Ljng;-><init>(ILandroid/content/Context;Ljava/lang/Runnable;)V

    invoke-direct {v9, v8, v7, v10}, Lowj;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/text/style/CharacterStyle;)V

    aput-object v9, v3, v1

    new-instance v1, Lowj;

    new-instance v5, Landroid/text/style/StyleSpan;

    invoke-direct {v5, v2}, Landroid/text/style/StyleSpan;-><init>(I)V

    const-string v6, "<bold>"

    const-string v7, "</bold>"

    invoke-direct {v1, v6, v7, v5}, Lowj;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/text/style/CharacterStyle;)V

    aput-object v1, v3, v2

    goto :goto_64

    :cond_52
    new-array v3, v2, [Lowj;

    new-instance v2, Lowj;

    new-instance v9, Ljng;

    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v10

    invoke-direct {v9, v6, v10, v5}, Ljng;-><init>(ILandroid/content/Context;Ljava/lang/Runnable;)V

    invoke-direct {v2, v8, v7, v9}, Lowj;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/text/style/CharacterStyle;)V

    aput-object v2, v3, v1

    :goto_64
    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v3}, Ln1h;->d(Ljava/lang/String;[Lowj;)Landroid/text/SpannableString;

    move-result-object v0

    invoke-static {v4, v0}, Lphj;->u0(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    iget-boolean v0, p0, Ltn;->a:Z

    if-eqz v0, :cond_7b

    const p1, 0x7f1411b3

    goto :goto_88

    :cond_7b
    iget-object p1, p1, Lamk;->c:Lxlk;

    iget-object p1, p1, Lxlk;->a:Lwlk;

    if-eqz p1, :cond_85

    const p1, 0x7f141180

    goto :goto_88

    :cond_85
    const p1, 0x7f141194

    :goto_88
    iget-object p0, p0, Ltn;->c:Ljava/lang/Object;

    check-cast p0, Landroid/widget/Button;

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    return-void
.end method

.method public final j()V
    .registers 5

    iget-object p0, p0, Lr9g;->b:Ljava/lang/Object;

    check-cast p0, Lknh;

    iget-object v0, p0, Lknh;->A:Ly83;

    const/4 v1, 0x0

    if-nez v0, :cond_a

    move-object v0, v1

    :cond_a
    iget-object v0, v0, Ly83;->g:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/widget/MeasurableHeightScrollView;

    invoke-static {v0}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->C(Landroid/view/View;)Lcom/opera/android/sheet/OperaBottomSheetBehavior;

    move-result-object v0

    iget v2, v0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->q:I

    const/4 v3, 0x6

    if-eq v2, v3, :cond_18

    return-void

    :cond_18
    iget-object p0, p0, Lknh;->B:Lvl6;

    if-eqz p0, :cond_1d

    move-object v1, p0

    :cond_1d
    iget-boolean p0, v0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->f:Z

    if-eqz p0, :cond_23

    const/4 p0, -0x1

    goto :goto_25

    :cond_23
    iget p0, v0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->e:I

    :goto_25
    iget-object v0, v1, Lvl6;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;

    invoke-virtual {v0, p0}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->H(I)V

    const/4 p0, 0x4

    invoke-virtual {v0, p0}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->I(I)V

    iget-object p0, v1, Lvl6;->e:Ljava/lang/Object;

    check-cast p0, Landroidx/core/widget/NestedScrollView;

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v0}, Landroidx/core/widget/NestedScrollView;->scrollTo(II)V

    return-void
.end method

.method public final k(Ldgh;)V
    .registers 7

    iget-object p0, p0, Lr9g;->b:Ljava/lang/Object;

    check-cast p0, Landroidx/camera/view/PreviewView;

    sget v0, Landroidx/camera/view/PreviewView;->p:I

    instance-of v0, p1, Lgdo;

    if-eqz v0, :cond_4f

    iget-object p0, p0, Landroidx/camera/view/PreviewView;->h:Lycc;

    if-eqz p0, :cond_4f

    check-cast p1, Lgdo;

    iget p1, p1, Lgdo;->a:F

    invoke-virtual {p0}, Lycc;->j()Z

    move-result v0

    if-eqz v0, :cond_4f

    iget-boolean v0, p0, Lycc;->t:Z

    if-eqz v0, :cond_4f

    invoke-static {}, Lxug;->i()V

    iget-object v0, p0, Lycc;->w:Lhx5;

    invoke-virtual {v0}, Lhx5;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lodo;

    if-eqz v0, :cond_4f

    invoke-virtual {v0}, Lodo;->a()F

    move-result v1

    const/high16 v2, 0x3f800000    # 1.0f

    cmpl-float v3, p1, v2

    const/high16 v4, 0x40000000    # 2.0f

    if-lez v3, :cond_3a

    invoke-static {p1, v2, v4, v2}, Lv0g;->g(FFFF)F

    move-result p1

    goto :goto_3f

    :cond_3a
    sub-float p1, v2, p1

    mul-float/2addr p1, v4

    sub-float p1, v2, p1

    :goto_3f
    mul-float/2addr v1, p1

    iget p1, v0, Lodo;->b:F

    invoke-static {v1, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    iget v0, v0, Lodo;->c:F

    invoke-static {p1, v0}, Ljava/lang/Math;->min(FF)F

    move-result p1

    invoke-virtual {p0, p1}, Lycc;->n(F)Lcom/google/common/util/concurrent/ListenableFuture;

    :cond_4f
    return-void
.end method

.method public final onComplete(Lcom/google/android/gms/tasks/Task;)V
    .registers 9

    iget-byte v0, p0, Lr9g;->a:B

    const/4 v1, 0x1

    const/4 v2, 0x0

    iget-object p0, p0, Lr9g;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_b0

    check-cast p0, Lvgi;

    iget-object v0, p0, Lvgi;->d:Lx5f;

    sget-object v3, Lcom/opera/android/browser/SafeBrowsingBridge;->a:Lvgi;

    if-ne v3, p0, :cond_45

    sget-object v3, Lcom/opera/android/browser/SafeBrowsingBridge;->b:Ljava/util/ArrayDeque;

    sput-object v2, Lcom/opera/android/browser/SafeBrowsingBridge;->b:Ljava/util/ArrayDeque;

    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result p1

    if-eqz p1, :cond_24

    const/4 p1, 0x0

    iput-boolean p1, p0, Lvgi;->g:Z

    sget-object p0, Lvd0;->b:Lvd0;

    invoke-virtual {v0, p0}, Lx5f;->G0(Lvd0;)V

    goto :goto_2b

    :cond_24
    iput-boolean v1, p0, Lvgi;->g:Z

    sget-object p0, Lvd0;->d:Lvd0;

    invoke-virtual {v0, p0}, Lx5f;->G0(Lvd0;)V

    :goto_2b
    if-eqz v3, :cond_48

    invoke-virtual {v3}, Ljava/util/ArrayDeque;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_31
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_48

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lwgi;

    iget-object v0, p1, Lwgi;->a:Ljava/lang/String;

    iget-wide v1, p1, Lwgi;->b:J

    invoke-static {v0, v1, v2}, Lcom/opera/android/browser/SafeBrowsingBridge;->checkUrl(Ljava/lang/String;J)V

    goto :goto_31

    :cond_45
    invoke-virtual {p0}, Lvgi;->S()V

    :cond_48
    return-void

    :pswitch_49
    check-cast p0, Lsjh;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    iput-wide v3, p0, Lsjh;->p:J

    iget-wide v5, p0, Lsjh;->o:J

    sub-long/2addr v3, v5

    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-nez v0, :cond_87

    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    instance-of v0, p1, Ly1i;

    sget-object v5, Lw1i;->b:Lw1i;

    if-eqz v0, :cond_7c

    check-cast p1, Ly1i;

    invoke-virtual {p1}, Ly1i;->d()I

    move-result p1

    const/16 v0, -0x64

    if-eq p1, v0, :cond_7a

    const/4 v0, -0x2

    if-eq p1, v0, :cond_77

    const/4 v0, -0x1

    if-ne p1, v0, :cond_7c

    sget-object v5, Lu1i;->b:Lu1i;

    goto :goto_7c

    :cond_77
    sget-object v5, Lt1i;->b:Lt1i;

    goto :goto_7c

    :cond_7a
    sget-object v5, Ls1i;->b:Ls1i;

    :cond_7c
    :goto_7c
    iget-object p1, p0, Lsjh;->d:Lorm;

    iget-object v0, v5, Lx1i;->a:Ljava/lang/String;

    check-cast p1, Lx5f;

    const/16 v5, 0xb

    invoke-virtual {p1, v5, v0}, Lx5f;->R(ILjava/lang/String;)V

    :cond_87
    const-wide/16 v5, 0x3e8

    cmp-long p1, v3, v5

    if-gtz p1, :cond_af

    iget-object p1, p0, Lsjh;->n:Lcom/google/android/gms/tasks/Task;

    if-eqz p1, :cond_ac

    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isComplete()Z

    move-result p1

    if-ne p1, v1, :cond_ac

    iget-object p1, p0, Lsjh;->n:Lcom/google/android/gms/tasks/Task;

    if-eqz p1, :cond_ac

    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result p1

    if-ne p1, v1, :cond_ac

    iget-object p1, p0, Lsjh;->n:Lcom/google/android/gms/tasks/Task;

    if-eqz p1, :cond_ac

    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p1

    move-object v2, p1

    check-cast v2, Lz1i;

    :cond_ac
    invoke-virtual {p0, v2}, Lsjh;->b(Lz1i;)V

    :cond_af
    return-void

    :pswitch_data_b0
    .packed-switch 0xe
        :pswitch_49
    .end packed-switch
.end method

.method public final onSuccess(Ljava/lang/Object;)V
    .registers 2

    iget-object p0, p0, Lr9g;->b:Ljava/lang/Object;

    check-cast p0, Lveh;

    invoke-virtual {p0, p1}, Lveh;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final test(Ljava/lang/Object;)Z
    .registers 8

    iget-object p0, p0, Lr9g;->b:Ljava/lang/Object;

    check-cast p0, [Landroid/print/PageRange;

    check-cast p1, [Landroid/print/PageRange;

    array-length v0, p0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_45

    aget-object v0, p0, v1

    invoke-virtual {v0}, Landroid/print/PageRange;->getStart()I

    move-result v0

    if-nez v0, :cond_45

    aget-object p0, p0, v1

    invoke-virtual {p0}, Landroid/print/PageRange;->getEnd()I

    move-result p0

    const v0, 0x7fffffff

    if-ne p0, v0, :cond_45

    array-length p0, p1

    move v0, v1

    move v3, v0

    :goto_21
    if-ge v0, p0, :cond_33

    aget-object v4, p1, v0

    invoke-virtual {v4}, Landroid/print/PageRange;->getStart()I

    move-result v5

    if-ne v5, v3, :cond_45

    invoke-virtual {v4}, Landroid/print/PageRange;->getEnd()I

    move-result v3

    add-int/2addr v3, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_21

    :cond_33
    array-length p0, p1

    if-nez p0, :cond_38

    move p0, v1

    goto :goto_40

    :cond_38
    array-length p0, p1

    sub-int/2addr p0, v2

    aget-object p0, p1, p0

    invoke-virtual {p0}, Landroid/print/PageRange;->getEnd()I

    move-result p0

    :goto_40
    const/16 p1, 0x64

    if-ge p0, p1, :cond_45

    return v2

    :cond_45
    return v1
.end method
