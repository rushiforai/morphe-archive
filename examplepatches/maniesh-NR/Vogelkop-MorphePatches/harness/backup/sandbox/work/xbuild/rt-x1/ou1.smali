.class public final Lou1;
.super Liph;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public b:I


# direct methods
.method public synthetic constructor <init>()V
    .registers 2

    .line 8
    const/4 v0, 0x3

    iput-byte v0, p0, Lou1;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(BI)V
    .registers 3

    iput-byte p1, p0, Lou1;->a:B

    iput p2, p0, Lou1;->b:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Lvph;)V
    .registers 6

    iget-byte v0, p0, Lou1;->a:B

    packed-switch v0, :pswitch_data_7a

    iget-object p3, p3, Landroidx/recyclerview/widget/RecyclerView;->n:Landroidx/recyclerview/widget/f;

    instance-of v0, p3, Landroidx/recyclerview/widget/GridLayoutManager;

    if-eqz v0, :cond_e

    check-cast p3, Landroidx/recyclerview/widget/GridLayoutManager;

    goto :goto_f

    :cond_e
    const/4 p3, 0x0

    :goto_f
    if-eqz p3, :cond_30

    invoke-static {p2}, Landroidx/recyclerview/widget/RecyclerView;->S(Landroid/view/View;)I

    move-result p2

    const/4 v0, -0x1

    if-eq p2, v0, :cond_30

    iget v0, p3, Landroidx/recyclerview/widget/GridLayoutManager;->b:I

    iget-object p3, p3, Landroidx/recyclerview/widget/GridLayoutManager;->g:Ltx7;

    invoke-virtual {p4}, Lvph;->b()I

    move-result p4

    invoke-virtual {p3, p2, v0}, Ltx7;->d(II)I

    move-result p2

    add-int/lit8 p4, p4, -0x1

    invoke-virtual {p3, p4, v0}, Ltx7;->d(II)I

    move-result p3

    if-ge p2, p3, :cond_30

    iget p0, p0, Lou1;->b:I

    iput p0, p1, Landroid/graphics/Rect;->bottom:I

    :cond_30
    return-void

    :pswitch_31
    iget p0, p0, Lou1;->b:I

    div-int/lit8 p2, p0, 0x2

    iput p2, p1, Landroid/graphics/Rect;->right:I

    div-int/lit8 p0, p0, 0x2

    iput p0, p1, Landroid/graphics/Rect;->left:I

    return-void

    :pswitch_3c
    invoke-static {p2}, Landroidx/recyclerview/widget/RecyclerView;->S(Landroid/view/View;)I

    move-result p2

    if-nez p2, :cond_44

    const/4 p0, 0x0

    goto :goto_46

    :cond_44
    iget p0, p0, Lou1;->b:I

    :goto_46
    invoke-static {p3}, Lcs5;->W(Landroid/view/View;)Z

    move-result p2

    if-eqz p2, :cond_4f

    iput p0, p1, Landroid/graphics/Rect;->right:I

    goto :goto_51

    :cond_4f
    iput p0, p1, Landroid/graphics/Rect;->left:I

    :goto_51
    return-void

    :pswitch_52
    iget p0, p0, Lou1;->b:I

    div-int/lit8 p2, p0, 0x2

    iput p2, p1, Landroid/graphics/Rect;->left:I

    div-int/lit8 p0, p0, 0x2

    iput p0, p1, Landroid/graphics/Rect;->right:I

    return-void

    :pswitch_5d
    invoke-virtual {p3, p2}, Landroidx/recyclerview/widget/RecyclerView;->T(Landroid/view/View;)Landroidx/recyclerview/widget/i;

    move-result-object p2

    invoke-virtual {p2}, Landroidx/recyclerview/widget/i;->getBindingAdapterPosition()I

    move-result p2

    if-nez p2, :cond_6b

    invoke-virtual {p1}, Landroid/graphics/Rect;->setEmpty()V

    goto :goto_78

    :cond_6b
    invoke-static {p3}, Lcs5;->W(Landroid/view/View;)Z

    move-result p2

    iget p0, p0, Lou1;->b:I

    if-eqz p2, :cond_76

    iput p0, p1, Landroid/graphics/Rect;->right:I

    goto :goto_78

    :cond_76
    iput p0, p1, Landroid/graphics/Rect;->left:I

    :goto_78
    return-void

    nop

    :pswitch_data_7a
    .packed-switch 0x0
        :pswitch_5d
        :pswitch_52
        :pswitch_3c
        :pswitch_31
    .end packed-switch
.end method
