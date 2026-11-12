.class public final Lht7;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lbfl;

.field public final b:Landroid/view/View;

.field public final c:Lgt7;


# direct methods
.method public constructor <init>(Lbfl;Landroid/view/View;Lgt7;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lht7;->a:Lbfl;

    iput-object p2, p0, Lht7;->b:Landroid/view/View;

    iput-object p3, p0, Lht7;->c:Lgt7;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 5

    if-eq p0, p1, :cond_21

    instance-of v0, p1, Lht7;

    const/4 v1, 0x0

    if-eqz v0, :cond_20

    check-cast p1, Lht7;

    iget-object v0, p0, Lht7;->a:Lbfl;

    iget-object v2, p1, Lht7;->a:Lbfl;

    if-eq v0, v2, :cond_10

    return v1

    :cond_10
    iget-object v0, p0, Lht7;->b:Landroid/view/View;

    iget-object v2, p1, Lht7;->b:Landroid/view/View;

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_20

    iget-object p0, p0, Lht7;->c:Lgt7;

    iget-object p1, p1, Lht7;->c:Lgt7;

    if-eq p0, p1, :cond_21

    :cond_20
    return v1

    :cond_21
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 3

    iget-object v0, p0, Lht7;->a:Lbfl;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lht7;->b:Landroid/view/View;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object p0, p0, Lht7;->c:Lgt7;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr p0, v1

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
