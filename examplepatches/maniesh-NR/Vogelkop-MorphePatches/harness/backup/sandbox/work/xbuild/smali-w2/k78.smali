.class public final Lk78;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lm78;


# instance fields
.field public final a:Lrxh;

.field public final b:Lpxh;

.field public final c:Lrxh;

.field public final d:Lsxh;

.field public final e:Lrxh;


# direct methods
.method public constructor <init>(Lrxh;Lpxh;Lrxh;Lsxh;Lrxh;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lk78;->a:Lrxh;

    iput-object p2, p0, Lk78;->b:Lpxh;

    iput-object p3, p0, Lk78;->c:Lrxh;

    iput-object p4, p0, Lk78;->d:Lsxh;

    iput-object p5, p0, Lk78;->e:Lrxh;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_3c

    instance-of v0, p1, Lk78;

    if-eqz v0, :cond_3a

    check-cast p1, Lk78;

    iget-object v0, p0, Lk78;->a:Lrxh;

    iget-object v1, p1, Lk78;->a:Lrxh;

    invoke-virtual {v0, v1}, Lrxh;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3a

    iget-object v0, p0, Lk78;->b:Lpxh;

    iget-object v1, p1, Lk78;->b:Lpxh;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3a

    iget-object v0, p0, Lk78;->c:Lrxh;

    iget-object v1, p1, Lk78;->c:Lrxh;

    invoke-virtual {v0, v1}, Lrxh;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3a

    iget-object v0, p0, Lk78;->d:Lsxh;

    iget-object v1, p1, Lk78;->d:Lsxh;

    invoke-virtual {v0, v1}, Lsxh;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3a

    iget-object p0, p0, Lk78;->e:Lrxh;

    iget-object p1, p1, Lk78;->e:Lrxh;

    invoke-virtual {p0, p1}, Lrxh;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3c

    :cond_3a
    const/4 p0, 0x0

    return p0

    :cond_3c
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lk78;->a:Lrxh;

    iget v0, v0, Lrxh;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lk78;->b:Lpxh;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object v0, p0, Lk78;->c:Lrxh;

    iget v0, v0, Lrxh;->a:I

    invoke-static {v0, v2, v1}, Lrfp;->c(III)I

    move-result v0

    iget-object v2, p0, Lk78;->d:Lsxh;

    invoke-virtual {v2}, Lsxh;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object p0, p0, Lk78;->e:Lrxh;

    iget p0, p0, Lrxh;->a:I

    invoke-static {p0}, Ljava/lang/Integer;->hashCode(I)I

    move-result p0

    add-int/2addr p0, v2

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
