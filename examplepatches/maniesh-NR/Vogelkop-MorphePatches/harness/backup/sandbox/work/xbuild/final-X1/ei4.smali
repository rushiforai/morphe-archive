.class public final Lei4;
.super Landroid/widget/ArrayAdapter;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lro9;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Landroid/content/Context;Ljava/util/AbstractList;Lro9;B)V
    .registers 6

    iput-byte p5, p0, Lei4;->a:B

    iput-object p4, p0, Lei4;->b:Lro9;

    const p1, 0x7f0d00c3

    invoke-direct {p0, p2, p1, p3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    return-void
.end method


# virtual methods
.method public final getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 8

    iget-byte v0, p0, Lei4;->a:B

    const v1, 0x7f080512

    iget-object v2, p0, Lei4;->b:Lro9;

    const/4 v3, 0x0

    packed-switch v0, :pswitch_data_52

    invoke-super {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iget p3, v2, Lro9;->b:I

    if-ne p1, p3, :cond_29

    invoke-virtual {p0}, Landroid/widget/ArrayAdapter;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {v1, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p0}, Landroid/widget/ArrayAdapter;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lf03;->C(Landroid/content/Context;)I

    move-result p0

    invoke-static {p1, p0}, Lj14;->n0(Landroid/graphics/drawable/Drawable;I)V

    goto :goto_2a

    :cond_29
    move-object p1, v3

    :goto_2a
    invoke-virtual {p2, v3, v3, p1, v3}, Landroid/widget/TextView;->setCompoundDrawablesRelativeWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    return-object p2

    :pswitch_2e
    invoke-super {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iget p3, v2, Lro9;->b:I

    if-ne p1, p3, :cond_4c

    invoke-virtual {p0}, Landroid/widget/ArrayAdapter;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {v1, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p0}, Landroid/widget/ArrayAdapter;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lf03;->C(Landroid/content/Context;)I

    move-result p0

    invoke-static {p1, p0}, Lj14;->n0(Landroid/graphics/drawable/Drawable;I)V

    goto :goto_4d

    :cond_4c
    move-object p1, v3

    :goto_4d
    invoke-virtual {p2, v3, v3, p1, v3}, Landroid/widget/TextView;->setCompoundDrawablesRelativeWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    return-object p2

    nop

    :pswitch_data_52
    .packed-switch 0x0
        :pswitch_2e
    .end packed-switch
.end method
