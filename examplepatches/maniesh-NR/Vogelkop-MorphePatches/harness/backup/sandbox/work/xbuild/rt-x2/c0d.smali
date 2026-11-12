.class public final Lc0d;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lv3g;

.field public final b:Z

.field public final c:Z


# direct methods
.method public constructor <init>(Lv3g;ZZ)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lc0d;->a:Lv3g;

    iput-boolean p2, p0, Lc0d;->b:Z

    iput-boolean p3, p0, Lc0d;->c:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_20

    instance-of v0, p1, Lc0d;

    if-eqz v0, :cond_1e

    check-cast p1, Lc0d;

    iget-object v0, p0, Lc0d;->a:Lv3g;

    iget-object v1, p1, Lc0d;->a:Lv3g;

    invoke-virtual {v0, v1}, Lv3g;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1e

    iget-boolean v0, p0, Lc0d;->b:Z

    iget-boolean v1, p1, Lc0d;->b:Z

    if-ne v0, v1, :cond_1e

    iget-boolean p0, p0, Lc0d;->c:Z

    iget-boolean p1, p1, Lc0d;->c:Z

    if-eq p0, p1, :cond_20

    :cond_1e
    const/4 p0, 0x0

    return p0

    :cond_20
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lc0d;->a:Lv3g;

    invoke-virtual {v0}, Lv3g;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-boolean v2, p0, Lc0d;->b:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean p0, p0, Lc0d;->c:Z

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
