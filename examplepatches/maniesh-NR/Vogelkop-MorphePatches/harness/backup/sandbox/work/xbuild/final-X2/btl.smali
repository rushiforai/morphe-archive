.class public final Lbtl;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lb7j;

.field public final b:Z

.field public final c:Z

.field public final d:Z

.field public final e:Lop0;


# direct methods
.method public constructor <init>(Lb7j;ZZZLop0;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lbtl;->a:Lb7j;

    iput-boolean p2, p0, Lbtl;->b:Z

    iput-boolean p3, p0, Lbtl;->c:Z

    iput-boolean p4, p0, Lbtl;->d:Z

    iput-object p5, p0, Lbtl;->e:Lop0;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lbtl;

    const/4 v2, 0x0

    if-eqz v1, :cond_23

    check-cast p1, Lbtl;

    iget-object v1, p0, Lbtl;->a:Lb7j;

    iget-object v3, p1, Lbtl;->a:Lb7j;

    if-ne v1, v3, :cond_23

    iget-boolean v1, p0, Lbtl;->b:Z

    iget-boolean v3, p1, Lbtl;->b:Z

    if-ne v1, v3, :cond_23

    iget-boolean v1, p0, Lbtl;->c:Z

    iget-boolean v3, p1, Lbtl;->c:Z

    if-ne v1, v3, :cond_23

    iget-boolean v1, p0, Lbtl;->d:Z

    iget-boolean v3, p1, Lbtl;->d:Z

    if-eq v1, v3, :cond_24

    :cond_23
    return v2

    :cond_24
    iget-object p0, p0, Lbtl;->e:Lop0;

    iget-object p1, p1, Lbtl;->e:Lop0;

    if-eq p0, p1, :cond_2b

    return v2

    :cond_2b
    return v0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lbtl;->a:Lb7j;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-boolean v2, p0, Lbtl;->b:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Lbtl;->c:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean v2, p0, Lbtl;->d:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-object p0, p0, Lbtl;->e:Lop0;

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
