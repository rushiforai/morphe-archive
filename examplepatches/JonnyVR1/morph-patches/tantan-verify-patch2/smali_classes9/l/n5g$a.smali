.class public final Ll/n5g$a;
.super Landroid/graphics/drawable/Drawable$ConstantState;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/n5g;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public final a:Landroid/graphics/Paint;

.field public final b:Landroid/graphics/Paint;

.field public final c:Landroid/graphics/Paint;

.field public d:Landroid/graphics/Bitmap;

.field public e:Ll/nxp;


# direct methods
.method public constructor <init>(Ll/n5g$a;)V
    .locals 2

    .line 46
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable$ConstantState;-><init>()V

    .line 47
    iget-object v0, p1, Ll/n5g$a;->e:Ll/nxp;

    iput-object v0, p0, Ll/n5g$a;->e:Ll/nxp;

    .line 48
    iget-object v0, p1, Ll/n5g$a;->d:Landroid/graphics/Bitmap;

    iput-object v0, p0, Ll/n5g$a;->d:Landroid/graphics/Bitmap;

    .line 49
    new-instance v0, Landroid/graphics/Paint;

    iget-object v1, p1, Ll/n5g$a;->a:Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(Landroid/graphics/Paint;)V

    iput-object v0, p0, Ll/n5g$a;->a:Landroid/graphics/Paint;

    .line 50
    new-instance v0, Landroid/graphics/Paint;

    iget-object v1, p1, Ll/n5g$a;->b:Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(Landroid/graphics/Paint;)V

    iput-object v0, p0, Ll/n5g$a;->b:Landroid/graphics/Paint;

    .line 51
    new-instance v0, Landroid/graphics/Paint;

    iget-object p1, p1, Ll/n5g$a;->c:Landroid/graphics/Paint;

    invoke-direct {v0, p1}, Landroid/graphics/Paint;-><init>(Landroid/graphics/Paint;)V

    iput-object v0, p0, Ll/n5g$a;->c:Landroid/graphics/Paint;

    return-void
.end method

.method public constructor <init>(Ll/nxp;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable$ConstantState;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/n5g$a;->e:Ll/nxp;

    .line 5
    .line 6
    iput-object p2, p0, Ll/n5g$a;->d:Landroid/graphics/Bitmap;

    .line 7
    .line 8
    new-instance p1, Landroid/graphics/Paint;

    .line 9
    .line 10
    const/4 p2, 0x7

    .line 11
    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Ll/n5g$a;->a:Landroid/graphics/Paint;

    .line 15
    .line 16
    new-instance p1, Landroid/graphics/Paint;

    .line 17
    .line 18
    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, Ll/n5g$a;->b:Landroid/graphics/Paint;

    .line 22
    .line 23
    new-instance p1, Landroid/graphics/Paint;

    .line 24
    .line 25
    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    .line 26
    .line 27
    .line 28
    iput-object p1, p0, Ll/n5g$a;->c:Landroid/graphics/Paint;

    .line 29
    .line 30
    sget-object p0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 31
    .line 32
    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 33
    .line 34
    .line 35
    const/high16 p0, 0x40000000    # 2.0f

    .line 36
    .line 37
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    int-to-float p0, p0

    .line 42
    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 43
    .line 44
    .line 45
    return-void
.end method


# virtual methods
.method public a()I
    .locals 1

    .line 1
    iget-object p0, p0, Ll/n5g$a;->e:Ll/nxp;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/nxp;->a()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-static {p0, v0}, Ll/n3d0;->h(Ljava/lang/String;I)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public b()I
    .locals 1

    .line 1
    iget-object p0, p0, Ll/n5g$a;->e:Ll/nxp;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/nxp;->a()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-static {p0, v0}, Ll/n3d0;->h(Ljava/lang/String;I)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public c()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n5g$a;->e:Ll/nxp;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/nxp;->d()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/n3d0;->g(Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public d()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n5g$a;->e:Ll/nxp;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/nxp;->i()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/n3d0;->g(Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

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
    new-instance v0, Ll/n5g;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Ll/n5g;-><init>(Ll/n5g$a;Ll/o5g;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method
