.class public final synthetic Lj6o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lh6o;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lh6o;Ljava/lang/Object;B)V
    .registers 4

    iput-byte p3, p0, Lj6o;->a:B

    iput-object p1, p0, Lj6o;->b:Lh6o;

    iput-object p2, p0, Lj6o;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 13

    iget-byte v0, p0, Lj6o;->a:B

    iget-object v1, p0, Lj6o;->c:Ljava/lang/Object;

    iget-object p0, p0, Lj6o;->b:Lh6o;

    packed-switch v0, :pswitch_data_5a

    check-cast v1, Lrk4;

    iget-object p0, p0, Lh6o;->j:Lw6o;

    invoke-virtual {p0, v1}, Lw6o;->d(Lsk4;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_13
    check-cast v1, Ltsd;

    iget-object v0, p0, Lh6o;->k:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    const v3, 0x7f0d049b

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v0, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_48

    check-cast v0, Landroid/widget/FrameLayout;

    invoke-static {v0}, Lkf;->b(Landroid/widget/FrameLayout;)Lkf;

    move-result-object v0

    new-instance v2, Lh7o;

    iget-object v3, p0, Lh6o;->l:Ltsd;

    new-instance v4, Llrk;

    iget-object v6, p0, Lh6o;->j:Lw6o;

    const/4 v10, 0x0

    const/16 v11, 0x1b

    const/4 v5, 0x1

    const-class v7, Lw6o;

    const-string v8, "onCardItemFullyVisible"

    const-string v9, "onCardItemFullyVisible$app(Lcom/opera/android/startpage/livescore/worldcup/WorldCupPromoCardAspectItem;)V"

    invoke-direct/range {v4 .. v11}, Llrk;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-direct {v2, v0, v3, v1, v4}, Lh7o;-><init>(Lkf;Ltsd;Ltsd;Llrk;)V

    goto :goto_4e

    :cond_48
    const-string p0, "rootView"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 v2, 0x0

    :goto_4e
    return-object v2

    :pswitch_4f
    check-cast v1, Lqk4;

    iget-object p0, p0, Lh6o;->j:Lw6o;

    invoke-virtual {p0, v1}, Lw6o;->d(Lsk4;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_5a
    .packed-switch 0x0
        :pswitch_4f
        :pswitch_13
    .end packed-switch
.end method
