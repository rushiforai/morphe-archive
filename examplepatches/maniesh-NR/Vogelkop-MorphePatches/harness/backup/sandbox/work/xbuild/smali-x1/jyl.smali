.class public final Ljyl;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:[Lbj8;

.field public c:I


# direct methods
.method public varargs constructor <init>([Lbj8;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljyl;->b:[Lbj8;

    array-length p1, p1

    iput p1, p0, Ljyl;->a:I

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-ne p0, p1, :cond_4

    const/4 p0, 0x1

    return p0

    :cond_4
    if-eqz p1, :cond_19

    const-class v0, Ljyl;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-ne v0, v1, :cond_19

    check-cast p1, Ljyl;

    iget-object p0, p0, Ljyl;->b:[Lbj8;

    iget-object p1, p1, Ljyl;->b:[Lbj8;

    invoke-static {p0, p1}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result p0

    return p0

    :cond_19
    const/4 p0, 0x0

    return p0
.end method

.method public final hashCode()I
    .registers 3

    iget v0, p0, Ljyl;->c:I

    if-nez v0, :cond_10

    iget-object v0, p0, Ljyl;->b:[Lbj8;

    invoke-static {v0}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    const/16 v1, 0x20f

    add-int/2addr v1, v0

    iput v1, p0, Ljyl;->c:I

    return v1

    :cond_10
    return v0
.end method
