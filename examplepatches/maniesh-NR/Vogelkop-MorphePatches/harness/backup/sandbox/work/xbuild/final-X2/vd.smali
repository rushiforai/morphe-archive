.class public final Lvd;
.super Lfe;
.source "SourceFile"


# instance fields
.field public final a:Lm4l;

.field public final b:Landroid/graphics/drawable/LayerDrawable;

.field public final c:Lmxh;

.field public final d:Lpxh;


# direct methods
.method public constructor <init>(Lm4l;Landroid/graphics/drawable/LayerDrawable;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvd;->a:Lm4l;

    iput-object p2, p0, Lvd;->b:Landroid/graphics/drawable/LayerDrawable;

    new-instance v0, Lmxh;

    invoke-direct {v0, p2}, Lmxh;-><init>(Landroid/graphics/drawable/Drawable;)V

    iput-object v0, p0, Lvd;->c:Lmxh;

    invoke-virtual {p1}, Lm4l;->c()Lpxh;

    move-result-object p1

    iput-object p1, p0, Lvd;->d:Lpxh;

    return-void
.end method


# virtual methods
.method public final a()Lb8h;
    .registers 1

    iget-object p0, p0, Lvd;->c:Lmxh;

    return-object p0
.end method

.method public final b()Lpxh;
    .registers 1

    iget-object p0, p0, Lvd;->d:Lpxh;

    return-object p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_1e

    instance-of v0, p1, Lvd;

    if-eqz v0, :cond_1c

    check-cast p1, Lvd;

    iget-object v0, p0, Lvd;->a:Lm4l;

    iget-object v1, p1, Lvd;->a:Lm4l;

    invoke-virtual {v0, v1}, Lm4l;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c

    iget-object p0, p0, Lvd;->b:Landroid/graphics/drawable/LayerDrawable;

    iget-object p1, p1, Lvd;->b:Landroid/graphics/drawable/LayerDrawable;

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1e

    :cond_1c
    const/4 p0, 0x0

    return p0

    :cond_1e
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 2

    iget-object v0, p0, Lvd;->a:Lm4l;

    invoke-virtual {v0}, Lm4l;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lvd;->b:Landroid/graphics/drawable/LayerDrawable;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
