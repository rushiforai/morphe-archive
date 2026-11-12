.class public final Lmlk;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public final b:Z


# direct methods
.method public constructor <init>(ZZ)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lmlk;->a:Z

    iput-boolean p2, p0, Lmlk;->b:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    const/4 v1, 0x0

    if-eqz p1, :cond_1f

    const-class v2, Lmlk;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-ne v2, v3, :cond_1f

    check-cast p1, Lmlk;

    iget-boolean v2, p0, Lmlk;->a:Z

    iget-boolean v3, p1, Lmlk;->a:Z

    if-eq v2, v3, :cond_18

    return v1

    :cond_18
    iget-boolean p0, p0, Lmlk;->b:Z

    iget-boolean p1, p1, Lmlk;->b:Z

    if-ne p0, p1, :cond_1f

    return v0

    :cond_1f
    return v1
.end method

.method public final hashCode()I
    .registers 2

    iget-boolean v0, p0, Lmlk;->a:Z

    mul-int/lit8 v0, v0, 0x1f

    iget-boolean p0, p0, Lmlk;->b:Z

    add-int/2addr v0, p0

    return v0
.end method
