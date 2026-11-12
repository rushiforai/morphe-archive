.class public final Lou7;
.super Landroidx/recyclerview/widget/i;
.source "SourceFile"


# instance fields
.field public final b:Lov0;

.field public final c:Lua7;

.field public final d:Ljv3;

.field public e:Llu7;


# direct methods
.method public constructor <init>(Lov0;Lua7;Ljv3;)V
    .registers 5

    iget-object v0, p1, Lov0;->b:Landroid/view/View;

    check-cast v0, Landroid/widget/FrameLayout;

    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lou7;->b:Lov0;

    iput-object p2, p0, Lou7;->c:Lua7;

    iput-object p3, p0, Lou7;->d:Ljv3;

    iget-object p1, p1, Lov0;->d:Ljava/lang/Object;

    check-cast p1, Landroid/widget/ImageView;

    new-instance p2, Lpc5;

    const/4 p3, 0x7

    invoke-direct {p2, p0, p3}, Lpc5;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p0

    if-nez p0, :cond_1e

    return-void

    :cond_1e
    invoke-static {p0, p1, p2}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    return-void
.end method


# virtual methods
.method public final U()V
    .registers 6

    iget-object v0, p0, Lou7;->e:Llu7;

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object v1, p0, Lou7;->b:Lov0;

    iget-object v1, v1, Lov0;->d:Ljava/lang/Object;

    check-cast v1, Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f07080f

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f07013b

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    iget-object v0, v0, Llu7;->b:Lnw0;

    iget-object p0, p0, Lou7;->d:Ljv3;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lzw0;

    invoke-static {v4, v2, v3, v0, p0}, Lexg;->m(Landroid/content/Context;IFLqw0;Lzw0;)Landroid/graphics/drawable/LayerDrawable;

    move-result-object p0

    invoke-virtual {v1, p0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_28

    instance-of v0, p1, Lou7;

    if-eqz v0, :cond_26

    check-cast p1, Lou7;

    iget-object v0, p0, Lou7;->b:Lov0;

    iget-object v1, p1, Lou7;->b:Lov0;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_26

    iget-object v0, p0, Lou7;->c:Lua7;

    iget-object v1, p1, Lou7;->c:Lua7;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_26

    iget-object p0, p0, Lou7;->d:Ljv3;

    iget-object p1, p1, Lou7;->d:Ljv3;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_28

    :cond_26
    const/4 p0, 0x0

    return p0

    :cond_28
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 3

    iget-object v0, p0, Lou7;->b:Lov0;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lou7;->c:Lua7;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object p0, p0, Lou7;->d:Ljv3;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr p0, v1

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
