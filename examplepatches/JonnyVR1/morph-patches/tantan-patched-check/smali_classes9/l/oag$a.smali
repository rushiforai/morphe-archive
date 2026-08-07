.class public final Ll/oag$a;
.super Landroid/graphics/drawable/Drawable$ConstantState;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/oag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public final a:Landroid/graphics/Paint;

.field public final b:Landroid/graphics/Paint;

.field public c:Landroid/graphics/Bitmap;

.field public d:Landroid/graphics/Bitmap;


# direct methods
.method public constructor <init>(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable$ConstantState;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/oag$a;->c:Landroid/graphics/Bitmap;

    .line 5
    .line 6
    iput-object p2, p0, Ll/oag$a;->d:Landroid/graphics/Bitmap;

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
    iput-object p1, p0, Ll/oag$a;->a:Landroid/graphics/Paint;

    .line 15
    .line 16
    new-instance p1, Landroid/graphics/Paint;

    .line 17
    .line 18
    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, Ll/oag$a;->b:Landroid/graphics/Paint;

    .line 22
    .line 23
    const/4 p0, -0x1

    .line 24
    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setColor(I)V

    .line 25
    .line 26
    .line 27
    const p0, 0x3d4ccccd    # 0.05f

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setLetterSpacing(F)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public constructor <init>(Ll/oag$a;)V
    .locals 2

    .line 34
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable$ConstantState;-><init>()V

    .line 35
    iget-object v0, p1, Ll/oag$a;->c:Landroid/graphics/Bitmap;

    iput-object v0, p0, Ll/oag$a;->c:Landroid/graphics/Bitmap;

    .line 36
    iget-object v0, p1, Ll/oag$a;->d:Landroid/graphics/Bitmap;

    iput-object v0, p0, Ll/oag$a;->d:Landroid/graphics/Bitmap;

    .line 37
    new-instance v0, Landroid/graphics/Paint;

    iget-object v1, p1, Ll/oag$a;->a:Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(Landroid/graphics/Paint;)V

    iput-object v0, p0, Ll/oag$a;->a:Landroid/graphics/Paint;

    .line 38
    new-instance v0, Landroid/graphics/Paint;

    iget-object p1, p1, Ll/oag$a;->b:Landroid/graphics/Paint;

    invoke-direct {v0, p1}, Landroid/graphics/Paint;-><init>(Landroid/graphics/Paint;)V

    iput-object v0, p0, Ll/oag$a;->b:Landroid/graphics/Paint;

    return-void
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
    new-instance v0, Ll/oag;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Ll/oag;-><init>(Ll/oag$a;Ll/pag;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method
