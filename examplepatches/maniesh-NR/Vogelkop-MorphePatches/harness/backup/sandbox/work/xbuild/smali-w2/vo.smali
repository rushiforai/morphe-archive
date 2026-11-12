.class public Lvo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Lyo;

.field public final e:I

.field public final f:I

.field public final g:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lyo;III)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvo;->a:Ljava/lang/String;

    iput-object p2, p0, Lvo;->b:Ljava/lang/String;

    iput-object p3, p0, Lvo;->c:Ljava/lang/String;

    iput-object p4, p0, Lvo;->d:Lyo;

    iput p5, p0, Lvo;->e:I

    iput p6, p0, Lvo;->f:I

    iput p7, p0, Lvo;->g:I

    return-void
.end method

.method public static a(Lr9i;)Lvo;
    .registers 16

    iget-object v0, p0, Lr9i;->d:Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, Ljava/lang/String;

    iget-object v0, p0, Lr9i;->e:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iget-object v1, p0, Lr9i;->b:Ljava/lang/Object;

    check-cast v1, Lorb;

    iget-object v2, v1, Lorb;->a:Lorg/json/JSONObject;

    const-string v4, "online"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    const-string v5, "cpd"

    const-string v6, "pricing"

    const-string v7, ""

    const-string v8, "id"

    const-string v9, "validity"

    const-string v10, "sdkPlcKey"

    const-string v11, "sdkSource"

    if-nez v4, :cond_9f

    const-string v4, "sdk"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    const/4 v12, 0x0

    if-nez v4, :cond_32

    invoke-static {v0}, Lqp2;->o(Ljava/lang/String;)V

    return-object v12

    :cond_32
    invoke-virtual {v1, v11}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lyo;->d(Ljava/lang/String;)Lyo;

    move-result-object v0

    move-object v4, v7

    invoke-virtual {v1, v10}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v10, "format"

    invoke-virtual {v1, v10, v4}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lrm;->d(Ljava/lang/String;)Lrm;

    move-result-object v10

    invoke-static {v0, v10}, Lyo;->g(Lyo;Lrm;)I

    move-result v11

    invoke-virtual {v2, v9, v11}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v9

    const-string v2, "mediationChannel"

    invoke-virtual {v1, v2, v12}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_61

    invoke-static {v2}, Lyo;->d(Ljava/lang/String;)Lyo;

    const-string v2, "mediationUnitId"

    invoke-virtual {v1, v2}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    :cond_61
    const-string v2, "bidUnitId"

    invoke-virtual {v1, v2, v12}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v11, "bidFormatId"

    invoke-virtual {v1, v11, v12}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    if-eqz v2, :cond_76

    if-eqz v11, :cond_76

    new-instance v12, Ly55;

    invoke-direct {v12}, Ljava/lang/Object;-><init>()V

    :cond_76
    move-object v11, v12

    move-object v12, v1

    new-instance v1, Lxo;

    iget-object p0, p0, Lr9i;->c:Ljava/lang/Object;

    move-object v2, p0

    check-cast v2, Ljava/lang/String;

    move-object v13, v4

    invoke-virtual {v12, v8}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const/16 p0, 0x32

    invoke-static {p0, v12}, Lvo;->b(ILorb;)I

    move-result v8

    invoke-virtual {v12, v6, v13}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    const-string v5, "contentMapping"

    invoke-virtual {v12, v5}, Lorb;->f(Ljava/lang/String;)Z

    move-result v12

    move-object v5, v0

    move-object v6, v10

    move v10, p0

    invoke-direct/range {v1 .. v12}, Lxo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lyo;Lrm;Ljava/lang/String;IIILy55;Z)V

    return-object v1

    :cond_9f
    move-object v12, v1

    move-object v13, v7

    new-instance v1, Lwo;

    iget-object p0, p0, Lr9i;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-virtual {v12, v8}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    sget-object v0, Lyo;->d:Lyo;

    const/4 v7, 0x0

    move-object v8, v5

    invoke-static {v7, v12}, Lvo;->b(ILorb;)I

    move-result v5

    sget-object v14, Lrm;->b:Lrm;

    invoke-static {v0, v14}, Lyo;->g(Lyo;Lrm;)I

    move-result v0

    invoke-virtual {v2, v9, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    invoke-virtual {v12, v6, v13}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    invoke-virtual {v12, v11}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v12, v10}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v10, "successBackoff"

    invoke-virtual {v2, v10, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v10

    const-string v7, "failureBackoff"

    const/16 v11, 0xa

    invoke-virtual {v2, v7, v11}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v11

    move-object v2, p0

    move v7, v6

    move v6, v0

    invoke-direct/range {v1 .. v11}, Lwo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIILjava/lang/String;Ljava/lang/String;II)V

    return-object v1
.end method

.method public static b(ILorb;)I
    .registers 4

    iget-object p1, p1, Lorb;->a:Lorg/json/JSONObject;

    const-string v0, "weight"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_f

    invoke-virtual {p1, v0, p0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result p0

    return p0

    :cond_f
    const-string v0, "rank"

    invoke-virtual {p1, v0, p0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result p1

    if-ltz p1, :cond_1c

    const/16 v0, 0x64

    if-gt p1, v0, :cond_1c

    return p1

    :cond_1c
    return p0
.end method
