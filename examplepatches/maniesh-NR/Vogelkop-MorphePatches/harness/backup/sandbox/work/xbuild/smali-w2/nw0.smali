.class public final Lnw0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lqw0;


# instance fields
.field public final a:Ljava/io/File;

.field public final b:Lo29;


# direct methods
.method public constructor <init>(Ljava/io/File;Lo29;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnw0;->a:Ljava/io/File;

    iput-object p2, p0, Lnw0;->b:Lo29;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_1a

    instance-of v0, p1, Lnw0;

    if-eqz v0, :cond_18

    check-cast p1, Lnw0;

    iget-object v0, p0, Lnw0;->a:Ljava/io/File;

    iget-object v1, p1, Lnw0;->a:Ljava/io/File;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_18

    iget-object p0, p0, Lnw0;->b:Lo29;

    iget-object p1, p1, Lnw0;->b:Lo29;

    if-eq p0, p1, :cond_1a

    :cond_18
    const/4 p0, 0x0

    return p0

    :cond_1a
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 2

    iget-object v0, p0, Lnw0;->a:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lnw0;->b:Lo29;

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
