.class public final Liag;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lkag;

.field public final b:Z


# direct methods
.method public constructor <init>(Lkag;Z)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Liag;->a:Lkag;

    iput-boolean p2, p0, Liag;->b:Z

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

    const-class v2, Liag;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-ne v2, v3, :cond_1f

    check-cast p1, Liag;

    iget-boolean v2, p0, Liag;->b:Z

    iget-boolean v3, p1, Liag;->b:Z

    if-eq v2, v3, :cond_18

    return v1

    :cond_18
    iget-object p0, p0, Liag;->a:Lkag;

    iget-object p1, p1, Liag;->a:Lkag;

    if-ne p0, p1, :cond_1f

    return v0

    :cond_1f
    return v1
.end method

.method public final hashCode()I
    .registers 2

    iget-object v0, p0, Liag;->a:Lkag;

    if-eqz v0, :cond_9

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    mul-int/lit8 v0, v0, 0x1f

    iget-boolean p0, p0, Liag;->b:Z

    add-int/2addr v0, p0

    return v0
.end method
