.class public final Lv3a;
.super Landroid/graphics/drawable/Drawable$ConstantState;
.source "SourceFile"


# instance fields
.field public final a:Landroid/graphics/drawable/Drawable;

.field public b:Landroid/graphics/ColorFilter;

.field public final c:I

.field public final d:Z

.field public final e:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Landroid/graphics/drawable/Drawable;)V
    .registers 2

    .line 38
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable$ConstantState;-><init>()V

    .line 39
    iput-object p1, p0, Lv3a;->a:Landroid/graphics/drawable/Drawable;

    return-void
.end method

.method public constructor <init>(Landroid/graphics/drawable/Drawable;IZ)V
    .registers 4

    .line 34
    invoke-direct {p0, p1}, Lv3a;-><init>(Landroid/graphics/drawable/Drawable;)V

    .line 35
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lv3a;->e:Landroid/graphics/Rect;

    .line 36
    iput p2, p0, Lv3a;->c:I

    .line 37
    iput-boolean p3, p0, Lv3a;->d:Z

    return-void
.end method

.method public constructor <init>(Lv3a;)V
    .registers 4

    iget-object v0, p1, Lv3a;->a:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-direct {p0, v0}, Lv3a;-><init>(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p1, Lv3a;->b:Landroid/graphics/ColorFilter;

    iput-object v0, p0, Lv3a;->b:Landroid/graphics/ColorFilter;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lv3a;->e:Landroid/graphics/Rect;

    iget v1, p1, Lv3a;->c:I

    iput v1, p0, Lv3a;->c:I

    iget-boolean v1, p1, Lv3a;->d:Z

    iput-boolean v1, p0, Lv3a;->d:Z

    iget-object p0, p1, Lv3a;->e:Landroid/graphics/Rect;

    invoke-virtual {v0, p0}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    return-void
.end method


# virtual methods
.method public final getChangingConfigurations()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final newDrawable()Landroid/graphics/drawable/Drawable;
    .registers 2

    new-instance v0, Lw3a;

    invoke-direct {v0, p0}, Lw3a;-><init>(Lv3a;)V

    return-object v0
.end method
