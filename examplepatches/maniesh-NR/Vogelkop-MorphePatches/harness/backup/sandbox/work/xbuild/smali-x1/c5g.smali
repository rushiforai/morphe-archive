.class public abstract Lc5g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# direct methods
.method public static a(Landroid/widget/TextView;Z)V
    .registers 5

    invoke-virtual {p0}, Landroid/widget/TextView;->getSelectionStart()I

    move-result v0

    invoke-virtual {p0}, Landroid/widget/TextView;->getSelectionEnd()I

    move-result v1

    invoke-virtual {p0}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v2

    if-eqz p1, :cond_11

    const/16 p1, 0x90

    goto :goto_13

    :cond_11
    const/16 p1, 0x80

    :goto_13
    or-int/lit8 p1, p1, 0x1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setInputType(I)V

    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    instance-of p1, p0, Landroid/widget/EditText;

    if-eqz p1, :cond_24

    check-cast p0, Landroid/widget/EditText;

    invoke-virtual {p0, v0, v1}, Landroid/widget/EditText;->setSelection(II)V

    :cond_24
    return-void
.end method
