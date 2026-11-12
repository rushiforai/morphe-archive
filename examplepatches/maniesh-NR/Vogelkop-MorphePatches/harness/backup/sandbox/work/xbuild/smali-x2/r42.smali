.class public final Lr42;
.super Lnjf;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lr42;->a:B

    iput-object p1, p0, Lr42;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final e()V
    .registers 1

    return-void
.end method

.method private final f()V
    .registers 1

    return-void
.end method

.method private final g()V
    .registers 1

    return-void
.end method

.method private final h()V
    .registers 1

    return-void
.end method

.method private final i()V
    .registers 1

    return-void
.end method

.method private final j(Landroid/view/View;F)V
    .registers 3

    return-void
.end method

.method private final k(Landroid/view/View;F)V
    .registers 3

    return-void
.end method

.method private final l(Landroid/view/View;F)V
    .registers 3

    return-void
.end method

.method private final m(Landroid/view/View;F)V
    .registers 3

    return-void
.end method


# virtual methods
.method public final b()V
    .registers 1

    iget-byte p0, p0, Lr42;->a:B

    return-void
.end method

.method public final c(Landroid/view/View;F)V
    .registers 3

    iget-byte p1, p0, Lr42;->a:B

    packed-switch p1, :pswitch_data_e

    :pswitch_5
    return-void

    :pswitch_6
    iget-object p0, p0, Lr42;->b:Ljava/lang/Object;

    check-cast p0, Lx79;

    invoke-virtual {p0}, Lx79;->O()V

    :pswitch_d
    return-void

    :pswitch_data_e
    .packed-switch 0x0
        :pswitch_d
        :pswitch_6
        :pswitch_5
        :pswitch_5
    .end packed-switch
.end method

.method public final d(I)V
    .registers 7

    iget-byte v0, p0, Lr42;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x3

    iget-object p0, p0, Lr42;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_6e

    check-cast p0, Lmqn;

    iget-object p0, p0, Lmqn;->U:Lkze;

    if-ne p1, v3, :cond_11

    move v1, v2

    :cond_11
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :pswitch_19
    check-cast p0, Lknh;

    iget-boolean v0, p0, Lknh;->H:Z

    const/4 v1, 0x0

    const/4 v4, 0x5

    if-eqz v0, :cond_2f

    const/4 v0, 0x4

    if-eq p1, v0, :cond_26

    if-ne p1, v4, :cond_48

    :cond_26
    iget-object p0, p0, Lknh;->B:Lvl6;

    if-eqz p0, :cond_2b

    move-object v1, p0

    :cond_2b
    invoke-virtual {v1}, Lvl6;->S()Z

    goto :goto_48

    :cond_2f
    if-eq p1, v3, :cond_40

    if-ne p1, v4, :cond_48

    iget-object p0, p0, Lknh;->B:Lvl6;

    if-eqz p0, :cond_38

    move-object v1, p0

    :cond_38
    iget-object p0, v1, Lvl6;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;

    invoke-virtual {p0, v3}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->I(I)V

    goto :goto_48

    :cond_40
    iput-boolean v2, p0, Lknh;->H:Z

    invoke-virtual {p0}, Lknh;->J0()V

    invoke-virtual {p0}, Lknh;->I0()V

    :cond_48
    :goto_48
    return-void

    :pswitch_49
    check-cast p0, Llrc;

    iget-object p0, p0, Llrc;->D:Lkze;

    if-ne p1, v3, :cond_50

    move v1, v2

    :cond_50
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :pswitch_58
    check-cast p0, Lx79;

    invoke-virtual {p0}, Lx79;->O()V

    return-void

    :pswitch_5e
    check-cast p0, Lt42;

    iget-object p0, p0, Lt42;->K:Lkze;

    if-ne p1, v3, :cond_65

    move v1, v2

    :cond_65
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    nop

    :pswitch_data_6e
    .packed-switch 0x0
        :pswitch_5e
        :pswitch_58
        :pswitch_49
        :pswitch_19
    .end packed-switch
.end method
