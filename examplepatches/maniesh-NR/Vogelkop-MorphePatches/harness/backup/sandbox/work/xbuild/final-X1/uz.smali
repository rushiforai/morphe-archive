.class public final Luz;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lvo;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-object v0, p1, Lvo;->a:Ljava/lang/String;

    iput-object v0, p0, Luz;->a:Ljava/lang/String;

    iget-object v0, p1, Lvo;->b:Ljava/lang/String;

    iput-object v0, p0, Luz;->b:Ljava/lang/String;

    iget-object p1, p1, Lvo;->c:Ljava/lang/String;

    iput-object p1, p0, Luz;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_2c

    if-eqz p1, :cond_2e

    const-class v0, Luz;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-ne v0, v1, :cond_2e

    check-cast p1, Luz;

    iget-object v0, p0, Luz;->a:Ljava/lang/String;

    iget-object v1, p1, Luz;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2e

    iget-object v0, p0, Luz;->b:Ljava/lang/String;

    iget-object v1, p1, Luz;->b:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2e

    iget-object p0, p0, Luz;->c:Ljava/lang/String;

    iget-object p1, p1, Luz;->c:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2e

    :cond_2c
    const/4 p0, 0x1

    return p0

    :cond_2e
    const/4 p0, 0x0

    return p0
.end method

.method public final hashCode()I
    .registers 3

    iget-object v0, p0, Luz;->b:Ljava/lang/String;

    iget-object v1, p0, Luz;->c:Ljava/lang/String;

    iget-object p0, p0, Luz;->a:Ljava/lang/String;

    filled-new-array {p0, v0, v1}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method
