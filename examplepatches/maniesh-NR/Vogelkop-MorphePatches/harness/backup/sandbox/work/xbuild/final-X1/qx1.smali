.class public final Lqx1;
.super Lwxe;
.source "SourceFile"


# instance fields
.field public final m:Ljava/io/File;

.field public final n:Ljava/lang/String;

.field public final o:Lo29;


# direct methods
.method public constructor <init>(Lo29;Ljava/io/File;Ljava/lang/String;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lqx1;->m:Ljava/io/File;

    iput-object p3, p0, Lqx1;->n:Ljava/lang/String;

    iput-object p1, p0, Lqx1;->o:Lo29;

    return-void
.end method


# virtual methods
.method public final G()Z
    .registers 2

    iget-object p0, p0, Lqx1;->o:Lo29;

    sget-object v0, Lo29;->k:Lo29;

    if-ne p0, v0, :cond_8

    const/4 p0, 0x1

    return p0

    :cond_8
    const/4 p0, 0x0

    return p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_24

    instance-of v0, p1, Lqx1;

    if-eqz v0, :cond_22

    check-cast p1, Lqx1;

    iget-object v0, p0, Lqx1;->m:Ljava/io/File;

    iget-object v1, p1, Lqx1;->m:Ljava/io/File;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_22

    iget-object v0, p0, Lqx1;->n:Ljava/lang/String;

    iget-object v1, p1, Lqx1;->n:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_22

    iget-object p0, p0, Lqx1;->o:Lo29;

    iget-object p1, p1, Lqx1;->o:Lo29;

    if-eq p0, p1, :cond_24

    :cond_22
    const/4 p0, 0x0

    return p0

    :cond_24
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 3

    iget-object v0, p0, Lqx1;->m:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lqx1;->n:Ljava/lang/String;

    if-nez v1, :cond_e

    const/4 v1, 0x0

    goto :goto_12

    :cond_e
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_12
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lqx1;->o:Lo29;

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
