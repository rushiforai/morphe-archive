.class public final Lju1;
.super Lk8;
.source "SourceFile"


# instance fields
.field public final synthetic o:B

.field public final p:Lpde;

.field public final q:Lkze;

.field public final r:Lkze;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Luul;B)V
    .registers 13

    iput-byte p3, p0, Lju1;->o:B

    const/4 v0, 0x0

    const v1, 0x7f070a00

    packed-switch p3, :pswitch_data_b8

    invoke-direct {p0, p2}, Lk8;-><init>(Luul;)V

    new-instance p3, Lpde;

    invoke-virtual {p2}, Lz43;->k()Lx43;

    move-result-object v2

    iget-object v4, v2, Lx43;->a:Lyul;

    invoke-virtual {p2}, Lz43;->e()I

    move-result v6

    invoke-virtual {p2}, Lz43;->e()I

    move-result v2

    invoke-virtual {p1}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    add-int v7, p1, v2

    new-instance v3, Lavl;

    const/4 v5, 0x0

    const/4 v8, 0x1

    invoke-direct/range {v3 .. v8}, Lavl;-><init>(Lyul;ZIII)V

    invoke-direct {p3, v3}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p3, p0, Lju1;->p:Lpde;

    new-instance p1, Lkze;

    invoke-virtual {p3}, Lekc;->g()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lavl;

    iget-object p3, p3, Lavl;->a:Lyul;

    iget p3, p3, Lyul;->a:F

    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p3

    invoke-direct {p1, p3}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lju1;->q:Lkze;

    new-instance p1, Lkze;

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p3

    invoke-direct {p1, p3}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lju1;->r:Lkze;

    new-instance p1, Liu1;

    const/4 p3, 0x0

    invoke-direct {p1, p0, p3}, Liu1;-><init>(Lk8;B)V

    iget-object p0, p2, Lz43;->h:Ljava/lang/Object;

    check-cast p0, Li7f;

    invoke-virtual {p0, p1}, Li7f;->b(Ljava/lang/Object;)Z

    return-void

    :pswitch_60
    invoke-direct {p0, p2}, Lk8;-><init>(Luul;)V

    new-instance p3, Lpde;

    invoke-virtual {p2}, Lz43;->k()Lx43;

    move-result-object v2

    iget-object v4, v2, Lx43;->a:Lyul;

    invoke-virtual {p2}, Lz43;->e()I

    move-result v6

    invoke-virtual {p2}, Lz43;->e()I

    move-result v2

    invoke-virtual {p1}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    add-int v7, p1, v2

    new-instance v3, Lavl;

    const/4 v5, 0x1

    const/4 v8, 0x2

    invoke-direct/range {v3 .. v8}, Lavl;-><init>(Lyul;ZIII)V

    invoke-direct {p3, v3}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p3, p0, Lju1;->p:Lpde;

    new-instance p1, Lkze;

    invoke-virtual {p3}, Lekc;->g()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lavl;

    iget-object p3, p3, Lavl;->a:Lyul;

    iget p3, p3, Lyul;->a:F

    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p3

    invoke-direct {p1, p3}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lju1;->q:Lkze;

    new-instance p1, Lkze;

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p3

    invoke-direct {p1, p3}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lju1;->r:Lkze;

    new-instance p1, Liu1;

    const/4 p3, 0x1

    invoke-direct {p1, p0, p3}, Liu1;-><init>(Lk8;B)V

    iget-object p0, p2, Lz43;->h:Ljava/lang/Object;

    check-cast p0, Li7f;

    invoke-virtual {p0, p1}, Li7f;->b(Ljava/lang/Object;)Z

    return-void

    nop

    :pswitch_data_b8
    .packed-switch 0x1
        :pswitch_60
    .end packed-switch
.end method


# virtual methods
.method public final E()Lkze;
    .registers 2

    iget-byte v0, p0, Lju1;->o:B

    packed-switch v0, :pswitch_data_c

    iget-object p0, p0, Lju1;->r:Lkze;

    return-object p0

    :pswitch_8
    iget-object p0, p0, Lju1;->r:Lkze;

    return-object p0

    nop

    :pswitch_data_c
    .packed-switch 0x0
        :pswitch_8
    .end packed-switch
.end method

.method public final F()Lkze;
    .registers 2

    iget-byte v0, p0, Lju1;->o:B

    packed-switch v0, :pswitch_data_c

    iget-object p0, p0, Lju1;->q:Lkze;

    return-object p0

    :pswitch_8
    iget-object p0, p0, Lju1;->q:Lkze;

    return-object p0

    nop

    :pswitch_data_c
    .packed-switch 0x0
        :pswitch_8
    .end packed-switch
.end method

.method public final getState()Lpde;
    .registers 2

    iget-byte v0, p0, Lju1;->o:B

    packed-switch v0, :pswitch_data_c

    iget-object p0, p0, Lju1;->p:Lpde;

    return-object p0

    :pswitch_8
    iget-object p0, p0, Lju1;->p:Lpde;

    return-object p0

    nop

    :pswitch_data_c
    .packed-switch 0x0
        :pswitch_8
    .end packed-switch
.end method
