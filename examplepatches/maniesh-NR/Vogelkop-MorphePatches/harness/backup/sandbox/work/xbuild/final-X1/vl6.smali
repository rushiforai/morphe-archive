.class public final Lvl6;
.super Llim;
.source "SourceFile"


# static fields
.field public static f:Lvl6;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;

.field public final c:Ljava/lang/Object;

.field public final d:Ljava/lang/Object;

.field public e:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroidx/core/widget/NestedScrollView;ILnj8;)V
    .registers 7

    const/4 v0, 0x1

    iput-byte v0, p0, Lvl6;->a:B

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    invoke-static {p1}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->C(Landroid/view/View;)Lcom/opera/android/sheet/OperaBottomSheetBehavior;

    move-result-object v0

    iput-object v0, p0, Lvl6;->b:Ljava/lang/Object;

    .line 73
    invoke-virtual {v0, p2}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->I(I)V

    .line 74
    iput-object p3, p0, Lvl6;->c:Ljava/lang/Object;

    .line 75
    new-instance p2, Lmj8;

    new-instance v1, Ldg7;

    const/16 v2, 0xa

    invoke-direct {v1, p0, v2}, Ldg7;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p2, p3, v1}, Lmj8;-><init>(Lnj8;Ldg7;)V

    iput-object p2, p0, Lvl6;->d:Ljava/lang/Object;

    .line 76
    iput-object p1, p0, Lvl6;->e:Ljava/lang/Object;

    .line 77
    invoke-virtual {v0, p2}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->x(Lnjf;)V

    .line 78
    iget p0, v0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->q:I

    .line 79
    invoke-virtual {p2, p0}, Lmj8;->d(I)V

    return-void
.end method

.method public constructor <init>(Lfp1;Lu85;Ljava/lang/String;)V
    .registers 14

    const/4 v0, 0x3

    iput-byte v0, p0, Lvl6;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lvl6;->b:Ljava/lang/Object;

    iput-object p1, p0, Lvl6;->c:Ljava/lang/Object;

    iput-object p3, p0, Lvl6;->d:Ljava/lang/Object;

    new-instance v8, Lvdf;

    const/16 p3, 0x12

    invoke-direct {v8, p0, p3}, Lvdf;-><init>(Ljava/lang/Object;B)V

    new-instance v9, Lo8f;

    const/16 p3, 0xf

    invoke-direct {v9, p0, p3}, Lo8f;-><init>(Ljava/lang/Object;B)V

    new-instance v1, Lu85;

    iget-object v2, p2, Lu85;->d:Landroid/content/Context;

    iget-object p3, p2, Lu85;->e:Ljava/lang/Object;

    move-object v3, p3

    check-cast v3, Lr0k;

    iget v4, p2, Lu85;->b:I

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-direct/range {v1 .. v9}, Lu85;-><init>(Landroid/content/Context;Lr0k;ILgdb;Lndc;ILjava/lang/Runnable;Lcom/opera/api/Callback;)V

    invoke-virtual {p2}, Lu85;->c()V

    iput-object v1, p0, Lvl6;->e:Ljava/lang/Object;

    invoke-virtual {p1}, Lxd5;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->a(Lmdc;)V

    sput-object p0, Lvl6;->f:Lvl6;

    return-void
.end method

.method public constructor <init>(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V
    .registers 6

    const/4 v0, 0x2

    iput-byte v0, p0, Lvl6;->a:B

    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    iput-object p1, p0, Lvl6;->b:Ljava/lang/Object;

    iput-object p2, p0, Lvl6;->c:Ljava/lang/Object;

    iput-object p3, p0, Lvl6;->d:Ljava/lang/Object;

    iput-object p4, p0, Lvl6;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lumi;Lru9;Lcom/opera/android/Lazy;)V
    .registers 5

    const/4 v0, 0x0

    iput-byte v0, p0, Lvl6;->a:B

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    iput-object p1, p0, Lvl6;->b:Ljava/lang/Object;

    .line 69
    iput-object p2, p0, Lvl6;->c:Ljava/lang/Object;

    .line 70
    iput-object p3, p0, Lvl6;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lwv1;Lk3i;Lj4c;)V
    .registers 5

    const/4 v0, 0x4

    iput-byte v0, p0, Lvl6;->a:B

    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    iput-object p1, p0, Lvl6;->b:Ljava/lang/Object;

    .line 64
    iput-object p2, p0, Lvl6;->c:Ljava/lang/Object;

    .line 65
    iput-object p3, p0, Lvl6;->d:Ljava/lang/Object;

    .line 66
    new-instance p1, Lq3i;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lq3i;-><init>(Llim;B)V

    iput-object p1, p0, Lvl6;->e:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final R()V
    .registers 2

    iget-object v0, p0, Lvl6;->c:Ljava/lang/Object;

    check-cast v0, Lfp1;

    invoke-virtual {v0}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v0

    invoke-virtual {v0, p0}, Ltcc;->b(Lmdc;)V

    sget-object v0, Lvl6;->f:Lvl6;

    if-ne v0, p0, :cond_12

    const/4 p0, 0x0

    sput-object p0, Lvl6;->f:Lvl6;

    :cond_12
    return-void
.end method

.method public final S()Z
    .registers 3

    iget-object p0, p0, Lvl6;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;

    iget-boolean v0, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->n:Z

    if-eqz v0, :cond_a

    const/4 v0, 0x6

    goto :goto_b

    :cond_a
    const/4 v0, 0x4

    :goto_b
    iget v1, p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->q:I

    if-ne v1, v0, :cond_11

    const/4 p0, 0x0

    return p0

    :cond_11
    invoke-virtual {p0, v0}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->I(I)V

    const/4 p0, 0x1

    return p0
.end method

.method public final W(Lndc;)V
    .registers 5

    iget-byte v0, p0, Lvl6;->a:B

    packed-switch v0, :pswitch_data_28

    :pswitch_5
    return-void

    :pswitch_6
    iget-object v0, p0, Lvl6;->c:Ljava/lang/Object;

    check-cast v0, Lk3i;

    invoke-virtual {v0}, Lk3i;->a()Likc;

    move-result-object v0

    new-instance v1, Lrmg;

    const/16 v2, 0x15

    invoke-direct {v1, p0, v2}, Lrmg;-><init>(Ljava/lang/Object;B)V

    new-instance p0, Liwa;

    const/16 v2, 0x1b

    invoke-direct {p0, v1, v2}, Liwa;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, p1, p0}, Lekc;->j(Lndc;Lf7f;)V

    return-void

    :pswitch_20
    iget-object p0, p0, Lvl6;->b:Ljava/lang/Object;

    check-cast p0, Lkotlin/jvm/functions/Function1;

    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_data_28
    .packed-switch 0x2
        :pswitch_20
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method

.method public final onDestroy(Lndc;)V
    .registers 6

    iget-byte v0, p0, Lvl6;->a:B

    iget-object v1, p0, Lvl6;->d:Ljava/lang/Object;

    iget-object v2, p0, Lvl6;->b:Ljava/lang/Object;

    const/4 v3, 0x0

    packed-switch v0, :pswitch_data_62

    invoke-super {p0, p1}, Llim;->onDestroy(Lndc;)V

    return-void

    :pswitch_e
    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    iget-object p1, p0, Lvl6;->e:Ljava/lang/Object;

    check-cast p1, Lu85;

    if-eqz p1, :cond_20

    invoke-virtual {p1}, Lu85;->c()V

    iput-object v3, p0, Lvl6;->e:Ljava/lang/Object;

    :cond_20
    sget-object p1, Lvl6;->f:Lvl6;

    if-ne p1, p0, :cond_26

    sput-object v3, Lvl6;->f:Lvl6;

    :cond_26
    check-cast v2, Landroid/content/Context;

    check-cast v1, Ljava/lang/String;

    invoke-static {v2, v1}, Lwwc;->i(Landroid/content/Context;Ljava/lang/String;)V

    return-void

    :pswitch_2e
    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object v0

    invoke-virtual {v0, p0}, Ltcc;->b(Lmdc;)V

    iget-object p0, p0, Lvl6;->c:Ljava/lang/Object;

    check-cast p0, Lkotlin/jvm/functions/Function1;

    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_3d
    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    check-cast v2, Lcom/opera/android/sheet/OperaBottomSheetBehavior;

    check-cast v1, Lmj8;

    iget-object p0, v2, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->A:Ljava/util/ArrayList;

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    return-void

    :pswitch_4e
    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    iget-object p1, p0, Lvl6;->e:Ljava/lang/Object;

    check-cast p1, Loml;

    if-eqz p1, :cond_5f

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Loml;->cancel(Z)Z

    :cond_5f
    iput-object v3, p0, Lvl6;->e:Ljava/lang/Object;

    return-void

    :pswitch_data_62
    .packed-switch 0x0
        :pswitch_4e
        :pswitch_3d
        :pswitch_2e
        :pswitch_e
    .end packed-switch
.end method

.method public final onPause(Lndc;)V
    .registers 3

    iget-byte v0, p0, Lvl6;->a:B

    packed-switch v0, :pswitch_data_e

    return-void

    :pswitch_6
    iget-object p0, p0, Lvl6;->d:Ljava/lang/Object;

    check-cast p0, Lkotlin/jvm/functions/Function1;

    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_data_e
    .packed-switch 0x2
        :pswitch_6
    .end packed-switch
.end method

.method public final onResume(Lndc;)V
    .registers 5

    iget-byte v0, p0, Lvl6;->a:B

    packed-switch v0, :pswitch_data_54

    :pswitch_5
    return-void

    :pswitch_6
    iget-object p0, p0, Lvl6;->e:Ljava/lang/Object;

    check-cast p0, Lkotlin/jvm/functions/Function1;

    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_e
    iget-object v0, p0, Lvl6;->c:Ljava/lang/Object;

    check-cast v0, Lru9;

    iget-object v0, v0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v1, "default_browser.first_set.timestamp"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_24

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    goto :goto_52

    :cond_24
    iget-object p1, p0, Lvl6;->b:Ljava/lang/Object;

    check-cast p1, Lumi;

    iget-object v0, p0, Lvl6;->e:Ljava/lang/Object;

    check-cast v0, Loml;

    if-nez v0, :cond_52

    new-instance v0, Lul6;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lul6;-><init>(Lvl6;B)V

    invoke-virtual {p1, v0}, Lumi;->e(Ln5o;)Lnml;

    move-result-object v0

    new-instance v1, Lul6;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Lul6;-><init>(Lvl6;B)V

    invoke-virtual {p1, v1}, Lumi;->f(Ln5o;)Lnml;

    move-result-object p1

    invoke-virtual {v0, p1}, Lnml;->b(Lnml;)V

    new-instance p1, Loml;

    invoke-direct {p1, v0}, Loml;-><init>(Lnml;)V

    iput-object p1, p0, Lvl6;->e:Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    const/4 v0, 0x0

    invoke-virtual {p1, p0, v0}, Loml;->a(Ljava/lang/Object;Ljri;)V

    :cond_52
    :goto_52
    return-void

    nop

    :pswitch_data_54
    .packed-switch 0x0
        :pswitch_e
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method
