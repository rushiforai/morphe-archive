.class public final Lw12;
.super Lo0g;
.source "SourceFile"


# instance fields
.field public final i:Landroid/net/Uri;

.field public final j:Ljava/io/File;


# direct methods
.method public constructor <init>(Landroid/net/Uri;Ljava/io/File;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lw12;->i:Landroid/net/Uri;

    iput-object p2, p0, Lw12;->j:Ljava/io/File;

    return-void
.end method


# virtual methods
.method public final V()Ljava/io/File;
    .registers 1

    iget-object p0, p0, Lw12;->j:Ljava/io/File;

    return-object p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_1e

    instance-of v0, p1, Lw12;

    if-eqz v0, :cond_1c

    check-cast p1, Lw12;

    iget-object v0, p0, Lw12;->i:Landroid/net/Uri;

    iget-object v1, p1, Lw12;->i:Landroid/net/Uri;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c

    iget-object p0, p0, Lw12;->j:Ljava/io/File;

    iget-object p1, p1, Lw12;->j:Ljava/io/File;

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

    iget-object v0, p0, Lw12;->i:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lw12;->j:Ljava/io/File;

    invoke-virtual {p0}, Ljava/io/File;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
