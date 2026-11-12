.class public final synthetic Lqcj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyjj;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lvcj;


# direct methods
.method public synthetic constructor <init>(Lvcj;B)V
    .registers 3

    iput-byte p2, p0, Lqcj;->a:B

    iput-object p1, p0, Lqcj;->b:Lvcj;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final c(Landroid/view/ViewGroup;)Landroidx/recyclerview/widget/i;
    .registers 11

    iget-byte v0, p0, Lqcj;->a:B

    packed-switch v0, :pswitch_data_8c

    new-instance v0, Lscj;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    invoke-static {v1, p1}, Lq5g;->d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lq5g;

    move-result-object p1

    new-instance v1, Le6g;

    const/4 v7, 0x0

    const/16 v8, 0x19

    const/4 v2, 0x0

    iget-object v3, p0, Lqcj;->b:Lvcj;

    const-class v4, Lvcj;

    const-string v5, "onMoreClicked"

    const-string v6, "onMoreClicked()V"

    invoke-direct/range {v1 .. v8}, Le6g;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    iget-object p0, p1, Lq5g;->b:Landroid/view/ViewGroup;

    check-cast p0, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    invoke-direct {v0, p0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iget-object p0, v0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    iget-object v2, v0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    new-instance v3, Ltk4;

    const/4 v4, 0x4

    invoke-direct {v3, v2, v4}, Ltk4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v2, v3}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/view/View;->setClipToOutline(Z)V

    iget-object v2, p1, Lq5g;->c:Ljava/lang/Object;

    check-cast v2, Landroid/widget/TextView;

    const v3, 0x7f140a5f

    invoke-virtual {p0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p1, Lq5g;->d:Ljava/lang/Object;

    check-cast p1, Landroid/widget/ImageView;

    const v2, 0x7f08058e

    invoke-static {v2, p0}, Lw8h;->u(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object p0, v0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    new-instance p1, Lh4i;

    const/16 v2, 0x8

    invoke-direct {p1, v1, v2}, Lh4i;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object v0

    :pswitch_69
    new-instance v0, Lucj;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    invoke-static {v1, p1}, Lq5g;->d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lq5g;

    move-result-object p1

    new-instance v1, Lldh;

    const/4 v7, 0x0

    const/16 v8, 0x1a

    const/4 v2, 0x1

    iget-object v3, p0, Lqcj;->b:Lvcj;

    const-class v4, Lvcj;

    const-string v5, "onShareTargetClicked"

    const-string v6, "onShareTargetClicked(Lcom/opera/android/share/ShareTarget;)V"

    invoke-direct/range {v1 .. v8}, Lldh;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-direct {v0, p1, v1}, Lucj;-><init>(Lq5g;Lldh;)V

    return-object v0

    :pswitch_data_8c
    .packed-switch 0x0
        :pswitch_69
    .end packed-switch
.end method
