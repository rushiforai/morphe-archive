.class public final Ll6n;
.super Lo6n;
.source "SourceFile"

# interfaces
.implements Lh4a;


# virtual methods
.method public final l(Landroid/graphics/Rect;)V
    .registers 3

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const/high16 v0, 0x41800000    # 16.0f

    invoke-static {v0, p0}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p0

    iput p0, p1, Landroid/graphics/Rect;->bottom:I

    return-void
.end method
