.class public final Lgx8;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lhjf;

.field public final b:Ldkf;

.field public final c:Lpde;

.field public final d:Lpde;


# direct methods
.method public constructor <init>(Lhjf;Lhjf;Likc;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lgx8;->a:Lhjf;

    new-instance v0, Ldkf;

    const v1, 0x7f15039b

    invoke-direct {v0, p1, v1}, Ldkf;-><init>(Landroid/content/Context;I)V

    iput-object v0, p0, Lgx8;->b:Ldkf;

    new-instance p1, Lpde;

    invoke-virtual {p0}, Lgx8;->a()I

    move-result v1

    const v2, 0x7f0408e3

    const/4 v3, 0x0

    invoke-static {v2, v0, v3}, Lf03;->w(ILandroid/content/Context;I)I

    move-result v0

    if-ge v1, v0, :cond_20

    move v1, v0

    :cond_20
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-direct {p1, v0}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lgx8;->c:Lpde;

    new-instance p1, Lpde;

    invoke-virtual {p0}, Lgx8;->a()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-direct {p1, v0}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lgx8;->d:Lpde;

    new-instance p1, Ltu7;

    const/16 v0, 0xa

    invoke-direct {p1, p0, v0}, Ltu7;-><init>(Ljava/lang/Object;B)V

    new-instance p0, Lcl4;

    const/16 v0, 0x14

    invoke-direct {p0, p1, v0}, Lcl4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p3, p2, p0}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method


# virtual methods
.method public final a()I
    .registers 10

    iget-object p0, p0, Lgx8;->a:Lhjf;

    invoke-virtual {p0}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-static {p0}, Lr9n;->i(Landroid/content/Context;)Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v1

    invoke-static {v1, p0}, Lddh;->t(ILandroid/content/Context;)Lhpj;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    const/4 v3, 0x0

    const/high16 v4, 0x44740000    # 976.0f

    const/4 v5, 0x3

    const/4 v6, 0x1

    const/4 v7, 0x2

    if-eqz v2, :cond_46

    if-eq v2, v6, :cond_3e

    if-eq v2, v7, :cond_28

    if-eq v2, v5, :cond_28

    invoke-static {}, Lh9o;->p()V

    return v3

    :cond_28
    invoke-static {p0, v4}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v2

    if-ge v1, v2, :cond_36

    const v2, 0x7f070228

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    goto :goto_4d

    :cond_36
    const v2, 0x7f070229

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    goto :goto_4d

    :cond_3e
    const v2, 0x7f07022a

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    goto :goto_4d

    :cond_46
    const v2, 0x7f070227

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    :goto_4d
    invoke-static {v1, p0}, Lddh;->t(ILandroid/content/Context;)Lhpj;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Enum;->ordinal()I

    move-result v8

    if-eqz v8, :cond_7f

    if-eq v8, v6, :cond_77

    if-eq v8, v7, :cond_61

    if-eq v8, v5, :cond_61

    invoke-static {}, Lh9o;->p()V

    return v3

    :cond_61
    invoke-static {p0, v4}, Lz7h;->h(Landroid/content/Context;F)I

    move-result p0

    if-ge v1, p0, :cond_6f

    const p0, 0x7f070220

    invoke-virtual {v0, p0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p0

    goto :goto_86

    :cond_6f
    const p0, 0x7f070221

    invoke-virtual {v0, p0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p0

    goto :goto_86

    :cond_77
    const p0, 0x7f070222

    invoke-virtual {v0, p0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p0

    goto :goto_86

    :cond_7f
    const p0, 0x7f07021f

    invoke-virtual {v0, p0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p0

    :goto_86
    sub-int/2addr v1, p0

    div-int/2addr v1, v7

    if-ge v2, v1, :cond_8b

    return v1

    :cond_8b
    return v2
.end method
