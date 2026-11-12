.class public final Lnvm;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Lpxh;

.field public final c:Lpxh;

.field public final d:Lti3;

.field public final e:Landroid/net/Uri;

.field public final f:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Lpxh;Lpxh;Lti3;Landroid/net/Uri;Z)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnvm;->a:Ljava/lang/String;

    iput-object p2, p0, Lnvm;->b:Lpxh;

    iput-object p3, p0, Lnvm;->c:Lpxh;

    iput-object p4, p0, Lnvm;->d:Lti3;

    iput-object p5, p0, Lnvm;->e:Landroid/net/Uri;

    iput-boolean p6, p0, Lnvm;->f:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_3e

    instance-of v0, p1, Lnvm;

    if-eqz v0, :cond_3c

    check-cast p1, Lnvm;

    iget-object v0, p0, Lnvm;->a:Ljava/lang/String;

    iget-object v1, p1, Lnvm;->a:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3c

    iget-object v0, p0, Lnvm;->b:Lpxh;

    iget-object v1, p1, Lnvm;->b:Lpxh;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3c

    iget-object v0, p0, Lnvm;->c:Lpxh;

    iget-object v1, p1, Lnvm;->c:Lpxh;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3c

    iget-object v0, p0, Lnvm;->d:Lti3;

    iget-object v1, p1, Lnvm;->d:Lti3;

    if-ne v0, v1, :cond_3c

    iget-object v0, p0, Lnvm;->e:Landroid/net/Uri;

    iget-object v1, p1, Lnvm;->e:Landroid/net/Uri;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3c

    iget-boolean p0, p0, Lnvm;->f:Z

    iget-boolean p1, p1, Lnvm;->f:Z

    if-eq p0, p1, :cond_3e

    :cond_3c
    const/4 p0, 0x0

    return p0

    :cond_3e
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lnvm;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lnvm;->b:Lpxh;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    const/4 v0, 0x0

    iget-object v2, p0, Lnvm;->c:Lpxh;

    if-nez v2, :cond_18

    move v2, v0

    goto :goto_1c

    :cond_18
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    :goto_1c
    add-int/2addr v1, v2

    mul-int/lit8 v1, v1, 0x1f

    iget-object v2, p0, Lnvm;->d:Lti3;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v1

    mul-int/lit8 v2, v2, 0x1f

    iget-object v1, p0, Lnvm;->e:Landroid/net/Uri;

    if-eqz v1, :cond_30

    invoke-virtual {v1}, Landroid/net/Uri;->hashCode()I

    move-result v0

    :cond_30
    add-int/2addr v2, v0

    mul-int/lit8 v2, v2, 0x1f

    iget-boolean p0, p0, Lnvm;->f:Z

    invoke-static {p0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result p0

    add-int/2addr p0, v2

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
