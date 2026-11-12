.class public final Lwqn;
.super Landroidx/recyclerview/widget/i;
.source "SourceFile"


# instance fields
.field public final b:Lq5g;

.field public final c:Lz4k;

.field public final d:Lesk;

.field public e:Lioh;

.field public f:Z


# direct methods
.method public constructor <init>(Lq5g;Lz4k;Lesk;)V
    .registers 5

    iget-object v0, p1, Lq5g;->b:Landroid/view/ViewGroup;

    check-cast v0, Landroid/widget/FrameLayout;

    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lwqn;->b:Lq5g;

    iput-object p2, p0, Lwqn;->c:Lz4k;

    iput-object p3, p0, Lwqn;->d:Lesk;

    iget-object p1, p1, Lq5g;->d:Ljava/lang/Object;

    check-cast p1, Landroid/widget/ImageView;

    new-instance p2, Loon;

    const/4 p3, 0x1

    invoke-direct {p2, p0, p3}, Loon;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p0

    if-nez p0, :cond_1e

    return-void

    :cond_1e
    invoke-static {p0, p1, p2}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    return-void
.end method


# virtual methods
.method public final U(Landroid/net/Uri;)V
    .registers 5

    iget-object v0, p0, Lwqn;->b:Lq5g;

    iget-object v1, v0, Lq5g;->d:Ljava/lang/Object;

    check-cast v1, Landroid/widget/ImageView;

    sget-object v2, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    iget-object v0, v0, Lq5g;->d:Ljava/lang/Object;

    check-cast v0, Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageTintList(Landroid/content/res/ColorStateList;)V

    sget-object v1, Lyne;->b:Ldeg;

    invoke-virtual {v1, p1}, Ldeg;->g(Landroid/net/Uri;)Ldwh;

    move-result-object p1

    new-instance v1, Lu7k;

    invoke-direct {v1, p0}, Lu7k;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p1, v0, v1}, Ldwh;->g(Landroid/widget/ImageView;Ld94;)V

    return-void
.end method

.method public final V(III)V
    .registers 5

    iget-object p0, p0, Lwqn;->b:Lq5g;

    iget-object p0, p0, Lq5g;->d:Ljava/lang/Object;

    check-cast p0, Landroid/widget/ImageView;

    sget-object v0, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {p1, v0}, Lf03;->W(ILandroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p2, p1}, Lf03;->W(ILandroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageTintList(Landroid/content/res/ColorStateList;)V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const/high16 p2, 0x42000000    # 32.0f

    invoke-static {p1, p2}, Lz7h;->h(Landroid/content/Context;F)I

    move-result p1

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2, p3}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    if-eqz p2, :cond_3a

    invoke-static {p2, p1}, Lic4;->R(Landroid/graphics/drawable/Drawable;I)Lo92;

    move-result-object p1

    goto :goto_3b

    :cond_3a
    const/4 p1, 0x0

    :goto_3b
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public final X(Lioh;)V
    .registers 6

    instance-of v0, p1, Ltqn;

    const v1, 0x7f080553

    const v2, 0x7f04028e

    const v3, 0x7f04028f

    if-eqz v0, :cond_50

    check-cast p1, Ltqn;

    iget-object p1, p1, Ltqn;->a:Lo29;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    packed-switch p1, :pswitch_data_64

    :pswitch_18
    invoke-virtual {p0, v3, v2, v1}, Lwqn;->V(III)V

    return-void

    :pswitch_1c
    const p1, 0x7f04028b

    const v0, 0x7f0805b2

    const v1, 0x7f04028c

    invoke-virtual {p0, v1, p1, v0}, Lwqn;->V(III)V

    return-void

    :pswitch_29
    const p1, 0x7f04027d

    const v0, 0x7f080542

    const v1, 0x7f04027e

    invoke-virtual {p0, v1, p1, v0}, Lwqn;->V(III)V

    return-void

    :pswitch_36
    const p1, 0x7f040291

    const v0, 0x7f080621

    const v1, 0x7f040292

    invoke-virtual {p0, v1, p1, v0}, Lwqn;->V(III)V

    return-void

    :pswitch_43
    const p1, 0x7f04027a

    const v0, 0x7f0804fd

    const v1, 0x7f04027b

    invoke-virtual {p0, v1, p1, v0}, Lwqn;->V(III)V

    return-void

    :cond_50
    sget-object v0, Luqn;->a:Luqn;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_60

    iget-boolean p1, p0, Lwqn;->f:Z

    if-eqz p1, :cond_5f

    invoke-virtual {p0, v3, v2, v1}, Lwqn;->V(III)V

    :cond_5f
    :pswitch_5f
    return-void

    :cond_60
    invoke-static {}, Lh9o;->p()V

    return-void

    :pswitch_data_64
    .packed-switch 0x0
        :pswitch_43
        :pswitch_43
        :pswitch_36
        :pswitch_36
        :pswitch_36
        :pswitch_18
        :pswitch_29
        :pswitch_29
        :pswitch_1c
        :pswitch_5f
        :pswitch_18
        :pswitch_18
        :pswitch_29
    .end packed-switch
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lwqn;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lwqn;

    iget-object v1, p0, Lwqn;->b:Lq5g;

    iget-object v3, p1, Lwqn;->b:Lq5g;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-object v1, p0, Lwqn;->c:Lz4k;

    iget-object v3, p1, Lwqn;->c:Lz4k;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_22

    return v2

    :cond_22
    iget-object p0, p0, Lwqn;->d:Lesk;

    iget-object p1, p1, Lwqn;->d:Lesk;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2d

    return v2

    :cond_2d
    return v0
.end method

.method public final hashCode()I
    .registers 3

    iget-object v0, p0, Lwqn;->b:Lq5g;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lwqn;->c:Lz4k;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object p0, p0, Lwqn;->d:Lesk;

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
