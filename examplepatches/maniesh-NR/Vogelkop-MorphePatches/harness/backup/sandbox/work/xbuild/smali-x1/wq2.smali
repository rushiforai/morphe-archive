.class public final Lwq2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr8n;


# instance fields
.field public final synthetic a:B

.field public b:I


# direct methods
.method public synthetic constructor <init>()V
    .registers 2

    .line 26
    const/4 v0, 0x0

    iput-byte v0, p0, Lwq2;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Leq1;I)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Lwq2;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p2, p0, Lwq2;->b:I

    invoke-virtual {p1}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    invoke-static {p1}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p2

    invoke-static {p2, p1, p0}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 6

    iget-byte v0, p0, Lwq2;->a:B

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_44

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget p0, p0, Lwq2;->b:I

    sget-object v2, Lzhh;->t:[I

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, p0, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p0

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v3, v3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    if-eqz v2, :cond_21

    invoke-static {v2, v0}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    :cond_21
    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    invoke-static {p1, v1}, Lq9n;->B(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    return-void

    :pswitch_28
    iget v0, p0, Lwq2;->b:I

    if-eqz v0, :cond_42

    instance-of v0, p1, Landroid/widget/ImageView;

    if-eqz v0, :cond_33

    move-object v1, p1

    check-cast v1, Landroid/widget/ImageView;

    :cond_33
    if-eqz v1, :cond_42

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iget p0, p0, Lwq2;->b:I

    invoke-static {p0, p1}, Lf03;->x(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    invoke-virtual {v1, p0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_42
    return-void

    nop

    :pswitch_data_44
    .packed-switch 0x0
        :pswitch_28
    .end packed-switch
.end method
