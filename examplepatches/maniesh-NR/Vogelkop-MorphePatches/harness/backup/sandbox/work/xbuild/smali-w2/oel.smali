.class public final Loel;
.super Lba3;
.source "SourceFile"


# static fields
.field public static final s:Lioj;

.field public static final synthetic t:[Lxtb;


# instance fields
.field public final k:Landroid/graphics/PointF;

.field public final transient l:Z

.field public final m:Lmel;

.field public final n:Lmel;

.field public final o:Lmel;

.field public final p:Lmel;

.field public final q:Lmel;

.field public final r:Lmel;


# direct methods
.method static constructor <clinit>()V
    .registers 10

    new-instance v0, Lpee;

    const-class v1, Loel;

    const-string v2, "color"

    const-string v3, "getColor()I"

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Lpee;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    new-instance v2, Lpee;

    const-string v3, "inverted"

    const-string v5, "getInverted()Z"

    invoke-direct {v2, v1, v3, v5, v4}, Lpee;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    new-instance v3, Lpee;

    const-string v5, "style"

    const-string v6, "getStyle()I"

    invoke-direct {v3, v1, v5, v6, v4}, Lpee;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    new-instance v5, Lpee;

    const-string v6, "font"

    const-string v7, "getFont()Lcom/opera/hype/image/editor/TextFont;"

    invoke-direct {v5, v1, v6, v7, v4}, Lpee;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    new-instance v6, Lpee;

    const-string v7, "isAllCaps"

    const-string v8, "isAllCaps()Z"

    invoke-direct {v6, v1, v7, v8, v4}, Lpee;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    new-instance v7, Lpee;

    const-string v8, "strokeColor"

    const-string v9, "getStrokeColor()I"

    invoke-direct {v7, v1, v8, v9, v4}, Lpee;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    const/4 v1, 0x6

    new-array v1, v1, [Lxtb;

    aput-object v0, v1, v4

    const/4 v0, 0x1

    aput-object v2, v1, v0

    const/4 v0, 0x2

    aput-object v3, v1, v0

    const/4 v0, 0x3

    aput-object v5, v1, v0

    const/4 v0, 0x4

    aput-object v6, v1, v0

    const/4 v0, 0x5

    aput-object v7, v1, v0

    sput-object v1, Loel;->t:[Lxtb;

    new-instance v1, Lioj;

    invoke-direct {v1, v0}, Lioj;-><init>(B)V

    sput-object v1, Loel;->s:Lioj;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Landroid/graphics/PointF;FFIZLandroid/graphics/PointF;IZLnil;ZI)V
    .registers 19

    sget-object v5, Leya;->d:Leya;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    invoke-direct/range {v0 .. v5}, Lba3;-><init>(Ljava/lang/String;Landroid/graphics/PointF;FFLeya;)V

    iput-object p7, p0, Loel;->k:Landroid/graphics/PointF;

    iput-boolean p9, p0, Loel;->l:Z

    invoke-static {p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    new-instance p2, Lmel;

    const/4 p3, 0x0

    invoke-direct {p2, p1, p0, p3}, Lmel;-><init>(Ljava/lang/Object;Loel;B)V

    iput-object p2, p0, Loel;->m:Lmel;

    invoke-static {p6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    new-instance p2, Lmel;

    const/4 p3, 0x1

    invoke-direct {p2, p1, p0, p3}, Lmel;-><init>(Ljava/lang/Object;Loel;B)V

    iput-object p2, p0, Loel;->n:Lmel;

    invoke-static {p8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    new-instance p2, Lmel;

    const/4 p3, 0x2

    invoke-direct {p2, p1, p0, p3}, Lmel;-><init>(Ljava/lang/Object;Loel;B)V

    iput-object p2, p0, Loel;->o:Lmel;

    new-instance p1, Lmel;

    const/4 p2, 0x3

    move-object/from16 p3, p10

    invoke-direct {p1, p3, p0, p2}, Lmel;-><init>(Ljava/lang/Object;Loel;B)V

    iput-object p1, p0, Loel;->p:Lmel;

    invoke-static/range {p11 .. p11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    new-instance p2, Lmel;

    const/4 p3, 0x4

    invoke-direct {p2, p1, p0, p3}, Lmel;-><init>(Ljava/lang/Object;Loel;B)V

    iput-object p2, p0, Loel;->q:Lmel;

    invoke-static/range {p12 .. p12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    new-instance p2, Lmel;

    const/4 p3, 0x5

    invoke-direct {p2, p1, p0, p3}, Lmel;-><init>(Ljava/lang/Object;Loel;B)V

    iput-object p2, p0, Loel;->r:Lmel;

    return-void
.end method


# virtual methods
.method public final a(Lcya;)V
    .registers 6

    iget v0, p1, Lcya;->b:I

    iget-object v1, p1, Lcya;->d:Ljava/lang/Object;

    const v2, 0x7f0a0558

    sget-object v3, Loel;->t:[Lxtb;

    if-ne v0, v2, :cond_19

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    const/4 p1, 0x1

    aget-object p1, v3, p1

    iget-object p0, p0, Loel;->n:Lmel;

    invoke-virtual {p0, p1, v1}, La7f;->g(Lxtb;Ljava/lang/Object;)V

    return-void

    :cond_19
    const v2, 0x7f0a0556

    if-ne v0, v2, :cond_2c

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    const/4 p1, 0x0

    aget-object p1, v3, p1

    iget-object p0, p0, Loel;->m:Lmel;

    invoke-virtual {p0, p1, v1}, La7f;->g(Lxtb;Ljava/lang/Object;)V

    return-void

    :cond_2c
    const v2, 0x7f0a055d

    if-ne v0, v2, :cond_3f

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    const/4 p1, 0x2

    aget-object p1, v3, p1

    iget-object p0, p0, Loel;->o:Lmel;

    invoke-virtual {p0, p1, v1}, La7f;->g(Lxtb;Ljava/lang/Object;)V

    return-void

    :cond_3f
    const v2, 0x7f0a0557

    if-ne v0, v2, :cond_4f

    check-cast v1, Lnil;

    const/4 p1, 0x3

    aget-object p1, v3, p1

    iget-object p0, p0, Loel;->p:Lmel;

    invoke-virtual {p0, p1, v1}, La7f;->g(Lxtb;Ljava/lang/Object;)V

    return-void

    :cond_4f
    const v2, 0x7f0a0555

    if-ne v0, v2, :cond_62

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    const/4 p1, 0x4

    aget-object p1, v3, p1

    iget-object p0, p0, Loel;->q:Lmel;

    invoke-virtual {p0, p1, v1}, La7f;->g(Lxtb;Ljava/lang/Object;)V

    return-void

    :cond_62
    const v2, 0x7f0a055c

    if-ne v0, v2, :cond_75

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    const/4 p1, 0x5

    aget-object p1, v3, p1

    iget-object p0, p0, Loel;->r:Lmel;

    invoke-virtual {p0, p1, v1}, La7f;->g(Lxtb;Ljava/lang/Object;)V

    return-void

    :cond_75
    invoke-super {p0, p1}, Lba3;->a(Lcya;)V

    return-void
.end method

.method public final g()F
    .registers 1

    const/high16 p0, 0x40000000    # 2.0f

    return p0
.end method

.method public final h(Lcom/opera/hype/image/editor/TextBoxEditText;)V
    .registers 10

    invoke-virtual {p1}, Lcom/opera/hype/image/editor/TextBoxEditText;->t()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {p0}, Lba3;->f()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_15

    invoke-virtual {p0}, Lba3;->f()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_15
    invoke-virtual {p0}, Loel;->i()I

    move-result v0

    sget-object v1, Loel;->s:Lioj;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0}, Lab5;->f(I)D

    move-result-wide v0

    const-wide/high16 v2, 0x3fe0000000000000L    # 0.5

    cmpl-double v0, v0, v2

    const/high16 v1, -0x1000000

    if-ltz v0, :cond_2c

    move v0, v1

    goto :goto_2d

    :cond_2c
    const/4 v0, -0x1

    :goto_2d
    invoke-virtual {p0}, Loel;->j()Z

    move-result v2

    if-nez v2, :cond_37

    invoke-virtual {p0}, Loel;->i()I

    move-result v0

    :cond_37
    invoke-virtual {p0}, Loel;->j()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_43

    invoke-virtual {p0}, Loel;->i()I

    move-result v2

    goto :goto_44

    :cond_43
    move v2, v3

    :goto_44
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    const/16 v4, 0x3d

    invoke-static {v0, v4}, Lab5;->l(II)I

    move-result v4

    invoke-virtual {p1, v4}, Landroid/widget/TextView;->setHighlightColor(I)V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    const v5, 0x7f0803ff

    invoke-virtual {v4, v5}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-static {v2}, Landroid/graphics/Color;->alpha(I)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v6

    const v7, 0x7f0803f9

    invoke-virtual {v6, v7}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    invoke-virtual {v6, v2}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    filled-new-array {v4, v6}, [Landroid/graphics/drawable/Drawable;

    move-result-object v2

    new-instance v4, Landroid/graphics/drawable/LayerDrawable;

    invoke-direct {v4, v2}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p1, v4}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    rsub-int v2, v5, 0xff

    int-to-double v4, v2

    invoke-static {v0}, Lab5;->f(I)D

    move-result-wide v6

    mul-double/2addr v6, v4

    double-to-int v0, v6

    const/4 v2, 0x0

    if-nez v0, :cond_8c

    invoke-virtual {p1, v2, v2, v2, v3}, Landroid/widget/TextView;->setShadowLayer(FFFI)V

    goto :goto_a4

    :cond_8c
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    const/4 v5, 0x1

    const/high16 v6, 0x40000000    # 2.0f

    invoke-static {v5, v6, v4}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v4

    float-to-int v4, v4

    int-to-float v4, v4

    invoke-static {v1, v0}, Lab5;->l(II)I

    move-result v0

    invoke-virtual {p1, v4, v2, v2, v0}, Landroid/widget/TextView;->setShadowLayer(FFFI)V

    :goto_a4
    sget-object v0, Loel;->t:[Lxtb;

    const/4 v1, 0x3

    aget-object v0, v0, v1

    iget-object v0, p0, Loel;->p:Lmel;

    iget-object v0, v0, La7f;->b:Ljava/lang/Object;

    check-cast v0, Lnil;

    invoke-virtual {p0}, Loel;->l()I

    move-result v1

    iget-object v2, p1, Lcom/opera/hype/image/editor/TextBoxEditText;->l:Luam;

    iget-object v0, v0, Lnil;->a:Ljava/lang/String;

    invoke-interface {v2, v1, v0}, Luam;->e(ILjava/lang/String;)V

    invoke-virtual {p0}, Loel;->u()Z

    move-result v0

    invoke-virtual {p1, v0}, Lcom/opera/hype/image/editor/TextBoxEditText;->setAllCaps(Z)V

    invoke-virtual {p0}, Loel;->k()I

    move-result p0

    iget-object p1, p1, Lcom/opera/hype/image/editor/TextBoxEditText;->j:Lfz2;

    sget-object v0, Lcom/opera/hype/image/editor/TextBoxEditText;->o:[Lxtb;

    aget-object v0, v0, v3

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {p1, v0, p0}, La7f;->g(Lxtb;Ljava/lang/Object;)V

    return-void
.end method

.method public final i()I
    .registers 3

    sget-object v0, Loel;->t:[Lxtb;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    iget-object p0, p0, Loel;->m:Lmel;

    iget-object p0, p0, La7f;->b:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result p0

    return p0
.end method

.method public final j()Z
    .registers 3

    sget-object v0, Loel;->t:[Lxtb;

    const/4 v1, 0x1

    aget-object v0, v0, v1

    iget-object p0, p0, Loel;->n:Lmel;

    iget-object p0, p0, La7f;->b:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0
.end method

.method public final k()I
    .registers 3

    sget-object v0, Loel;->t:[Lxtb;

    const/4 v1, 0x5

    aget-object v0, v0, v1

    iget-object p0, p0, Loel;->r:Lmel;

    iget-object p0, p0, La7f;->b:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result p0

    return p0
.end method

.method public final l()I
    .registers 3

    sget-object v0, Loel;->t:[Lxtb;

    const/4 v1, 0x2

    aget-object v0, v0, v1

    iget-object p0, p0, Loel;->o:Lmel;

    iget-object p0, p0, La7f;->b:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result p0

    return p0
.end method

.method public final u()Z
    .registers 3

    sget-object v0, Loel;->t:[Lxtb;

    const/4 v1, 0x4

    aget-object v0, v0, v1

    iget-object p0, p0, Loel;->q:Lmel;

    iget-object p0, p0, La7f;->b:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0
.end method

.method public final writeToParcel(Landroid/os/Parcel;I)V
    .registers 4

    invoke-super {p0, p1, p2}, Lba3;->writeToParcel(Landroid/os/Parcel;I)V

    invoke-virtual {p0}, Loel;->i()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    invoke-virtual {p0}, Loel;->j()Z

    move-result v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget-object v0, p0, Loel;->k:Landroid/graphics/PointF;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    invoke-virtual {p0}, Loel;->l()I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    iget-boolean p2, p0, Loel;->l:Z

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    sget-object p2, Loel;->t:[Lxtb;

    const/4 v0, 0x3

    aget-object p2, p2, v0

    iget-object p2, p0, Loel;->p:Lmel;

    iget-object p2, p2, La7f;->b:Ljava/lang/Object;

    check-cast p2, Lnil;

    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    invoke-virtual {p0}, Loel;->u()Z

    move-result p2

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    invoke-virtual {p0}, Loel;->k()I

    move-result p0

    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method
