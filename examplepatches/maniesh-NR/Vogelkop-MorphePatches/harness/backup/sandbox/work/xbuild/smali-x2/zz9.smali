.class public final Lzz9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lb0a;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/io/File;

.field public final c:Lo29;


# direct methods
.method public constructor <init>(Lo29;Ljava/io/File;Ljava/lang/String;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p3, p0, Lzz9;->a:Ljava/lang/String;

    iput-object p2, p0, Lzz9;->b:Ljava/io/File;

    iput-object p1, p0, Lzz9;->c:Lo29;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lzz9;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lzz9;

    iget-object v1, p0, Lzz9;->a:Ljava/lang/String;

    iget-object v3, p1, Lzz9;->a:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-object v1, p0, Lzz9;->b:Ljava/io/File;

    iget-object v3, p1, Lzz9;->b:Ljava/io/File;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_22

    return v2

    :cond_22
    iget-object p0, p0, Lzz9;->c:Lo29;

    iget-object p1, p1, Lzz9;->c:Lo29;

    if-eq p0, p1, :cond_29

    return v2

    :cond_29
    return v0
.end method

.method public final getId()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lzz9;->a:Ljava/lang/String;

    return-object p0
.end method

.method public final hashCode()I
    .registers 3

    iget-object v0, p0, Lzz9;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lzz9;->b:Ljava/io/File;

    if-nez v1, :cond_e

    const/4 v1, 0x0

    goto :goto_12

    :cond_e
    invoke-virtual {v1}, Ljava/io/File;->hashCode()I

    move-result v1

    :goto_12
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lzz9;->c:Lo29;

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
