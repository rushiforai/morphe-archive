.class public final synthetic Lws7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/hype/image/editor/EditImage;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/hype/image/editor/EditImage;B)V
    .registers 3

    iput-byte p2, p0, Lws7;->a:B

    iput-object p1, p0, Lws7;->b:Lcom/opera/hype/image/editor/EditImage;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    iget-byte v0, p0, Lws7;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lws7;->b:Lcom/opera/hype/image/editor/EditImage;

    packed-switch v0, :pswitch_data_60

    check-cast p1, Li97;

    iget-object v0, p0, Lcom/opera/hype/image/editor/EditImage;->d:Ldya;

    iget-object v0, v0, Ldya;->b:Landroid/graphics/PointF;

    iget-object v2, p1, Li97;->b:Landroid/graphics/PointF;

    invoke-virtual {v0, v2}, Landroid/graphics/PointF;->set(Landroid/graphics/PointF;)V

    new-instance v0, Lg6n;

    invoke-direct {v0, p0}, Lg6n;-><init>(Landroid/view/ViewGroup;)V

    invoke-virtual {v0}, Lg6n;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_1c
    :goto_1c
    move-object v0, p0

    check-cast v0, Lh6n;

    invoke-virtual {v0}, Lh6n;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_40

    invoke-virtual {v0}, Lh6n;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    const v2, 0x7f0a0561

    invoke-virtual {v0, v2}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    instance-of v2, v0, Lbfl;

    if-eqz v2, :cond_39

    check-cast v0, Lbfl;

    goto :goto_3a

    :cond_39
    move-object v0, v1

    :goto_3a
    if-eqz v0, :cond_1c

    invoke-virtual {v0, p1}, Lbfl;->d(Li97;)V

    goto :goto_1c

    :cond_40
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_43
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, p0, Lcom/opera/hype/image/editor/EditImage;->m:Lqq6;

    if-eqz p0, :cond_5c

    iget-object p0, p0, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Lywa;

    invoke-virtual {p0}, Lywa;->g0()Llxa;

    move-result-object p0

    iget-object p0, p0, Llxa;->m:Lnak;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, v1, p1}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    :cond_5c
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_60
    .packed-switch 0x0
        :pswitch_43
    .end packed-switch
.end method
