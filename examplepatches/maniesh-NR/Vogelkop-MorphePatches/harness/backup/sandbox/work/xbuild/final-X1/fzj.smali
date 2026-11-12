.class public final Lfzj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyl2;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Landroid/text/SpannableStringBuilder;

.field public final d:Laua;

.field public final e:Landroid/graphics/drawable/Drawable;

.field public final f:I

.field public final g:Z

.field public final h:Lqpm;

.field public final i:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lesk;Ljava/lang/String;Ljava/lang/String;IZLandroid/graphics/drawable/Drawable;Lqpm;Ljava/lang/Runnable;)V
    .registers 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p3, p0, Lfzj;->a:Ljava/lang/String;

    iput-object p4, p0, Lfzj;->b:Ljava/lang/String;

    iput p5, p0, Lfzj;->f:I

    iput-boolean p6, p0, Lfzj;->g:Z

    iput-object p8, p0, Lfzj;->h:Lqpm;

    iput-object p9, p0, Lfzj;->i:Ljava/lang/Runnable;

    new-instance p4, Laua;

    new-instance p5, Lvg4;

    const/16 p6, 0x11

    invoke-direct {p5, p1, p6}, Lvg4;-><init>(Landroid/content/Context;B)V

    const/high16 p6, 0x41000000    # 8.0f

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-static {p6, p1}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p1

    invoke-direct {p4, p2, p5, p1}, Laua;-><init>(Lesk;Lkotlin/jvm/functions/Function0;I)V

    iput-object p4, p0, Lfzj;->d:Laua;

    new-instance p1, Landroid/text/SpannableStringBuilder;

    const-string p2, " "

    invoke-static {p3, p2}, Lsko;->u(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {p1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result p2

    add-int/lit8 p2, p2, -0x1

    invoke-virtual {p1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result p3

    const/16 p5, 0x21

    invoke-virtual {p1, p4, p2, p3, p5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    iput-object p1, p0, Lfzj;->c:Landroid/text/SpannableStringBuilder;

    iput-object p7, p0, Lfzj;->e:Landroid/graphics/drawable/Drawable;

    return-void
.end method


# virtual methods
.method public final b()Laua;
    .registers 1

    iget-object p0, p0, Lfzj;->d:Laua;

    return-object p0
.end method

.method public final c()V
    .registers 1

    iget-object p0, p0, Lfzj;->i:Ljava/lang/Runnable;

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method public final d()Ljava/lang/CharSequence;
    .registers 1

    iget-object p0, p0, Lfzj;->c:Landroid/text/SpannableStringBuilder;

    return-object p0
.end method

.method public final e(Lxl2;)Z
    .registers 2

    iget-object p0, p0, Lfzj;->e:Landroid/graphics/drawable/Drawable;

    invoke-interface {p1, p0}, Lxl2;->c(Landroid/graphics/drawable/Drawable;)V

    const/4 p0, 0x1

    return p0
.end method

.method public final f()F
    .registers 2

    iget-boolean v0, p0, Lfzj;->g:Z

    iget p0, p0, Lfzj;->f:I

    if-eqz v0, :cond_a

    add-int/lit16 p0, p0, 0x2710

    int-to-float p0, p0

    return p0

    :cond_a
    int-to-float p0, p0

    const/high16 v0, 0x3f000000    # 0.5f

    add-float/2addr p0, v0

    return p0
.end method

.method public final g(Ljava/lang/String;)Z
    .registers 4

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    iget-object p0, p0, Lfzj;->a:Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_24

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    if-eq p0, p1, :cond_24

    const/4 p0, 0x1

    return p0

    :cond_24
    const/4 p0, 0x0

    return p0
.end method

.method public final h()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lfzj;->b:Ljava/lang/String;

    return-object p0
.end method

.method public final i()V
    .registers 1

    iget-object p0, p0, Lfzj;->h:Lqpm;

    if-eqz p0, :cond_7

    invoke-virtual {p0}, Lqpm;->run()V

    :cond_7
    return-void
.end method

.method public final j(Ljava/lang/String;)Z
    .registers 2

    iget-object p0, p0, Lfzj;->c:Landroid/text/SpannableStringBuilder;

    invoke-virtual {p0}, Landroid/text/SpannableStringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method
