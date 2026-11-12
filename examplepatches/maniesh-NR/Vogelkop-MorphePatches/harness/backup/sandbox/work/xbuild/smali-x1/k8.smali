.class public abstract Lk8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lbvl;
.implements Lw7e;


# instance fields
.field public a:Ljava/lang/Object;

.field public b:Ljava/lang/Object;


# direct methods
.method public constructor <init>(B)V
    .registers 2

    sparse-switch p1, :sswitch_data_3c

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x2

    new-array p1, p1, [I

    iput-object p1, p0, Lk8;->b:Ljava/lang/Object;

    return-void

    :sswitch_c
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lk8;->a:Ljava/lang/Object;

    new-instance p1, Lh7f;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lk8;->b:Ljava/lang/Object;

    return-void

    :sswitch_1e
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x1

    invoke-static {p1}, Lc26;->j(I)Lbf2;

    move-result-object p1

    iput-object p1, p0, Lk8;->a:Ljava/lang/Object;

    new-instance p1, Lcd5;

    invoke-direct {p1}, Lcd5;-><init>()V

    iput-object p1, p0, Lk8;->b:Ljava/lang/Object;

    return-void

    :sswitch_30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lk8;->a:Ljava/lang/Object;

    return-void

    nop

    :sswitch_data_3c
    .sparse-switch
        0x6 -> :sswitch_30
        0x9 -> :sswitch_1e
        0xd -> :sswitch_c
    .end sparse-switch
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 2

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    iput-object p1, p0, Lk8;->a:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6

    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    sget-object v0, Lvml;->d:Lumi;

    const/4 v1, 0x0

    new-array v1, v1, [Lbg1;

    invoke-static {p1, v0, p2, v1}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    iput-object p1, p0, Lk8;->b:Ljava/lang/Object;

    .line 74
    iput-object p3, p0, Lk8;->a:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lpro;)V
    .registers 4

    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lk8;->a:Ljava/lang/Object;

    new-instance p1, Lm53;

    const/4 v0, 0x5

    invoke-direct {p1, p0, p2, v0}, Lm53;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lk8;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;Lcrk;)V
    .registers 4

    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    iput-object p1, p0, Lk8;->a:Ljava/lang/Object;

    .line 78
    iput-object p2, p0, Lk8;->b:Ljava/lang/Object;

    .line 79
    new-instance p2, Lh4i;

    const/16 v0, 0x18

    invoke-direct {p2, p0, v0}, Lh4i;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;)V
    .registers 2

    .line 75
    iput-object p1, p0, Lk8;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3

    .line 60
    iput-object p1, p0, Lk8;->a:Ljava/lang/Object;

    iput-object p2, p0, Lk8;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 4

    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    new-instance v0, Lay;

    const/4 v1, 0x5

    invoke-direct {v0, p0, v1}, Lay;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lk8;->b:Ljava/lang/Object;

    .line 64
    iput-object p1, p0, Lk8;->a:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Luul;)V
    .registers 4

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    iput-object p1, p0, Lk8;->a:Ljava/lang/Object;

    .line 67
    new-instance p1, Lpde;

    new-instance v0, Lzul;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1}, Lzul;-><init>(II)V

    .line 68
    invoke-direct {p1, v0}, Lekc;-><init>(Ljava/lang/Object;)V

    .line 69
    iput-object p1, p0, Lk8;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final D(Lzul;)V
    .registers 9

    iget-object v0, p0, Lk8;->b:Ljava/lang/Object;

    check-cast v0, Lpde;

    invoke-static {v0, p1}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    iget-object v0, p0, Lk8;->a:Ljava/lang/Object;

    check-cast v0, Luul;

    invoke-interface {p0}, Lbvl;->getState()Lpde;

    move-result-object p0

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lavl;

    iget p0, p0, Lavl;->d:I

    iget-object p0, v0, Luul;->j:Lcom/opera/android/bar/TopToolbarContainer;

    iget-object v1, v0, Luul;->j:Lcom/opera/android/bar/TopToolbarContainer;

    iget-object v2, v0, Lz43;->i:Ljava/lang/Object;

    check-cast v2, Lgbf;

    iget-object v3, v2, Lgbf;->j:Lvbf;

    invoke-virtual {v3}, Lvbf;->p()Z

    move-result v3

    if-nez v3, :cond_81

    iget v3, p1, Lzul;->a:I

    iget p1, p1, Lzul;->b:I

    invoke-virtual {p0}, Landroid/view/View;->getTranslationY()F

    move-result v4

    float-to-int v4, v4

    int-to-float v5, v3

    invoke-virtual {v1}, Landroid/view/View;->getTranslationY()F

    move-result v6

    cmpl-float v6, v5, v6

    if-eqz v6, :cond_54

    invoke-virtual {v1, v5}, Landroid/view/View;->setTranslationY(F)V

    iget-object v0, v0, Lz43;->h:Ljava/lang/Object;

    check-cast v0, Li7f;

    invoke-static {v0, v0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object v0

    :goto_44
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_54

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ly43;

    invoke-interface {v6, v5}, Ly43;->p(F)V

    goto :goto_44

    :cond_54
    iput v3, p0, Lcom/opera/android/bar/TopToolbarContainer;->e:I

    iput p1, p0, Lcom/opera/android/bar/TopToolbarContainer;->f:I

    invoke-virtual {p0}, Lcom/opera/android/bar/TopToolbarContainer;->b()V

    if-eqz v3, :cond_5f

    const/4 p0, 0x4

    goto :goto_60

    :cond_5f
    const/4 p0, 0x0

    :goto_60
    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result p1

    if-eq p0, p1, :cond_69

    invoke-virtual {v1, p0}, Landroid/view/View;->setVisibility(I)V

    :cond_69
    if-eq v3, v4, :cond_81

    iget-object p0, v2, Lgbf;->p:Li7f;

    invoke-static {p0, p0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p0

    :goto_71
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_81

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcz3;

    invoke-interface {p1}, Lcz3;->a()V

    goto :goto_71

    :cond_81
    return-void
.end method

.method public final G()V
    .registers 2

    iget-object p0, p0, Lk8;->a:Ljava/lang/Object;

    check-cast p0, Luul;

    iget-object v0, p0, Lz43;->f:Ljava/lang/Object;

    check-cast v0, Lv43;

    iget-object p0, p0, Lz43;->c:Ljava/lang/Object;

    check-cast p0, Lk6l;

    iget-object p0, p0, Lk6l;->o:Lb2l;

    invoke-virtual {v0, p0}, Lv43;->c(Lb2l;)V

    return-void
.end method

.method public final H()Lyoo;
    .registers 1

    iget-object p0, p0, Lk8;->b:Ljava/lang/Object;

    check-cast p0, Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lyoo;

    return-object p0
.end method

.method public final I()V
    .registers 1

    invoke-virtual {p0}, Lk8;->H()Lyoo;

    move-result-object p0

    invoke-virtual {p0}, Lpxo;->c()V

    return-void
.end method

.method public final J(Lcn;)V
    .registers 6

    invoke-virtual {p0}, Lk8;->H()Lyoo;

    move-result-object v0

    new-instance v1, Lesg;

    const/16 v2, 0x12

    const/4 v3, 0x0

    invoke-direct {v1, v2, p1, p0, v3}, Lesg;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Luuj;

    invoke-direct {p0, v1}, Luuj;-><init>(Lroo;)V

    iput-object p0, v0, Lpxo;->c:Luuj;

    return-void
.end method

.method public final K(Landroid/content/Context;Lvm;)V
    .registers 5

    sget-object v0, Lfko;->a:Lejo;

    invoke-static {p1}, Lfko;->a(Landroid/content/Context;)V

    invoke-virtual {p0}, Lk8;->H()Lyoo;

    move-result-object v0

    invoke-virtual {v0}, Lpxo;->d()Z

    move-result v0

    if-eqz v0, :cond_1d

    new-instance p0, Lcm;

    const/16 p1, 0x67

    const/4 v0, 0x0

    const-string v1, "Ad is invalid or expired!"

    invoke-direct {p0, p1, v1, v0}, Lcm;-><init>(ILjava/lang/String;B)V

    invoke-interface {p2, p0}, Lvm;->C(Lcm;)V

    return-void

    :cond_1d
    instance-of v0, p0, Lm4b;

    const/4 v1, 0x0

    if-eqz v0, :cond_26

    move-object v0, p0

    check-cast v0, Lm4b;

    goto :goto_27

    :cond_26
    move-object v0, v1

    :goto_27
    if-eqz v0, :cond_30

    new-instance v1, Li06;

    const/16 v0, 0xe

    invoke-direct {v1, v0}, Li06;-><init>(B)V

    :cond_30
    invoke-virtual {p0}, Lk8;->H()Lyoo;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lh4m;

    invoke-direct {v0, p0, p1, v1, p2}, Lh4m;-><init>(Lyoo;Landroid/content/Context;Li06;Lvm;)V

    sget-boolean p0, Lfko;->c:Z

    if-eqz p0, :cond_44

    invoke-virtual {v0}, Lh4m;->run()V

    return-void

    :cond_44
    invoke-static {v0}, Lpfp;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final L()V
    .registers 3

    iget-object v0, p0, Lk8;->a:Ljava/lang/Object;

    check-cast v0, Lup1;

    if-eqz v0, :cond_12

    :try_start_6
    iget-object v1, p0, Lk8;->b:Ljava/lang/Object;

    check-cast v1, Lxp1;

    iget-object v1, v1, Lxp1;->k:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_f
    .catch Ljava/lang/IllegalArgumentException; {:try_start_6 .. :try_end_f} :catch_f

    :catch_f
    const/4 v0, 0x0

    iput-object v0, p0, Lk8;->a:Ljava/lang/Object;

    :cond_12
    return-void
.end method

.method public abstract M()Landroid/content/IntentFilter;
.end method

.method public final N()V
    .registers 1

    invoke-virtual {p0}, Lk8;->q0()V

    return-void
.end method

.method public final O()V
    .registers 4

    iget-object v0, p0, Lk8;->a:Ljava/lang/Object;

    check-cast v0, Lbf2;

    sget-object v1, Lbf2;->b:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->decrementAndGet(Ljava/lang/Object;)I

    move-result v0

    if-nez v0, :cond_21

    iget-object v0, p0, Lk8;->b:Ljava/lang/Object;

    check-cast v0, Lcd5;

    new-instance v1, Louf;

    const/4 v2, 0x2

    invoke-direct {v1, v2}, Louf;-><init>(I)V

    new-instance v2, Lmuf;

    invoke-direct {v2, v1}, Lmuf;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v2}, Lxob;->j0(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lk8;->j0()V

    :cond_21
    return-void
.end method

.method public P()V
    .registers 4

    invoke-virtual {p0}, Lk8;->H()Lyoo;

    move-result-object p0

    iget-object v0, p0, Lpxo;->e:Lbap;

    new-instance v1, Lmmo;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lmmo;-><init>(Lyoo;B)V

    invoke-virtual {v0, v1}, Lbap;->c(Lkotlin/jvm/functions/Function1;)Lbap;

    move-result-object v0

    iput-object v0, p0, Lpxo;->e:Lbap;

    return-void
.end method

.method public final Q(Ljava/lang/Object;)V
    .registers 4

    iget-object v0, p0, Lk8;->a:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_d

    iput-object p1, p0, Lk8;->b:Ljava/lang/Object;

    return-void

    :cond_d
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p0

    const/4 p1, 0x0

    :cond_12
    if-ge p1, p0, :cond_1f

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    add-int/lit8 p1, p1, 0x1

    if-eqz v1, :cond_12

    invoke-static {}, Lh9o;->t()V

    :cond_1f
    return-void
.end method

.method public abstract R(I)[I
.end method

.method public abstract S()I
.end method

.method public abstract T(I)Landroid/graphics/Rect;
.end method

.method public final U(Landroid/view/MenuItem;)Landroid/view/MenuItem;
    .registers 4

    instance-of v0, p1, Lmsk;

    if-eqz v0, :cond_2d

    check-cast p1, Lmsk;

    iget-object v0, p0, Lk8;->b:Ljava/lang/Object;

    check-cast v0, Lhkj;

    if-nez v0, :cond_14

    new-instance v0, Lhkj;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lhkj;-><init>(I)V

    iput-object v0, p0, Lk8;->b:Ljava/lang/Object;

    :cond_14
    invoke-virtual {v0, p1}, Lhkj;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/MenuItem;

    if-nez v0, :cond_2c

    new-instance v0, Lvtd;

    iget-object v1, p0, Lk8;->a:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    invoke-direct {v0, v1, p1}, Lvtd;-><init>(Landroid/content/Context;Lmsk;)V

    iget-object p0, p0, Lk8;->b:Ljava/lang/Object;

    check-cast p0, Lhkj;

    invoke-virtual {p0, p1, v0}, Lhkj;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2c
    return-object v0

    :cond_2d
    return-object p1
.end method

.method public final V(II)[I
    .registers 4

    if-ltz p1, :cond_11

    if-ltz p2, :cond_11

    if-eq p1, p2, :cond_11

    iget-object p0, p0, Lk8;->b:Ljava/lang/Object;

    check-cast p0, [I

    const/4 v0, 0x0

    aput p1, p0, v0

    const/4 p1, 0x1

    aput p2, p0, p1

    return-object p0

    :cond_11
    const/4 p0, 0x0

    return-object p0
.end method

.method public W()I
    .registers 1

    const/4 p0, 0x2

    return p0
.end method

.method public final X()Z
    .registers 3

    iget-object v0, p0, Lk8;->b:Ljava/lang/Object;

    check-cast v0, Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    iget-object p0, p0, Lk8;->a:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    const/4 v1, 0x0

    invoke-interface {v0, p0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method public abstract Y(Lmq;)Z
.end method

.method public final Z(I)Z
    .registers 6

    iget-object v0, p0, Lk8;->b:Ljava/lang/Object;

    check-cast v0, Landroidx/recyclerview/widget/GridLayoutManager;

    iget-object p0, p0, Lk8;->a:Ljava/lang/Object;

    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;

    iget-object p0, p0, Landroidx/recyclerview/widget/RecyclerView;->m:Landroidx/recyclerview/widget/d;

    if-eqz p0, :cond_25

    invoke-virtual {p0}, Landroidx/recyclerview/widget/d;->getItemCount()I

    move-result p0

    const/4 v1, 0x1

    sub-int/2addr p0, v1

    iget-object v2, v0, Landroidx/recyclerview/widget/GridLayoutManager;->g:Ltx7;

    iget v3, v0, Landroidx/recyclerview/widget/GridLayoutManager;->b:I

    invoke-virtual {v2, p1, v3}, Ltx7;->d(II)I

    move-result p1

    iget-object v2, v0, Landroidx/recyclerview/widget/GridLayoutManager;->g:Ltx7;

    iget v0, v0, Landroidx/recyclerview/widget/GridLayoutManager;->b:I

    invoke-virtual {v2, p0, v0}, Ltx7;->d(II)I

    move-result p0

    if-ne p1, p0, :cond_25

    return v1

    :cond_25
    const/4 p0, 0x0

    return p0
.end method

.method public final a(Lkotlin/jvm/functions/Function1;Lnt5;)Ljava/lang/Object;
    .registers 7

    iget-object v0, p0, Lk8;->a:Ljava/lang/Object;

    check-cast v0, Lads_mobile_sdk/qr0;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    sget-object v2, Lads_mobile_sdk/fo;->a:Lads_mobile_sdk/fo;

    const-string v3, "gads:call_all_methods_on_ui_thread:enabled"

    invoke-virtual {v0, v3, v1, v2}, Lads_mobile_sdk/ov;->a(Ljava/lang/String;Ljava/lang/Object;Lkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_29

    iget-object p0, p0, Lk8;->b:Ljava/lang/Object;

    check-cast p0, Lkotlin/coroutines/CoroutineContext;

    new-instance v0, Lwc2;

    const/4 v1, 0x0

    const/4 v2, 0x4

    invoke-direct {v0, p1, v1, v2}, Lwc2;-><init>(Lkotlin/jvm/functions/Function1;Lmt5;B)V

    invoke-static {p0, v0, p2}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :cond_29
    invoke-interface {p1, p2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final a0()Z
    .registers 1

    iget-object p0, p0, Lk8;->b:Ljava/lang/Object;

    check-cast p0, Lay;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0
.end method

.method public final b0()Z
    .registers 2

    iget-object p0, p0, Lk8;->b:Ljava/lang/Object;

    check-cast p0, Landroidx/recyclerview/widget/GridLayoutManager;

    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->getOrientation()I

    move-result p0

    const/4 v0, 0x1

    if-ne p0, v0, :cond_c

    return v0

    :cond_c
    const/4 p0, 0x0

    return p0
.end method

.method public final c0()V
    .registers 2

    iget-object p0, p0, Lk8;->b:Ljava/lang/Object;

    check-cast p0, Lh7f;

    new-instance v0, Lg7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Lh7f;)V

    :goto_9
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_19

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Li21;

    invoke-virtual {p0}, Li21;->a()V

    goto :goto_9

    :cond_19
    return-void
.end method

.method public d0(Lmq;)V
    .registers 2

    return-void
.end method

.method public abstract e0()V
.end method

.method public abstract f0(Lmq;)V
.end method

.method public g0(Lmq;)V
    .registers 11

    iget-object v0, p0, Lk8;->a:Ljava/lang/Object;

    move-object v1, v0

    check-cast v1, Lx5f;

    invoke-virtual {p0, p1}, Lk8;->Y(Lmq;)Z

    move-result v0

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v0, :cond_54

    iget-object p0, p1, Lmq;->c:Ldl;

    iget-object p1, p0, Ldl;->b:Lq50;

    iget-object p0, p0, Ldl;->c:Ljava/lang/String;

    iget-boolean v0, v1, Lx5f;->h:Z

    if-eqz v0, :cond_87

    iget-object v0, v1, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v4

    new-instance v5, Lj80;

    const/4 v6, -0x1

    const/4 v7, 0x2

    const/16 v8, 0x98b

    invoke-direct {v5, v8, v6, v7}, Ljf0;-><init>(III)V

    invoke-virtual {v5, v2, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v5, v3, v3, p0}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v4, v0}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object p0

    invoke-virtual {p0, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    if-eqz p1, :cond_44

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_44

    new-instance v0, Lhf0;

    invoke-direct {v0, p0, v3, p1}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_4d

    :cond_44
    invoke-static {p0, v3, v3}, Lvep;->t(Lqd0;II)Ljava/util/ArrayList;

    move-result-object p1

    new-instance v0, Lhf0;

    invoke-direct {v0, p0, v3, p1}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_4d
    invoke-virtual {v0, v5}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v1, v4}, Lx5f;->U0(Lx56;)V

    return-void

    :cond_54
    instance-of v0, p1, Lno;

    if-eqz v0, :cond_87

    invoke-virtual {p1}, Lmq;->j()Z

    move-result v0

    if-nez v0, :cond_87

    check-cast p1, Lno;

    iget-object v0, p1, Lmq;->g:Lkm;

    iget-object v4, p1, Lmq;->c:Ldl;

    invoke-interface {v0, v4}, Lkm;->c(Ldl;)V

    iget-object p0, p0, Lk8;->b:Ljava/lang/Object;

    check-cast p0, Lf5k;

    if-eqz p0, :cond_74

    iget-object p0, p0, Lf5k;->a:Lk5k;

    iget-boolean v2, p0, Lk5k;->h:Z

    move v6, v2

    move v5, v3

    goto :goto_76

    :cond_74
    move v5, v2

    move v6, v5

    :goto_76
    iget-object p0, p1, Lno;->p:Lbz;

    iget-object v2, v4, Ldl;->b:Lq50;

    iget-object v3, v4, Ldl;->c:Ljava/lang/String;

    invoke-interface {p0}, Lbz;->i()I

    move-result v4

    invoke-interface {p0}, Lbz;->b()Ls50;

    move-result-object v7

    invoke-virtual/range {v1 .. v7}, Lx5f;->s(Lq50;Ljava/lang/String;IZZLs50;)V

    :cond_87
    return-void
.end method

.method public final getOffset()Lpde;
    .registers 1

    iget-object p0, p0, Lk8;->b:Ljava/lang/Object;

    check-cast p0, Lpde;

    return-object p0
.end method

.method public abstract h0(I)[I
.end method

.method public abstract i0(Lqim;Lyo7;)V
.end method

.method public isEnabled()Z
    .registers 1

    sget-object p0, Lowe;->c:Lowe;

    iget-object p0, p0, Lowe;->a:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result p0

    return p0
.end method

.method public j0()V
    .registers 1

    return-void
.end method

.method public abstract k0(Z)V
.end method

.method public final l0()V
    .registers 4

    invoke-virtual {p0}, Lk8;->L()V

    invoke-virtual {p0}, Lk8;->M()Landroid/content/IntentFilter;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/IntentFilter;->countActions()I

    move-result v1

    if-nez v1, :cond_e

    return-void

    :cond_e
    iget-object v1, p0, Lk8;->a:Ljava/lang/Object;

    check-cast v1, Lup1;

    if-nez v1, :cond_1c

    new-instance v1, Lup1;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lup1;-><init>(Ljava/lang/Object;B)V

    iput-object v1, p0, Lk8;->a:Ljava/lang/Object;

    :cond_1c
    iget-object p0, p0, Lk8;->b:Ljava/lang/Object;

    check-cast p0, Lxp1;

    iget-object p0, p0, Lxp1;->k:Landroid/content/Context;

    invoke-virtual {p0, v1, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    return-void
.end method

.method public m0()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public n0(Li21;)V
    .registers 2

    iget-object p0, p0, Lk8;->b:Ljava/lang/Object;

    check-cast p0, Lh7f;

    invoke-virtual {p0, p1}, Lh7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public o0()V
    .registers 1

    iget-object p0, p0, Lk8;->b:Ljava/lang/Object;

    check-cast p0, Lh7f;

    invoke-virtual {p0}, Lh7f;->clear()V

    return-void
.end method

.method public final onViewDetachedFromWindow(Landroid/view/View;)V
    .registers 2

    invoke-virtual {p0}, Lk8;->c0()V

    return-void
.end method

.method public abstract p0(Lmq;)V
.end method

.method public q0()V
    .registers 1

    return-void
.end method

.method public r0(Lqrl;)V
    .registers 2

    invoke-virtual {p1}, Lqrl;->run()V

    return-void
.end method

.method public final w(Ld5o;)Lv7e;
    .registers 6

    new-instance v0, Leeh;

    iget-object v1, p0, Lk8;->a:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    iget-object p0, p0, Lk8;->b:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Class;

    const-class v2, Ljava/io/File;

    invoke-virtual {p1, v2, p0}, Ld5o;->r(Ljava/lang/Class;Ljava/lang/Class;)Lv7e;

    move-result-object v2

    const-class v3, Landroid/net/Uri;

    invoke-virtual {p1, v3, p0}, Ld5o;->r(Ljava/lang/Class;Ljava/lang/Class;)Lv7e;

    move-result-object p1

    invoke-direct {v0, v1, v2, p1, p0}, Leeh;-><init>(Landroid/content/Context;Lv7e;Lv7e;Ljava/lang/Class;)V

    return-object v0
.end method
