.class public final Ljmk;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Limk;

.field public final c:Lhmk;


# direct methods
.method public constructor <init>(Ljava/lang/String;Limk;Lhmk;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljmk;->a:Ljava/lang/String;

    iput-object p2, p0, Ljmk;->b:Limk;

    iput-object p3, p0, Ljmk;->c:Lhmk;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 5

    if-ne p0, p1, :cond_4

    const/4 p0, 0x1

    return p0

    :cond_4
    instance-of v0, p1, Ljmk;

    const/4 v1, 0x0

    if-nez v0, :cond_a

    return v1

    :cond_a
    check-cast p1, Ljmk;

    iget-object v0, p0, Ljmk;->a:Ljava/lang/String;

    iget-object v2, p1, Ljmk;->a:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_17

    return v1

    :cond_17
    iget-object v0, p0, Ljmk;->b:Limk;

    iget-object v2, p1, Ljmk;->b:Limk;

    invoke-static {v0, v2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_22

    return v1

    :cond_22
    iget-object p0, p0, Ljmk;->c:Lhmk;

    iget-object p1, p1, Ljmk;->c:Lhmk;

    invoke-static {p0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public final hashCode()I
    .registers 3

    iget-object v0, p0, Ljmk;->b:Limk;

    iget-object v1, p0, Ljmk;->c:Lhmk;

    iget-object p0, p0, Ljmk;->a:Ljava/lang/String;

    filled-new-array {p0, v0, v1}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method
