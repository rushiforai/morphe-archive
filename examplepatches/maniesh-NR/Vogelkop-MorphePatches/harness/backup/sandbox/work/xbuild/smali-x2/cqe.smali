.class public final Lcqe;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll0c;

.field public final b:Z


# direct methods
.method public constructor <init>(Ll0c;Z)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcqe;->a:Ll0c;

    iput-boolean p2, p0, Lcqe;->b:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_1a

    instance-of v0, p1, Lcqe;

    if-eqz v0, :cond_18

    check-cast p1, Lcqe;

    iget-object v0, p0, Lcqe;->a:Ll0c;

    iget-object v1, p1, Lcqe;->a:Ll0c;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_18

    iget-boolean p0, p0, Lcqe;->b:Z

    iget-boolean p1, p1, Lcqe;->b:Z

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

    iget-object v0, p0, Lcqe;->a:Ll0c;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    goto :goto_a

    :cond_6
    invoke-virtual {v0}, Ll0c;->hashCode()I

    move-result v0

    :goto_a
    mul-int/lit8 v0, v0, 0x1f

    iget-boolean p0, p0, Lcqe;->b:Z

    invoke-static {p0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
