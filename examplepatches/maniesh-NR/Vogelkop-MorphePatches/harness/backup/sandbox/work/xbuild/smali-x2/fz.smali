.class public final Lfz;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:Ljava/lang/String;

.field public f:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfz;->a:Ljava/lang/String;

    iput-object p2, p0, Lfz;->b:Ljava/lang/String;

    iput-object p3, p0, Lfz;->c:Ljava/lang/String;

    iput-object p5, p0, Lfz;->d:Ljava/lang/String;

    iput p4, p0, Lfz;->f:I

    iput-object p6, p0, Lfz;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a(Lt9f;Landroid/net/Uri;Ljava/lang/String;Lhz;)V
    .registers 15

    iget v0, p0, Lfz;->f:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lfz;->f:I

    new-instance v9, Lez;

    invoke-direct {v9, p0, p4}, Lez;-><init>(Lfz;Lhz;)V

    iget-object v3, p0, Lfz;->a:Ljava/lang/String;

    iget-object v4, p0, Lfz;->e:Ljava/lang/String;

    iget-object v5, p0, Lfz;->b:Ljava/lang/String;

    iget-object v6, p0, Lfz;->c:Ljava/lang/String;

    iget-object v7, p0, Lfz;->d:Ljava/lang/String;

    move-object v1, p1

    move-object v2, p2

    move-object v8, p3

    invoke-static/range {v1 .. v9}, Ljz;->a(Lt9f;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lez;)V

    return-void
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 5

    if-ne p0, p1, :cond_4

    const/4 p0, 0x1

    return p0

    :cond_4
    const/4 v0, 0x0

    if-eqz p1, :cond_46

    const-class v1, Lfz;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-ne v1, v2, :cond_46

    check-cast p1, Lfz;

    iget-object v1, p0, Lfz;->a:Ljava/lang/String;

    iget-object v2, p1, Lfz;->a:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1c

    return v0

    :cond_1c
    iget-object v1, p0, Lfz;->b:Ljava/lang/String;

    iget-object v2, p1, Lfz;->b:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_27

    return v0

    :cond_27
    iget-object v1, p0, Lfz;->c:Ljava/lang/String;

    iget-object v2, p1, Lfz;->c:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_32

    return v0

    :cond_32
    iget-object v1, p0, Lfz;->d:Ljava/lang/String;

    iget-object v2, p1, Lfz;->d:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3d

    return v0

    :cond_3d
    iget-object p0, p0, Lfz;->e:Ljava/lang/String;

    iget-object p1, p1, Lfz;->e:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :cond_46
    return v0
.end method

.method public final hashCode()I
    .registers 5

    iget-object v0, p0, Lfz;->d:Ljava/lang/String;

    iget-object v1, p0, Lfz;->e:Ljava/lang/String;

    iget-object v2, p0, Lfz;->a:Ljava/lang/String;

    iget-object v3, p0, Lfz;->b:Ljava/lang/String;

    iget-object p0, p0, Lfz;->c:Ljava/lang/String;

    filled-new-array {v2, v3, p0, v0, v1}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 9

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "1:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lfz;->f:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    iget-object v7, p0, Lfz;->e:Ljava/lang/String;

    iget-object v2, p0, Lfz;->a:Ljava/lang/String;

    iget-object v3, p0, Lfz;->b:Ljava/lang/String;

    iget-object v4, p0, Lfz;->c:Ljava/lang/String;

    iget-object v5, p0, Lfz;->d:Ljava/lang/String;

    filled-new-array/range {v2 .. v7}, [Ljava/lang/Object;

    move-result-object p0

    const-string v1, "\t"

    invoke-static {v1, p0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
