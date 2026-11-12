.class public final Lbf7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lqe7;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lbf7;->a:B

    iput-object p1, p0, Lbf7;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final f(Lre7;)V
    .registers 2

    return-void
.end method

.method private final g(Lre7;)V
    .registers 2

    return-void
.end method

.method private final h(Lre7;)V
    .registers 2

    return-void
.end method

.method private final i(Lre7;)V
    .registers 2

    return-void
.end method

.method private final j(Lre7;)V
    .registers 2

    return-void
.end method

.method private final k(Lre7;)V
    .registers 2

    return-void
.end method


# virtual methods
.method public final a(Lre7;)V
    .registers 4

    iget-byte v0, p0, Lbf7;->a:B

    iget-object p0, p0, Lbf7;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_50

    check-cast p0, Lrf7;

    iget-object v0, p0, Lrf7;->b:Lh7f;

    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v0

    :goto_f
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1f

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lqf7;

    invoke-interface {v1, p1}, Lqf7;->a(Lre7;)V

    goto :goto_f

    :cond_1f
    invoke-virtual {p1}, Lre7;->j()Z

    move-result p1

    if-nez p1, :cond_35

    iget-boolean p1, p0, Lrf7;->k:Z

    if-nez p1, :cond_35

    const/4 p1, 0x1

    iput-boolean p1, p0, Lrf7;->k:Z

    new-instance p1, Lof7;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lof7;-><init>(Lrf7;B)V

    invoke-static {p1}, Lvml;->c(Ljava/lang/Runnable;)V

    :cond_35
    return-void

    :pswitch_36
    check-cast p0, Lnf7;

    invoke-virtual {p0}, Lo73;->b()Z

    return-void

    :pswitch_3c
    check-cast p0, Lcf7;

    iget-object p1, p0, Lcf7;->d:Ljava/lang/Object;

    check-cast p1, Lre7;

    invoke-virtual {p1}, Lre7;->l()Z

    move-result p1

    if-eqz p1, :cond_4e

    sget-object p1, Lhjm;->b:Lhjm;

    const/4 v0, 0x3

    invoke-virtual {p0, p1, v0}, Lo93;->b(Lhjm;I)V

    :cond_4e
    return-void

    nop

    :pswitch_data_50
    .packed-switch 0x0
        :pswitch_3c
        :pswitch_36
    .end packed-switch
.end method

.method public final b(Lre7;)V
    .registers 3

    iget-byte v0, p0, Lbf7;->a:B

    packed-switch v0, :pswitch_data_20

    iget-object p0, p0, Lbf7;->b:Ljava/lang/Object;

    check-cast p0, Lrf7;

    iget-object p0, p0, Lrf7;->b:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_f
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1f

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lqf7;

    invoke-interface {v0, p1}, Lqf7;->b(Lre7;)V

    goto :goto_f

    :cond_1f
    :pswitch_1f
    return-void

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_1f
        :pswitch_1f
    .end packed-switch
.end method

.method public final c(Lre7;)V
    .registers 3

    iget-byte v0, p0, Lbf7;->a:B

    packed-switch v0, :pswitch_data_20

    iget-object p0, p0, Lbf7;->b:Ljava/lang/Object;

    check-cast p0, Lrf7;

    iget-object p0, p0, Lrf7;->b:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_f
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1f

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lqf7;

    invoke-interface {v0, p1}, Lqf7;->c(Lre7;)V

    goto :goto_f

    :cond_1f
    :pswitch_1f
    return-void

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_1f
        :pswitch_1f
    .end packed-switch
.end method

.method public final e(Lre7;)V
    .registers 3

    iget-byte p1, p0, Lbf7;->a:B

    packed-switch p1, :pswitch_data_1c

    :pswitch_5
    return-void

    :pswitch_6
    iget-object p0, p0, Lbf7;->b:Ljava/lang/Object;

    check-cast p0, Lcf7;

    iget-object p1, p0, Lcf7;->d:Ljava/lang/Object;

    check-cast p1, Lre7;

    invoke-virtual {p1}, Lre7;->l()Z

    move-result p1

    if-eqz p1, :cond_1a

    sget-object p1, Lhjm;->b:Lhjm;

    const/4 v0, 0x3

    invoke-virtual {p0, p1, v0}, Lo93;->b(Lhjm;I)V

    :cond_1a
    return-void

    nop

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
    .end packed-switch
.end method
