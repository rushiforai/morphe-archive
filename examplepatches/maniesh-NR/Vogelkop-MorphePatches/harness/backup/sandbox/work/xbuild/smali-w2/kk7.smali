.class public final Lkk7;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public b:Li97;

.field public c:Landroid/graphics/Bitmap;

.field public d:Z

.field public final e:Landroid/content/res/Resources;


# direct methods
.method public constructor <init>(Landroid/content/Context;Li97;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkk7;->a:Landroid/content/Context;

    iput-object p2, p0, Lkk7;->b:Li97;

    const/4 p2, 0x0

    iput-object p2, p0, Lkk7;->c:Landroid/graphics/Bitmap;

    const/4 p2, 0x1

    iput-boolean p2, p0, Lkk7;->d:Z

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    iput-object p1, p0, Lkk7;->e:Landroid/content/res/Resources;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_2e

    instance-of v0, p1, Lkk7;

    if-eqz v0, :cond_2c

    check-cast p1, Lkk7;

    iget-object v0, p0, Lkk7;->a:Landroid/content/Context;

    iget-object v1, p1, Lkk7;->a:Landroid/content/Context;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2c

    iget-object v0, p0, Lkk7;->b:Li97;

    iget-object v1, p1, Lkk7;->b:Li97;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2c

    iget-object v0, p0, Lkk7;->c:Landroid/graphics/Bitmap;

    iget-object v1, p1, Lkk7;->c:Landroid/graphics/Bitmap;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2c

    iget-boolean p0, p0, Lkk7;->d:Z

    iget-boolean p1, p1, Lkk7;->d:Z

    if-eq p0, p1, :cond_2e

    :cond_2c
    const/4 p0, 0x0

    return p0

    :cond_2e
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 3

    iget-object v0, p0, Lkk7;->a:Landroid/content/Context;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lkk7;->b:Li97;

    invoke-virtual {v1}, Li97;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Lkk7;->c:Landroid/graphics/Bitmap;

    if-nez v0, :cond_17

    const/4 v0, 0x0

    goto :goto_1b

    :cond_17
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    :goto_1b
    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-boolean p0, p0, Lkk7;->d:Z

    invoke-static {p0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result p0

    add-int/2addr p0, v1

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
