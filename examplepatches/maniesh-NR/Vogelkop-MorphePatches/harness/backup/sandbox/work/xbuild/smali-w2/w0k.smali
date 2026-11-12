.class public final Lw0k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyl2;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:I

.field public final d:Liuh;

.field public final e:Laua;

.field public final f:Landroid/text/SpannableStringBuilder;

.field public g:Landroid/graphics/drawable/Drawable;

.field public h:Z

.field public final i:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lesk;Ljava/lang/String;Ljava/lang/String;ILroj;Liuh;)V
    .registers 16

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p3, p0, Lw0k;->a:Ljava/lang/String;

    iput-object p4, p0, Lw0k;->b:Ljava/lang/String;

    iput p5, p0, Lw0k;->c:I

    iput-object p7, p0, Lw0k;->d:Liuh;

    new-instance p4, Laua;

    new-instance p5, Lvg4;

    const/16 p7, 0x12

    invoke-direct {p5, p1, p7}, Lvg4;-><init>(Landroid/content/Context;B)V

    const/high16 p7, 0x41000000    # 8.0f

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-static {p7, p1}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p1

    invoke-direct {p4, p2, p5, p1}, Laua;-><init>(Lesk;Lkotlin/jvm/functions/Function0;I)V

    iput-object p4, p0, Lw0k;->e:Laua;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lw0k;->i:Ljava/util/ArrayList;

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

    iput-object p1, p0, Lw0k;->f:Landroid/text/SpannableStringBuilder;

    new-instance v0, Lldh;

    const/4 v6, 0x0

    const/16 v7, 0x1c

    const/4 v1, 0x1

    const-class v3, Lw0k;

    const-string v4, "setIcon"

    const-string v5, "setIcon(Landroid/graphics/drawable/Drawable;)V"

    move-object v2, p0

    invoke-direct/range {v0 .. v7}, Lldh;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    iget-object p0, p6, Lroj;->b:Ljava/lang/Object;

    check-cast p0, Lcbk;

    iget-object p1, p6, Lroj;->c:Ljava/lang/Object;

    check-cast p1, Ll2g;

    iget-object p0, p0, Lcbk;->e:Ljava/lang/Object;

    check-cast p0, Llgf;

    iget-object p2, p0, Llgf;->c:Ljava/lang/Object;

    check-cast p2, Landroid/content/Context;

    iget p0, p0, Llgf;->a:I

    iget-object p3, p1, Ll2g;->b:Ljava/lang/String;

    iget-object p1, p1, Ll2g;->f:Ljava/lang/String;

    new-instance p4, Lilm;

    const/4 p5, 0x4

    invoke-direct {p4, v0, p5}, Lilm;-><init>(Ljava/lang/Object;B)V

    invoke-static {p2, p0, p3, p1, p4}, Lqbe;->v(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Lcom/opera/api/Callback;)V

    return-void
.end method


# virtual methods
.method public final b()Laua;
    .registers 1

    iget-object p0, p0, Lw0k;->e:Laua;

    return-object p0
.end method

.method public final c()V
    .registers 7

    new-instance v0, Lb3g;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lb3g;-><init>(I)V

    iget v1, p0, Lw0k;->c:I

    invoke-virtual {v0, v1}, Lb3g;->a(I)La3g;

    move-result-object v1

    iget-wide v2, v1, La3g;->c:J

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    iput-wide v2, v1, La3g;->c:J

    iget-object p0, p0, Lw0k;->d:Liuh;

    iget-object p0, p0, Liuh;->b:Ljava/lang/Object;

    check-cast p0, Lole;

    invoke-virtual {p0, v0}, Lole;->C(Lb3g;)V

    return-void
.end method

.method public final d()Ljava/lang/CharSequence;
    .registers 1

    iget-object p0, p0, Lw0k;->f:Landroid/text/SpannableStringBuilder;

    return-object p0
.end method

.method public final e(Lxl2;)Z
    .registers 4

    iget-boolean v0, p0, Lw0k;->h:Z

    if-eqz v0, :cond_a

    iget-object p0, p0, Lw0k;->g:Landroid/graphics/drawable/Drawable;

    invoke-interface {p1, p0}, Lxl2;->c(Landroid/graphics/drawable/Drawable;)V

    goto :goto_19

    :cond_a
    invoke-interface {p1}, Lxl2;->d()V

    new-instance v0, Ltu;

    const/16 v1, 0x9

    invoke-direct {v0, p1, v1}, Ltu;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p0, Lw0k;->i:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_19
    const/4 p0, 0x1

    return p0
.end method

.method public final f()F
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final g(Ljava/lang/String;)Z
    .registers 5

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    iget-object p0, p0, Lw0k;->a:Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lkotlin/text/c;->q(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_25

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    if-eq p0, p1, :cond_25

    const/4 p0, 0x1

    return p0

    :cond_25
    return v2
.end method

.method public final h()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lw0k;->b:Ljava/lang/String;

    return-object p0
.end method

.method public final i()V
    .registers 7

    iget-object v0, p0, Lw0k;->d:Liuh;

    iget-object v1, v0, Liuh;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/LinkedHashSet;

    iget p0, p0, Lw0k;->c:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2a

    new-instance v1, Lb3g;

    const/4 v2, 0x4

    invoke-direct {v1, v2}, Lb3g;-><init>(I)V

    invoke-virtual {v1, p0}, Lb3g;->a(I)La3g;

    move-result-object p0

    iget-wide v2, p0, La3g;->b:J

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    iput-wide v2, p0, La3g;->b:J

    iget-object p0, v0, Liuh;->b:Ljava/lang/Object;

    check-cast p0, Lole;

    invoke-virtual {p0, v1}, Lole;->C(Lb3g;)V

    :cond_2a
    return-void
.end method

.method public final j(Ljava/lang/String;)Z
    .registers 3

    iget-object p0, p0, Lw0k;->f:Landroid/text/SpannableStringBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Lkotlin/text/c;->m(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method
