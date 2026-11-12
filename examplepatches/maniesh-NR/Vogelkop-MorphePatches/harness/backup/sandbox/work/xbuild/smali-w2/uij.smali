.class public final Luij;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public final b:Z

.field public final c:Z

.field public final d:Ls5h;


# direct methods
.method public constructor <init>(ZZZLs5h;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Luij;->a:Z

    iput-boolean p2, p0, Luij;->b:Z

    iput-boolean p3, p0, Luij;->c:Z

    iput-object p4, p0, Luij;->d:Ls5h;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_26

    instance-of v0, p1, Luij;

    if-eqz v0, :cond_24

    check-cast p1, Luij;

    iget-boolean v0, p0, Luij;->a:Z

    iget-boolean v1, p1, Luij;->a:Z

    if-ne v0, v1, :cond_24

    iget-boolean v0, p0, Luij;->b:Z

    iget-boolean v1, p1, Luij;->b:Z

    if-ne v0, v1, :cond_24

    iget-boolean v0, p0, Luij;->c:Z

    iget-boolean v1, p1, Luij;->c:Z

    if-ne v0, v1, :cond_24

    iget-object p0, p0, Luij;->d:Ls5h;

    iget-object p1, p1, Luij;->d:Ls5h;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_26

    :cond_24
    const/4 p0, 0x0

    return p0

    :cond_26
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-boolean v0, p0, Luij;->a:Z

    invoke-static {v0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-boolean v2, p0, Luij;->b:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Luij;->c:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-object p0, p0, Luij;->d:Ls5h;

    invoke-virtual {p0}, Ls5h;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
