.class public Ll/j6x;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:I

.field public static b:Ljava/lang/String;

.field public static c:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/high16 v0, 0x40000000    # 2.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Ll/j6x;->a:I

    .line 8
    .line 9
    const-string v0, "#85b9f2"

    .line 10
    .line 11
    sput-object v0, Ll/j6x;->b:Ljava/lang/String;

    .line 12
    .line 13
    const-string v0, "#f3c8f5"

    .line 14
    .line 15
    sput-object v0, Ll/j6x;->c:Ljava/lang/String;

    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/LiveUserMask;Z)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/wlj;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/wlj;->p()Lcom/facebook/drawee/generic/RoundingParams;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    invoke-static {}, Lcom/facebook/drawee/generic/RoundingParams;->a()Lcom/facebook/drawee/generic/RoundingParams;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    const-string v0, "#00000000"

    .line 21
    .line 22
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    filled-new-array {v0, v0}, [I

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    .line 31
    .line 32
    sget-object v3, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 33
    .line 34
    invoke-direct {v2, v3, v0}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    .line 35
    .line 36
    .line 37
    const/4 v0, 0x1

    .line 38
    invoke-virtual {v2, v0}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 39
    .line 40
    .line 41
    if-eqz p2, :cond_2

    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/LiveUserMask;->isFemale()Z

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    if-eqz p2, :cond_1

    .line 48
    .line 49
    sget-object p2, Ll/j6x;->c:Ljava/lang/String;

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    sget-object p2, Ll/j6x;->b:Ljava/lang/String;

    .line 53
    .line 54
    :goto_0
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    move-result p2

    .line 58
    sget v0, Ll/j6x;->a:I

    .line 59
    .line 60
    int-to-float v0, v0

    .line 61
    invoke-virtual {v1, v0}, Lcom/facebook/drawee/generic/RoundingParams;->u(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 62
    .line 63
    .line 64
    sget v0, Ll/j6x;->a:I

    .line 65
    .line 66
    invoke-virtual {v2, v0, p2}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 67
    .line 68
    .line 69
    :cond_2
    iget-object p2, p1, Lcom/p1/mobile/putong/data/LiveUserMask;->color:Ljava/lang/String;

    .line 70
    .line 71
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 72
    .line 73
    .line 74
    move-result p2

    .line 75
    if-nez p2, :cond_3

    .line 76
    .line 77
    iget-object p1, p1, Lcom/p1/mobile/putong/data/LiveUserMask;->color:Ljava/lang/String;

    .line 78
    .line 79
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    invoke-virtual {v2, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 84
    .line 85
    .line 86
    :cond_3
    invoke-virtual {p0, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 87
    .line 88
    .line 89
    return-void
.end method
