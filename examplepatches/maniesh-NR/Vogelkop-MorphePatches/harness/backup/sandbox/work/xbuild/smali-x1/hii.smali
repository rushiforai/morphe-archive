.class public final Lhii;
.super Lnji;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;

.field public final synthetic c:Lndc;


# direct methods
.method public synthetic constructor <init>(Lndc;Ljava/lang/Object;B)V
    .registers 4

    iput-byte p3, p0, Lhii;->a:B

    iput-object p1, p0, Lhii;->c:Lndc;

    iput-object p2, p0, Lhii;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final b()V
    .registers 2

    iget-byte v0, p0, Lhii;->a:B

    packed-switch v0, :pswitch_data_1c

    return-void

    :pswitch_6
    iget-object p0, p0, Lhii;->c:Lndc;

    check-cast p0, Lpii;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lpii;->M:Z

    invoke-virtual {p0}, Lpii;->J0()V

    iget-object v0, p0, Lpii;->G:Llii;

    invoke-interface {v0}, Llii;->a()Z

    move-result v0

    if-eqz v0, :cond_1b

    invoke-virtual {p0}, Lpii;->L0()V

    :cond_1b
    return-void

    :pswitch_data_1c
    .packed-switch 0x1
        :pswitch_6
    .end packed-switch
.end method

.method public final c(I)V
    .registers 8

    iget-byte v0, p0, Lhii;->a:B

    iget-object v1, p0, Lhii;->b:Ljava/lang/Object;

    const/4 v2, 0x2

    iget-object v3, p0, Lhii;->c:Lndc;

    packed-switch v0, :pswitch_data_6e

    check-cast v3, Lpii;

    if-eqz p1, :cond_30

    const/4 p0, 0x1

    const/4 v0, 0x0

    if-eq p1, p0, :cond_2a

    if-eq p1, v2, :cond_1a

    const/4 p0, 0x3

    if-ne p1, p0, :cond_33

    iput-boolean v0, v3, Lpii;->M:Z

    goto :goto_33

    :cond_1a
    iput-boolean v0, v3, Lpii;->M:Z

    iget-object p0, v3, Lpii;->J:Lm9f;

    if-nez p0, :cond_33

    iget-boolean p0, v3, Lpii;->L:Z

    if-nez p0, :cond_33

    check-cast v1, Landroid/content/Context;

    invoke-virtual {v3, v1}, Lpii;->H0(Landroid/content/Context;)V

    goto :goto_3e

    :cond_2a
    iput-boolean v0, v3, Lpii;->M:Z

    invoke-virtual {v3}, Lpii;->J0()V

    goto :goto_33

    :cond_30
    invoke-virtual {v3}, Lpii;->J0()V

    :cond_33
    :goto_33
    iget-object p0, v3, Lpii;->G:Llii;

    invoke-interface {p0}, Llii;->a()Z

    move-result p0

    if-eqz p0, :cond_3e

    invoke-virtual {v3, p1}, Lpii;->O0(I)V

    :cond_3e
    :goto_3e
    return-void

    :pswitch_3f
    check-cast v3, Liii;

    if-ne p1, v2, :cond_6d

    iget-object p1, v3, Liii;->E:Lqji;

    iget-object p1, p1, Lqji;->p:[Landroid/print/PageRange;

    if-eqz p1, :cond_6d

    check-cast v1, Lr9g;

    invoke-virtual {v1, p1}, Lr9g;->test(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_6d

    iget-object p1, v3, Liii;->E:Lqji;

    iget-wide v0, p1, Lqji;->o:J

    const-wide/16 v4, 0x0

    cmp-long p1, v0, v4

    if-eqz p1, :cond_6d

    iget-object p1, v3, Liii;->z:Lh7b;

    iput-wide v0, p1, Lh7b;->c:J

    invoke-virtual {v3}, Liji;->W()V

    invoke-virtual {v3}, Liji;->Z()Z

    iget-object p1, v3, Liii;->E:Lqji;

    invoke-virtual {p1, p0}, Lqji;->e(Lnji;)V

    const/4 p0, 0x0

    iput-object p0, v3, Liii;->G:Lhii;

    :cond_6d
    return-void

    :pswitch_data_6e
    .packed-switch 0x0
        :pswitch_3f
    .end packed-switch
.end method
