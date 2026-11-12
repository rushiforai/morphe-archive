.class public final Lrma;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final j:[I

.field public static final k:[I

.field public static final l:[I

.field public static final m:[I

.field public static final n:[I


# instance fields
.field public final synthetic a:B

.field public b:I

.field public c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;

.field public e:Ljava/lang/Object;

.field public f:Ljava/lang/Object;

.field public g:Ljava/lang/Object;

.field public h:Ljava/lang/Object;

.field public i:Ljava/lang/Object;


# direct methods
.method static synthetic constructor <clinit>()V
    .registers 3

    const/16 v0, 0x8

    new-array v1, v0, [I

    fill-array-data v1, :array_2a

    sput-object v1, Lrma;->j:[I

    new-array v0, v0, [I

    fill-array-data v0, :array_3e

    sput-object v0, Lrma;->k:[I

    const v0, 0x10100a7

    filled-new-array {v0}, [I

    move-result-object v1

    sput-object v1, Lrma;->l:[I

    const v1, 0x10100a1

    filled-new-array {v1}, [I

    move-result-object v2

    sput-object v2, Lrma;->m:[I

    filled-new-array {v1, v0}, [I

    move-result-object v0

    sput-object v0, Lrma;->n:[I

    return-void

    nop

    :array_2a
    .array-data 4
        -0x10000
        -0xff0001
        -0xffff01
        -0xff0100
        -0xff01
        -0x100
        -0x1000000
        -0x1
    .end array-data

    :array_3e
    .array-data 4
        0x7f140476
        0x7f140473
        0x7f14046e
        0x7f140474
        0x7f140475
        0x7f14047a
        0x7f14046d
        0x7f140479
    .end array-data
.end method

.method public constructor <init>(B)V
    .registers 3

    iput-byte p1, p0, Lrma;->a:B

    packed-switch p1, :pswitch_data_20

    .line 278
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 279
    const-string p1, ""

    iput-object p1, p0, Lrma;->d:Ljava/lang/Object;

    .line 280
    iput-object p1, p0, Lrma;->e:Ljava/lang/Object;

    const/4 v0, -0x1

    .line 281
    iput v0, p0, Lrma;->b:I

    .line 282
    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lj95;->j([Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object p1

    iput-object p1, p0, Lrma;->f:Ljava/lang/Object;

    return-void

    .line 283
    :pswitch_1c
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void

    :pswitch_data_20
    .packed-switch 0x6
        :pswitch_1c
    .end packed-switch
.end method

.method public constructor <init>(Landroid/content/Context;Lwa;Lvma;)V
    .registers 5

    const/4 v0, 0x0

    iput-byte v0, p0, Lrma;->a:B

    .line 273
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 274
    iput-object p1, p0, Lrma;->c:Ljava/lang/Object;

    .line 275
    iput-object p2, p0, Lrma;->d:Ljava/lang/Object;

    .line 276
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lrma;->f:Ljava/lang/Object;

    .line 277
    iput-object p3, p0, Lrma;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;[Ljava/lang/String;Ljava/lang/String;)V
    .registers 6

    const/4 v0, 0x5

    iput-byte v0, p0, Lrma;->a:B

    .line 264
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v1, 0x0

    .line 265
    aget-object v1, p2, v1

    iput-object v1, p0, Lrma;->f:Ljava/lang/Object;

    const/4 v1, 0x3

    .line 266
    aget-object v1, p2, v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lrma;->b:I

    .line 267
    aget-object v0, p2, v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 268
    new-array v0, v0, [I

    iput-object v0, p0, Lrma;->d:Ljava/lang/Object;

    .line 269
    iput-object p1, p0, Lrma;->c:Ljava/lang/Object;

    .line 270
    new-instance p1, Ljava/net/URI;

    const/4 v0, 0x2

    aget-object v0, p2, v0

    invoke-direct {p1, v0}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lrma;->g:Ljava/lang/Object;

    const/4 p1, 0x4

    .line 271
    aget-object v0, p2, p1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_36

    aget-object p1, p2, p1

    goto :goto_37

    :cond_36
    const/4 p1, 0x0

    :goto_37
    iput-object p1, p0, Lrma;->h:Ljava/lang/Object;

    .line 272
    iput-object p3, p0, Lrma;->i:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/view/View;II[FIIII)V
    .registers 15

    const/4 v0, 0x1

    iput-byte v0, p0, Lrma;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrma;->c:Ljava/lang/Object;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, p5}, Landroid/content/Context;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object p5

    iput-object p5, p0, Lrma;->e:Ljava/lang/Object;

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p5

    invoke-virtual {p5, p6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p5

    iput p5, p0, Lrma;->b:I

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p5

    invoke-virtual {p5, p3}, Landroid/content/Context;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object p3

    iget-object p5, p0, Lrma;->e:Ljava/lang/Object;

    check-cast p5, Landroid/content/res/ColorStateList;

    iget p6, p0, Lrma;->b:I

    new-instance v1, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    iput-object v1, p0, Lrma;->g:Ljava/lang/Object;

    invoke-virtual {v1, p4}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadii([F)V

    if-lez p6, :cond_3d

    iget-object v1, p0, Lrma;->g:Ljava/lang/Object;

    check-cast v1, Landroid/graphics/drawable/GradientDrawable;

    invoke-virtual {v1, p6, p5}, Landroid/graphics/drawable/GradientDrawable;->setStroke(ILandroid/content/res/ColorStateList;)V

    :cond_3d
    new-instance p5, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {p5}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    iput-object p5, p0, Lrma;->h:Ljava/lang/Object;

    invoke-virtual {p5, p4}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadii([F)V

    iget-object p5, p0, Lrma;->h:Ljava/lang/Object;

    check-cast p5, Landroid/graphics/drawable/GradientDrawable;

    const/4 v1, 0x0

    invoke-virtual {p5, p6, v1}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    new-instance p5, Landroid/graphics/drawable/LayerDrawable;

    iget-object p6, p0, Lrma;->g:Ljava/lang/Object;

    check-cast p6, Landroid/graphics/drawable/GradientDrawable;

    iget-object v2, p0, Lrma;->h:Ljava/lang/Object;

    check-cast v2, Landroid/graphics/drawable/GradientDrawable;

    const/4 v3, 0x2

    new-array v3, v3, [Landroid/graphics/drawable/Drawable;

    aput-object p6, v3, v1

    aput-object v2, v3, v0

    invoke-direct {p5, v3}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    iput-object p5, p0, Lrma;->i:Ljava/lang/Object;

    new-instance p5, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {p5}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    invoke-virtual {p5, p4}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadii([F)V

    const/4 p4, -0x1

    invoke-virtual {p5, p4}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    new-instance p4, Landroid/graphics/drawable/RippleDrawable;

    new-instance p6, Landroid/content/res/ColorStateList;

    sget-object v1, Lrma;->m:[I

    sget-object v2, Landroid/util/StateSet;->NOTHING:[I

    filled-new-array {v1, v2}, [[I

    move-result-object v1

    sget-object v2, Lrma;->n:[I

    invoke-virtual {p3}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v3

    invoke-virtual {p3, v2, v3}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v2

    invoke-static {v2}, Landroid/graphics/Color;->alpha(I)I

    move-result v3

    shl-int/2addr v3, v0

    const/16 v4, 0xff

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    invoke-static {v2, v3}, Lab5;->l(II)I

    move-result v2

    sget-object v3, Lrma;->l:[I

    invoke-virtual {p3}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v5

    invoke-virtual {p3, v3, v5}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result p3

    invoke-static {p3}, Landroid/graphics/Color;->alpha(I)I

    move-result v3

    shl-int/2addr v3, v0

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-static {p3, v0}, Lab5;->l(II)I

    move-result p3

    filled-new-array {v2, p3}, [I

    move-result-object p3

    invoke-direct {p6, v1, p3}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    iget-object p3, p0, Lrma;->i:Ljava/lang/Object;

    move-object v1, p3

    check-cast v1, Landroid/graphics/drawable/LayerDrawable;

    if-eqz p7, :cond_c5

    new-instance v0, Landroid/graphics/drawable/InsetDrawable;

    move v4, p8

    move v5, p7

    move v3, p7

    move v2, p8

    invoke-direct/range {v0 .. v5}, Landroid/graphics/drawable/InsetDrawable;-><init>(Landroid/graphics/drawable/Drawable;IIII)V

    move-object v1, v0

    :cond_c5
    invoke-direct {p4, p6, v1, p5}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p1, p4}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/content/Context;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    iget-object p2, p0, Lrma;->d:Ljava/lang/Object;

    check-cast p2, Landroid/content/res/ColorStateList;

    if-eq p1, p2, :cond_e2

    iput-object p1, p0, Lrma;->d:Ljava/lang/Object;

    iget-object p0, p0, Lrma;->g:Ljava/lang/Object;

    check-cast p0, Landroid/graphics/drawable/GradientDrawable;

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(Landroid/content/res/ColorStateList;)V

    :cond_e2
    return-void
.end method

.method public constructor <init>(Lbf9;Lumi;Lcd9;)V
    .registers 9

    const/4 v0, 0x3

    iput-byte v0, p0, Lrma;->a:B

    .line 251
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 252
    new-instance v0, Lj99;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lj99;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lrma;->c:Ljava/lang/Object;

    .line 253
    new-instance v2, Lyc9;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lyc9;-><init>(Lrma;B)V

    .line 254
    new-instance v3, Lq65;

    const/4 v4, 0x4

    invoke-direct {v3, v2, v4}, Lq65;-><init>(Ljava/lang/Object;B)V

    .line 255
    iput-object v3, p0, Lrma;->g:Ljava/lang/Object;

    .line 256
    new-instance v2, Lyc9;

    invoke-direct {v2, p0, v1}, Lyc9;-><init>(Lrma;B)V

    .line 257
    new-instance v1, Lq65;

    invoke-direct {v1, v2, v4}, Lq65;-><init>(Ljava/lang/Object;B)V

    .line 258
    iput-object v1, p0, Lrma;->h:Ljava/lang/Object;

    .line 259
    iput-object p3, p0, Lrma;->f:Ljava/lang/Object;

    .line 260
    iput-object p1, p0, Lrma;->d:Ljava/lang/Object;

    .line 261
    iput-object p2, p0, Lrma;->e:Ljava/lang/Object;

    .line 262
    invoke-virtual {p1, v0}, Lbf9;->b(Lhxl;)V

    .line 263
    invoke-virtual {p0}, Lrma;->l()V

    return-void
.end method

.method public constructor <init>(Lsaj;)V
    .registers 3

    const/4 v0, 0x6

    iput-byte v0, p0, Lrma;->a:B

    .line 248
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 249
    invoke-virtual {p0}, Lrma;->n()V

    .line 250
    sget-object v0, Landroid/util/StateSet;->WILD_CARD:[I

    invoke-virtual {p0, v0, p1}, Lrma;->c([ILsaj;)V

    return-void
.end method

.method public constructor <init>(Lx93;Lsa2;)V
    .registers 5

    const/4 v0, 0x2

    iput-byte v0, p0, Lrma;->a:B

    .line 227
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 228
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lrma;->f:Ljava/lang/Object;

    .line 229
    new-instance v1, Ljava/util/IdentityHashMap;

    invoke-direct {v1}, Ljava/util/IdentityHashMap;-><init>()V

    iput-object v1, p0, Lrma;->e:Ljava/lang/Object;

    .line 230
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lrma;->g:Ljava/lang/Object;

    .line 231
    new-instance v1, Lz;

    .line 232
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 233
    iput-object v1, p0, Lrma;->h:Ljava/lang/Object;

    .line 234
    iput-object p1, p0, Lrma;->c:Ljava/lang/Object;

    .line 235
    new-instance p1, Lb3g;

    .line 236
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 237
    new-instance v1, Landroid/util/SparseArray;

    invoke-direct {v1}, Landroid/util/SparseArray;-><init>()V

    iput-object v1, p1, Lb3g;->a:Landroid/util/SparseArray;

    const/4 v1, 0x0

    .line 238
    iput v1, p1, Lb3g;->b:I

    .line 239
    iput-object p1, p0, Lrma;->d:Ljava/lang/Object;

    .line 240
    iget p1, p2, Lsa2;->b:I

    iput p1, p0, Lrma;->b:I

    const/4 p2, 0x1

    if-ne p1, p2, :cond_46

    .line 241
    new-instance p1, Lisd;

    const/16 p2, 0x1b

    invoke-direct {p1, p2}, Lisd;-><init>(B)V

    iput-object p1, p0, Lrma;->i:Ljava/lang/Object;

    goto :goto_62

    :cond_46
    if-ne p1, v0, :cond_56

    .line 242
    new-instance p1, Lhp2;

    const/16 p2, 0xb

    .line 243
    invoke-direct {p1, p2, v1}, Lhp2;-><init>(BZ)V

    const-wide/16 v0, 0x0

    .line 244
    iput-wide v0, p1, Lhp2;->b:J

    .line 245
    iput-object p1, p0, Lrma;->i:Ljava/lang/Object;

    goto :goto_62

    :cond_56
    const/4 p2, 0x3

    if-ne p1, p2, :cond_63

    .line 246
    new-instance p1, Lyhe;

    const/16 p2, 0x18

    invoke-direct {p1, p2}, Lyhe;-><init>(B)V

    iput-object p1, p0, Lrma;->i:Ljava/lang/Object;

    :goto_62
    return-void

    .line 247
    :cond_63
    const-string p0, "unknown stable id mode"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0
.end method

.method public static h(Landroid/content/Context;Ljava/lang/String;)Lrma;
    .registers 6

    const-string v0, ";"

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x6

    const/4 v3, 0x0

    if-lt v1, v2, :cond_37

    const-string v1, "#"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_37

    const/4 p1, 0x3

    aget-object v1, v0, p1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    if-nez v1, :cond_24

    new-instance p1, Lrma;

    const-string v1, "GET"

    invoke-direct {p1, p0, v0, v1}, Lrma;-><init>(Landroid/content/Context;[Ljava/lang/String;Ljava/lang/String;)V

    return-object p1

    :cond_24
    const/4 v2, 0x1

    if-ne v1, v2, :cond_2f

    new-instance p1, Lrma;

    const-string v1, "HEAD"

    invoke-direct {p1, p0, v0, v1}, Lrma;-><init>(Landroid/content/Context;[Ljava/lang/String;Ljava/lang/String;)V

    return-object p1

    :cond_2f
    const-string p0, "Unknown test type "

    aget-object p1, v0, p1

    invoke-static {p1, p0}, Lt3p;->i(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v3

    :cond_37
    const-string p0, "Invalidly formatted test "

    invoke-virtual {p0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-object v3
.end method

.method public static t(Ljava/lang/String;)Ljava/util/ArrayList;
    .registers 7

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    :goto_6
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-gt v1, v2, :cond_43

    const/16 v2, 0x26

    const/4 v3, 0x4

    invoke-static {p0, v2, v1, v3}, Lkotlin/text/StringsKt;->K(Ljava/lang/CharSequence;CII)I

    move-result v2

    const/4 v4, -0x1

    if-ne v2, v4, :cond_1a

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    :cond_1a
    const/16 v5, 0x3d

    invoke-static {p0, v5, v1, v3}, Lkotlin/text/StringsKt;->K(Ljava/lang/CharSequence;CII)I

    move-result v3

    if-eq v3, v4, :cond_35

    if-gt v3, v2, :cond_35

    invoke-virtual {p0, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {p0, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_40

    :cond_35
    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_40
    add-int/lit8 v1, v2, 0x1

    goto :goto_6

    :cond_43
    return-object v0
.end method


# virtual methods
.method public final a(Ljava/lang/String;Ljava/lang/String;)V
    .registers 14

    iget-object v0, p0, Lrma;->h:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    if-nez v0, :cond_d

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lrma;->h:Ljava/lang/Object;

    :cond_d
    const/16 v9, 0x53

    const/4 v10, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const-string v4, " \"\'<>#&="

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x1

    const/4 v8, 0x0

    move-object v1, p1

    invoke-static/range {v1 .. v10}, Lokhttp3/internal/url/_UrlKt;->canonicalize$default(Ljava/lang/String;IILjava/lang/String;ZZZZILjava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object p0, p0, Lrma;->h:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    if-eqz p2, :cond_37

    const/16 v8, 0x53

    const/4 v9, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const-string v3, " \"\'<>#&="

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/4 v6, 0x1

    const/4 v7, 0x0

    move-object v0, p2

    invoke-static/range {v0 .. v9}, Lokhttp3/internal/url/_UrlKt;->canonicalize$default(Ljava/lang/String;IILjava/lang/String;ZZZZILjava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    goto :goto_38

    :cond_37
    const/4 p1, 0x0

    :goto_38
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final b(Ljava/lang/String;Ljava/lang/String;)V
    .registers 14

    iget-object v0, p0, Lrma;->h:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    if-nez v0, :cond_d

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lrma;->h:Ljava/lang/Object;

    :cond_d
    const/16 v9, 0x5b

    const/4 v10, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const-string v4, " !\"#$&\'(),/:;<=>?@[]\\^`{|}~"

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x1

    const/4 v8, 0x0

    move-object v1, p1

    invoke-static/range {v1 .. v10}, Lokhttp3/internal/url/_UrlKt;->canonicalize$default(Ljava/lang/String;IILjava/lang/String;ZZZZILjava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object p0, p0, Lrma;->h:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    if-eqz p2, :cond_37

    const/16 v8, 0x5b

    const/4 v9, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const-string v3, " !\"#$&\'(),/:;<=>?@[]\\^`{|}~"

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x1

    const/4 v7, 0x0

    move-object v0, p2

    invoke-static/range {v0 .. v9}, Lokhttp3/internal/url/_UrlKt;->canonicalize$default(Ljava/lang/String;IILjava/lang/String;ZZZZILjava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    goto :goto_38

    :cond_37
    const/4 p1, 0x0

    :goto_38
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final c([ILsaj;)V
    .registers 8

    iget v0, p0, Lrma;->b:I

    if-eqz v0, :cond_7

    array-length v1, p1

    if-nez v1, :cond_9

    :cond_7
    iput-object p2, p0, Lrma;->c:Ljava/lang/Object;

    :cond_9
    iget-object v1, p0, Lrma;->d:Ljava/lang/Object;

    check-cast v1, [[I

    array-length v2, v1

    if-lt v0, v2, :cond_25

    add-int/lit8 v2, v0, 0xa

    new-array v3, v2, [[I

    const/4 v4, 0x0

    invoke-static {v1, v4, v3, v4, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iput-object v3, p0, Lrma;->d:Ljava/lang/Object;

    new-array v1, v2, [Lsaj;

    iget-object v2, p0, Lrma;->e:Ljava/lang/Object;

    check-cast v2, [Lsaj;

    invoke-static {v2, v4, v1, v4, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iput-object v1, p0, Lrma;->e:Ljava/lang/Object;

    :cond_25
    iget-object v0, p0, Lrma;->d:Ljava/lang/Object;

    check-cast v0, [[I

    iget v1, p0, Lrma;->b:I

    aput-object p1, v0, v1

    iget-object p1, p0, Lrma;->e:Ljava/lang/Object;

    check-cast p1, [Lsaj;

    aput-object p2, p1, v1

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lrma;->b:I

    return-void
.end method

.method public final d()Lhra;
    .registers 21

    move-object/from16 v0, p0

    iget-object v1, v0, Lrma;->c:Ljava/lang/Object;

    move-object v3, v1

    check-cast v3, Ljava/lang/String;

    const/4 v1, 0x0

    if-eqz v3, :cond_b6

    iget-object v2, v0, Lrma;->d:Ljava/lang/Object;

    move-object v4, v2

    check-cast v4, Ljava/lang/String;

    const/4 v8, 0x7

    const/4 v9, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-static/range {v4 .. v9}, Lokhttp3/internal/url/_UrlKt;->percentDecode$default(Ljava/lang/String;IIZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    iget-object v2, v0, Lrma;->e:Ljava/lang/Object;

    move-object v5, v2

    check-cast v5, Ljava/lang/String;

    const/4 v9, 0x7

    const/4 v10, 0x0

    const/4 v8, 0x0

    invoke-static/range {v5 .. v10}, Lokhttp3/internal/url/_UrlKt;->percentDecode$default(Ljava/lang/String;IIZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    iget-object v2, v0, Lrma;->g:Ljava/lang/Object;

    move-object v6, v2

    check-cast v6, Ljava/lang/String;

    if-eqz v6, :cond_b0

    invoke-virtual {v0}, Lrma;->i()I

    move-result v7

    iget-object v2, v0, Lrma;->f:Ljava/lang/Object;

    check-cast v2, Ljava/util/ArrayList;

    new-instance v8, Ljava/util/ArrayList;

    const/16 v9, 0xa

    invoke-static {v2, v9}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v10

    invoke-direct {v8, v10}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v10

    const/4 v11, 0x0

    move v12, v11

    :goto_44
    if-ge v12, v10, :cond_60

    invoke-virtual {v2, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    add-int/lit8 v12, v12, 0x1

    move-object v14, v13

    check-cast v14, Ljava/lang/String;

    const/16 v18, 0x7

    const/16 v19, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    invoke-static/range {v14 .. v19}, Lokhttp3/internal/url/_UrlKt;->percentDecode$default(Ljava/lang/String;IIZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v8, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_44

    :cond_60
    iget-object v2, v0, Lrma;->h:Ljava/lang/Object;

    check-cast v2, Ljava/util/ArrayList;

    if-eqz v2, :cond_94

    new-instance v10, Ljava/util/ArrayList;

    invoke-static {v2, v9}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v9

    invoke-direct {v10, v9}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v9

    :goto_73
    if-ge v11, v9, :cond_92

    invoke-virtual {v2, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    add-int/lit8 v11, v11, 0x1

    move-object v13, v12

    check-cast v13, Ljava/lang/String;

    if-eqz v13, :cond_8d

    const/16 v17, 0x3

    const/16 v18, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x1

    invoke-static/range {v13 .. v18}, Lokhttp3/internal/url/_UrlKt;->percentDecode$default(Ljava/lang/String;IIZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    goto :goto_8e

    :cond_8d
    move-object v12, v1

    :goto_8e
    invoke-virtual {v10, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_73

    :cond_92
    move-object v9, v10

    goto :goto_95

    :cond_94
    move-object v9, v1

    :goto_95
    iget-object v2, v0, Lrma;->i:Ljava/lang/Object;

    move-object v10, v2

    check-cast v10, Ljava/lang/String;

    if-eqz v10, :cond_a5

    const/4 v14, 0x7

    const/4 v15, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    invoke-static/range {v10 .. v15}, Lokhttp3/internal/url/_UrlKt;->percentDecode$default(Ljava/lang/String;IIZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    :cond_a5
    move-object v10, v1

    invoke-virtual {v0}, Lrma;->toString()Ljava/lang/String;

    move-result-object v11

    new-instance v2, Lhra;

    invoke-direct/range {v2 .. v11}, Lhra;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)V

    return-object v2

    :cond_b0
    const-string v0, "host == null"

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v1

    :cond_b6
    const-string v0, "scheme == null"

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v1
.end method

.method public final e()V
    .registers 8

    iget-object v0, p0, Lrma;->c:Ljava/lang/Object;

    check-cast v0, Lx93;

    iget-object p0, p0, Lrma;->g:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :cond_d
    if-ge v2, v1, :cond_2a

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lxke;

    iget-object v4, v3, Lxke;->c:Landroidx/recyclerview/widget/d;

    invoke-virtual {v4}, Landroidx/recyclerview/widget/d;->getStateRestorationPolicy()Leph;

    move-result-object v4

    sget-object v5, Leph;->c:Leph;

    if-eq v4, v5, :cond_2c

    sget-object v6, Leph;->b:Leph;

    if-ne v4, v6, :cond_d

    iget v3, v3, Lxke;->e:I

    if-nez v3, :cond_d

    goto :goto_2c

    :cond_2a
    sget-object v5, Leph;->a:Leph;

    :cond_2c
    :goto_2c
    invoke-virtual {v0}, Landroidx/recyclerview/widget/d;->getStateRestorationPolicy()Leph;

    move-result-object p0

    if-eq v5, p0, :cond_35

    invoke-virtual {v0, v5}, Lx93;->I(Leph;)V

    :cond_35
    return-void
.end method

.method public final f()V
    .registers 2

    iget-object v0, p0, Lrma;->g:Ljava/lang/Object;

    check-cast v0, Lq65;

    invoke-virtual {v0}, Ln1;->S()V

    iget-object v0, p0, Lrma;->h:Ljava/lang/Object;

    check-cast v0, Lq65;

    invoke-virtual {v0}, Ln1;->S()V

    iget-object v0, p0, Lrma;->i:Ljava/lang/Object;

    check-cast v0, Lih4;

    if-eqz v0, :cond_1a

    invoke-interface {v0}, Lih4;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Lrma;->i:Ljava/lang/Object;

    :cond_1a
    const/4 v0, 0x0

    iput v0, p0, Lrma;->b:I

    return-void
.end method

.method public final g(Lxke;)I
    .registers 6

    iget-object p0, p0, Lrma;->g:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :goto_a
    if-ge v2, v0, :cond_1a

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lxke;

    if-eq v3, p1, :cond_1a

    iget v3, v3, Lxke;->e:I

    add-int/2addr v1, v3

    goto :goto_a

    :cond_1a
    return v1
.end method

.method public final i()I
    .registers 3

    iget v0, p0, Lrma;->b:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_6

    return v0

    :cond_6
    iget-object p0, p0, Lrma;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    const-string v0, "http"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_15

    const/16 v1, 0x50

    goto :goto_1f

    :cond_15
    const-string v0, "https"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1f

    const/16 v1, 0x1bb

    :cond_1f
    :goto_1f
    return v1
.end method

.method public final j(Ljava/lang/String;)V
    .registers 4

    const-string v0, "/"

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Lkotlin/text/c;->q(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_11

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p0, v1, v0, p1}, Lrma;->r(IILjava/lang/String;)V

    return-void

    :cond_11
    const-string p0, "unexpected encodedPath: "

    invoke-virtual {p0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lbxl;->d(Ljava/lang/Object;)V

    return-void
.end method

.method public final k(I)Lz;
    .registers 8

    iget-object v0, p0, Lrma;->h:Ljava/lang/Object;

    check-cast v0, Lz;

    iget-boolean v1, v0, Lz;->a:Z

    if-eqz v1, :cond_e

    new-instance v0, Lz;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    goto :goto_11

    :cond_e
    const/4 v1, 0x1

    iput-boolean v1, v0, Lz;->a:Z

    :goto_11
    iget-object p0, p0, Lrma;->g:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    move v3, p1

    :goto_1b
    if-ge v2, v1, :cond_30

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v2, v2, 0x1

    check-cast v4, Lxke;

    iget v5, v4, Lxke;->e:I

    if-le v5, v3, :cond_2e

    iput-object v4, v0, Lz;->c:Ljava/lang/Object;

    iput v3, v0, Lz;->b:I

    goto :goto_30

    :cond_2e
    sub-int/2addr v3, v5

    goto :goto_1b

    :cond_30
    :goto_30
    iget-object p0, v0, Lz;->c:Ljava/lang/Object;

    check-cast p0, Lxke;

    if-eqz p0, :cond_37

    return-object v0

    :cond_37
    const-string p0, "Cannot find wrapper for "

    invoke-static {p1, p0}, Lsko;->i(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final l()V
    .registers 20

    move-object/from16 v0, p0

    iget v1, v0, Lrma;->b:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_8

    return-void

    :cond_8
    invoke-virtual {v0}, Lrma;->f()V

    iget-object v1, v0, Lrma;->f:Ljava/lang/Object;

    check-cast v1, Lcd9;

    iput v2, v1, Lcd9;->n:I

    const/4 v3, 0x0

    iput-object v3, v1, Lcd9;->t:Ljava/lang/String;

    invoke-virtual {v1}, Lcd9;->y0()V

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    iget-object v1, v0, Lrma;->d:Ljava/lang/Object;

    check-cast v1, Lbf9;

    new-instance v6, Laz4;

    invoke-direct {v6, v0, v4, v5, v2}, Laz4;-><init>(Ljava/lang/Object;JB)V

    iget-object v4, v1, Lbf9;->y:Lmgh;

    if-eqz v4, :cond_2d

    invoke-virtual {v4, v3}, Lmgh;->e(Ljava/lang/Object;)V

    iput-object v3, v1, Lbf9;->y:Lmgh;

    :cond_2d
    const/4 v3, 0x6

    new-array v4, v3, [B

    new-instance v5, Ljava/security/SecureRandom;

    invoke-direct {v5}, Ljava/security/SecureRandom;-><init>()V

    invoke-virtual {v5, v4}, Ljava/security/SecureRandom;->nextBytes([B)V

    const/4 v5, 0x0

    aget-byte v7, v4, v5

    and-int/lit8 v7, v7, 0x3f

    invoke-static {v7}, Lbf9;->Q(I)C

    move-result v7

    aget-byte v8, v4, v2

    and-int/lit8 v8, v8, 0xf

    aget-byte v9, v4, v5

    and-int/lit16 v9, v9, 0xc0

    const/4 v10, 0x2

    shr-int/2addr v9, v10

    or-int/2addr v8, v9

    invoke-static {v8}, Lbf9;->Q(I)C

    move-result v8

    aget-byte v9, v4, v2

    and-int/lit16 v9, v9, 0xf0

    shr-int/2addr v9, v10

    aget-byte v11, v4, v10

    const/4 v12, 0x3

    and-int/2addr v11, v12

    or-int/2addr v9, v11

    invoke-static {v9}, Lbf9;->Q(I)C

    move-result v9

    aget-byte v11, v4, v10

    and-int/lit16 v11, v11, 0xfc

    shr-int/2addr v11, v10

    invoke-static {v11}, Lbf9;->Q(I)C

    move-result v11

    aget-byte v13, v4, v12

    and-int/lit8 v13, v13, 0x3f

    invoke-static {v13}, Lbf9;->Q(I)C

    move-result v13

    const/4 v14, 0x4

    aget-byte v15, v4, v14

    and-int/lit8 v15, v15, 0xf

    move/from16 v16, v3

    aget-byte v3, v4, v12

    and-int/lit16 v3, v3, 0xc0

    shr-int/2addr v3, v10

    or-int/2addr v15, v3

    invoke-static {v15}, Lbf9;->Q(I)C

    move-result v3

    aget-byte v15, v4, v14

    and-int/lit16 v15, v15, 0xf0

    shr-int/2addr v15, v10

    const/16 v17, 0x5

    aget-byte v18, v4, v17

    and-int/lit8 v18, v18, 0x3

    or-int v15, v15, v18

    invoke-static {v15}, Lbf9;->Q(I)C

    move-result v15

    aget-byte v4, v4, v17

    and-int/lit16 v4, v4, 0xfc

    shr-int/2addr v4, v10

    invoke-static {v4}, Lbf9;->Q(I)C

    move-result v4

    move/from16 v18, v10

    const/16 v10, 0x9

    new-array v10, v10, [C

    aput-char v7, v10, v5

    aput-char v8, v10, v2

    aput-char v9, v10, v18

    aput-char v11, v10, v12

    const/16 v7, 0x2d

    aput-char v7, v10, v14

    aput-char v13, v10, v17

    aput-char v3, v10, v16

    const/4 v3, 0x7

    aput-char v15, v10, v3

    const/16 v3, 0x8

    aput-char v4, v10, v3

    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, v10}, Ljava/lang/String;-><init>([C)V

    invoke-virtual {v1}, Lbf9;->r()I

    move-result v4

    if-lt v4, v2, :cond_cd

    iget-object v4, v1, Lbf9;->n:Lzd2;

    if-nez v4, :cond_cd

    invoke-virtual {v1, v3, v6, v2}, Lbf9;->c(Ljava/lang/String;Laz4;Z)Lmgh;

    move-result-object v3

    iput-object v3, v1, Lbf9;->y:Lmgh;

    goto :goto_e3

    :cond_cd
    new-instance v4, Lexl;

    new-instance v7, Lte9;

    invoke-direct {v7, v1, v3, v6, v5}, Lte9;-><init>(Lbf9;Ljava/lang/String;Laz4;B)V

    invoke-direct {v4, v7, v6}, Lexl;-><init>(Ldxl;Lcom/opera/api/Callback;)V

    iput-object v4, v1, Lbf9;->y:Lmgh;

    iget-object v3, v1, Lbf9;->g:Ljava/util/ArrayList;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v1}, Lbf9;->C()V

    iget-object v3, v1, Lbf9;->y:Lmgh;

    :goto_e3
    iput v2, v0, Lrma;->b:I

    iput-object v3, v0, Lrma;->i:Ljava/lang/Object;

    return-void
.end method

.method public final m(Landroidx/recyclerview/widget/i;)Lxke;
    .registers 4

    iget-object v0, p0, Lrma;->e:Ljava/lang/Object;

    check-cast v0, Ljava/util/IdentityHashMap;

    invoke-virtual {v0, p1}, Ljava/util/IdentityHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lxke;

    if-eqz v0, :cond_d

    return-object v0

    :cond_d
    const-string v0, "Cannot find wrapper for "

    const-string v1, ", seems like it is not bound by this adapter: "

    invoke-static {v0, p1, v1, p0}, Ln57;->f(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final n()V
    .registers 3

    new-instance v0, Lsaj;

    invoke-direct {v0}, Lsaj;-><init>()V

    iput-object v0, p0, Lrma;->c:Ljava/lang/Object;

    const/16 v0, 0xa

    new-array v1, v0, [[I

    iput-object v1, p0, Lrma;->d:Ljava/lang/Object;

    new-array v0, v0, [Lsaj;

    iput-object v0, p0, Lrma;->e:Ljava/lang/Object;

    return-void
.end method

.method public final o(Ljava/lang/String;Lhra;)V
    .registers 33

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v7, p2

    iget-object v2, v0, Lrma;->f:Ljava/lang/Object;

    move-object v8, v2

    check-cast v8, Ljava/util/ArrayList;

    const/4 v9, 0x0

    const/4 v2, 0x3

    const/4 v10, 0x0

    invoke-static {v1, v9, v9, v2, v10}, Lokhttp3/internal/_UtilCommonKt;->indexOfFirstNonAsciiWhitespace$default(Ljava/lang/String;IIILjava/lang/Object;)I

    move-result v3

    const/4 v11, 0x2

    invoke-static {v1, v3, v9, v11, v10}, Lokhttp3/internal/_UtilCommonKt;->indexOfLastNonAsciiWhitespace$default(Ljava/lang/String;IIILjava/lang/Object;)I

    move-result v12

    sub-int v2, v12, v3

    const/16 v13, 0x5b

    const/16 v14, 0x3a

    const/4 v15, -0x1

    if-lt v2, v11, :cond_70

    invoke-virtual {v1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v4, 0x61

    invoke-static {v2, v4}, Lkotlin/jvm/internal/Intrinsics;->b(II)I

    move-result v5

    const/16 v6, 0x41

    if-ltz v5, :cond_36

    const/16 v5, 0x7a

    invoke-static {v2, v5}, Lkotlin/jvm/internal/Intrinsics;->b(II)I

    move-result v5

    if-lez v5, :cond_44

    :cond_36
    invoke-static {v2, v6}, Lkotlin/jvm/internal/Intrinsics;->b(II)I

    move-result v5

    if-ltz v5, :cond_70

    const/16 v5, 0x5a

    invoke-static {v2, v5}, Lkotlin/jvm/internal/Intrinsics;->b(II)I

    move-result v2

    if-gtz v2, :cond_70

    :cond_44
    add-int/lit8 v2, v3, 0x1

    :goto_46
    if-ge v2, v12, :cond_70

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-gt v4, v5, :cond_52

    const/16 v4, 0x7b

    if-lt v5, v4, :cond_6b

    :cond_52
    if-gt v6, v5, :cond_56

    if-lt v5, v13, :cond_6b

    :cond_56
    const/16 v4, 0x30

    if-gt v4, v5, :cond_5c

    if-lt v5, v14, :cond_6b

    :cond_5c
    const/16 v4, 0x2b

    if-eq v5, v4, :cond_6b

    const/16 v4, 0x2d

    if-eq v5, v4, :cond_6b

    const/16 v4, 0x2e

    if-eq v5, v4, :cond_6b

    if-ne v5, v14, :cond_70

    goto :goto_71

    :cond_6b
    add-int/lit8 v2, v2, 0x1

    const/16 v4, 0x61

    goto :goto_46

    :cond_70
    move v2, v15

    :goto_71
    const-string v4, "http"

    const-string v5, "https"

    const/4 v6, 0x1

    if-eq v2, v15, :cond_c4

    move-object/from16 v16, v5

    const/4 v5, 0x0

    move/from16 v17, v2

    move v2, v6

    const/4 v6, 0x6

    move-object/from16 v18, v4

    const-string v4, "https:"

    move-object/from16 v14, v16

    move/from16 v10, v17

    move-object/from16 v13, v18

    invoke-virtual/range {v1 .. v6}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    move-result v4

    if-eqz v4, :cond_96

    iput-object v14, v0, Lrma;->c:Ljava/lang/Object;

    add-int/lit8 v3, v3, 0x6

    move-object/from16 v1, p1

    goto :goto_cc

    :cond_96
    const/4 v5, 0x0

    const/4 v6, 0x5

    const-string v4, "http:"

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v6}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    move-result v4

    if-eqz v4, :cond_a7

    iput-object v13, v0, Lrma;->c:Ljava/lang/Object;

    add-int/lit8 v3, v3, 0x5

    goto :goto_cc

    :cond_a7
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v1, v9, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Expected URL scheme \'http\' or \'https\' but was \'"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x27

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_c4
    move-object v13, v4

    move-object v14, v5

    if-eqz v7, :cond_2f9

    iget-object v4, v7, Lhra;->a:Ljava/lang/String;

    iput-object v4, v0, Lrma;->c:Ljava/lang/Object;

    :goto_cc
    move v4, v3

    move v5, v9

    :goto_ce
    const/16 v6, 0x5c

    const/16 v10, 0x2f

    if-ge v4, v12, :cond_e1

    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-eq v2, v10, :cond_dc

    if-ne v2, v6, :cond_e1

    :cond_dc
    add-int/lit8 v5, v5, 0x1

    add-int/lit8 v4, v4, 0x1

    goto :goto_ce

    :cond_e1
    const/16 v2, 0x3f

    const/16 v4, 0x23

    if-ge v5, v11, :cond_146

    if-eqz v7, :cond_146

    iget-object v11, v7, Lhra;->a:Ljava/lang/String;

    iget-object v9, v0, Lrma;->c:Ljava/lang/Object;

    check-cast v9, Ljava/lang/String;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_146

    invoke-virtual {v7}, Lhra;->e()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v0, Lrma;->d:Ljava/lang/Object;

    invoke-virtual {v7}, Lhra;->a()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v0, Lrma;->e:Ljava/lang/Object;

    iget-object v5, v7, Lhra;->d:Ljava/lang/String;

    iput-object v5, v0, Lrma;->g:Ljava/lang/Object;

    iget v5, v7, Lhra;->e:I

    iput v5, v0, Lrma;->b:I

    invoke-virtual {v8}, Ljava/util/ArrayList;->clear()V

    invoke-virtual {v7}, Lhra;->c()Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v8, v5}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    if-eq v3, v12, :cond_11b

    invoke-virtual {v1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-ne v5, v4, :cond_141

    :cond_11b
    invoke-virtual {v7}, Lhra;->d()Ljava/lang/String;

    move-result-object v20

    if-eqz v20, :cond_13e

    const/16 v28, 0x53

    const/16 v29, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const-string v23, " \"\'<>#"

    const/16 v24, 0x1

    const/16 v25, 0x0

    const/16 v26, 0x1

    const/16 v27, 0x0

    invoke-static/range {v20 .. v29}, Lokhttp3/internal/url/_UrlKt;->canonicalize$default(Ljava/lang/String;IILjava/lang/String;ZZZZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_13e

    invoke-static {v5}, Lrma;->t(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v10

    goto :goto_13f

    :cond_13e
    const/4 v10, 0x0

    :goto_13f
    iput-object v10, v0, Lrma;->h:Ljava/lang/Object;

    :cond_141
    move/from16 v18, v12

    const/4 v12, 0x1

    goto/16 :goto_2a1

    :cond_146
    add-int/2addr v3, v5

    const/4 v11, 0x0

    const/16 v20, 0x0

    :cond_14a
    :goto_14a
    const-string v5, "@/\\?#"

    invoke-static {v1, v5, v3, v12}, Lokhttp3/internal/_UtilCommonKt;->delimiterOffset(Ljava/lang/String;Ljava/lang/String;II)I

    move-result v5

    if-eq v5, v12, :cond_157

    invoke-virtual {v1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v7

    goto :goto_158

    :cond_157
    move v7, v15

    :goto_158
    if-eq v7, v15, :cond_205

    if-eq v7, v4, :cond_205

    if-eq v7, v10, :cond_205

    if-eq v7, v6, :cond_205

    if-eq v7, v2, :cond_205

    const/16 v8, 0x40

    if-ne v7, v8, :cond_14a

    const-string v7, "%40"

    move v2, v3

    if-nez v20, :cond_1c2

    const/16 v8, 0x3a

    invoke-static {v1, v8, v2, v5}, Lokhttp3/internal/_UtilCommonKt;->delimiterOffset(Ljava/lang/String;CII)I

    move-result v3

    const/16 v9, 0x70

    move/from16 v19, v10

    const/4 v10, 0x0

    const-string v4, " \"\':;<=>@[]^`{}|/\\?#"

    move/from16 v22, v5

    const/4 v5, 0x1

    move/from16 v23, v6

    const/4 v6, 0x0

    move-object/from16 v24, v7

    const/4 v7, 0x0

    const/4 v8, 0x0

    move/from16 p2, v11

    move/from16 v18, v12

    move/from16 v15, v22

    move-object/from16 v11, v24

    const/4 v12, 0x1

    invoke-static/range {v1 .. v10}, Lokhttp3/internal/url/_UrlKt;->canonicalize$default(Ljava/lang/String;IILjava/lang/String;ZZZZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    if-eqz p2, :cond_19e

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, v0, Lrma;->d:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    invoke-static {v1, v4, v11, v2}, Lp3p;->n(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :cond_19e
    iput-object v2, v0, Lrma;->d:Ljava/lang/Object;

    if-eq v3, v15, :cond_1b8

    add-int/lit8 v2, v3, 0x1

    const/16 v9, 0x70

    const/4 v10, 0x0

    const-string v4, " \"\':;<=>@[]^`{}|/\\?#"

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object/from16 v1, p1

    move v3, v15

    invoke-static/range {v1 .. v10}, Lokhttp3/internal/url/_UrlKt;->canonicalize$default(Ljava/lang/String;IILjava/lang/String;ZZZZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lrma;->e:Ljava/lang/Object;

    move v6, v12

    goto :goto_1bb

    :cond_1b8
    move v3, v15

    move/from16 v6, v20

    :goto_1bb
    move-object/from16 v1, p1

    move v7, v3

    move/from16 v20, v6

    move v11, v12

    goto :goto_1f6

    :cond_1c2
    move v3, v5

    move/from16 v23, v6

    move/from16 v19, v10

    move/from16 p2, v11

    move/from16 v18, v12

    move-object v11, v7

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, v0, Lrma;->e:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v15, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v9, 0x70

    const/4 v10, 0x0

    const-string v4, " \"\':;<=>@[]^`{}|/\\?#"

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object/from16 v1, p1

    invoke-static/range {v1 .. v10}, Lokhttp3/internal/url/_UrlKt;->canonicalize$default(Ljava/lang/String;IILjava/lang/String;ZZZZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    move v7, v3

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lrma;->e:Ljava/lang/Object;

    move/from16 v11, p2

    :goto_1f6
    add-int/lit8 v3, v7, 0x1

    move/from16 v12, v18

    move/from16 v10, v19

    move/from16 v6, v23

    const/16 v2, 0x3f

    const/16 v4, 0x23

    const/4 v15, -0x1

    goto/16 :goto_14a

    :cond_205
    move v2, v3

    move v7, v5

    move/from16 v18, v12

    const/4 v12, 0x1

    move v3, v2

    :goto_20b
    if-ge v3, v7, :cond_226

    invoke-virtual {v1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v8, 0x3a

    if-eq v4, v8, :cond_227

    const/16 v5, 0x5b

    if-ne v4, v5, :cond_224

    :cond_219
    add-int/2addr v3, v12

    if-ge v3, v7, :cond_224

    invoke-virtual {v1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v6, 0x5d

    if-ne v4, v6, :cond_219

    :cond_224
    add-int/2addr v3, v12

    goto :goto_20b

    :cond_226
    move v3, v7

    :cond_227
    add-int/lit8 v8, v3, 0x1

    const/16 v11, 0x22

    if-ge v8, v7, :cond_273

    const/4 v5, 0x4

    const/4 v6, 0x0

    const/4 v4, 0x0

    invoke-static/range {v1 .. v6}, Lokhttp3/internal/url/_UrlKt;->percentDecode$default(Ljava/lang/String;IIZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move v15, v2

    move/from16 v16, v3

    invoke-static {v4}, Lokhttp3/internal/_HostnamesCommonKt;->toCanonicalHost(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lrma;->g:Ljava/lang/Object;

    :try_start_23d
    const-string v4, ""
    :try_end_23f
    .catch Ljava/lang/NumberFormatException; {:try_start_23d .. :try_end_23f} :catch_25c

    const/16 v9, 0x78

    const/4 v10, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move v3, v7

    const/4 v7, 0x0

    move v2, v8

    const/4 v8, 0x0

    move-object/from16 v1, p1

    :try_start_24a
    invoke-static/range {v1 .. v10}, Lokhttp3/internal/url/_UrlKt;->canonicalize$default(Ljava/lang/String;IILjava/lang/String;ZZZZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v4
    :try_end_24e
    .catch Ljava/lang/NumberFormatException; {:try_start_24a .. :try_end_24e} :catch_25a

    move v7, v3

    :try_start_24f
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3
    :try_end_253
    .catch Ljava/lang/NumberFormatException; {:try_start_24f .. :try_end_253} :catch_25f

    if-gt v12, v3, :cond_25f

    const/high16 v4, 0x10000

    if-ge v3, v4, :cond_25f

    goto :goto_260

    :catch_25a
    move v7, v3

    goto :goto_25f

    :catch_25c
    move-object/from16 v1, p1

    move v2, v8

    :catch_25f
    :cond_25f
    :goto_25f
    const/4 v3, -0x1

    :goto_260
    iput v3, v0, Lrma;->b:I

    const/4 v8, -0x1

    if-eq v3, v8, :cond_269

    move v2, v15

    move/from16 v3, v16

    goto :goto_29a

    :cond_269
    const-string v0, "Invalid URL port: \""

    invoke-virtual {v1, v2, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v11}, Ls49;->p(Ljava/lang/String;Ljava/lang/Object;I)V

    return-void

    :cond_273
    const/4 v8, -0x1

    const/4 v5, 0x4

    const/4 v6, 0x0

    const/4 v4, 0x0

    invoke-static/range {v1 .. v6}, Lokhttp3/internal/url/_UrlKt;->percentDecode$default(Ljava/lang/String;IIZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lokhttp3/internal/_HostnamesCommonKt;->toCanonicalHost(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v0, Lrma;->g:Ljava/lang/Object;

    iget-object v4, v0, Lrma;->c:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    invoke-static {v4, v13}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_28e

    const/16 v15, 0x50

    goto :goto_298

    :cond_28e
    invoke-static {v4, v14}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_297

    const/16 v15, 0x1bb

    goto :goto_298

    :cond_297
    move v15, v8

    :goto_298
    iput v15, v0, Lrma;->b:I

    :goto_29a
    iget-object v4, v0, Lrma;->g:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    if-eqz v4, :cond_2ef

    move v3, v7

    :goto_2a1
    const-string v2, "?#"

    move/from16 v11, v18

    invoke-static {v1, v2, v3, v11}, Lokhttp3/internal/_UtilCommonKt;->delimiterOffset(Ljava/lang/String;Ljava/lang/String;II)I

    move-result v2

    invoke-virtual {v0, v3, v2, v1}, Lrma;->r(IILjava/lang/String;)V

    if-ge v2, v11, :cond_2d3

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v8, 0x3f

    if-ne v3, v8, :cond_2d3

    const/16 v13, 0x23

    invoke-static {v1, v13, v2, v11}, Lokhttp3/internal/_UtilCommonKt;->delimiterOffset(Ljava/lang/String;CII)I

    move-result v3

    add-int/lit8 v2, v2, 0x1

    const/16 v9, 0x50

    const/4 v10, 0x0

    const-string v4, " \"\'<>#"

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x1

    const/4 v8, 0x0

    invoke-static/range {v1 .. v10}, Lokhttp3/internal/url/_UrlKt;->canonicalize$default(Ljava/lang/String;IILjava/lang/String;ZZZZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lrma;->t(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v2

    iput-object v2, v0, Lrma;->h:Ljava/lang/Object;

    move v2, v3

    goto :goto_2d5

    :cond_2d3
    const/16 v13, 0x23

    :goto_2d5
    if-ge v2, v11, :cond_2ee

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v13, :cond_2ee

    add-int/2addr v2, v12

    const/16 v9, 0x30

    const/4 v10, 0x0

    const-string v4, ""

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x1

    move v3, v11

    invoke-static/range {v1 .. v10}, Lokhttp3/internal/url/_UrlKt;->canonicalize$default(Ljava/lang/String;IILjava/lang/String;ZZZZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lrma;->i:Ljava/lang/Object;

    :cond_2ee
    return-void

    :cond_2ef
    const-string v0, "Invalid URL host: \""

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v11}, Ls49;->p(Ljava/lang/String;Ljava/lang/Object;I)V

    return-void

    :cond_2f9
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v2, 0x6

    if-le v0, v2, :cond_30b

    invoke-static {v2, v1}, Lpik;->D(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "..."

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_30c

    :cond_30b
    move-object v0, v1

    :goto_30c
    const-string v1, "Expected URL scheme \'http\' or \'https\' but no scheme was found for "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lqp2;->o(Ljava/lang/String;)V

    return-void
.end method

.method public final p(Ljava/net/Socket;Z)I
    .registers 15

    iget-object v0, p0, Lrma;->i:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iget-object v1, p0, Lrma;->h:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    const-wide/32 v4, 0xf4240

    div-long/2addr v2, v4

    new-instance v6, Ljava/io/PrintStream;

    invoke-virtual {p1}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/PrintStream;-><init>(Ljava/io/OutputStream;)V

    iget-object v7, p0, Lrma;->g:Ljava/lang/Object;

    check-cast v7, Ljava/net/URI;

    if-eqz p2, :cond_24

    invoke-virtual {v7}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_28

    :cond_24
    invoke-virtual {v7}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object p2

    :goto_28
    const-string v8, "?"

    invoke-static {p2, v8}, Lu35;->h(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v8

    const-wide/32 v10, 0x10001

    rem-long/2addr v8, v10

    invoke-virtual {p2, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v9, " "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " HTTP/1.0\r\nHost: "

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "\r\nCache-Control: no-cache\r\nConnection: close\r\n\r\n"

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v6, p2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/io/PrintStream;->checkError()Z

    move-result p2

    if-nez p2, :cond_e2

    const-string p2, "HEAD"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    new-instance v0, Ljava/io/BufferedReader;

    new-instance v6, Ljava/io/InputStreamReader;

    invoke-virtual {p1}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object p1

    invoke-direct {v6, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v0, v6}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    const/4 p1, 0x0

    :cond_7d
    :goto_7d
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_99

    if-eqz p1, :cond_8a

    const-string v0, "Unexpectedly got more than one line of response"

    iput-object v0, p0, Lrma;->e:Ljava/lang/Object;

    goto :goto_99

    :cond_8a
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-nez v6, :cond_7d

    if-nez p2, :cond_97

    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object p1

    goto :goto_7d

    :cond_97
    const-string p1, ""

    :cond_99
    :goto_99
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v6

    div-long/2addr v6, v4

    if-nez p1, :cond_a5

    const-string p1, "No response from server"

    iput-object p1, p0, Lrma;->e:Ljava/lang/Object;

    goto :goto_df

    :cond_a5
    if-nez p2, :cond_df

    iget-object p2, p0, Lrma;->e:Ljava/lang/Object;

    check-cast p2, Ljava/lang/String;

    if-nez p2, :cond_df

    if-eqz v1, :cond_df

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_df

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p2

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    shl-int/lit8 v0, v0, 0x1

    invoke-static {p2, v0}, Ljava/lang/Math;->min(II)I

    move-result p2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v4, "Response \""

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v4, 0x0

    invoke-virtual {p1, v4, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\" didn\'t match \""

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\""

    invoke-static {v0, v1, p1}, Lz1m;->l(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lrma;->e:Ljava/lang/Object;

    :cond_df
    :goto_df
    sub-long/2addr v6, v2

    long-to-int p0, v6

    return p0

    :cond_e2
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0}, Ljava/io/IOException;-><init>()V

    throw p0
.end method

.method public final q(Ljava/lang/String;IIZZ)V
    .registers 16

    iget-object p0, p0, Lrma;->f:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    const/16 v8, 0x70

    const/4 v9, 0x0

    const-string v3, " \"<>^`{}|/\\?#"

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, p1

    move v1, p2

    move v2, p3

    move v4, p5

    invoke-static/range {v0 .. v9}, Lokhttp3/internal/url/_UrlKt;->canonicalize$default(Ljava/lang/String;IILjava/lang/String;ZZZZILjava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string p2, "."

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_83

    const-string p2, "%2e"

    const/4 p3, 0x1

    invoke-static {p1, p2, p3}, Lkotlin/text/c;->m(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p2

    if-nez p2, :cond_83

    const-string p2, ".."

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p2

    const-string p5, ""

    if-nez p2, :cond_65

    const-string p2, "%2e."

    invoke-static {p1, p2, p3}, Lkotlin/text/c;->m(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p2

    if-nez p2, :cond_65

    const-string p2, ".%2e"

    invoke-static {p1, p2, p3}, Lkotlin/text/c;->m(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p2

    if-nez p2, :cond_65

    const-string p2, "%2e%2e"

    invoke-static {p1, p2, p3}, Lkotlin/text/c;->m(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p2

    if-nez p2, :cond_65

    invoke-static {p3, p0}, Lam2;->k(ILjava/util/ArrayList;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/CharSequence;

    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    move-result p2

    if-nez p2, :cond_5c

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p2

    sub-int/2addr p2, p3

    invoke-virtual {p0, p2, p1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_5f

    :cond_5c
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_5f
    if-eqz p4, :cond_83

    invoke-virtual {p0, p5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    :cond_65
    invoke-static {p3, p0}, Lvep;->r(ILjava/util/ArrayList;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    if-nez p1, :cond_80

    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_80

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p1

    sub-int/2addr p1, p3

    invoke-virtual {p0, p1, p5}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_80
    invoke-virtual {p0, p5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_83
    return-void
.end method

.method public final r(IILjava/lang/String;)V
    .registers 15

    iget-object v0, p0, Lrma;->f:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    if-eq p1, p2, :cond_46

    invoke-virtual {p3, p1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x2f

    const-string v3, ""

    const/4 v4, 0x1

    if-eq v1, v2, :cond_1e

    const/16 v2, 0x5c

    if-eq v1, v2, :cond_1e

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    sub-int/2addr v1, v4

    invoke-virtual {v0, v1, v3}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_26

    :cond_1e
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 p1, p1, 0x1

    :goto_26
    move v7, p1

    :goto_27
    if-ge v7, p2, :cond_46

    const-string p1, "/\\"

    invoke-static {p3, p1, v7, p2}, Lokhttp3/internal/_UtilCommonKt;->delimiterOffset(Ljava/lang/String;Ljava/lang/String;II)I

    move-result v8

    if-ge v8, p2, :cond_33

    move v9, v4

    goto :goto_35

    :cond_33
    const/4 p1, 0x0

    move v9, p1

    :goto_35
    const/4 v10, 0x1

    move-object v5, p0

    move-object v6, p3

    invoke-virtual/range {v5 .. v10}, Lrma;->q(Ljava/lang/String;IIZZ)V

    if-eqz v9, :cond_42

    add-int/lit8 v7, v8, 0x1

    move-object p0, v5

    move-object p3, v6

    goto :goto_27

    :cond_42
    move-object p0, v5

    move-object p3, v6

    move v7, v8

    goto :goto_27

    :cond_46
    return-void
.end method

.method public final s()I
    .registers 6

    iget-object v0, p0, Lrma;->g:Ljava/lang/Object;

    check-cast v0, Ljava/net/URI;

    invoke-static {v0}, Lb8h;->g(Ljava/net/URI;)Lcm;

    move-result-object v1

    invoke-virtual {v0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Ljava/net/URI;->getPort()I

    move-result v0

    if-eqz v1, :cond_16

    iget-object v2, v1, Lcm;->c:Ljava/lang/String;

    iget v0, v1, Lcm;->b:I

    :cond_16
    new-instance v3, Ljava/net/Socket;

    invoke-direct {v3}, Ljava/net/Socket;-><init>()V

    :try_start_1b
    new-instance v4, Ljava/net/InetSocketAddress;

    if-gtz v0, :cond_21

    const/16 v0, 0x50

    :cond_21
    invoke-direct {v4, v2, v0}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    const/16 v0, 0xbb8

    invoke-virtual {v3, v4, v0}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V

    invoke-virtual {v3, v0}, Ljava/net/Socket;->setSoTimeout(I)V

    if-eqz v1, :cond_30

    const/4 v0, 0x1

    goto :goto_31

    :cond_30
    const/4 v0, 0x0

    :goto_31
    invoke-virtual {p0, v3, v0}, Lrma;->p(Ljava/net/Socket;Z)I

    move-result p0
    :try_end_35
    .catchall {:try_start_1b .. :try_end_35} :catchall_3f

    invoke-virtual {v3}, Ljava/net/Socket;->isClosed()Z

    move-result v0

    if-nez v0, :cond_3e

    invoke-virtual {v3}, Ljava/net/Socket;->close()V

    :cond_3e
    return p0

    :catchall_3f
    move-exception p0

    invoke-virtual {v3}, Ljava/net/Socket;->isClosed()Z

    move-result v0

    if-nez v0, :cond_49

    invoke-virtual {v3}, Ljava/net/Socket;->close()V

    :cond_49
    throw p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 7

    iget-byte v0, p0, Lrma;->a:B

    packed-switch v0, :pswitch_data_f6

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_a
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lrma;->c:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_1e

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_23

    :cond_1e
    const-string v1, "//"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_23
    iget-object v1, p0, Lrma;->d:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x3a

    if-gtz v1, :cond_39

    iget-object v1, p0, Lrma;->e:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_59

    :cond_39
    iget-object v1, p0, Lrma;->d:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lrma;->e:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_54

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lrma;->e:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_54
    const/16 v1, 0x40

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_59
    iget-object v1, p0, Lrma;->g:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_7e

    invoke-static {v1, v2}, Lkotlin/text/StringsKt;->F(Ljava/lang/CharSequence;C)Z

    move-result v1

    if-eqz v1, :cond_77

    const/16 v1, 0x5b

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lrma;->g:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x5d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_7e

    :cond_77
    iget-object v1, p0, Lrma;->g:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_7e
    :goto_7e
    iget v1, p0, Lrma;->b:I

    const/4 v3, -0x1

    if-ne v1, v3, :cond_89

    iget-object v1, p0, Lrma;->c:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_b0

    :cond_89
    invoke-virtual {p0}, Lrma;->i()I

    move-result v1

    iget-object v4, p0, Lrma;->c:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    if-eqz v4, :cond_aa

    const-string v5, "http"

    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_9e

    const/16 v3, 0x50

    goto :goto_a8

    :cond_9e
    const-string v5, "https"

    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_a8

    const/16 v3, 0x1bb

    :cond_a8
    :goto_a8
    if-eq v1, v3, :cond_b0

    :cond_aa
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    :cond_b0
    iget-object v1, p0, Lrma;->f:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    :goto_b9
    if-ge v3, v2, :cond_cc

    const/16 v4, 0x2f

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v3, 0x1

    goto :goto_b9

    :cond_cc
    iget-object v1, p0, Lrma;->h:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    if-eqz v1, :cond_de

    const/16 v1, 0x3f

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lrma;->h:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    invoke-static {v1, v0}, Lwu5;->j(Ljava/util/ArrayList;Ljava/lang/StringBuilder;)V

    :cond_de
    iget-object v1, p0, Lrma;->i:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_f0

    const/16 v1, 0x23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lrma;->i:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_f0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_f6
    .packed-switch 0x4
        :pswitch_a
    .end packed-switch
.end method
