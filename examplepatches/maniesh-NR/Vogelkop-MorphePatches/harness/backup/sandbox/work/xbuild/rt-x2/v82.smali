.class public final Lv82;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw82;


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/Object;


# direct methods
.method public constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lv82;->a:B

    packed-switch p1, :pswitch_data_14

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lv82;->b:Ljava/lang/Object;

    return-void

    :pswitch_10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void

    :pswitch_data_14
    .packed-switch 0x1
        :pswitch_10
    .end packed-switch
.end method

.method public constructor <init>(Lxw8;)V
    .registers 3

    const/4 v0, 0x2

    iput-byte v0, p0, Lv82;->a:B

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lv82;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a(Lc53;)V
    .registers 5

    iget-byte v0, p0, Lv82;->a:B

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_64

    iget-object p0, p0, Lv82;->b:Ljava/lang/Object;

    check-cast p0, Lxw8;

    iget-object v0, p0, Lxw8;->s:Lqie;

    iget-object v0, v0, Lqie;->b:Ljava/lang/Object;

    check-cast v0, Lc5k;

    iget-object v0, v0, Lc5k;->n:Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;

    invoke-virtual {v0, v1, v1}, Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;->c(ZZ)V

    iget-object v0, p0, Lxw8;->m:Lvu8;

    const/4 v2, 0x1

    iput-boolean v2, v0, Lvu8;->f:Z

    iput-boolean v1, v0, Lvu8;->g:Z

    invoke-virtual {v0}, Lvu8;->t()V

    iget-object p0, p0, Lxw8;->n:Luv8;

    if-eqz p0, :cond_42

    iget-object v0, p1, Lc53;->b:Loqe;

    if-eqz v0, :cond_2e

    invoke-virtual {p1}, Lc53;->b()Z

    move-result p1

    if-nez p1, :cond_2e

    move v1, v2

    :cond_2e
    iget-boolean p1, p0, Luv8;->e:Z

    if-eq p1, v1, :cond_42

    iput-boolean v1, p0, Luv8;->e:Z

    iget-object p1, p0, Luv8;->d:Low8;

    new-instance v0, Lsv8;

    invoke-virtual {p0}, Luv8;->t()I

    move-result p0

    invoke-direct {v0, p0}, Lsv8;-><init>(I)V

    invoke-virtual {p1, v0, v0}, Lha2;->W(Lja2;Lja2;)V

    :cond_42
    return-void

    :pswitch_43
    iget-object p0, p0, Lv82;->b:Ljava/lang/Object;

    check-cast p0, Lv82;

    if-eqz p0, :cond_4c

    invoke-virtual {p0, p1}, Lv82;->a(Lc53;)V

    :cond_4c
    return-void

    :pswitch_4d
    iget-object p0, p0, Lv82;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_55
    if-ge v1, v0, :cond_63

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Lw82;

    invoke-interface {v2, p1}, Lw82;->a(Lc53;)V

    goto :goto_55

    :cond_63
    return-void

    :pswitch_data_64
    .packed-switch 0x0
        :pswitch_4d
        :pswitch_43
    .end packed-switch
.end method

.method public final b(Lc53;)V
    .registers 5

    iget-byte v0, p0, Lv82;->a:B

    packed-switch v0, :pswitch_data_36

    iget-object p1, p1, Lc53;->b:Loqe;

    if-nez p1, :cond_12

    iget-object p0, p0, Lv82;->b:Ljava/lang/Object;

    check-cast p0, Lxw8;

    iget-object p0, p0, Lxw8;->w:Lhv2;

    invoke-virtual {p0}, Lhv2;->f()V

    :cond_12
    return-void

    :pswitch_13
    iget-object p0, p0, Lv82;->b:Ljava/lang/Object;

    check-cast p0, Lv82;

    if-eqz p0, :cond_1c

    invoke-virtual {p0, p1}, Lv82;->b(Lc53;)V

    :cond_1c
    return-void

    :pswitch_1d
    iget-object p0, p0, Lv82;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_26
    if-ge v1, v0, :cond_34

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Lw82;

    invoke-interface {v2, p1}, Lw82;->b(Lc53;)V

    goto :goto_26

    :cond_34
    return-void

    nop

    :pswitch_data_36
    .packed-switch 0x0
        :pswitch_1d
        :pswitch_13
    .end packed-switch
.end method

.method public final c(Lc53;)V
    .registers 5

    iget-byte v0, p0, Lv82;->a:B

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_38

    iget-object p0, p0, Lv82;->b:Ljava/lang/Object;

    check-cast p0, Lxw8;

    iget-object p0, p0, Lxw8;->s:Lqie;

    iget-object p0, p0, Lqie;->b:Ljava/lang/Object;

    check-cast p0, Lc5k;

    iget-object p0, p0, Lc5k;->n:Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;

    invoke-virtual {p0, v1, v1}, Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;->c(ZZ)V

    return-void

    :pswitch_16
    iget-object p0, p0, Lv82;->b:Ljava/lang/Object;

    check-cast p0, Lv82;

    if-eqz p0, :cond_1f

    invoke-virtual {p0, p1}, Lv82;->c(Lc53;)V

    :cond_1f
    return-void

    :pswitch_20
    iget-object p0, p0, Lv82;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_28
    if-ge v1, v0, :cond_36

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Lw82;

    invoke-interface {v2, p1}, Lw82;->c(Lc53;)V

    goto :goto_28

    :cond_36
    return-void

    nop

    :pswitch_data_38
    .packed-switch 0x0
        :pswitch_20
        :pswitch_16
    .end packed-switch
.end method

.method public final d(Lk92;Ljava/lang/Exception;)V
    .registers 6

    iget-byte v0, p0, Lv82;->a:B

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_42

    iget-object p0, p0, Lv82;->b:Ljava/lang/Object;

    check-cast p0, Lxw8;

    iget-object p1, p0, Lxw8;->s:Lqie;

    iget-object p1, p1, Lqie;->b:Ljava/lang/Object;

    check-cast p1, Lc5k;

    iget-object p1, p1, Lc5k;->n:Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;

    invoke-virtual {p1, v1, v1}, Lorg/chromium/third_party/android/swiperefresh/SwipeRefreshLayout;->c(ZZ)V

    iget-object p0, p0, Lxw8;->m:Lvu8;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lvu8;->f:Z

    iput-boolean p1, p0, Lvu8;->g:Z

    invoke-virtual {p0}, Lvu8;->t()V

    return-void

    :pswitch_20
    iget-object p0, p0, Lv82;->b:Ljava/lang/Object;

    check-cast p0, Lv82;

    if-eqz p0, :cond_29

    invoke-virtual {p0, p1, p2}, Lv82;->d(Lk92;Ljava/lang/Exception;)V

    :cond_29
    return-void

    :pswitch_2a
    iget-object p0, p0, Lv82;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_32
    if-ge v1, v0, :cond_40

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Lw82;

    invoke-interface {v2, p1, p2}, Lw82;->d(Lk92;Ljava/lang/Exception;)V

    goto :goto_32

    :cond_40
    return-void

    nop

    :pswitch_data_42
    .packed-switch 0x0
        :pswitch_2a
        :pswitch_20
    .end packed-switch
.end method
