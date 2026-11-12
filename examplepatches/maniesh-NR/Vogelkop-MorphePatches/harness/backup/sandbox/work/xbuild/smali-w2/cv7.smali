.class public final Lcv7;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/graphics/drawable/Drawable;

.field public final b:Lfri;

.field public final c:Z

.field public final d:Ljava/lang/String;

.field public final e:Lcv2;


# direct methods
.method public constructor <init>(Landroid/graphics/drawable/Drawable;Lfri;ZLjava/lang/String;Lcv2;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcv7;->a:Landroid/graphics/drawable/Drawable;

    iput-object p2, p0, Lcv7;->b:Lfri;

    iput-boolean p3, p0, Lcv7;->c:Z

    iput-object p4, p0, Lcv7;->d:Ljava/lang/String;

    iput-object p5, p0, Lcv7;->e:Lcv2;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_34

    instance-of v0, p1, Lcv7;

    if-eqz v0, :cond_32

    check-cast p1, Lcv7;

    iget-object v0, p0, Lcv7;->a:Landroid/graphics/drawable/Drawable;

    iget-object v1, p1, Lcv7;->a:Landroid/graphics/drawable/Drawable;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_32

    iget-object v0, p0, Lcv7;->b:Lfri;

    iget-object v1, p1, Lcv7;->b:Lfri;

    if-ne v0, v1, :cond_32

    iget-boolean v0, p0, Lcv7;->c:Z

    iget-boolean v1, p1, Lcv7;->c:Z

    if-ne v0, v1, :cond_32

    iget-object v0, p0, Lcv7;->d:Ljava/lang/String;

    iget-object v1, p1, Lcv7;->d:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_32

    iget-object p0, p0, Lcv7;->e:Lcv2;

    iget-object p1, p1, Lcv7;->e:Lcv2;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_34

    :cond_32
    const/4 p0, 0x0

    return p0

    :cond_34
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 5

    const/4 v0, 0x0

    iget-object v1, p0, Lcv7;->a:Landroid/graphics/drawable/Drawable;

    if-nez v1, :cond_7

    move v1, v0

    goto :goto_b

    :cond_7
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :goto_b
    const/16 v2, 0x1f

    mul-int/2addr v1, v2

    iget-object v3, p0, Lcv7;->b:Lfri;

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    add-int/2addr v3, v1

    mul-int/2addr v3, v2

    iget-boolean v1, p0, Lcv7;->c:Z

    invoke-static {v3, v2, v1}, Lfki;->k(IIZ)I

    move-result v1

    iget-object v3, p0, Lcv7;->d:Ljava/lang/String;

    if-nez v3, :cond_22

    move v3, v0

    goto :goto_26

    :cond_22
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_26
    add-int/2addr v1, v3

    mul-int/2addr v1, v2

    iget-object p0, p0, Lcv7;->e:Lcv2;

    if-eqz p0, :cond_30

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    :cond_30
    add-int/2addr v1, v0

    return v1
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
