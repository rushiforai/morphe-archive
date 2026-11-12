.class public final Ljj3;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/net/Uri;

.field public final b:Ljava/lang/String;

.field public final c:Lwx;


# direct methods
.method public constructor <init>(Landroid/net/Uri;Ljava/lang/String;Lwx;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljj3;->a:Landroid/net/Uri;

    iput-object p2, p0, Ljj3;->b:Ljava/lang/String;

    iput-object p3, p0, Ljj3;->c:Lwx;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Ljj3;

    const/4 v2, 0x0

    if-eqz v1, :cond_1f

    check-cast p1, Ljj3;

    iget-object v1, p0, Ljj3;->a:Landroid/net/Uri;

    iget-object v3, p1, Ljj3;->a:Landroid/net/Uri;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1f

    iget-object v1, p0, Ljj3;->b:Ljava/lang/String;

    iget-object v3, p1, Ljj3;->b:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_20

    :cond_1f
    return v2

    :cond_20
    iget-object p0, p0, Ljj3;->c:Lwx;

    iget-object p1, p1, Ljj3;->c:Lwx;

    if-eq p0, p1, :cond_27

    return v2

    :cond_27
    return v0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Ljj3;->a:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Ljj3;->b:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object p0, p0, Ljj3;->c:Lwx;

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
