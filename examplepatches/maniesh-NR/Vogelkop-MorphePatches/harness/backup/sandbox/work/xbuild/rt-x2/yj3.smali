.class public final Lyj3;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public final b:Lxj3;


# direct methods
.method public constructor <init>(ZLxj3;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lyj3;->a:Z

    iput-object p2, p0, Lyj3;->b:Lxj3;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_1a

    instance-of v0, p1, Lyj3;

    if-eqz v0, :cond_18

    check-cast p1, Lyj3;

    iget-boolean v0, p0, Lyj3;->a:Z

    iget-boolean v1, p1, Lyj3;->a:Z

    if-ne v0, v1, :cond_18

    iget-object p0, p0, Lyj3;->b:Lxj3;

    iget-object p1, p1, Lyj3;->b:Lxj3;

    invoke-virtual {p0, p1}, Lxj3;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1a

    :cond_18
    const/4 p0, 0x0

    return p0

    :cond_1a
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 2

    iget-boolean v0, p0, Lyj3;->a:Z

    invoke-static {v0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lyj3;->b:Lxj3;

    invoke-virtual {p0}, Lxj3;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
