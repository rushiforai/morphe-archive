.class public final Lkpf;
.super Lf73;
.source "SourceFile"


# instance fields
.field public final synthetic h:B

.field public i:Lfdn;

.field public j:Lac1;


# direct methods
.method public synthetic constructor <init>(Lowc;Ltah;B)V
    .registers 4

    iput-byte p3, p0, Lkpf;->h:B

    invoke-direct {p0, p1, p2}, Lf73;-><init>(Lowc;Ltah;)V

    return-void
.end method


# virtual methods
.method public final V(Lja2;Z)V
    .registers 9

    iget-byte v0, p0, Lkpf;->h:B

    packed-switch v0, :pswitch_data_90

    check-cast p1, Lwxc;

    iget-object p2, p1, Lwxc;->d:Lfdn;

    iput-object p2, p0, Lkpf;->i:Lfdn;

    iget-object p2, p2, Lfdn;->c:Ljava/lang/String;

    iget-object p1, p1, Lxxc;->b:Lrcd;

    invoke-static {p2, p1}, Lnzb;->y(Ljava/lang/String;Lrcd;)Ljava/lang/CharSequence;

    move-result-object v1

    new-instance v0, Lac1;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v5}, Lac1;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;IILandroid/view/View$OnClickListener;)V

    iput-object v0, p0, Lkpf;->j:Lac1;

    return-void

    :pswitch_1f
    check-cast p1, Lvxc;

    iget-object p2, p1, Lvxc;->d:Lfdn;

    iget-object v0, p1, Lxxc;->c:Lrcd;

    iget-object v1, p2, Lfdn;->f:Lfdn;

    iget-object v2, p2, Lfdn;->c:Ljava/lang/String;

    iput-object p2, p0, Lkpf;->i:Lfdn;

    if-nez v1, :cond_37

    new-instance p1, Lac1;

    invoke-static {v2, v0}, Lnzb;->y(Ljava/lang/String;Lrcd;)Ljava/lang/CharSequence;

    move-result-object p2

    invoke-direct {p1, p2}, Lac1;-><init>(Ljava/lang/CharSequence;)V

    goto :goto_4b

    :cond_37
    new-instance p2, Lac1;

    iget-object v1, v1, Lfdn;->c:Ljava/lang/String;

    iget-object p1, p1, Lxxc;->b:Lrcd;

    invoke-static {v1, p1}, Lnzb;->y(Ljava/lang/String;Lrcd;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-direct {p2, p1}, Lac1;-><init>(Ljava/lang/CharSequence;)V

    invoke-static {v2, v0}, Lnzb;->y(Ljava/lang/String;Lrcd;)Ljava/lang/CharSequence;

    move-result-object p1

    iput-object p1, p2, Lac1;->d:Ljava/lang/Object;

    move-object p1, p2

    :goto_4b
    new-instance v0, Lac1;

    iget-object p2, p1, Lac1;->c:Ljava/lang/Object;

    move-object v1, p2

    check-cast v1, Ljava/lang/CharSequence;

    iget-object p2, p1, Lac1;->d:Ljava/lang/Object;

    move-object v2, p2

    check-cast v2, Ljava/lang/CharSequence;

    iget v3, p1, Lac1;->a:I

    iget v4, p1, Lac1;->b:I

    iget-object p1, p1, Lac1;->e:Ljava/lang/Object;

    move-object v5, p1

    check-cast v5, Lobn;

    invoke-direct/range {v0 .. v5}, Lac1;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;IILandroid/view/View$OnClickListener;)V

    iput-object v0, p0, Lkpf;->j:Lac1;

    return-void

    :pswitch_66
    if-nez p2, :cond_7b

    check-cast p1, Lnxc;

    iget-object p1, p1, Lnxc;->b:Lfdn;

    iput-object p1, p0, Lkpf;->i:Lfdn;

    iget-object v1, p1, Lfdn;->c:Ljava/lang/String;

    new-instance v0, Lac1;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v5}, Lac1;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;IILandroid/view/View$OnClickListener;)V

    iput-object v0, p0, Lkpf;->j:Lac1;

    :cond_7b
    return-void

    :pswitch_7c
    check-cast p1, Lqmf;

    iget-object p1, p1, Lqmf;->b:Lfdn;

    iput-object p1, p0, Lkpf;->i:Lfdn;

    iget-object v1, p1, Lfdn;->c:Ljava/lang/String;

    new-instance v0, Lac1;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v5}, Lac1;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;IILandroid/view/View$OnClickListener;)V

    iput-object v0, p0, Lkpf;->j:Lac1;

    return-void

    :pswitch_data_90
    .packed-switch 0x0
        :pswitch_7c
        :pswitch_66
        :pswitch_1f
    .end packed-switch
.end method

.method public final b0()Lac1;
    .registers 2

    iget-byte v0, p0, Lkpf;->h:B

    packed-switch v0, :pswitch_data_12

    iget-object p0, p0, Lkpf;->j:Lac1;

    return-object p0

    :pswitch_8
    iget-object p0, p0, Lkpf;->j:Lac1;

    return-object p0

    :pswitch_b
    iget-object p0, p0, Lkpf;->j:Lac1;

    return-object p0

    :pswitch_e
    iget-object p0, p0, Lkpf;->j:Lac1;

    return-object p0

    nop

    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_e
        :pswitch_b
        :pswitch_8
    .end packed-switch
.end method

.method public final c0()Lfdn;
    .registers 2

    iget-byte v0, p0, Lkpf;->h:B

    packed-switch v0, :pswitch_data_12

    iget-object p0, p0, Lkpf;->i:Lfdn;

    return-object p0

    :pswitch_8
    iget-object p0, p0, Lkpf;->i:Lfdn;

    return-object p0

    :pswitch_b
    iget-object p0, p0, Lkpf;->i:Lfdn;

    return-object p0

    :pswitch_e
    iget-object p0, p0, Lkpf;->i:Lfdn;

    return-object p0

    nop

    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_e
        :pswitch_b
        :pswitch_8
    .end packed-switch
.end method
