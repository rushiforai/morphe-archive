.class public final Lob9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr8n;


# instance fields
.field public a:I

.field public final b:Ljava/lang/ref/WeakReference;

.field public c:Z


# direct methods
.method public constructor <init>(Landroid/widget/TextView;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lob9;->b:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public static b(ILandroid/view/View;)V
    .registers 4

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz p0, :cond_2e

    const/4 v1, 0x1

    if-eq p0, v1, :cond_19

    const/4 v1, 0x2

    if-eq p0, v1, :cond_11

    invoke-static {v0}, Lf03;->F(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p0

    goto :goto_32

    :cond_11
    const p0, 0x7f0402b9

    invoke-static {p0, v0}, Lf03;->W(ILandroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p0

    goto :goto_32

    :cond_19
    const p0, 0x7f06104e

    invoke-static {p0, v0}, Lnb6;->v(ILandroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p0

    if-nez p0, :cond_32

    const p0, 0x7f06063b

    invoke-virtual {v0, p0}, Landroid/content/Context;->getColor(I)I

    move-result p0

    invoke-static {p0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p0

    goto :goto_32

    :cond_2e
    invoke-static {v0}, Lf03;->F(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p0

    :cond_32
    :goto_32
    instance-of v0, p1, Landroid/widget/TextView;

    if-eqz v0, :cond_3b

    check-cast p1, Landroid/widget/TextView;

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    :cond_3b
    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 2

    iget p0, p0, Lob9;->a:I

    invoke-static {p0, p1}, Lob9;->b(ILandroid/view/View;)V

    return-void
.end method
