.class public final Luo7;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lorg/chromium/url/GURL;

.field public final b:Lqo7;

.field public final c:Z

.field public final d:Lkag;

.field public final e:Z

.field public final f:Z


# direct methods
.method public constructor <init>(Lorg/chromium/url/GURL;Lqo7;ZLkag;ZZ)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Luo7;->a:Lorg/chromium/url/GURL;

    iput-object p2, p0, Luo7;->b:Lqo7;

    iput-boolean p3, p0, Luo7;->c:Z

    iput-object p4, p0, Luo7;->d:Lkag;

    iput-boolean p5, p0, Luo7;->e:Z

    iput-boolean p6, p0, Luo7;->f:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_36

    instance-of v0, p1, Luo7;

    if-eqz v0, :cond_34

    check-cast p1, Luo7;

    iget-object v0, p0, Luo7;->a:Lorg/chromium/url/GURL;

    iget-object v1, p1, Luo7;->a:Lorg/chromium/url/GURL;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_34

    iget-object v0, p0, Luo7;->b:Lqo7;

    iget-object v1, p1, Luo7;->b:Lqo7;

    invoke-virtual {v0, v1}, Lqo7;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_34

    iget-boolean v0, p0, Luo7;->c:Z

    iget-boolean v1, p1, Luo7;->c:Z

    if-ne v0, v1, :cond_34

    iget-object v0, p0, Luo7;->d:Lkag;

    iget-object v1, p1, Luo7;->d:Lkag;

    if-ne v0, v1, :cond_34

    iget-boolean v0, p0, Luo7;->e:Z

    iget-boolean v1, p1, Luo7;->e:Z

    if-ne v0, v1, :cond_34

    iget-boolean p0, p0, Luo7;->f:Z

    iget-boolean p1, p1, Luo7;->f:Z

    if-eq p0, p1, :cond_36

    :cond_34
    const/4 p0, 0x0

    return p0

    :cond_36
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Luo7;->a:Lorg/chromium/url/GURL;

    iget-object v0, v0, Lorg/chromium/url/GURL;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Luo7;->b:Lqo7;

    invoke-virtual {v2}, Lqo7;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-boolean v0, p0, Luo7;->c:Z

    invoke-static {v2, v1, v0}, Lfki;->k(IIZ)I

    move-result v0

    iget-object v2, p0, Luo7;->d:Lkag;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-boolean v0, p0, Luo7;->e:Z

    invoke-static {v2, v1, v0}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean p0, p0, Luo7;->f:Z

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
