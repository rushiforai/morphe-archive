.class public final La3l;
.super Lzwg;
.source "SourceFile"


# instance fields
.field public final a:Lir;

.field public final b:Landroid/graphics/Rect;

.field public final c:Landroid/view/View;

.field public final d:Landroid/view/View;

.field public final e:Z


# direct methods
.method public constructor <init>(Lir;Landroid/graphics/Rect;Landroid/view/View;Landroid/view/View;Z)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, La3l;->a:Lir;

    iput-object p2, p0, La3l;->b:Landroid/graphics/Rect;

    iput-object p3, p0, La3l;->c:Landroid/view/View;

    iput-object p4, p0, La3l;->d:Landroid/view/View;

    iput-boolean p5, p0, La3l;->e:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 5

    if-eq p0, p1, :cond_35

    instance-of v0, p1, La3l;

    const/4 v1, 0x0

    if-eqz v0, :cond_34

    check-cast p1, La3l;

    iget-object v0, p0, La3l;->a:Lir;

    iget-object v2, p1, La3l;->a:Lir;

    if-eq v0, v2, :cond_10

    return v1

    :cond_10
    iget-object v0, p0, La3l;->b:Landroid/graphics/Rect;

    iget-object v2, p1, La3l;->b:Landroid/graphics/Rect;

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_34

    iget-object v0, p0, La3l;->c:Landroid/view/View;

    iget-object v2, p1, La3l;->c:Landroid/view/View;

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_34

    iget-object v0, p0, La3l;->d:Landroid/view/View;

    iget-object v2, p1, La3l;->d:Landroid/view/View;

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_34

    iget-boolean p0, p0, La3l;->e:Z

    iget-boolean p1, p1, La3l;->e:Z

    if-eq p0, p1, :cond_35

    :cond_34
    return v1

    :cond_35
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 3

    iget-object v0, p0, La3l;->a:Lir;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, La3l;->b:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, La3l;->c:Landroid/view/View;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, La3l;->d:Landroid/view/View;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-boolean p0, p0, La3l;->e:Z

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
