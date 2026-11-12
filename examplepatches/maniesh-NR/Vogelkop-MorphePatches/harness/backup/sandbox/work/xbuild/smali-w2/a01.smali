.class public final La01;
.super Landroid/text/InputFilter$AllCaps;
.source "SourceFile"


# instance fields
.field public a:Z


# virtual methods
.method public final filter(Ljava/lang/CharSequence;IILandroid/text/Spanned;II)Ljava/lang/CharSequence;
    .registers 8

    iget-boolean v0, p0, La01;->a:Z

    if-eqz v0, :cond_9

    invoke-super/range {p0 .. p6}, Landroid/text/InputFilter$AllCaps;->filter(Ljava/lang/CharSequence;IILandroid/text/Spanned;II)Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0

    :cond_9
    return-object p1
.end method
