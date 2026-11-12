.class public final La0a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lb0a;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/io/File;

.field public final c:Lo29;

.field public final d:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/io/File;Lo29;Ljava/lang/String;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, La0a;->a:Ljava/lang/String;

    iput-object p2, p0, La0a;->b:Ljava/io/File;

    iput-object p3, p0, La0a;->c:Lo29;

    iput-object p4, p0, La0a;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_2e

    instance-of v0, p1, La0a;

    if-eqz v0, :cond_2c

    check-cast p1, La0a;

    iget-object v0, p0, La0a;->a:Ljava/lang/String;

    iget-object v1, p1, La0a;->a:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2c

    iget-object v0, p0, La0a;->b:Ljava/io/File;

    iget-object v1, p1, La0a;->b:Ljava/io/File;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2c

    iget-object v0, p0, La0a;->c:Lo29;

    iget-object v1, p1, La0a;->c:Lo29;

    if-ne v0, v1, :cond_2c

    iget-object p0, p0, La0a;->d:Ljava/lang/String;

    iget-object p1, p1, La0a;->d:Ljava/lang/String;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2e

    :cond_2c
    const/4 p0, 0x0

    return p0

    :cond_2e
    const/4 p0, 0x1

    return p0
.end method

.method public final getId()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, La0a;->a:Ljava/lang/String;

    return-object p0
.end method

.method public final hashCode()I
    .registers 3

    iget-object v0, p0, La0a;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, La0a;->b:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object v0, p0, La0a;->c:Lo29;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, La0a;->d:Ljava/lang/String;

    if-nez p0, :cond_20

    const/4 p0, 0x0

    goto :goto_24

    :cond_20
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p0

    :goto_24
    add-int/2addr v0, p0

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
