.class public final Lwwa;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic t:B

.field public u:Z

.field public final synthetic v:Lywa;


# direct methods
.method public synthetic constructor <init>(Lywa;Lmt5;B)V
    .registers 4

    iput-byte p3, p0, Lwwa;->t:B

    iput-object p1, p0, Lwwa;->v:Lywa;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 5

    iget-byte v0, p0, Lwwa;->t:B

    iget-object p0, p0, Lwwa;->v:Lywa;

    packed-switch v0, :pswitch_data_24

    new-instance p1, Lwwa;

    const/4 v0, 0x2

    invoke-direct {p1, p0, p2, v0}, Lwwa;-><init>(Lywa;Lmt5;B)V

    return-object p1

    :pswitch_e
    new-instance v0, Lwwa;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p2, v1}, Lwwa;-><init>(Lywa;Lmt5;B)V

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    iput-boolean p0, v0, Lwwa;->u:Z

    return-object v0

    :pswitch_1d
    new-instance p1, Lwwa;

    const/4 v0, 0x0

    invoke-direct {p1, p0, p2, v0}, Lwwa;-><init>(Lywa;Lmt5;B)V

    return-object p1

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_1d
        :pswitch_e
    .end packed-switch
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    iget-byte v0, p0, Lwwa;->t:B

    packed-switch v0, :pswitch_data_40

    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lwwa;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lwwa;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lwwa;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_16
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    check-cast p2, Lmt5;

    new-instance v0, Lwwa;

    iget-object p0, p0, Lwwa;->v:Lywa;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p2, v1}, Lwwa;-><init>(Lywa;Lmt5;B)V

    iput-boolean p1, v0, Lwwa;->u:Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {v0, p0}, Lwwa;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_2f
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lwwa;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lwwa;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lwwa;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_data_40
    .packed-switch 0x0
        :pswitch_2f
        :pswitch_16
    .end packed-switch
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    iget-byte v0, p0, Lwwa;->t:B

    const/4 v1, 0x0

    const-string v2, "call to \'resume\' before \'invoke\' with coroutine"

    const/4 v3, 0x1

    iget-object v4, p0, Lwwa;->v:Lywa;

    packed-switch v0, :pswitch_data_b0

    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v5, p0, Lwwa;->u:Z

    if-eqz v5, :cond_1b

    if-ne v5, v3, :cond_17

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_2a

    :cond_17
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_65

    :cond_1b
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iput-boolean v3, p0, Lwwa;->u:Z

    const-wide/16 v1, 0x3e8

    invoke-static {v1, v2, p0}, Lnb6;->p(JLmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_2a

    move-object v1, v0

    goto :goto_65

    :cond_2a
    :goto_2a
    invoke-virtual {v4}, Lywa;->h0()Lora;

    move-result-object p0

    iget-object p0, p0, Lora;->e:Lcom/opera/hype/image/editor/EditImage;

    sget-object p1, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-virtual {p0}, Landroid/view/View;->isLaidOut()Z

    move-result p1

    if-eqz p1, :cond_5a

    invoke-virtual {p0}, Landroid/view/View;->isLayoutRequested()Z

    move-result p1

    if-nez p1, :cond_5a

    invoke-virtual {v4}, Lywa;->h0()Lora;

    move-result-object p0

    iget-object p0, p0, Lora;->e:Lcom/opera/hype/image/editor/EditImage;

    invoke-virtual {p0}, Lcom/opera/hype/image/editor/EditImage;->f()Lv39;

    move-result-object p0

    invoke-static {p0}, Ly1j;->d(Lkotlin/sequences/Sequence;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lbfl;

    if-eqz p0, :cond_63

    invoke-virtual {v4}, Lywa;->h0()Lora;

    move-result-object p1

    iget-object p1, p1, Lora;->e:Lcom/opera/hype/image/editor/EditImage;

    invoke-virtual {p1, p0, v3}, Lcom/opera/hype/image/editor/EditImage;->a(Lbfl;Z)V

    goto :goto_63

    :cond_5a
    new-instance p1, Lho3;

    const/4 v0, 0x4

    invoke-direct {p1, v4, v0}, Lho3;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    :cond_63
    :goto_63
    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_65
    return-object v1

    :pswitch_66
    iget-boolean p0, p0, Lwwa;->u:Z

    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    invoke-virtual {v4}, Lywa;->h0()Lora;

    move-result-object p1

    iget-object p1, p1, Lora;->c:Landroid/widget/ImageView;

    const/16 v0, 0x8

    const/4 v1, 0x0

    if-nez p0, :cond_7a

    move v2, v1

    goto :goto_7b

    :cond_7a
    move v2, v0

    :goto_7b
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v4}, Lywa;->h0()Lora;

    move-result-object p1

    iget-object p1, p1, Lora;->b:Landroid/widget/ImageView;

    if-nez p0, :cond_87

    move v0, v1

    :cond_87
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_8d
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v5, p0, Lwwa;->u:Z

    if-eqz v5, :cond_9d

    if-ne v5, v3, :cond_99

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_ac

    :cond_99
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_ae

    :cond_9d
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iput-boolean v3, p0, Lwwa;->u:Z

    sget-object p1, Lywa;->g:[Lxtb;

    invoke-virtual {v4, p0}, Lywa;->i0(Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_ac

    move-object v1, v0

    goto :goto_ae

    :cond_ac
    :goto_ac
    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_ae
    return-object v1

    nop

    :pswitch_data_b0
    .packed-switch 0x0
        :pswitch_8d
        :pswitch_66
    .end packed-switch
.end method
