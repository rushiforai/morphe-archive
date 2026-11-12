.class public final Lfpf;
.super Lipf;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:I

.field public final f:B


# direct methods
.method public constructor <init>(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfpf;->a:Ljava/lang/String;

    iput-object p4, p0, Lfpf;->b:Ljava/lang/String;

    iput-object p5, p0, Lfpf;->c:Ljava/lang/String;

    iput-object p6, p0, Lfpf;->d:Ljava/lang/String;

    iput p2, p0, Lfpf;->e:I

    iput-byte p3, p0, Lfpf;->f:B

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_3e

    instance-of v0, p1, Lfpf;

    if-eqz v0, :cond_3c

    check-cast p1, Lfpf;

    iget-object v0, p0, Lfpf;->a:Ljava/lang/String;

    iget-object v1, p1, Lfpf;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3c

    iget-object v0, p0, Lfpf;->b:Ljava/lang/String;

    iget-object v1, p1, Lfpf;->b:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3c

    iget-object v0, p0, Lfpf;->c:Ljava/lang/String;

    iget-object v1, p1, Lfpf;->c:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3c

    iget-object v0, p0, Lfpf;->d:Ljava/lang/String;

    iget-object v1, p1, Lfpf;->d:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3c

    iget v0, p0, Lfpf;->e:I

    iget v1, p1, Lfpf;->e:I

    if-ne v0, v1, :cond_3c

    iget-byte p0, p0, Lfpf;->f:B

    iget-byte p1, p1, Lfpf;->f:B

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

    iget-object v0, p0, Lfpf;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lfpf;->b:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Lfpf;->c:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Lfpf;->d:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget v2, p0, Lfpf;->e:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget-byte p0, p0, Lfpf;->f:B

    invoke-static {p0}, Ljava/lang/Integer;->hashCode(I)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
