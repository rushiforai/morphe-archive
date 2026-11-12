.class public final synthetic Lnqn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lxjj;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lyw;


# direct methods
.method public synthetic constructor <init>(Lyw;B)V
    .registers 3

    iput-byte p2, p0, Lnqn;->a:B

    iput-object p1, p0, Lnqn;->b:Lyw;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final i(Ljava/lang/Object;Landroidx/recyclerview/widget/i;)V
    .registers 6

    iget-byte v0, p0, Lnqn;->a:B

    iget-object p0, p0, Lnqn;->b:Lyw;

    packed-switch v0, :pswitch_data_44

    check-cast p1, Lqqn;

    check-cast p2, Lpqn;

    iget-object v0, p2, Lpqn;->b:Lq5g;

    iget-object v0, v0, Lq5g;->c:Ljava/lang/Object;

    check-cast v0, Lb98;

    iget-object v0, v0, Lb98;->b:Landroid/widget/FrameLayout;

    new-instance v1, Loqn;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, v2}, Loqn;-><init>(Lyw;Lqqn;B)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p2, p2, Lpqn;->b:Lq5g;

    iget-object p2, p2, Lq5g;->d:Ljava/lang/Object;

    check-cast p2, Landroid/widget/FrameLayout;

    new-instance v0, Loqn;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p1, v1}, Loqn;-><init>(Lyw;Lqqn;B)V

    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :pswitch_2c
    check-cast p1, Lsqn;

    check-cast p2, Lxqn;

    iget-object p2, p2, Lxqn;->b:Lb7k;

    iget-object p2, p2, Lb7k;->c:Ljava/lang/Object;

    check-cast p2, Lb98;

    iget-object p2, p2, Lb98;->b:Landroid/widget/FrameLayout;

    new-instance v0, Lobn;

    const/16 v1, 0xa

    invoke-direct {v0, p0, p1, v1}, Lobn;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    nop

    :pswitch_data_44
    .packed-switch 0x0
        :pswitch_2c
    .end packed-switch
.end method
