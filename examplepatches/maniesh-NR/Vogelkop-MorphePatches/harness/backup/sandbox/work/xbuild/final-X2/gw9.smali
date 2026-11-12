.class public final Lgw9;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lf03;

.field public final b:Lf03;

.field public final c:Z

.field public final d:Lqhj;


# direct methods
.method public constructor <init>(Lf03;Lf03;ZLqhj;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lgw9;->a:Lf03;

    iput-object p2, p0, Lgw9;->b:Lf03;

    iput-boolean p3, p0, Lgw9;->c:Z

    iput-object p4, p0, Lgw9;->d:Lqhj;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_2a

    instance-of v0, p1, Lgw9;

    if-eqz v0, :cond_28

    check-cast p1, Lgw9;

    iget-object v0, p0, Lgw9;->a:Lf03;

    iget-object v1, p1, Lgw9;->a:Lf03;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28

    iget-object v0, p0, Lgw9;->b:Lf03;

    iget-object v1, p1, Lgw9;->b:Lf03;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28

    iget-boolean v0, p0, Lgw9;->c:Z

    iget-boolean v1, p1, Lgw9;->c:Z

    if-ne v0, v1, :cond_28

    iget-object p0, p0, Lgw9;->d:Lqhj;

    iget-object p1, p1, Lgw9;->d:Lqhj;

    if-eq p0, p1, :cond_2a

    :cond_28
    const/4 p0, 0x0

    return p0

    :cond_2a
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lgw9;->a:Lf03;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lgw9;->b:Lf03;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-boolean v0, p0, Lgw9;->c:Z

    invoke-static {v2, v1, v0}, Lfki;->k(IIZ)I

    move-result v0

    iget-object p0, p0, Lgw9;->d:Lqhj;

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
