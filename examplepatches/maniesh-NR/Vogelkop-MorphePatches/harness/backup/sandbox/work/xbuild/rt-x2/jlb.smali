.class public final Ljlb;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lial;

.field public final b:Lklb;

.field public final c:Landroid/view/View;

.field public final d:Landroidx/recyclerview/widget/i;


# direct methods
.method public constructor <init>(Lial;Lklb;Landroid/view/View;Landroidx/recyclerview/widget/i;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljlb;->a:Lial;

    iput-object p2, p0, Ljlb;->b:Lklb;

    iput-object p3, p0, Ljlb;->c:Landroid/view/View;

    iput-object p4, p0, Ljlb;->d:Landroidx/recyclerview/widget/i;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_32

    instance-of v0, p1, Ljlb;

    if-eqz v0, :cond_30

    check-cast p1, Ljlb;

    iget-object v0, p0, Ljlb;->a:Lial;

    iget-object v1, p1, Ljlb;->a:Lial;

    invoke-virtual {v0, v1}, Lial;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_30

    iget-object v0, p0, Ljlb;->b:Lklb;

    iget-object v1, p1, Ljlb;->b:Lklb;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_30

    iget-object v0, p0, Ljlb;->c:Landroid/view/View;

    iget-object v1, p1, Ljlb;->c:Landroid/view/View;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_30

    iget-object p0, p0, Ljlb;->d:Landroidx/recyclerview/widget/i;

    iget-object p1, p1, Ljlb;->d:Landroidx/recyclerview/widget/i;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_32

    :cond_30
    const/4 p0, 0x0

    return p0

    :cond_32
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 3

    iget-object v0, p0, Ljlb;->a:Lial;

    iget-object v0, v0, Lial;->a:Ljava/lang/Iterable;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Ljlb;->b:Lklb;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, Ljlb;->c:Landroid/view/View;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Ljlb;->d:Landroidx/recyclerview/widget/i;

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
