.class public final Ll/ck20$a;
.super Landroid/graphics/drawable/Drawable$ConstantState;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ck20;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public final a:Landroid/graphics/Paint;

.field public b:Landroid/graphics/Bitmap;

.field public c:F


# direct methods
.method public constructor <init>(Landroid/graphics/Bitmap;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable$ConstantState;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x3f800000    # 1.0f

    .line 5
    .line 6
    iput v0, p0, Ll/ck20$a;->c:F

    .line 7
    .line 8
    iput-object p1, p0, Ll/ck20$a;->b:Landroid/graphics/Bitmap;

    .line 9
    .line 10
    new-instance v1, Landroid/graphics/Paint;

    .line 11
    .line 12
    const/4 v2, 0x7

    .line 13
    invoke-direct {v1, v2}, Landroid/graphics/Paint;-><init>(I)V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Ll/ck20$a;->a:Landroid/graphics/Paint;

    .line 17
    .line 18
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    int-to-float v1, v1

    .line 29
    mul-float/2addr v1, v0

    .line 30
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    int-to-float p1, p1

    .line 35
    div-float/2addr v1, p1

    .line 36
    iput v1, p0, Ll/ck20$a;->c:F

    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public constructor <init>(Ll/ck20$a;)V
    .locals 2

    .line 39
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable$ConstantState;-><init>()V

    const/high16 v0, 0x3f800000    # 1.0f

    .line 40
    iput v0, p0, Ll/ck20$a;->c:F

    .line 41
    iget-object v0, p1, Ll/ck20$a;->b:Landroid/graphics/Bitmap;

    iput-object v0, p0, Ll/ck20$a;->b:Landroid/graphics/Bitmap;

    .line 42
    new-instance v0, Landroid/graphics/Paint;

    iget-object v1, p1, Ll/ck20$a;->a:Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(Landroid/graphics/Paint;)V

    iput-object v0, p0, Ll/ck20$a;->a:Landroid/graphics/Paint;

    .line 43
    iget p1, p1, Ll/ck20$a;->c:F

    iput p1, p0, Ll/ck20$a;->c:F

    return-void
.end method

.method public static bridge synthetic a(Ll/ck20$a;)F
    .locals 0

    .line 1
    iget p0, p0, Ll/ck20$a;->c:F

    return p0
.end method


# virtual methods
.method public getChangingConfigurations()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public newDrawable()Landroid/graphics/drawable/Drawable;
    .locals 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Ll/ck20;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Ll/ck20;-><init>(Ll/ck20$a;Ll/dk20;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method
