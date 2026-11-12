.class public final synthetic Lxkl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# instance fields
.field public final synthetic a:Landroid/widget/TextView;

.field public final synthetic b:Lcgh;

.field public final synthetic c:Ledf;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/TextView;Lcgh;Ledf;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lxkl;->a:Landroid/widget/TextView;

    iput-object p2, p0, Lxkl;->b:Lcgh;

    iput-object p3, p0, Lxkl;->c:Ledf;

    return-void
.end method


# virtual methods
.method public final onPreDraw()Z
    .registers 10

    iget-object v0, p0, Lxkl;->a:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getLayout()Landroid/text/Layout;

    move-result-object v1

    const/4 v2, 0x3

    const/4 v3, 0x0

    if-nez v1, :cond_e

    invoke-static {v0, v3, v2}, Lna2;->G(Landroid/widget/TextView;II)Landroid/text/StaticLayout;

    move-result-object v1

    :cond_e
    iget-object v4, p0, Lxkl;->b:Lcgh;

    instance-of v5, v4, Lckl;

    iget-object p0, p0, Lxkl;->c:Ledf;

    const/4 v6, 0x1

    if-eqz v5, :cond_20

    invoke-virtual {v1}, Landroid/text/Layout;->getLineCount()I

    move-result v0

    invoke-interface {p0, v0}, Ledf;->b(I)Lddf;

    move-result-object p0

    goto :goto_7d

    :cond_20
    instance-of v5, v4, Ldkl;

    if-eqz v5, :cond_83

    invoke-virtual {v1}, Landroid/text/Layout;->getLineCount()I

    move-result v5

    sub-int/2addr v5, v6

    invoke-virtual {v1, v5}, Landroid/text/Layout;->getEllipsisCount(I)I

    move-result v7

    if-lez v7, :cond_75

    check-cast v4, Ldkl;

    iget-object v7, v4, Ldkl;->b:Lzyk;

    invoke-virtual {v7}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    if-eqz v8, :cond_75

    invoke-virtual {v1, v5}, Landroid/text/Layout;->getLineStart(I)I

    move-result v8

    invoke-virtual {v1, v5}, Landroid/text/Layout;->getEllipsisStart(I)I

    move-result v5

    add-int/2addr v5, v8

    iget-object v4, v4, Ldkl;->a:Ljava/lang/String;

    invoke-static {v4}, Lopm;->a(Ljava/lang/String;)Lfr;

    move-result-object v8

    if-eqz v8, :cond_4f

    iget v4, v8, Lfr;->c:I

    goto :goto_53

    :cond_4f
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    :goto_53
    if-ge v5, v4, :cond_6c

    invoke-virtual {v7}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-static {v0, v3, v2}, Lna2;->G(Landroid/widget/TextView;II)Landroid/text/StaticLayout;

    move-result-object v0

    invoke-virtual {v0}, Landroid/text/StaticLayout;->getLineCount()I

    move-result v0

    invoke-interface {p0, v0}, Ledf;->b(I)Lddf;

    sget-object p0, Lddf;->b:Lddf;

    goto :goto_7d

    :cond_6c
    invoke-virtual {v1}, Landroid/text/Layout;->getLineCount()I

    move-result v0

    invoke-interface {p0, v0}, Ledf;->b(I)Lddf;

    move-result-object p0

    goto :goto_7d

    :cond_75
    invoke-virtual {v1}, Landroid/text/Layout;->getLineCount()I

    move-result v0

    invoke-interface {p0, v0}, Ledf;->b(I)Lddf;

    move-result-object p0

    :goto_7d
    sget-object v0, Lddf;->a:Lddf;

    if-ne p0, v0, :cond_82

    return v6

    :cond_82
    return v3

    :cond_83
    invoke-static {}, Lh9o;->p()V

    return v3
.end method
