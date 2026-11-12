.class public final Lkbd;
.super Lh42;
.source "SourceFile"


# instance fields
.field public final synthetic n:B

.field public final o:Ljava/lang/Object;

.field public final p:Ljava/lang/Object;

.field public q:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lekc;Lb6i;Lnqi;)V
    .registers 7

    const/4 v0, 0x1

    iput-byte v0, p0, Lkbd;->n:B

    invoke-direct {p0}, Lh42;-><init>()V

    iput-object p1, p0, Lkbd;->o:Ljava/lang/Object;

    iput-object p2, p0, Lkbd;->p:Ljava/lang/Object;

    iput-object p3, p0, Lkbd;->q:Ljava/lang/Object;

    new-instance p3, Li9j;

    const/4 v1, 0x0

    invoke-direct {p3, p0, v1}, Li9j;-><init>(Lkbd;B)V

    new-instance v1, Lt7d;

    const/16 v2, 0xb

    invoke-direct {v1, p3, v2}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {p0, p1, v1}, Lh42;->s(Lekc;Lf7f;)V

    new-instance p1, Li9j;

    invoke-direct {p1, p0, v0}, Li9j;-><init>(Lkbd;B)V

    new-instance p3, Lt7d;

    invoke-direct {p3, p1, v2}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {p0, p2, p3}, Lh42;->s(Lekc;Lf7f;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Lt14;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Lkbd;->n:B

    .line 42
    invoke-direct {p0}, Lh42;-><init>()V

    .line 43
    iput-object p1, p0, Lkbd;->o:Ljava/lang/Object;

    .line 44
    iput-object p2, p0, Lkbd;->p:Ljava/lang/Object;

    return-void
.end method

.method public static final u(Lode;Lkbd;Lode;)V
    .registers 5

    if-eqz p0, :cond_5

    invoke-virtual {p1, p0}, Lh42;->t(Lekc;)V

    :cond_5
    new-instance p0, Lrkc;

    const/16 v0, 0xe

    invoke-direct {p0, p1, v0}, Lrkc;-><init>(Ljava/lang/Object;B)V

    new-instance v0, Ld8d;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Ld8d;-><init>(Ljava/lang/Object;B)V

    invoke-super {p1, p2, v0}, Lh42;->s(Lekc;Lf7f;)V

    return-void
.end method

.method public static v(Lkbd;Ljava/lang/Object;Ljava/lang/Object;I)V
    .registers 5

    and-int/lit8 v0, p3, 0x1

    if-eqz v0, :cond_c

    iget-object p1, p0, Lkbd;->o:Ljava/lang/Object;

    check-cast p1, Lekc;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    :cond_c
    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_18

    iget-object p2, p0, Lkbd;->p:Ljava/lang/Object;

    check-cast p2, Lb6i;

    invoke-virtual {p2}, Lekc;->g()Ljava/lang/Object;

    move-result-object p2

    :cond_18
    if-eqz p1, :cond_27

    if-eqz p2, :cond_27

    iget-object p3, p0, Lkbd;->q:Ljava/lang/Object;

    check-cast p3, Lnqi;

    invoke-virtual {p3, p1, p2}, Lnqi;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    :cond_27
    return-void
.end method


# virtual methods
.method public final g()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Lkbd;->n:B

    packed-switch v0, :pswitch_data_20

    invoke-super {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_a
    iget-object v0, p0, Lkbd;->q:Ljava/lang/Object;

    check-cast v0, Lode;

    if-nez v0, :cond_13

    iget-object p0, p0, Lkbd;->o:Ljava/lang/Object;

    goto :goto_1f

    :cond_13
    iget-object p0, p0, Lkbd;->p:Ljava/lang/Object;

    check-cast p0, Lt14;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v0}, Lt14;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    :goto_1f
    return-object p0

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method

.method public final s(Lekc;Lf7f;)V
    .registers 4

    iget-byte v0, p0, Lkbd;->n:B

    packed-switch v0, :pswitch_data_10

    invoke-super {p0, p1, p2}, Lh42;->s(Lekc;Lf7f;)V

    return-void

    :pswitch_9
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p0

    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_9
    .end packed-switch
.end method
