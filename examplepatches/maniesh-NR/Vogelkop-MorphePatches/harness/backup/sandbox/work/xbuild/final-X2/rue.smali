.class public final Lrue;
.super Landroidx/viewpager/widget/PagerAdapter;
.source "SourceFile"


# instance fields
.field public final synthetic a:Lsue;


# direct methods
.method public constructor <init>(Lsue;)V
    .registers 2

    iput-object p1, p0, Lrue;->a:Lsue;

    invoke-direct {p0}, Landroidx/viewpager/widget/PagerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public final destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .registers 4

    check-cast p3, Landroid/view/View;

    const/4 p0, 0x4

    invoke-virtual {p3, p0}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public final getCount()I
    .registers 1

    iget-object p0, p0, Lrue;->a:Lsue;

    iget-object p0, p0, Lab2;->b:Lja2;

    check-cast p0, Lj82;

    if-nez p0, :cond_a

    const/4 p0, 0x1

    return p0

    :cond_a
    const/4 p0, 0x3

    return p0
.end method

.method public final getItemPosition(Ljava/lang/Object;)I
    .registers 2

    const/4 p0, -0x2

    return p0
.end method

.method public final instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .registers 7

    const/4 p1, 0x2

    const/4 v0, 0x1

    iget-object p0, p0, Lrue;->a:Lsue;

    if-eqz p2, :cond_1b

    if-eq p2, v0, :cond_18

    if-ne p2, p1, :cond_d

    iget-object v1, p0, Lsue;->t:Landroid/widget/ImageView;

    goto :goto_1d

    :cond_d
    const-string p0, "Invalid position: "

    invoke-static {p2, p0}, Lsko;->i(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_18
    iget-object v1, p0, Lsue;->s:Landroid/widget/ImageView;

    goto :goto_1d

    :cond_1b
    iget-object v1, p0, Lgu8;->g:Landroid/widget/ImageView;

    :goto_1d
    iget-object v2, p0, Lgu8;->j:Lga6;

    iget-object v3, p0, Lgu8;->j:Lga6;

    if-nez v2, :cond_24

    return-object v1

    :cond_24
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    if-nez p2, :cond_2e

    invoke-static {p0}, Lsue;->v0(Lsue;)V

    return-object v1

    :cond_2e
    if-ne p2, v0, :cond_5d

    invoke-virtual {p0}, Lsue;->w0()Ljre;

    move-result-object p1

    iget-object p1, p1, Ljre;->D:Landroid/net/Uri;

    if-eqz v3, :cond_55

    iget-object p2, v3, Lga6;->b:Ljava/lang/Object;

    check-cast p2, Landroid/graphics/Point;

    iget v0, p2, Landroid/graphics/Point;->x:I

    if-lez v0, :cond_55

    iget v0, p2, Landroid/graphics/Point;->y:I

    if-lez v0, :cond_55

    invoke-virtual {p0}, Luue;->u0()Lr9i;

    move-result-object p0

    iget-object p0, p0, Lr9i;->b:Ljava/lang/Object;

    check-cast p0, Luqe;

    iget v0, p2, Landroid/graphics/Point;->x:I

    iget p2, p2, Landroid/graphics/Point;->y:I

    invoke-virtual {p0, p1, v0, p2}, Luqe;->m(Landroid/net/Uri;II)Ljava/lang/String;

    move-result-object p0

    goto :goto_59

    :cond_55
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_59
    invoke-static {p0, v1, v3}, Lgu8;->g0(Ljava/lang/String;Landroid/widget/ImageView;Lga6;)V

    return-object v1

    :cond_5d
    if-ne p2, p1, :cond_8b

    invoke-virtual {p0}, Lsue;->w0()Ljre;

    move-result-object p1

    iget-object p1, p1, Ljre;->E:Landroid/net/Uri;

    if-eqz v3, :cond_84

    iget-object p2, v3, Lga6;->b:Ljava/lang/Object;

    check-cast p2, Landroid/graphics/Point;

    iget v0, p2, Landroid/graphics/Point;->x:I

    if-lez v0, :cond_84

    iget v0, p2, Landroid/graphics/Point;->y:I

    if-lez v0, :cond_84

    invoke-virtual {p0}, Luue;->u0()Lr9i;

    move-result-object p0

    iget-object p0, p0, Lr9i;->b:Ljava/lang/Object;

    check-cast p0, Luqe;

    iget v0, p2, Landroid/graphics/Point;->x:I

    iget p2, p2, Landroid/graphics/Point;->y:I

    invoke-virtual {p0, p1, v0, p2}, Luqe;->m(Landroid/net/Uri;II)Ljava/lang/String;

    move-result-object p0

    goto :goto_88

    :cond_84
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_88
    invoke-static {p0, v1, v3}, Lgu8;->g0(Ljava/lang/String;Landroid/widget/ImageView;Lga6;)V

    :cond_8b
    return-object v1
.end method

.method public final isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .registers 3

    if-ne p2, p1, :cond_4

    const/4 p0, 0x1

    return p0

    :cond_4
    const/4 p0, 0x0

    return p0
.end method
