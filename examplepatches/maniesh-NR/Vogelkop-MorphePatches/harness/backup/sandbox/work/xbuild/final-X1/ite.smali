.class public final Lite;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/List;

.field public final b:Z

.field public final c:Z

.field public final d:Z


# direct methods
.method public constructor <init>(Ljava/util/List;ZZZ)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lite;->a:Ljava/util/List;

    iput-boolean p2, p0, Lite;->b:Z

    iput-boolean p3, p0, Lite;->c:Z

    iput-boolean p4, p0, Lite;->d:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_26

    instance-of v0, p1, Lite;

    if-eqz v0, :cond_24

    check-cast p1, Lite;

    iget-object v0, p0, Lite;->a:Ljava/util/List;

    iget-object v1, p1, Lite;->a:Ljava/util/List;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_24

    iget-boolean v0, p0, Lite;->b:Z

    iget-boolean v1, p1, Lite;->b:Z

    if-ne v0, v1, :cond_24

    iget-boolean v0, p0, Lite;->c:Z

    iget-boolean v1, p1, Lite;->c:Z

    if-ne v0, v1, :cond_24

    iget-boolean p0, p0, Lite;->d:Z

    iget-boolean p1, p1, Lite;->d:Z

    if-eq p0, p1, :cond_26

    :cond_24
    const/4 p0, 0x0

    return p0

    :cond_26
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lite;->a:Ljava/util/List;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-boolean v2, p0, Lite;->b:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Lite;->c:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean p0, p0, Lite;->d:Z

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
