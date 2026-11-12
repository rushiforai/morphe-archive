.class public final Lqo7;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Lp4j;

.field public final c:Lnd7;

.field public final d:Ljava/util/LinkedHashMap;

.field public final e:Z

.field public final f:Z

.field public final g:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Lp4j;Lnd7;Ljava/util/LinkedHashMap;ZZZ)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqo7;->a:Ljava/lang/String;

    iput-object p2, p0, Lqo7;->b:Lp4j;

    iput-object p3, p0, Lqo7;->c:Lnd7;

    iput-object p4, p0, Lqo7;->d:Ljava/util/LinkedHashMap;

    iput-boolean p5, p0, Lqo7;->e:Z

    iput-boolean p6, p0, Lqo7;->f:Z

    iput-boolean p7, p0, Lqo7;->g:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 5

    if-eq p0, p1, :cond_41

    instance-of v0, p1, Lqo7;

    const/4 v1, 0x0

    if-eqz v0, :cond_40

    check-cast p1, Lqo7;

    iget-object v0, p0, Lqo7;->a:Ljava/lang/String;

    iget-object v2, p1, Lqo7;->a:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_40

    iget-object v0, p0, Lqo7;->b:Lp4j;

    iget-object v2, p1, Lqo7;->b:Lp4j;

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_40

    iget-object v0, p0, Lqo7;->c:Lnd7;

    iget-object v2, p1, Lqo7;->c:Lnd7;

    if-eq v0, v2, :cond_24

    return v1

    :cond_24
    iget-object v0, p0, Lqo7;->d:Ljava/util/LinkedHashMap;

    iget-object v2, p1, Lqo7;->d:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_40

    iget-boolean v0, p0, Lqo7;->e:Z

    iget-boolean v2, p1, Lqo7;->e:Z

    if-ne v0, v2, :cond_40

    iget-boolean v0, p0, Lqo7;->f:Z

    iget-boolean v2, p1, Lqo7;->f:Z

    if-ne v0, v2, :cond_40

    iget-boolean p0, p0, Lqo7;->g:Z

    iget-boolean p1, p1, Lqo7;->g:Z

    if-eq p0, p1, :cond_41

    :cond_40
    return v1

    :cond_41
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lqo7;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lqo7;->b:Lp4j;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object v0, p0, Lqo7;->c:Lnd7;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-object v2, p0, Lqo7;->d:Ljava/util/LinkedHashMap;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-boolean v0, p0, Lqo7;->e:Z

    invoke-static {v2, v1, v0}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Lqo7;->f:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean p0, p0, Lqo7;->g:Z

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
