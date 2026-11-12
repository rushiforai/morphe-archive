.class public final Lmjk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Luil;


# virtual methods
.method public final a(Ljava/lang/String;Landroid/text/SpannableStringBuilder;)Z
    .registers 6

    const-string p0, "b"

    const/4 v0, 0x1

    invoke-static {p1, p0, v0}, Lkotlin/text/c;->m(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p0

    const/4 p1, 0x0

    if-eqz p0, :cond_26

    invoke-virtual {p2}, Landroid/text/SpannableStringBuilder;->length()I

    move-result p0

    const-class v1, Lljk;

    invoke-virtual {p2, p1, p0, v1}, Landroid/text/SpannableStringBuilder;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Lljk;

    array-length v1, p0

    const/4 v2, 0x0

    if-eqz v1, :cond_24

    array-length v1, p0

    add-int/lit8 v1, v1, -0x1

    if-ltz v1, :cond_24

    aget-object v2, p0, v1

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_24
    if-nez v2, :cond_27

    :cond_26
    return p1

    :cond_27
    new-instance p0, Landroid/text/style/StyleSpan;

    invoke-direct {p0, v0}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-virtual {p2, v2}, Landroid/text/SpannableStringBuilder;->getSpanStart(Ljava/lang/Object;)I

    move-result p1

    invoke-virtual {p2, v2}, Landroid/text/SpannableStringBuilder;->removeSpan(Ljava/lang/Object;)V

    invoke-virtual {p2}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v1

    if-eq p1, v1, :cond_3e

    const/16 v2, 0x21

    invoke-virtual {p2, p0, p1, v1, v2}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    :cond_3e
    return v0
.end method

.method public final b(Ljava/lang/String;Landroid/text/SpannableStringBuilder;)Ltil;
    .registers 4

    const-string p0, "b"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_b

    sget-object p0, Lsil;->a:Lsil;

    return-object p0

    :cond_b
    new-instance p0, Lljk;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p2}, Landroid/text/SpannableStringBuilder;->length()I

    move-result p1

    const/16 v0, 0x11

    invoke-virtual {p2, p0, p1, p1, v0}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    new-instance p0, Lril;

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lril;-><init>(Z)V

    return-object p0
.end method
