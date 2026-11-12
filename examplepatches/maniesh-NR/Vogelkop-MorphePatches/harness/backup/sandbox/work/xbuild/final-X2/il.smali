.class public final Lil;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:I

.field public final c:I

.field public final d:I

.field public final e:Z

.field public final f:Lo1;


# direct methods
.method public constructor <init>(IIIIZLo1;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    if-ge p1, v0, :cond_9

    const p1, 0x7fffffff

    :cond_9
    iput p1, p0, Lil;->a:I

    iput p2, p0, Lil;->b:I

    const/4 p1, 0x0

    invoke-static {p3, p1}, Ljava/lang/Math;->max(II)I

    move-result p2

    iput p2, p0, Lil;->c:I

    invoke-static {p4, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Lil;->d:I

    iput-boolean p5, p0, Lil;->e:Z

    iput-object p6, p0, Lil;->f:Lo1;

    return-void
.end method

.method public static a(Lorb;)Lil;
    .registers 13

    new-instance v0, Lil;

    iget-object v1, p0, Lorb;->a:Lorg/json/JSONObject;

    const-string v2, "requestWindowSize"

    const v3, 0x7fffffff

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v2

    const-string v4, "maxBlockCost"

    invoke-virtual {v1, v4, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v4

    const-string v5, "initialMinCacheSize"

    const/4 v6, 0x0

    invoke-virtual {v1, v5, v6}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v5

    const-string v7, "newsConsumerMinCacheSize"

    invoke-virtual {v1, v7, v6}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v7

    const-string v8, "fbOnlyCtaClickable"

    invoke-virtual {v1, v8, v6}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v8

    const-string v9, "premiumBackfillPid"

    invoke-virtual {v1, v9}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_4d

    new-instance v10, Lo1;

    const-string v11, ""

    invoke-virtual {p0, v9, v11}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v9, "maxCountPerDayForPremiumBackfill"

    invoke-virtual {v1, v9, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v3

    const-string v9, "minIntervalInMinutesForPremiumBackfill"

    invoke-virtual {v1, v9, v6}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v1

    const/4 v6, 0x1

    invoke-direct {v10, p0, v3, v1, v6}, Lo1;-><init>(Ljava/lang/String;IIB)V

    :goto_46
    move v1, v2

    move v2, v4

    move v3, v5

    move v4, v7

    move v5, v8

    move-object v6, v10

    goto :goto_4f

    :cond_4d
    const/4 v10, 0x0

    goto :goto_46

    :goto_4f
    invoke-direct/range {v0 .. v6}, Lil;-><init>(IIIIZLo1;)V

    return-object v0
.end method
