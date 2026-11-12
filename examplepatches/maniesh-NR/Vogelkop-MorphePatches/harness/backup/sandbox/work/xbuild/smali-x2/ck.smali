.class public final Lck;
.super Lc09;
.source "SourceFile"


# instance fields
.field public final W:Lrxh;

.field public final X:Lrxh;

.field public final Y:Z

.field public final Z:Lkk;


# direct methods
.method public constructor <init>(Lrxh;Lrxh;ZLkk;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lck;->W:Lrxh;

    iput-object p2, p0, Lck;->X:Lrxh;

    iput-boolean p3, p0, Lck;->Y:Z

    iput-object p4, p0, Lck;->Z:Lkk;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_2a

    instance-of v0, p1, Lck;

    if-eqz v0, :cond_28

    check-cast p1, Lck;

    iget-object v0, p0, Lck;->W:Lrxh;

    iget-object v1, p1, Lck;->W:Lrxh;

    invoke-virtual {v0, v1}, Lrxh;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28

    iget-object v0, p0, Lck;->X:Lrxh;

    iget-object v1, p1, Lck;->X:Lrxh;

    invoke-virtual {v0, v1}, Lrxh;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28

    iget-boolean v0, p0, Lck;->Y:Z

    iget-boolean v1, p1, Lck;->Y:Z

    if-ne v0, v1, :cond_28

    iget-object p0, p0, Lck;->Z:Lkk;

    iget-object p1, p1, Lck;->Z:Lkk;

    if-eq p0, p1, :cond_2a

    :cond_28
    const/4 p0, 0x0

    return p0

    :cond_2a
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lck;->W:Lrxh;

    iget v0, v0, Lrxh;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lck;->X:Lrxh;

    iget v2, v2, Lrxh;->a:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget-boolean v2, p0, Lck;->Y:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-object p0, p0, Lck;->Z:Lkk;

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
