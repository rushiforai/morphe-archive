.class public abstract Lo6n;
.super Lz6n;
.source "SourceFile"


# instance fields
.field public final b:I


# direct methods
.method public constructor <init>(Ly46;ILtjn;)V
    .registers 4

    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput p2, p0, Lo6n;->b:I

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    new-instance p1, Ln6n;

    const/4 p2, 0x0

    invoke-direct {p1, p3, p2}, Ln6n;-><init>(Ltjn;B)V

    invoke-virtual {p0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method public final U(ZLandroid/graphics/drawable/ShapeDrawable;)Landroid/graphics/drawable/RippleDrawable;
    .registers 4

    iget-object v0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz p1, :cond_c

    const p1, 0x7f060f8c

    goto :goto_f

    :cond_c
    const p1, 0x7f060f8d

    :goto_f
    invoke-virtual {v0, p1}, Landroid/content/Context;->getColor(I)I

    move-result p1

    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    iget p0, p0, Lo6n;->b:I

    invoke-static {p2, p1, p0}, Lxgh;->i(Landroid/graphics/drawable/ShapeDrawable;Landroid/content/res/ColorStateList;I)Landroid/graphics/drawable/RippleDrawable;

    move-result-object p0

    return-object p0
.end method
