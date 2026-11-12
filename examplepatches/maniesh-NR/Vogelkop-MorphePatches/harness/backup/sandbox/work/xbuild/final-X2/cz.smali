.class public final Lcz;
.super Llyf;
.source "SourceFile"


# direct methods
.method public constructor <init>(Lyo;Lrm;Ljava/lang/String;)V
    .registers 5

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p3, ","

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, p1, p2}, Llyf;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public static a(Lvo;Lil;)Lcz;
    .registers 13

    instance-of v0, p0, Lxo;

    const-string v1, ","

    if-eqz v0, :cond_54

    check-cast p0, Lxo;

    iget-object v0, p0, Lvo;->d:Lyo;

    sget-object v2, Lyo;->c:Lyo;

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-ne v0, v2, :cond_1e

    if-eqz p1, :cond_18

    iget-boolean p1, p1, Lil;->e:Z

    if-eqz p1, :cond_18

    move p1, v4

    goto :goto_19

    :cond_18
    move p1, v3

    :goto_19
    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object p1

    goto :goto_20

    :cond_1e
    const-string p1, ""

    :goto_20
    new-instance v2, Lcz;

    iget-object v5, p0, Lvo;->a:Ljava/lang/String;

    iget-object v6, p0, Lvo;->b:Ljava/lang/String;

    iget-object v7, p0, Lvo;->c:Ljava/lang/String;

    iget-object v8, p0, Lxo;->h:Lrm;

    iget-object v9, p0, Lxo;->i:Ljava/lang/String;

    iget p0, p0, Lvo;->e:I

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p0

    const/4 v10, 0x7

    new-array v10, v10, [Ljava/io/Serializable;

    aput-object v5, v10, v3

    aput-object v6, v10, v4

    const/4 v3, 0x2

    aput-object v7, v10, v3

    const/4 v3, 0x3

    aput-object v8, v10, v3

    const/4 v3, 0x4

    aput-object v9, v10, v3

    const/4 v3, 0x5

    aput-object p0, v10, v3

    const/4 p0, 0x6

    aput-object p1, v10, p0

    invoke-static {v10}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-static {v1, p0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v2, v0, p0}, Llyf;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v2

    :cond_54
    instance-of p1, p0, Lwo;

    if-eqz p1, :cond_90

    check-cast p0, Lwo;

    new-instance p1, Lcz;

    iget-object v0, p0, Lvo;->d:Lyo;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lvo;->a:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lvo;->c:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lwo;->i:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lwo;->h:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p0, p0, Lvo;->e:I

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, v0, p0}, Llyf;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object p1

    :cond_90
    const-string p0, "unknown ad provider config"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method
