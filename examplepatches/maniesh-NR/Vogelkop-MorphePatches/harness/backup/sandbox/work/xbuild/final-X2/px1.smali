.class public final Lpx1;
.super Lvx1;
.source "SourceFile"


# instance fields
.field public final d:Ley1;


# direct methods
.method public constructor <init>(Lvx1;Ley1;)V
    .registers 5

    iget-object v0, p1, Lvx1;->a:Ljava/lang/String;

    iget-object v1, p1, Lvx1;->b:Lwxe;

    iget-object p1, p1, Lvx1;->c:Lux1;

    invoke-direct {p0, v0, v1, p1}, Lvx1;-><init>(Ljava/lang/String;Lwxe;Lux1;)V

    iput-object p2, p0, Lpx1;->d:Ley1;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 3

    invoke-super {p0, p1}, Lvx1;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    instance-of v0, p1, Lpx1;

    if-eqz v0, :cond_12

    check-cast p1, Lpx1;

    iget-object p1, p1, Lpx1;->d:Ley1;

    iget-object p0, p0, Lpx1;->d:Ley1;

    if-eq p0, p1, :cond_14

    :cond_12
    const/4 p0, 0x0

    return p0

    :cond_14
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 2

    invoke-super {p0}, Lvx1;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lpx1;->d:Ley1;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method
