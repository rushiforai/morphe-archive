.class public final Ltsi;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Z

.field public final c:Ltn;

.field public final d:Ljava/net/URL;


# direct methods
.method public constructor <init>(Ljava/lang/String;ZLtn;Ljava/net/URL;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ltsi;->a:Ljava/lang/String;

    iput-boolean p2, p0, Ltsi;->b:Z

    iput-object p3, p0, Ltsi;->c:Ltn;

    iput-object p4, p0, Ltsi;->d:Ljava/net/URL;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_1e

    instance-of v0, p1, Ltsi;

    if-eqz v0, :cond_20

    check-cast p1, Ltsi;

    iget-object v0, p0, Ltsi;->a:Ljava/lang/String;

    iget-object v1, p1, Ltsi;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_20

    iget-boolean v0, p0, Ltsi;->b:Z

    iget-boolean v1, p1, Ltsi;->b:Z

    if-ne v0, v1, :cond_20

    iget-object p0, p0, Ltsi;->c:Ltn;

    iget-object p1, p1, Ltsi;->c:Ltn;

    if-ne p0, p1, :cond_20

    :cond_1e
    const/4 p0, 0x1

    return p0

    :cond_20
    const/4 p0, 0x0

    return p0
.end method

.method public final hashCode()I
    .registers 4

    const/16 v0, 0x20f

    const/16 v1, 0x1f

    iget-object v2, p0, Ltsi;->a:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-boolean v2, p0, Ltsi;->b:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Boolean;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object p0, p0, Ltsi;->c:Ltn;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr p0, v2

    return p0
.end method
