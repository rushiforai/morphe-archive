.class final Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;
.super Ljava/lang/Object;
.source "TokenCostAudit.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;,
        Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$BucketMutation;
    }
.end annotation


# static fields
.field private static final LOCK:Ljava/lang/Object;

.field private static final PREFS:Ljava/lang/String; = "deepseek_caption_token_cost_audit"

.field private static final STATE:Ljava/lang/String; = "state_v1"

.field private static final VERSION:I = 0x1

.field private static final WATCH_PERSIST_INTERVAL_MS:J = 0x1388L

.field private static final WATCH_SAMPLE_MAX_DELTA_MS:J = 0x1388L

.field private static activeCore:Ljava/lang/String; = "event_rebuild_r2"

.field private static activeVideoId:Ljava/lang/String; = ""

.field private static volatile appContext:Landroid/content/Context; = null

.field private static generation:J = 0x0L

.field private static lastVideoTimeMs:J = -0x1L

.field private static lastWatchPersistRealtimeMs:J

.field private static memoryState:Lorg/json/JSONObject;


# direct methods
.method static bridge synthetic -$$Nest$smcoreBucket(Ljava/lang/String;)Ljava/lang/String;
    .registers 1

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->coreBucket(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static constructor <clinit>()V
    .registers 1

    .line 24
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->LOCK:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static add(Lorg/json/JSONObject;Ljava/lang/String;J)V
    .registers 11

    if-eqz p0, :cond_2f

    const-wide/16 v0, 0x0

    cmp-long v2, p2, v0

    if-nez v2, :cond_9

    goto :goto_2f

    .line 916
    :cond_9
    invoke-virtual {p0, p1, v0, v1}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v0

    if-lez v2, :cond_1b

    const-wide v3, 0x7fffffffffffffffL

    sub-long v5, v3, p2

    cmp-long v5, v0, v5

    if-lez v5, :cond_1b

    goto :goto_28

    :cond_1b
    if-gez v2, :cond_26

    const-wide/high16 v3, -0x8000000000000000L

    sub-long v5, v3, p2

    cmp-long v2, v0, v5

    if-gez v2, :cond_26

    goto :goto_28

    :cond_26
    add-long v3, v0, p2

    .line 921
    :goto_28
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-static {p0, p1, p2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->putQuiet(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_2f
    :goto_2f
    return-void
.end method

.method private static appendBucketLine(Ljava/lang/StringBuilder;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V
    .registers 9

    .line 672
    invoke-static {p1, p2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->bucketLocked(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    .line 673
    const-string p2, "\n  "

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "\uff1a"

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "logical_requests"

    .line 674
    invoke-static {p1, p2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide p2

    invoke-static {p2, p3}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->format(J)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " \u4e2a\u903b\u8f91\u8bf7\u6c42 / "

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "attempts"

    .line 675
    invoke-static {p1, p2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide p2

    invoke-static {p2, p3}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->format(J)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " \u6b21 API \u00b7 "

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "total_tokens"

    .line 676
    invoke-static {p1, p2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide p2

    invoke-static {p2, p3}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->format(J)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " tok"

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 677
    const-string p2, "focus_miss_results"

    invoke-static {p1, p2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide p2

    .line 678
    const-string v0, "local_deferrals"

    invoke-static {p1, v0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, p2, v2

    if-lez v4, :cond_65

    .line 679
    const-string v4, " \u00b7 \u7126\u70b9\u672a\u547d\u4e2d "

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p2, p3}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->format(J)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_65
    cmp-long p2, v0, v2

    if-lez p2, :cond_75

    .line 680
    const-string p2, " \u00b7 \u672c\u5730\u7194\u65ad "

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->format(J)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 681
    :cond_75
    const-string p2, " \u00b7 "

    invoke-static {p0, p1, p2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->appendCost(Ljava/lang/StringBuilder;Lorg/json/JSONObject;Ljava/lang/String;)V

    return-void
.end method

.method private static appendCoreRate(Ljava/lang/StringBuilder;Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V
    .registers 13

    .line 641
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "viewed_ms_"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v0

    .line 642
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v2, "core_"

    invoke-direct {p2, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->bucketLocked(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    .line 643
    const-string p2, "total_tokens"

    invoke-static {p1, p2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide p2

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-gtz v4, :cond_36

    cmp-long v4, p2, v2

    if-gtz v4, :cond_36

    goto/16 :goto_b2

    .line 645
    :cond_36
    const-string v4, "\n  "

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p4, "\uff1a\u89c2\u770b "

    invoke-virtual {p0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    long-to-double v4, v0

    const-wide v6, 0x408f400000000000L    # 1000.0

    div-double v6, v4, v6

    .line 646
    invoke-static {v6, v7}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->seconds1(D)Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p4, " \u79d2 \u00b7 "

    invoke-virtual {p0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 647
    invoke-static {p2, p3}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->format(J)Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p4, " tok"

    invoke-virtual {p0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-wide/16 v6, 0x1388

    cmp-long p4, v0, v6

    if-ltz p4, :cond_b2

    const-wide v0, 0x40ed4c0000000000L    # 60000.0

    div-double/2addr v4, v0

    .line 650
    const-string p4, " \u00b7 "

    invoke-virtual {p0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    long-to-double p2, p2

    const-wide v0, 0x3f50624dd2f1a9fcL    # 0.001

    invoke-static {v0, v1, v4, v5}, Ljava/lang/Math;->max(DD)D

    move-result-wide v0

    div-double/2addr p2, v0

    invoke-static {p2, p3}, Ljava/lang/Math;->round(D)J

    move-result-wide p2

    invoke-static {p2, p3}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->format(J)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " tok/\u89c2\u770b\u5206\u949f"

    .line 651
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 652
    const-string p2, "cost_nano_cny"

    invoke-static {p1, p2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide p1

    cmp-long p3, p1, v2

    if-lez p3, :cond_b2

    .line 654
    const-string p3, " \u00b7 \u00a5"

    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    long-to-double p1, p1

    const-wide p3, 0x41cdcd6500000000L    # 1.0E9

    div-double/2addr p1, p3

    div-double/2addr p1, v4

    invoke-static {p1, p2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->money(D)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "/\u5206\u949f"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_b2
    :goto_b2
    return-void
.end method

.method private static appendCost(Ljava/lang/StringBuilder;Lorg/json/JSONObject;Ljava/lang/String;)V
    .registers 9

    .line 699
    const-string v0, "cost_nano_cny"

    invoke-static {p1, v0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v0

    .line 700
    const-string v2, "priced_responses"

    invoke-static {p1, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-gtz v4, :cond_13

    goto :goto_38

    .line 702
    :cond_13
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "\u00a5"

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    long-to-double v0, v0

    const-wide v4, 0x41cdcd6500000000L    # 1.0E9

    div-double/2addr v0, v4

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->money(D)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 703
    const-string p2, "usage_responses"

    invoke-static {p1, p2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide p1

    cmp-long p1, v2, p1

    if-gez p1, :cond_38

    .line 704
    const-string p1, "\uff08\u4ec5\u7edf\u8ba1\u53ef\u6309\u5185\u7f6e V4 Flash \u4ef7\u683c\u8ba1\u4ef7\u7684\u54cd\u5e94\uff09"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_38
    :goto_38
    return-void
.end method

.method private static appendFailureBreakdown(Ljava/lang/StringBuilder;Lorg/json/JSONObject;)V
    .registers 6

    .line 659
    const-string v0, "failures"

    invoke-static {p1, v0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-gtz v0, :cond_d

    return-void

    .line 660
    :cond_d
    const-string v0, "\n\u5931\u8d25\u660e\u7ec6\uff1a429 "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "http_429_failures"

    invoke-static {p1, v0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->format(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " \u00b7 5xx "

    .line 661
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "http_5xx_failures"

    invoke-static {p1, v0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->format(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " \u00b7 \u5176\u4ed64xx "

    .line 662
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "http_4xx_failures"

    invoke-static {p1, v0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->format(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " \u00b7 \u8d85\u65f6 "

    .line 663
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "timeout_failures"

    invoke-static {p1, v0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->format(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " \u00b7 \u7f51\u7edc "

    .line 664
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "network_failures"

    invoke-static {p1, v0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->format(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " \u00b7 \u53d6\u6d88/\u4e2d\u65ad "

    .line 665
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "cancelled_failures"

    invoke-static {p1, v0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->format(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " \u00b7 \u5176\u4ed6 "

    .line 666
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "other_failures"

    .line 667
    invoke-static {p1, v0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v0

    const-string v2, "http_other_failures"

    invoke-static {p1, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v2

    add-long/2addr v0, v2

    .line 666
    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->format(J)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void
.end method

.method private static appendPageEfficiencyLine(Ljava/lang/StringBuilder;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V
    .registers 9

    .line 687
    invoke-static {p1, p2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->bucketLocked(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    .line 688
    const-string p2, "committed_atoms"

    invoke-static {p1, p2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long p2, v0, v2

    if-gtz p2, :cond_11

    return-void

    .line 690
    :cond_11
    const-string p2, "prompt_tokens"

    invoke-static {p1, p2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v2

    .line 691
    const-string p2, "cache_miss_tokens"

    invoke-static {p1, p2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide p1

    .line 692
    const-string v4, "\n  "

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " \u6548\u7387\uff1a\u65b0\u589e "

    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->format(J)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " \u4e2a\u6838\u5fc3 atom \u00b7 \u6bcf atom \u8f93\u5165 "

    .line 693
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    long-to-double v2, v2

    long-to-double v0, v0

    div-double/2addr v2, v0

    invoke-static {v2, v3}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->oneDecimal(D)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " tok \u00b7 \u6bcf atom \u672a\u547d\u4e2d\u8f93\u5165 "

    .line 694
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    long-to-double p1, p1

    div-double/2addr p1, v0

    invoke-static {p1, p2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->oneDecimal(D)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " tok"

    .line 695
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void
.end method

.method static beginAttempt(Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;I)I
    .registers 5

    if-nez p0, :cond_4

    const/4 p0, 0x0

    return p0

    .line 325
    :cond_4
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 326
    :try_start_7
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->stateLocked()Lorg/json/JSONObject;

    .line 327
    iget v1, p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;->attempts:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;->attempts:I

    .line 328
    new-instance v2, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$$ExternalSyntheticLambda5;

    invoke-direct {v2, p1, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$$ExternalSyntheticLambda5;-><init>(II)V

    invoke-static {p0, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->updateBucketsLocked(Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$BucketMutation;)V

    .line 333
    monitor-exit v0

    return v1

    :catchall_1a
    move-exception p0

    .line 334
    monitor-exit v0
    :try_end_1c
    .catchall {:try_start_7 .. :try_end_1c} :catchall_1a

    throw p0
.end method

.method static beginDisplay(Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;II)Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;
    .registers 13

    .line 299
    sget-object v1, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->LOCK:Ljava/lang/Object;

    monitor-enter v1

    .line 300
    :try_start_3
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->stateLocked()Lorg/json/JSONObject;

    .line 301
    new-instance v2, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;

    sget-wide v3, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->generation:J

    const-string v5, "display"

    if-nez p0, :cond_11

    .line 304
    const-string v0, ""

    goto :goto_13

    :cond_11
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->model:Ljava/lang/String;

    :goto_13
    move-object v6, v0

    if-nez p0, :cond_19

    .line 305
    const-string p0, ""

    goto :goto_1b

    :cond_19
    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->baseUrl:Ljava/lang/String;

    :goto_1b
    move-object v7, p0

    const-string v8, ""

    const-string v9, "semantic_ledger_v2"

    invoke-direct/range {v2 .. v9}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;-><init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 309
    iget-object p0, v2, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;->model:Ljava/lang/String;

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->noteModelLocked(Ljava/lang/String;)V

    .line 310
    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->incrementLogicalRequestLocked(Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;)V

    .line 311
    sget-object p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->memoryState:Lorg/json/JSONObject;

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->metricsLocked(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object p0

    .line 312
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->sessionLocked()Lorg/json/JSONObject;

    move-result-object v0

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->metricsLocked(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v0

    .line 313
    const-string v3, "display_requests"

    const-wide/16 v4, 0x1

    invoke-static {p0, v3, v4, v5}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 314
    const-string v3, "display_requests"

    invoke-static {v0, v3, v4, v5}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 315
    const-string v3, "display_atoms"

    const/4 v4, 0x0

    invoke-static {v4, p1}, Ljava/lang/Math;->max(II)I

    move-result v5

    int-to-long v5, v5

    invoke-static {p0, v3, v5, v6}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 316
    const-string v3, "display_atoms"

    invoke-static {v4, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    int-to-long v5, p1

    invoke-static {v0, v3, v5, v6}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 317
    const-string p1, "display_canonical_chars"

    invoke-static {v4, p2}, Ljava/lang/Math;->max(II)I

    move-result v3

    int-to-long v5, v3

    invoke-static {p0, p1, v5, v6}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 318
    const-string p0, "display_canonical_chars"

    invoke-static {v4, p2}, Ljava/lang/Math;->max(II)I

    move-result p1

    int-to-long p1, p1

    invoke-static {v0, p0, p1, p2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 319
    monitor-exit v1

    return-object v2

    :catchall_70
    move-exception v0

    move-object p0, v0

    .line 320
    monitor-exit v1
    :try_end_73
    .catchall {:try_start_3 .. :try_end_73} :catchall_70

    throw p0
.end method

.method static beginSemantic(Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;ZIIIILjava/lang/String;)Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;
    .registers 21

    move/from16 v0, p2

    move/from16 v1, p3

    move/from16 v2, p4

    move/from16 v3, p5

    .line 109
    sget-object v4, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->LOCK:Ljava/lang/Object;

    monitor-enter v4

    .line 110
    :try_start_b
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->stateLocked()Lorg/json/JSONObject;

    if-eqz p1, :cond_13

    .line 111
    const-string v5, "priority"

    goto :goto_15

    :cond_13
    const-string v5, "background"

    :goto_15
    move-object v9, v5

    .line 112
    new-instance v6, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;

    sget-wide v7, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->generation:J

    if-nez p0, :cond_1f

    .line 115
    const-string v5, ""

    goto :goto_21

    :cond_1f
    iget-object v5, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->model:Ljava/lang/String;

    :goto_21
    move-object v10, v5

    if-nez p0, :cond_27

    .line 116
    const-string p0, ""

    goto :goto_29

    :cond_27
    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->baseUrl:Ljava/lang/String;

    :goto_29
    move-object v11, p0

    const-string v13, "semantic_ledger_v2"

    move-object/from16 v12, p6

    invoke-direct/range {v6 .. v13}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;-><init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    iget-object p0, v6, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;->model:Ljava/lang/String;

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->noteModelLocked(Ljava/lang/String;)V

    .line 121
    invoke-static {v6}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->incrementLogicalRequestLocked(Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;)V

    .line 122
    sget-object p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->memoryState:Lorg/json/JSONObject;

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->metricsLocked(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object p0

    .line 123
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->sessionLocked()Lorg/json/JSONObject;

    move-result-object v5

    invoke-static {v5}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->metricsLocked(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v5

    .line 124
    const-string v7, "semantic_requests"

    const-wide/16 v8, 0x1

    invoke-static {p0, v7, v8, v9}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 125
    const-string v7, "semantic_requests"

    invoke-static {v5, v7, v8, v9}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 126
    const-string v7, "semantic_window_atoms"

    const/4 v8, 0x0

    invoke-static {v8, v0}, Ljava/lang/Math;->max(II)I

    move-result v9

    int-to-long v9, v9

    invoke-static {p0, v7, v9, v10}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 127
    const-string v7, "semantic_window_atoms"

    invoke-static {v8, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    int-to-long v9, v0

    invoke-static {v5, v7, v9, v10}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 128
    const-string v0, "semantic_core_atoms"

    invoke-static {v8, v1}, Ljava/lang/Math;->max(II)I

    move-result v7

    int-to-long v9, v7

    invoke-static {p0, v0, v9, v10}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 129
    const-string v0, "semantic_core_atoms"

    invoke-static {v8, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    int-to-long v9, v1

    invoke-static {v5, v0, v9, v10}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 130
    const-string v0, "semantic_outside_atoms"

    invoke-static {v8, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    int-to-long v9, v1

    invoke-static {p0, v0, v9, v10}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 131
    const-string v0, "semantic_outside_atoms"

    invoke-static {v8, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    int-to-long v1, v1

    invoke-static {v5, v0, v1, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 132
    const-string v0, "semantic_source_chars"

    invoke-static {v8, v3}, Ljava/lang/Math;->max(II)I

    move-result v1

    int-to-long v1, v1

    invoke-static {p0, v0, v1, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 133
    const-string p0, "semantic_source_chars"

    invoke-static {v8, v3}, Ljava/lang/Math;->max(II)I

    move-result v0

    int-to-long v0, v0

    invoke-static {v5, p0, v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 134
    monitor-exit v4

    return-object v6

    :catchall_a6
    move-exception v0

    move-object p0, v0

    .line 135
    monitor-exit v4
    :try_end_a9
    .catchall {:try_start_b .. :try_end_a9} :catchall_a6

    throw p0
.end method

.method static beginUnitBatch(Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;ZIIIILjava/lang/String;)Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;
    .registers 20

    move/from16 v1, p3

    move/from16 v2, p4

    move/from16 v3, p5

    move-object/from16 v10, p6

    .line 147
    sget-object v12, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->LOCK:Ljava/lang/Object;

    monitor-enter v12

    .line 148
    :try_start_b
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->stateLocked()Lorg/json/JSONObject;

    if-eqz p1, :cond_13

    .line 149
    const-string p1, "priority"

    goto :goto_15

    :cond_13
    const-string p1, "background"

    :goto_15
    move-object v7, p1

    .line 150
    new-instance v4, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;

    sget-wide v5, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->generation:J

    if-nez p0, :cond_1f

    .line 153
    const-string p1, ""

    goto :goto_21

    :cond_1f
    iget-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->model:Ljava/lang/String;

    :goto_21
    move-object v8, p1

    if-nez p0, :cond_27

    .line 154
    const-string p0, ""

    goto :goto_29

    :cond_27
    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->baseUrl:Ljava/lang/String;

    :goto_29
    move-object v9, p0

    if-eqz v10, :cond_37

    .line 156
    const-string p0, "event-rebuild-"

    invoke-virtual {v10, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_37

    const-string p0, "event_rebuild_r2"

    goto :goto_39

    :cond_37
    const-string p0, "contextual_unit_v1"

    :goto_39
    move-object v11, p0

    invoke-direct/range {v4 .. v11}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;-><init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    iget-object p0, v4, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;->model:Ljava/lang/String;

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->noteModelLocked(Ljava/lang/String;)V

    .line 159
    invoke-static {v4}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->incrementLogicalRequestLocked(Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;)V

    .line 160
    sget-object p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->memoryState:Lorg/json/JSONObject;

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->metricsLocked(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object p0

    .line 161
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->sessionLocked()Lorg/json/JSONObject;

    move-result-object p1

    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->metricsLocked(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object p1

    .line 162
    const-string v5, "unit_batch_requests"

    const-wide/16 v6, 0x1

    invoke-static {p0, v5, v6, v7}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 163
    const-string v5, "unit_batch_requests"

    invoke-static {p1, v5, v6, v7}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 164
    const-string v5, "unit_target_units"

    const/4 v6, 0x0

    invoke-static {v6, p2}, Ljava/lang/Math;->max(II)I

    move-result v7

    int-to-long v7, v7

    invoke-static {p0, v5, v7, v8}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 165
    const-string v5, "unit_target_units"

    invoke-static {v6, p2}, Ljava/lang/Math;->max(II)I

    move-result v0

    int-to-long v7, v0

    invoke-static {p1, v5, v7, v8}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 166
    const-string v0, "unit_context_units"

    invoke-static {v6, v1}, Ljava/lang/Math;->max(II)I

    move-result v5

    int-to-long v7, v5

    invoke-static {p0, v0, v7, v8}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 167
    const-string v0, "unit_context_units"

    invoke-static {v6, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    int-to-long v7, v1

    invoke-static {p1, v0, v7, v8}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 168
    const-string v0, "unit_target_chars"

    invoke-static {v6, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    int-to-long v7, v1

    invoke-static {p0, v0, v7, v8}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 169
    const-string v0, "unit_target_chars"

    invoke-static {v6, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    int-to-long v1, v1

    invoke-static {p1, v0, v1, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 170
    const-string v0, "unit_context_chars"

    invoke-static {v6, v3}, Ljava/lang/Math;->max(II)I

    move-result v1

    int-to-long v1, v1

    invoke-static {p0, v0, v1, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 171
    const-string p0, "unit_context_chars"

    invoke-static {v6, v3}, Ljava/lang/Math;->max(II)I

    move-result v0

    int-to-long v0, v0

    invoke-static {p1, p0, v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 172
    monitor-exit v12

    return-object v4

    :catchall_b2
    move-exception v0

    move-object p0, v0

    .line 173
    monitor-exit v12
    :try_end_b5
    .catchall {:try_start_b .. :try_end_b5} :catchall_b2

    throw p0
.end method

.method private static bucketLocked(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;
    .registers 4

    .line 816
    const-string v0, "buckets"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    if-nez v1, :cond_f

    .line 818
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->freshBuckets()Lorg/json/JSONObject;

    move-result-object v1

    .line 819
    invoke-static {p0, v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->putQuiet(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 821
    :cond_f
    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    if-nez p0, :cond_1d

    .line 823
    new-instance p0, Lorg/json/JSONObject;

    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    .line 824
    invoke-static {v1, p1, p0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->putQuiet(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_1d
    return-object p0
.end method

.method static clear(Landroid/content/Context;)V
    .registers 6

    if-eqz p0, :cond_5

    .line 443
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->install(Landroid/content/Context;)V

    .line 444
    :cond_5
    sget-object p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->LOCK:Ljava/lang/Object;

    monitor-enter p0

    .line 445
    :try_start_8
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->freshState()Lorg/json/JSONObject;

    move-result-object v0

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->memoryState:Lorg/json/JSONObject;

    .line 446
    sget-wide v1, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->generation:J

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    sput-wide v1, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->generation:J

    .line 447
    const-string v3, "session"

    sget-object v4, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->activeVideoId:Ljava/lang/String;

    invoke-static {v4, v1, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->freshSession(Ljava/lang/String;J)Lorg/json/JSONObject;

    move-result-object v1

    invoke-static {v0, v3, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->putQuiet(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    const-wide/16 v0, -0x1

    .line 448
    sput-wide v0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->lastVideoTimeMs:J

    .line 449
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->persistLocked()V

    .line 450
    monitor-exit p0

    return-void

    :catchall_29
    move-exception v0

    monitor-exit p0
    :try_end_2b
    .catchall {:try_start_8 .. :try_end_2b} :catchall_29

    throw v0
.end method

.method private static coreBucket(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 874
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->normalizeCore(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 875
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "core_"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static format(J)Ljava/lang/String;
    .registers 5

    .line 941
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-wide/16 v1, 0x0

    invoke-static {v1, v2, p0, p1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p0

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    const/4 p1, 0x1

    new-array p1, p1, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p0, p1, v1

    const-string p0, "%,d"

    invoke-static {v0, p0, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static freshBuckets()Lorg/json/JSONObject;
    .registers 3

    .line 787
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 788
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "all"

    invoke-static {v0, v2, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->putQuiet(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 789
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "priority"

    invoke-static {v0, v2, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->putQuiet(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 790
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "background"

    invoke-static {v0, v2, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->putQuiet(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 791
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "display"

    invoke-static {v0, v2, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->putQuiet(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    return-object v0
.end method

.method private static freshSession(Ljava/lang/String;J)Lorg/json/JSONObject;
    .registers 5

    .line 774
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 775
    const-string v1, "generation"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-static {v0, v1, p1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->putQuiet(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 776
    const-string p1, ""

    if-nez p0, :cond_13

    move-object p0, p1

    :cond_13
    const-string p2, "video_id"

    invoke-static {v0, p2, p0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->putQuiet(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 777
    const-string p0, "model"

    invoke-static {v0, p0, p1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->putQuiet(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 778
    const-string p0, "active_core"

    sget-object p1, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->activeCore:Ljava/lang/String;

    invoke-static {v0, p0, p1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->putQuiet(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 779
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p0

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    const-string p1, "started_at"

    invoke-static {v0, p1, p0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->putQuiet(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    const-wide/16 p0, 0x0

    .line 780
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    const-string p1, "viewed_ms"

    invoke-static {v0, p1, p0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->putQuiet(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 781
    new-instance p0, Lorg/json/JSONObject;

    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    const-string p1, "metrics"

    invoke-static {v0, p1, p0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->putQuiet(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 782
    const-string p0, "buckets"

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->freshBuckets()Lorg/json/JSONObject;

    move-result-object p1

    invoke-static {v0, p0, p1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->putQuiet(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    return-object v0
.end method

.method private static freshState()Lorg/json/JSONObject;
    .registers 3

    .line 764
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const/4 v1, 0x1

    .line 765
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "version"

    invoke-static {v0, v2, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->putQuiet(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 766
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const-string v2, "cleared_at"

    invoke-static {v0, v2, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->putQuiet(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    const-wide/16 v1, 0x0

    .line 767
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const-string v2, "viewed_ms"

    invoke-static {v0, v2, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->putQuiet(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 768
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "metrics"

    invoke-static {v0, v2, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->putQuiet(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 769
    const-string v1, "buckets"

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->freshBuckets()Lorg/json/JSONObject;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->putQuiet(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    return-object v0
.end method

.method private static httpCode(Ljava/lang/String;)I
    .registers 4

    const/4 v0, -0x1

    if-nez p0, :cond_4

    return v0

    :cond_4
    const/16 v1, 0x5f

    .line 889
    invoke-virtual {p0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    if-ltz v1, :cond_1e

    add-int/lit8 v1, v1, 0x1

    .line 890
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-lt v1, v2, :cond_15

    goto :goto_1e

    .line 892
    :cond_15
    :try_start_15
    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0
    :try_end_1d
    .catchall {:try_start_15 .. :try_end_1d} :catchall_1e

    return p0

    :catchall_1e
    :cond_1e
    :goto_1e
    return v0
.end method

.method private static incrementLogicalRequestLocked(Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;)V
    .registers 2

    .line 708
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$$ExternalSyntheticLambda0;-><init>()V

    invoke-static {p0, v0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->updateBucketsLocked(Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$BucketMutation;)V

    return-void
.end method

.method static install(Landroid/content/Context;)V
    .registers 2

    if-nez p0, :cond_3

    return-void

    .line 37
    :cond_3
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 38
    :try_start_6
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    sput-object p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->appContext:Landroid/content/Context;

    .line 39
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->stateLocked()Lorg/json/JSONObject;

    .line 40
    monitor-exit v0

    return-void

    :catchall_11
    move-exception p0

    monitor-exit v0
    :try_end_13
    .catchall {:try_start_6 .. :try_end_13} :catchall_11

    throw p0
.end method

.method private static isAlibabaBase(Ljava/lang/String;)Z
    .registers 3

    const/4 v0, 0x0

    if-nez p0, :cond_4

    return v0

    .line 864
    :cond_4
    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    .line 865
    const-string v1, "dashscope.aliyuncs.com"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1c

    const-string v1, "maas.aliyuncs.com"

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_1b

    goto :goto_1c

    :cond_1b
    return v0

    :cond_1c
    :goto_1c
    const/4 p0, 0x1

    return p0
.end method

.method private static isHttp4xx(Ljava/lang/String;)Z
    .registers 2

    .line 883
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->httpCode(Ljava/lang/String;)I

    move-result p0

    const/16 v0, 0x190

    if-lt p0, v0, :cond_12

    const/16 v0, 0x1f3

    if-gt p0, v0, :cond_12

    const/16 v0, 0x1ad

    if-eq p0, v0, :cond_12

    const/4 p0, 0x1

    return p0

    :cond_12
    const/4 p0, 0x0

    return p0
.end method

.method private static isHttp5xx(Ljava/lang/String;)Z
    .registers 2

    .line 878
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->httpCode(Ljava/lang/String;)I

    move-result p0

    const/16 v0, 0x1f4

    if-lt p0, v0, :cond_e

    const/16 v0, 0x257

    if-gt p0, v0, :cond_e

    const/4 p0, 0x1

    return p0

    :cond_e
    const/4 p0, 0x0

    return p0
.end method

.method static synthetic lambda$beginAttempt$3(IILorg/json/JSONObject;)V
    .registers 8

    .line 329
    const-string v0, "attempts"

    const-wide/16 v1, 0x1

    invoke-static {p2, v0, v1, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    const/4 v0, 0x0

    .line 330
    invoke-static {v0, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    int-to-long v3, p0

    const-string p0, "request_bytes"

    invoke-static {p2, p0, v3, v4}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    const/4 p0, 0x1

    if-le p1, p0, :cond_1a

    .line 331
    const-string p0, "internal_retries"

    invoke-static {p2, p0, v1, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    :cond_1a
    return-void
.end method

.method static synthetic lambda$incrementLogicalRequestLocked$8(Lorg/json/JSONObject;)V
    .registers 4

    .line 708
    const-string v0, "logical_requests"

    const-wide/16 v1, 0x1

    invoke-static {p0, v0, v1, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    return-void
.end method

.method static synthetic lambda$recordFailure$7(Ljava/lang/String;Lorg/json/JSONObject;)V
    .registers 5

    .line 421
    const-string v0, "failures"

    const-wide/16 v1, 0x1

    invoke-static {p1, v0, v1, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 422
    const-string v0, "http"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_40

    .line 423
    const-string v0, "http_failures"

    invoke-static {p1, v0, v1, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 424
    const-string v0, "429"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_22

    const-string p0, "http_429_failures"

    invoke-static {p1, p0, v1, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    return-void

    .line 425
    :cond_22
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->isHttp5xx(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2e

    const-string p0, "http_5xx_failures"

    invoke-static {p1, p0, v1, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    return-void

    .line 426
    :cond_2e
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->isHttp4xx(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_3a

    const-string p0, "http_4xx_failures"

    invoke-static {p1, p0, v1, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    return-void

    .line 427
    :cond_3a
    const-string p0, "http_other_failures"

    invoke-static {p1, p0, v1, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    return-void

    .line 428
    :cond_40
    const-string v0, "timeout"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_4e

    .line 429
    const-string p0, "timeout_failures"

    invoke-static {p1, p0, v1, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    return-void

    .line 430
    :cond_4e
    const-string v0, "network"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_5c

    .line 431
    const-string p0, "network_failures"

    invoke-static {p1, p0, v1, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    return-void

    .line 432
    :cond_5c
    const-string v0, "cancel"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_73

    const-string v0, "interrupt"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_6d

    goto :goto_73

    .line 435
    :cond_6d
    const-string p0, "other_failures"

    invoke-static {p1, p0, v1, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    return-void

    .line 433
    :cond_73
    :goto_73
    const-string p0, "cancelled_failures"

    invoke-static {p1, p0, v1, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    return-void
.end method

.method static synthetic lambda$recordResponse$4(Lorg/json/JSONObject;JJJJJZJLorg/json/JSONObject;)V
    .registers 21

    move-wide/from16 v0, p12

    move-object/from16 v2, p14

    .line 372
    const-string v3, "http_ok"

    const-wide/16 v4, 0x1

    invoke-static {v2, v3, v4, v5}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    if-nez p0, :cond_13

    .line 374
    const-string p0, "responses_without_usage"

    invoke-static {v2, p0, v4, v5}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    return-void

    .line 377
    :cond_13
    const-string p0, "usage_responses"

    invoke-static {v2, p0, v4, v5}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 378
    const-string p0, "prompt_tokens"

    invoke-static {v2, p0, p1, p2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 379
    const-string p0, "completion_tokens"

    invoke-static {v2, p0, p3, p4}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 380
    const-string p0, "total_tokens"

    invoke-static {v2, p0, p5, p6}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 381
    const-string p0, "cache_hit_tokens"

    invoke-static {v2, p0, p7, p8}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 382
    const-string p0, "cache_miss_tokens"

    move-wide p1, p9

    invoke-static {v2, p0, p1, p2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    if-eqz p11, :cond_39

    .line 383
    const-string p0, "cache_known_responses"

    invoke-static {v2, p0, v4, v5}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    :cond_39
    const-wide/16 p0, 0x0

    cmp-long p0, v0, p0

    if-ltz p0, :cond_49

    .line 385
    const-string p0, "priced_responses"

    invoke-static {v2, p0, v4, v5}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 386
    const-string p0, "cost_nano_cny"

    invoke-static {v2, p0, v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    :cond_49
    return-void
.end method

.method static synthetic lambda$recordSemanticDeferred$6(Lorg/json/JSONObject;)V
    .registers 4

    .line 410
    const-string v0, "local_deferrals"

    const-wide/16 v1, 0x1

    invoke-static {p0, v0, v1, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    return-void
.end method

.method static synthetic lambda$recordSemanticOutcome$5(IZLorg/json/JSONObject;)V
    .registers 8

    .line 398
    const-string v0, "semantic_results"

    const-wide/16 v1, 0x1

    invoke-static {p2, v0, v1, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    const/4 v0, 0x0

    .line 399
    invoke-static {v0, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    int-to-long v3, p0

    const-string p0, "semantic_units"

    invoke-static {p2, p0, v3, v4}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    if-nez p1, :cond_19

    .line 400
    const-string p0, "focus_miss_results"

    invoke-static {p2, p0, v1, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    :cond_19
    return-void
.end method

.method static synthetic lambda$recordSunkPrompt$2(JLorg/json/JSONObject;)V
    .registers 6

    .line 250
    const-string v0, "sunk_prompts"

    const-wide/16 v1, 0x1

    invoke-static {p2, v0, v1, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 251
    const-string v0, "sunk_prompt_bytes"

    invoke-static {p2, v0, p0, p1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    return-void
.end method

.method static synthetic lambda$recordUnitBatchOutcome$0(ILorg/json/JSONObject;)V
    .registers 5

    .line 201
    const-string v0, "unit_batch_results"

    const-wide/16 v1, 0x1

    invoke-static {p1, v0, v1, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    const/4 v0, 0x0

    .line 202
    invoke-static {v0, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    int-to-long v0, p0

    const-string p0, "unit_translations"

    invoke-static {p1, p0, v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    return-void
.end method

.method static synthetic lambda$recordUnitQualityOutcome$1(IIILorg/json/JSONObject;)V
    .registers 7

    const/4 v0, 0x0

    .line 210
    invoke-static {v0, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    int-to-long v1, p0

    const-string p0, "accepted_caption_units"

    invoke-static {p3, p0, v1, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 211
    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result p0

    int-to-long p0, p0

    const-string v1, "rejected_caption_units"

    invoke-static {p3, v1, p0, p1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 212
    invoke-static {v0, p2}, Ljava/lang/Math;->max(II)I

    move-result p0

    int-to-long p0, p0

    const-string p2, "quality_rejected_units"

    invoke-static {p3, p2, p0, p1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    return-void
.end method

.method private static metricsLocked(Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .registers 3

    .line 807
    const-string v0, "metrics"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    if-nez v1, :cond_10

    .line 809
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 810
    invoke-static {p0, v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->putQuiet(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_10
    return-object v1
.end method

.method private static money(D)Ljava/lang/String;
    .registers 7

    const-wide v0, 0x3f847ae147ae147bL    # 0.01

    cmpg-double v0, p0, v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-gez v0, :cond_1c

    .line 950
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    new-array p1, v2, [Ljava/lang/Object;

    aput-object p0, p1, v1

    const-string p0, "%.5f"

    invoke-static {v0, p0, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1c
    const-wide/high16 v3, 0x3ff0000000000000L    # 1.0

    cmpg-double v0, p0, v3

    if-gez v0, :cond_33

    .line 951
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    new-array p1, v2, [Ljava/lang/Object;

    aput-object p0, p1, v1

    const-string p0, "%.4f"

    invoke-static {v0, p0, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 952
    :cond_33
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    new-array p1, v2, [Ljava/lang/Object;

    aput-object p0, p1, v1

    const-string p0, "%.3f"

    invoke-static {v0, p0, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static nonNegative(J)J
    .registers 4

    const-wide/16 v0, 0x0

    .line 937
    invoke-static {v0, v1, p0, p1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p0

    return-wide p0
.end method

.method private static normalizeCore(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    if-nez p0, :cond_5

    .line 869
    const-string p0, ""

    goto :goto_f

    :cond_5
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    .line 870
    :goto_f
    const-string v0, "event_rebuild_r2"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_22

    const-string v0, "contextual_unit_v1"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_20

    goto :goto_22

    :cond_20
    const-string p0, "semantic_ledger_v2"

    :cond_22
    :goto_22
    return-object p0
.end method

.method private static noteModelLocked(Ljava/lang/String;)V
    .registers 3

    if-eqz p0, :cond_1a

    .line 830
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_d

    goto :goto_1a

    .line 831
    :cond_d
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->sessionLocked()Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "model"

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, v1, p0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->putQuiet(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_1a
    :goto_1a
    return-void
.end method

.method static onCoreSelected(Landroid/content/Context;Ljava/lang/String;)V
    .registers 5

    if-eqz p0, :cond_5

    .line 44
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->install(Landroid/content/Context;)V

    .line 45
    :cond_5
    const-string p0, "event_rebuild_r2"

    .line 46
    sget-object p1, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->LOCK:Ljava/lang/Object;

    monitor-enter p1

    .line 47
    :try_start_a
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->stateLocked()Lorg/json/JSONObject;

    .line 48
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->activeCore:Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 49
    sput-object p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->activeCore:Ljava/lang/String;

    .line 50
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->sessionLocked()Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "active_core"

    invoke-static {v1, v2, p0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->putQuiet(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    if-nez v0, :cond_24

    const-wide/16 v0, -0x1

    .line 51
    sput-wide v0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->lastVideoTimeMs:J

    .line 52
    :cond_24
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->persistLocked()V

    .line 53
    monitor-exit p1

    return-void

    :catchall_29
    move-exception p0

    monitor-exit p1
    :try_end_2b
    .catchall {:try_start_a .. :try_end_2b} :catchall_29

    throw p0
.end method

.method static onVideoId(Landroid/content/Context;Ljava/lang/String;)V
    .registers 6

    if-eqz p0, :cond_5

    .line 56
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->install(Landroid/content/Context;)V

    :cond_5
    if-nez p1, :cond_a

    .line 57
    const-string p0, ""

    goto :goto_e

    :cond_a
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 58
    :goto_e
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_15

    return-void

    .line 59
    :cond_15
    sget-object p1, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->LOCK:Ljava/lang/Object;

    monitor-enter p1

    .line 60
    :try_start_18
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->stateLocked()Lorg/json/JSONObject;

    .line 61
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->activeVideoId:Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_25

    monitor-exit p1

    return-void

    .line 62
    :cond_25
    sput-object p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->activeVideoId:Ljava/lang/String;

    .line 63
    sget-wide v0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->generation:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    sput-wide v0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->generation:J

    .line 64
    sget-object v2, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->memoryState:Lorg/json/JSONObject;

    const-string v3, "session"

    invoke-static {p0, v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->freshSession(Ljava/lang/String;J)Lorg/json/JSONObject;

    move-result-object p0

    invoke-static {v2, v3, p0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->putQuiet(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    const-wide/16 v0, -0x1

    .line 65
    sput-wide v0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->lastVideoTimeMs:J

    .line 66
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    sput-wide v0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->lastWatchPersistRealtimeMs:J

    .line 67
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->persistLocked()V

    .line 68
    monitor-exit p1

    return-void

    :catchall_48
    move-exception p0

    monitor-exit p1
    :try_end_4a
    .catchall {:try_start_18 .. :try_end_4a} :catchall_48

    throw p0
.end method

.method static onVideoTime(Landroid/content/Context;JZ)V
    .registers 11

    const-string v0, "viewed_ms_"

    if-eqz p0, :cond_7

    .line 72
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->install(Landroid/content/Context;)V

    .line 73
    :cond_7
    sget-object p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->LOCK:Ljava/lang/Object;

    monitor-enter p0

    .line 74
    :try_start_a
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->stateLocked()Lorg/json/JSONObject;

    if-nez p3, :cond_15

    const-wide/16 p1, -0x1

    .line 76
    sput-wide p1, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->lastVideoTimeMs:J

    .line 77
    monitor-exit p0

    return-void

    :cond_15
    const-wide/16 v1, 0x0

    .line 79
    invoke-static {v1, v2, p1, p2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p1

    .line 80
    sget-wide v3, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->lastVideoTimeMs:J

    cmp-long p3, v3, v1

    const-wide/16 v5, 0x1388

    if-ltz p3, :cond_5b

    sub-long v3, p1, v3

    cmp-long p3, v3, v1

    if-lez p3, :cond_5b

    cmp-long p3, v3, v5

    if-gtz p3, :cond_5b

    .line 83
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->sessionLocked()Lorg/json/JSONObject;

    move-result-object p3

    .line 84
    const-string v1, "viewed_ms"

    invoke-static {p3, v1, v3, v4}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 85
    sget-object v1, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->memoryState:Lorg/json/JSONObject;

    const-string v2, "viewed_ms"

    invoke-static {v1, v2, v3, v4}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 86
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->activeCore:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 87
    invoke-static {p3}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->metricsLocked(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object p3

    invoke-static {p3, v0, v3, v4}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 88
    sget-object p3, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->memoryState:Lorg/json/JSONObject;

    invoke-static {p3}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->metricsLocked(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object p3

    invoke-static {p3, v0, v3, v4}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 91
    :cond_5b
    sput-wide p1, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->lastVideoTimeMs:J

    .line 92
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide p1

    .line 93
    sget-wide v0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->lastWatchPersistRealtimeMs:J

    sub-long v0, p1, v0

    cmp-long p3, v0, v5

    if-ltz p3, :cond_6e

    .line 94
    sput-wide p1, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->lastWatchPersistRealtimeMs:J

    .line 95
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->persistLocked()V

    .line 97
    :cond_6e
    monitor-exit p0

    return-void

    :catchall_70
    move-exception p1

    monitor-exit p0
    :try_end_72
    .catchall {:try_start_a .. :try_end_72} :catchall_70

    throw p1
.end method

.method private static oneDecimal(D)Ljava/lang/String;
    .registers 4

    .line 956
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    const/4 p1, 0x1

    new-array p1, p1, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p0, p1, v1

    const-string p0, "%.1f"

    invoke-static {v0, p0, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static percent(JJ)Ljava/lang/String;
    .registers 7

    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-gtz v0, :cond_9

    .line 945
    const-string p0, "0.0%"

    return-object p0

    .line 946
    :cond_9
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    long-to-double p0, p0

    const-wide/high16 v1, 0x4059000000000000L    # 100.0

    mul-double/2addr p0, v1

    long-to-double p2, p2

    div-double/2addr p0, p2

    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    const/4 p1, 0x1

    new-array p1, p1, [Ljava/lang/Object;

    const/4 p2, 0x0

    aput-object p0, p1, p2

    const-string p0, "%.1f%%"

    invoke-static {v0, p0, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static persistLocked()V
    .registers 3

    .line 905
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->appContext:Landroid/content/Context;

    if-eqz v0, :cond_23

    .line 906
    sget-object v1, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->memoryState:Lorg/json/JSONObject;

    if-nez v1, :cond_9

    goto :goto_23

    .line 908
    :cond_9
    :try_start_9
    const-string v1, "deepseek_caption_token_cost_audit"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 909
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "state_v1"

    sget-object v2, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->memoryState:Lorg/json/JSONObject;

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_23
    .catchall {:try_start_9 .. :try_end_23} :catchall_23

    :catchall_23
    :cond_23
    :goto_23
    return-void
.end method

.method private static priceNanoCny(Ljava/lang/String;Ljava/lang/String;JJJZ)J
    .registers 12

    .line 842
    const-string v0, ""

    if-nez p0, :cond_6

    move-object p0, v0

    goto :goto_c

    :cond_6
    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    :goto_c
    if-nez p1, :cond_f

    goto :goto_15

    .line 843
    :cond_f
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p1, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 844
    :goto_15
    const-string p1, "deepseek-v4-flash"

    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    const-wide/16 v1, -0x1

    if-eqz p0, :cond_48

    if-nez p8, :cond_22

    goto :goto_48

    .line 847
    :cond_22
    const-string p0, "api.deepseek.com"

    invoke-virtual {v0, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_2d

    const-wide/16 p0, 0x14

    goto :goto_35

    .line 850
    :cond_2d
    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->isAlibabaBase(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_48

    const-wide/16 p0, 0xc8

    .line 857
    :goto_35
    invoke-static {p2, p3, p0, p1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->safeMultiply(JJ)J

    move-result-wide p0

    const-wide/16 p2, 0x3e8

    .line 858
    invoke-static {p4, p5, p2, p3}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->safeMultiply(JJ)J

    move-result-wide p2

    add-long/2addr p0, p2

    const-wide/16 p2, 0x7d0

    .line 859
    invoke-static {p6, p7, p2, p3}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->safeMultiply(JJ)J

    move-result-wide p2

    add-long/2addr p0, p2

    return-wide p0

    :cond_48
    :goto_48
    return-wide v1
.end method

.method private static putQuiet(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 3

    if-eqz p0, :cond_8

    if-nez p1, :cond_5

    goto :goto_8

    .line 927
    :cond_5
    :try_start_5
    invoke-virtual {p0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_8
    .catchall {:try_start_5 .. :try_end_8} :catchall_8

    :catchall_8
    :cond_8
    :goto_8
    return-void
.end method

.method static recordAltFramingArmed()V
    .registers 5

    .line 258
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 259
    :try_start_3
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->stateLocked()Lorg/json/JSONObject;

    .line 260
    sget-object v1, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->memoryState:Lorg/json/JSONObject;

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->metricsLocked(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "background_alt_armed"

    const-wide/16 v3, 0x1

    invoke-static {v1, v2, v3, v4}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 261
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->sessionLocked()Lorg/json/JSONObject;

    move-result-object v1

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->metricsLocked(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "background_alt_armed"

    invoke-static {v1, v2, v3, v4}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 262
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->persistLocked()V

    .line 263
    monitor-exit v0

    return-void

    :catchall_25
    move-exception v1

    monitor-exit v0
    :try_end_27
    .catchall {:try_start_3 .. :try_end_27} :catchall_25

    throw v1
.end method

.method static recordBlocksCompleted(Ljava/lang/String;J)V
    .registers 6

    if-eqz p0, :cond_35

    .line 231
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_35

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gtz v0, :cond_f

    goto :goto_35

    .line 232
    :cond_f
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 233
    :try_start_12
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->stateLocked()Lorg/json/JSONObject;

    .line 234
    sget-object v1, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->memoryState:Lorg/json/JSONObject;

    invoke-static {v1, p0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->bucketLocked(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "blocks_completed"

    invoke-static {v1, v2, p1, p2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 235
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->sessionLocked()Lorg/json/JSONObject;

    move-result-object v1

    invoke-static {v1, p0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->bucketLocked(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    const-string v1, "blocks_completed"

    invoke-static {p0, v1, p1, p2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 236
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->persistLocked()V

    .line 237
    monitor-exit v0

    return-void

    :catchall_32
    move-exception p0

    monitor-exit v0
    :try_end_34
    .catchall {:try_start_12 .. :try_end_34} :catchall_32

    throw p0

    :cond_35
    :goto_35
    return-void
.end method

.method static recordCommittedAtoms(Ljava/lang/String;J)V
    .registers 6

    if-eqz p0, :cond_35

    .line 216
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_35

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gtz v0, :cond_f

    goto :goto_35

    .line 217
    :cond_f
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 218
    :try_start_12
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->stateLocked()Lorg/json/JSONObject;

    .line 219
    sget-object v1, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->memoryState:Lorg/json/JSONObject;

    invoke-static {v1, p0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->bucketLocked(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "committed_atoms"

    invoke-static {v1, v2, p1, p2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 220
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->sessionLocked()Lorg/json/JSONObject;

    move-result-object v1

    invoke-static {v1, p0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->bucketLocked(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    const-string v1, "committed_atoms"

    invoke-static {p0, v1, p1, p2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 221
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->persistLocked()V

    .line 222
    monitor-exit v0

    return-void

    :catchall_32
    move-exception p0

    monitor-exit v0
    :try_end_34
    .catchall {:try_start_12 .. :try_end_34} :catchall_32

    throw p0

    :cond_35
    :goto_35
    return-void
.end method

.method static recordDisplayLocalOutcome(Z)V
    .registers 5

    .line 276
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 277
    :try_start_3
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->stateLocked()Lorg/json/JSONObject;

    if-eqz p0, :cond_b

    .line 278
    const-string p0, "display_local_success"

    goto :goto_d

    :cond_b
    const-string p0, "display_local_inconclusive"

    .line 279
    :goto_d
    sget-object v1, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->memoryState:Lorg/json/JSONObject;

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->metricsLocked(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v1

    const-wide/16 v2, 0x1

    invoke-static {v1, p0, v2, v3}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 280
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->sessionLocked()Lorg/json/JSONObject;

    move-result-object v1

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->metricsLocked(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-static {v1, p0, v2, v3}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 281
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->persistLocked()V

    .line 282
    monitor-exit v0

    return-void

    :catchall_28
    move-exception p0

    monitor-exit v0
    :try_end_2a
    .catchall {:try_start_3 .. :try_end_2a} :catchall_28

    throw p0
.end method

.method static recordDisplayLocalWholeSentence()V
    .registers 5

    .line 286
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 287
    :try_start_3
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->stateLocked()Lorg/json/JSONObject;

    .line 288
    sget-object v1, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->memoryState:Lorg/json/JSONObject;

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->metricsLocked(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "display_local_whole_sentence"

    const-wide/16 v3, 0x1

    invoke-static {v1, v2, v3, v4}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 289
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->sessionLocked()Lorg/json/JSONObject;

    move-result-object v1

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->metricsLocked(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "display_local_whole_sentence"

    invoke-static {v1, v2, v3, v4}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 290
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->persistLocked()V

    .line 291
    monitor-exit v0

    return-void

    :catchall_25
    move-exception v1

    monitor-exit v0
    :try_end_27
    .catchall {:try_start_3 .. :try_end_27} :catchall_25

    throw v1
.end method

.method static recordFailure(Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;ILjava/lang/String;)V
    .registers 4

    if-eqz p0, :cond_26

    if-gtz p1, :cond_5

    goto :goto_26

    .line 417
    :cond_5
    sget-object p1, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->LOCK:Ljava/lang/Object;

    monitor-enter p1

    .line 418
    :try_start_8
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->stateLocked()Lorg/json/JSONObject;

    if-nez p2, :cond_10

    .line 419
    const-string p2, "unknown"

    goto :goto_16

    :cond_10
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p2, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p2

    .line 420
    :goto_16
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$$ExternalSyntheticLambda8;

    invoke-direct {v0, p2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$$ExternalSyntheticLambda8;-><init>(Ljava/lang/String;)V

    invoke-static {p0, v0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->updateBucketsLocked(Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$BucketMutation;)V

    .line 438
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->persistLocked()V

    .line 439
    monitor-exit p1

    return-void

    :catchall_23
    move-exception p0

    monitor-exit p1
    :try_end_25
    .catchall {:try_start_8 .. :try_end_25} :catchall_23

    throw p0

    :cond_26
    :goto_26
    return-void
.end method

.method static recordPageFallback()V
    .registers 5

    .line 267
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 268
    :try_start_3
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->stateLocked()Lorg/json/JSONObject;

    .line 269
    sget-object v1, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->memoryState:Lorg/json/JSONObject;

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->metricsLocked(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "background_page_fallback_events"

    const-wide/16 v3, 0x1

    invoke-static {v1, v2, v3, v4}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 270
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->sessionLocked()Lorg/json/JSONObject;

    move-result-object v1

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->metricsLocked(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "background_page_fallback_events"

    invoke-static {v1, v2, v3, v4}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 271
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->persistLocked()V

    .line 272
    monitor-exit v0

    return-void

    :catchall_25
    move-exception v1

    monitor-exit v0
    :try_end_27
    .catchall {:try_start_3 .. :try_end_27} :catchall_25

    throw v1
.end method

.method static recordResponse(Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;ILorg/json/JSONObject;)V
    .registers 24

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    if-eqz v0, :cond_eb

    if-gtz p1, :cond_a

    goto/16 :goto_eb

    .line 339
    :cond_a
    sget-object v2, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->LOCK:Ljava/lang/Object;

    monitor-enter v2

    .line 340
    :try_start_d
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->stateLocked()Lorg/json/JSONObject;

    const/4 v3, 0x0

    if-nez v1, :cond_15

    move-object v5, v3

    goto :goto_1c

    .line 341
    :cond_15
    const-string v4, "usage"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    move-object v5, v1

    :goto_1c
    const-wide/16 v6, 0x0

    if-nez v5, :cond_22

    move-wide v8, v6

    goto :goto_2c

    .line 342
    :cond_22
    const-string v1, "prompt_tokens"

    invoke-virtual {v5, v1, v6, v7}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v8

    invoke-static {v8, v9}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->nonNegative(J)J

    move-result-wide v8

    :goto_2c
    if-nez v5, :cond_31

    move-wide/from16 v18, v6

    goto :goto_3d

    .line 343
    :cond_31
    const-string v1, "completion_tokens"

    invoke-virtual {v5, v1, v6, v7}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v10

    invoke-static {v10, v11}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->nonNegative(J)J

    move-result-wide v10

    move-wide/from16 v18, v10

    :goto_3d
    if-nez v5, :cond_42

    add-long v10, v8, v18

    goto :goto_4e

    .line 345
    :cond_42
    const-string v1, "total_tokens"

    add-long v10, v8, v18

    invoke-virtual {v5, v1, v10, v11}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v10

    invoke-static {v10, v11}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->nonNegative(J)J

    move-result-wide v10

    :goto_4e
    const/4 v1, 0x1

    const/4 v4, 0x0

    if-eqz v5, :cond_64

    .line 347
    const-string v12, "prompt_cache_hit_tokens"

    .line 348
    invoke-virtual {v5, v12}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_62

    const-string v12, "prompt_cache_miss_tokens"

    invoke-virtual {v5, v12}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_64

    :cond_62
    move v12, v1

    goto :goto_65

    :cond_64
    move v12, v4

    :goto_65
    if-nez v5, :cond_68

    goto :goto_6e

    .line 349
    :cond_68
    const-string v3, "prompt_tokens_details"

    invoke-virtual {v5, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    :goto_6e
    if-eqz v3, :cond_7a

    .line 350
    const-string v13, "cached_tokens"

    invoke-virtual {v3, v13}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_7a

    move v13, v1

    goto :goto_7b

    :cond_7a
    move v13, v4

    :goto_7b
    if-nez v12, :cond_83

    if-eqz v13, :cond_80

    goto :goto_83

    :cond_80
    move/from16 v16, v4

    goto :goto_85

    :cond_83
    :goto_83
    move/from16 v16, v1

    :goto_85
    if-eqz v12, :cond_ab

    .line 356
    const-string v1, "prompt_cache_hit_tokens"

    invoke-virtual {v5, v1, v6, v7}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v3

    invoke-static {v3, v4}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->nonNegative(J)J

    move-result-wide v3

    .line 357
    const-string v1, "prompt_cache_miss_tokens"

    invoke-virtual {v5, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_a4

    .line 358
    const-string v1, "prompt_cache_miss_tokens"

    invoke-virtual {v5, v1, v6, v7}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v6

    invoke-static {v6, v7}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->nonNegative(J)J

    move-result-wide v6

    goto :goto_c1

    :cond_a4
    sub-long v12, v8, v3

    .line 360
    invoke-static {v6, v7, v12, v13}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v6

    goto :goto_c1

    :cond_ab
    if-eqz v13, :cond_c3

    .line 363
    const-string v1, "cached_tokens"

    invoke-virtual {v3, v1, v6, v7}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v3

    invoke-static {v3, v4}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->nonNegative(J)J

    move-result-wide v3

    .line 364
    invoke-static {v3, v4, v8, v9}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v3

    sub-long v12, v8, v3

    .line 365
    invoke-static {v6, v7, v12, v13}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v6

    :goto_c1
    move-wide v14, v3

    goto :goto_c4

    :cond_c3
    move-wide v14, v6

    .line 369
    :goto_c4
    iget-object v12, v0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;->model:Ljava/lang/String;

    iget-object v13, v0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;->baseUrl:Ljava/lang/String;

    move/from16 v20, v16

    move-wide/from16 v16, v6

    invoke-static/range {v12 .. v20}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->priceNanoCny(Ljava/lang/String;Ljava/lang/String;JJJZ)J

    move-result-wide v3

    move-wide/from16 v6, v16

    move/from16 v16, v20

    move-wide v12, v14

    move-wide v14, v6

    move-wide v6, v8

    move-wide/from16 v8, v18

    move-wide/from16 v17, v3

    .line 371
    new-instance v4, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$$ExternalSyntheticLambda7;

    invoke-direct/range {v4 .. v18}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$$ExternalSyntheticLambda7;-><init>(Lorg/json/JSONObject;JJJJJZJ)V

    invoke-static {v0, v4}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->updateBucketsLocked(Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$BucketMutation;)V

    .line 389
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->persistLocked()V

    .line 390
    monitor-exit v2

    return-void

    :catchall_e8
    move-exception v0

    monitor-exit v2
    :try_end_ea
    .catchall {:try_start_d .. :try_end_ea} :catchall_e8

    throw v0

    :cond_eb
    :goto_eb
    return-void
.end method

.method static recordSemanticDeferred(Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;)V
    .registers 3

    if-nez p0, :cond_3

    return-void

    .line 408
    :cond_3
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 409
    :try_start_6
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->stateLocked()Lorg/json/JSONObject;

    .line 410
    new-instance v1, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$$ExternalSyntheticLambda1;

    invoke-direct {v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$$ExternalSyntheticLambda1;-><init>()V

    invoke-static {p0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->updateBucketsLocked(Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$BucketMutation;)V

    .line 411
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->persistLocked()V

    .line 412
    monitor-exit v0

    return-void

    :catchall_16
    move-exception p0

    monitor-exit v0
    :try_end_18
    .catchall {:try_start_6 .. :try_end_18} :catchall_16

    throw p0
.end method

.method static recordSemanticOutcome(Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;IZ)V
    .registers 5

    if-nez p0, :cond_3

    return-void

    .line 395
    :cond_3
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 396
    :try_start_6
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->stateLocked()Lorg/json/JSONObject;

    .line 397
    new-instance v1, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$$ExternalSyntheticLambda4;

    invoke-direct {v1, p1, p2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$$ExternalSyntheticLambda4;-><init>(IZ)V

    invoke-static {p0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->updateBucketsLocked(Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$BucketMutation;)V

    .line 402
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->persistLocked()V

    .line 403
    monitor-exit v0

    return-void

    :catchall_16
    move-exception p0

    monitor-exit v0
    :try_end_18
    .catchall {:try_start_6 .. :try_end_18} :catchall_16

    throw p0
.end method

.method static recordSunkPrompt(Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;J)V
    .registers 5

    if-eqz p0, :cond_1f

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gtz v0, :cond_9

    goto :goto_1f

    .line 247
    :cond_9
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 248
    :try_start_c
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->stateLocked()Lorg/json/JSONObject;

    .line 249
    new-instance v1, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$$ExternalSyntheticLambda2;

    invoke-direct {v1, p1, p2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$$ExternalSyntheticLambda2;-><init>(J)V

    invoke-static {p0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->updateBucketsLocked(Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$BucketMutation;)V

    .line 253
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->persistLocked()V

    .line 254
    monitor-exit v0

    return-void

    :catchall_1c
    move-exception p0

    monitor-exit v0
    :try_end_1e
    .catchall {:try_start_c .. :try_end_1e} :catchall_1c

    throw p0

    :cond_1f
    :goto_1f
    return-void
.end method

.method static recordUnitBatchOutcome(Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;I)V
    .registers 4

    if-nez p0, :cond_3

    return-void

    .line 198
    :cond_3
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 199
    :try_start_6
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->stateLocked()Lorg/json/JSONObject;

    .line 200
    new-instance v1, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$$ExternalSyntheticLambda6;

    invoke-direct {v1, p1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$$ExternalSyntheticLambda6;-><init>(I)V

    invoke-static {p0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->updateBucketsLocked(Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$BucketMutation;)V

    .line 204
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->persistLocked()V

    .line 205
    monitor-exit v0

    return-void

    :catchall_16
    move-exception p0

    monitor-exit v0
    :try_end_18
    .catchall {:try_start_6 .. :try_end_18} :catchall_16

    throw p0
.end method

.method static recordUnitCacheOutcome(IIZ)V
    .registers 11

    .line 177
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 178
    :try_start_3
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->stateLocked()Lorg/json/JSONObject;

    const/4 v1, 0x0

    .line 179
    invoke-static {v1, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    .line 180
    invoke-static {p0, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 181
    sget-object v1, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->memoryState:Lorg/json/JSONObject;

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->metricsLocked(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v1

    .line 182
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->sessionLocked()Lorg/json/JSONObject;

    move-result-object v2

    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->metricsLocked(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v2

    .line 183
    const-string v3, "unit_cache_lookups"

    const-wide/16 v4, 0x1

    invoke-static {v1, v3, v4, v5}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 184
    const-string v3, "unit_cache_lookups"

    invoke-static {v2, v3, v4, v5}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 185
    const-string v3, "unit_cache_hit_units"

    int-to-long v6, p1

    invoke-static {v1, v3, v6, v7}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 186
    const-string v3, "unit_cache_hit_units"

    invoke-static {v2, v3, v6, v7}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 187
    const-string v3, "unit_cache_miss_units"

    sub-int/2addr p0, p1

    int-to-long p0, p0

    invoke-static {v1, v3, p0, p1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 188
    const-string v3, "unit_cache_miss_units"

    invoke-static {v2, v3, p0, p1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    if-eqz p2, :cond_50

    .line 190
    const-string p0, "unit_cache_current_hits"

    invoke-static {v1, p0, v4, v5}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 191
    const-string p0, "unit_cache_current_hits"

    invoke-static {v2, p0, v4, v5}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->add(Lorg/json/JSONObject;Ljava/lang/String;J)V

    .line 193
    :cond_50
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->persistLocked()V

    .line 194
    monitor-exit v0

    return-void

    :catchall_55
    move-exception p0

    monitor-exit v0
    :try_end_57
    .catchall {:try_start_3 .. :try_end_57} :catchall_55

    throw p0
.end method

.method static recordUnitQualityOutcome(Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;III)V
    .registers 6

    if-nez p0, :cond_3

    return-void

    .line 209
    :cond_3
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    :try_start_6
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->stateLocked()Lorg/json/JSONObject;

    new-instance v1, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$$ExternalSyntheticLambda3;

    invoke-direct {v1, p1, p2, p3}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$$ExternalSyntheticLambda3;-><init>(III)V

    invoke-static {p0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->updateBucketsLocked(Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$BucketMutation;)V

    .line 213
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->persistLocked()V

    monitor-exit v0

    return-void

    :catchall_16
    move-exception p0

    monitor-exit v0
    :try_end_18
    .catchall {:try_start_6 .. :try_end_18} :catchall_16

    throw p0
.end method

.method private static safeMultiply(JJ)J
    .registers 8

    const-wide/16 v0, 0x0

    cmp-long v2, p0, v0

    if-lez v2, :cond_19

    cmp-long v2, p2, v0

    if-gtz v2, :cond_b

    goto :goto_19

    :cond_b
    const-wide v0, 0x7fffffffffffffffL

    .line 900
    div-long v2, v0, p2

    cmp-long v2, p0, v2

    if-lez v2, :cond_17

    return-wide v0

    :cond_17
    mul-long/2addr p0, p2

    return-wide p0

    :cond_19
    :goto_19
    return-wide v0
.end method

.method private static seconds1(D)Ljava/lang/String;
    .registers 5

    const-wide/high16 v0, 0x4024000000000000L    # 10.0

    cmpg-double v0, p0, v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-gez v0, :cond_19

    .line 960
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    new-array p1, v2, [Ljava/lang/Object;

    aput-object p0, p1, v1

    const-string p0, "%.1f"

    invoke-static {v0, p0, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 961
    :cond_19
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    new-array p1, v2, [Ljava/lang/Object;

    aput-object p0, p1, v1

    const-string p0, "%.0f"

    invoke-static {v0, p0, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static sessionLocked()Lorg/json/JSONObject;
    .registers 6

    .line 796
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->stateLocked()Lorg/json/JSONObject;

    move-result-object v0

    .line 797
    const-string v1, "session"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    if-nez v2, :cond_1c

    .line 799
    sget-wide v2, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->generation:J

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    sput-wide v2, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->generation:J

    .line 800
    sget-object v4, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->activeVideoId:Ljava/lang/String;

    invoke-static {v4, v2, v3}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->freshSession(Ljava/lang/String;J)Lorg/json/JSONObject;

    move-result-object v2

    .line 801
    invoke-static {v0, v1, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->putQuiet(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_1c
    return-object v2
.end method

.method private static stateLocked()Lorg/json/JSONObject;
    .registers 7

    .line 737
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->memoryState:Lorg/json/JSONObject;

    if-eqz v0, :cond_5

    return-object v0

    .line 738
    :cond_5
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->appContext:Landroid/content/Context;

    .line 740
    const-string v1, ""

    const/4 v2, 0x0

    const/4 v3, 0x0

    if-eqz v0, :cond_2b

    .line 742
    :try_start_d
    const-string v4, "deepseek_caption_token_cost_audit"

    invoke-virtual {v0, v4, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v4, "state_v1"

    invoke-interface {v0, v4, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2b

    .line 743
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_2b

    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_2a
    .catchall {:try_start_d .. :try_end_2a} :catchall_2b

    move-object v3, v4

    :catchall_2b
    :cond_2b
    if-eqz v3, :cond_36

    .line 747
    const-string v0, "version"

    invoke-virtual {v3, v0, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    const/4 v2, 0x1

    if-eq v0, v2, :cond_3a

    :cond_36
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->freshState()Lorg/json/JSONObject;

    move-result-object v3

    .line 748
    :cond_3a
    sput-object v3, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->memoryState:Lorg/json/JSONObject;

    .line 749
    const-string v0, "session"

    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    if-nez v2, :cond_55

    .line 751
    sget-wide v1, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->generation:J

    const-wide/16 v4, 0x1

    add-long/2addr v1, v4

    sput-wide v1, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->generation:J

    .line 752
    sget-object v4, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->activeVideoId:Ljava/lang/String;

    invoke-static {v4, v1, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->freshSession(Ljava/lang/String;J)Lorg/json/JSONObject;

    move-result-object v1

    .line 753
    invoke-static {v3, v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->putQuiet(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_87

    .line 755
    :cond_55
    sget-wide v3, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->generation:J

    const-string v0, "generation"

    const-wide/16 v5, 0x0

    invoke-virtual {v2, v0, v5, v6}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v5

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v3

    sput-wide v3, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->generation:J

    .line 756
    const-string v0, "video_id"

    invoke-virtual {v2, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 757
    sget-object v1, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->activeVideoId:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_79

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->activeVideoId:Ljava/lang/String;

    .line 758
    :cond_79
    const-string v0, "active_core"

    sget-object v1, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->activeCore:Ljava/lang/String;

    invoke-virtual {v2, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->normalizeCore(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->activeCore:Ljava/lang/String;

    .line 760
    :goto_87
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->memoryState:Lorg/json/JSONObject;

    return-object v0
.end method

.method static uiText(Landroid/content/Context;)Ljava/lang/String;
    .registers 21

    const-string v0, " \u6b21\u5931\u8d25 \u00b7 \u5185\u90e8\u91cd\u8bd5 "

    const-string v1, " \u6b21 2xx \u00b7 "

    const-string v2, " \u6b21\u5c1d\u8bd5 \u00b7 "

    if-eqz p0, :cond_b

    .line 454
    invoke-static/range {p0 .. p0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->install(Landroid/content/Context;)V

    .line 455
    :cond_b
    sget-object v3, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->LOCK:Ljava/lang/Object;

    monitor-enter v3

    .line 456
    :try_start_e
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->stateLocked()Lorg/json/JSONObject;

    move-result-object v4

    .line 457
    const-string v5, "all"

    invoke-static {v4, v5}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->bucketLocked(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    .line 458
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->sessionLocked()Lorg/json/JSONObject;

    move-result-object v6

    .line 459
    const-string v7, "all"

    invoke-static {v6, v7}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->bucketLocked(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    .line 460
    invoke-static {v6}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->metricsLocked(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v8

    .line 462
    const-string v9, "attempts"

    invoke-static {v5, v9}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v9

    .line 463
    const-string v11, "total_tokens"

    invoke-static {v5, v11}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v11

    const-wide/16 v13, 0x0

    cmp-long v9, v9, v13

    if-nez v9, :cond_40

    cmp-long v9, v11, v13

    if-nez v9, :cond_40

    .line 465
    const-string v0, "Token \u6210\u672c\u5ba1\u8ba1\uff1a\u5c1a\u65e0 API \u7528\u91cf\u3002\u64ad\u653e\u4e00\u6bb5 AI \u5b57\u5e55\u540e\u4f1a\u5728\u8fd9\u91cc\u663e\u793a\u7cbe\u786e usage\u3001\u7f13\u5b58\u547d\u4e2d\u3001\u7528\u9014\u5206\u644a\u4e0e\u6bcf\u5206\u949f\u6210\u672c\u3002"

    monitor-exit v3

    return-object v0

    .line 468
    :cond_40
    new-instance v9, Ljava/lang/StringBuilder;

    const/16 v10, 0x5dc

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 469
    const-string v10, "Token \u6210\u672c\u5ba1\u8ba1\uff08\u81ea\u4e0a\u6b21\u6e05\u7a7a\uff09"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 470
    const-string v10, "model"

    const-string v15, ""

    invoke-virtual {v6, v10, v15}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v10

    .line 471
    invoke-virtual {v10}, Ljava/lang/String;->isEmpty()Z

    move-result v15

    if-nez v15, :cond_66

    const-string v15, "\n\u5f53\u524d\u6a21\u578b\uff1a"

    invoke-virtual {v9, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 472
    :cond_66
    const-string v10, "\n\u5f53\u524d Core\uff1a"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 473
    const-string v10, "event_rebuild_r2"

    const-string v15, "active_core"

    move-wide/from16 v16, v13

    const-string v13, ""

    invoke-virtual {v6, v15, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v10, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_80

    .line 474
    const-string v10, "Event rebuild R2"

    goto :goto_82

    .line 475
    :cond_80
    const-string v10, "\u5386\u53f2\u6838\u5fc3"

    .line 472
    :goto_82
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 477
    const-string v10, "\nAPI\uff1a"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v10, "attempts"

    invoke-static {v5, v10}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v13

    invoke-static {v13, v14}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->format(J)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 478
    const-string v2, "http_ok"

    invoke-static {v5, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v13

    invoke-static {v13, v14}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->format(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 479
    const-string v1, "failures"

    invoke-static {v5, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v1

    invoke-static {v1, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->format(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 480
    const-string v0, "internal_retries"

    invoke-static {v5, v0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->format(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " \u6b21"

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 481
    invoke-static {v9, v5}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->appendFailureBreakdown(Ljava/lang/StringBuilder;Lorg/json/JSONObject;)V

    .line 482
    const-string v0, "accepted_caption_units"

    invoke-static {v5, v0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v0

    const-string v2, "rejected_caption_units"

    invoke-static {v5, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v13

    add-long v18, v0, v13

    cmp-long v2, v18, v16

    if-lez v2, :cond_10e

    .line 483
    const-string v2, "\n"

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\u7ed3\u6784\u53ca\u786e\u5b9a\u6027\u89c4\u5219\u6821\u9a8c\uff1a\u63a5\u53d7 / \u62d2\u7edd\uff08\u975e\u8bed\u4e49\u9a8c\u6536\uff09"

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ": "

    .line 484
    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, " / "

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v13, v14}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, " ("

    .line 485
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "quality_rejected_units"

    invoke-static {v5, v0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v0

    invoke-virtual {v9, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, ")"

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 486
    :cond_10e
    const-string v0, "\nTokens\uff1a"

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v11, v12}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->format(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " = \u8f93\u5165 "

    .line 487
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "prompt_tokens"

    invoke-static {v5, v0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->format(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " + \u8f93\u51fa "

    .line 488
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "completion_tokens"

    invoke-static {v5, v0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->format(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 490
    const-string v0, "cache_hit_tokens"

    invoke-static {v5, v0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v0

    .line 491
    const-string v2, "cache_miss_tokens"

    invoke-static {v5, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v10

    add-long v12, v0, v10

    cmp-long v2, v12, v16

    if-lez v2, :cond_175

    .line 494
    const-string v2, "\n\u8f93\u5165\u7f13\u5b58\uff1a\u547d\u4e2d "

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->format(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " / \u672a\u547d\u4e2d "

    .line 495
    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v10, v11}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->format(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " \u00b7 \u547d\u4e2d\u7387 "

    .line 496
    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0, v1, v12, v13}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->percent(JJ)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_17a

    .line 498
    :cond_175
    const-string v0, "\n\u8f93\u5165\u7f13\u5b58\uff1a\u5f53\u524d provider \u672a\u8fd4\u56de\u53ef\u8bc6\u522b\u7684 hit/miss \u660e\u7ec6"

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 501
    :goto_17a
    const-string v0, "\nV4 Flash \u5f53\u524d Provider \u4f30\u7b97\uff1a"

    invoke-static {v9, v5, v0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->appendCost(Ljava/lang/StringBuilder;Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 502
    const-string v0, "\n\u7528\u9014\u5206\u644a\uff1a"

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 503
    const-string v0, "priority"

    const-string v1, "\u5f53\u524d\u4f18\u5148"

    invoke-static {v9, v4, v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->appendBucketLine(Ljava/lang/StringBuilder;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V

    .line 504
    const-string v0, "priority_current"

    const-string v1, "  \u5f53\u524d\u951a\u70b9"

    invoke-static {v9, v4, v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->appendBucketLine(Ljava/lang/StringBuilder;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V

    .line 505
    const-string v0, "priority_gap_rescue"

    const-string v1, "  \u7f3a\u53e3\u62a2\u4fee"

    invoke-static {v9, v4, v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->appendBucketLine(Ljava/lang/StringBuilder;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V

    .line 506
    const-string v0, "background"

    const-string v1, "\u540e\u53f0\u9884\u53d6"

    invoke-static {v9, v4, v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->appendBucketLine(Ljava/lang/StringBuilder;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V

    .line 507
    const-string v0, "background_page"

    const-string v1, "  \u9875\u7ea7\u5408\u5e76"

    invoke-static {v9, v4, v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->appendBucketLine(Ljava/lang/StringBuilder;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V

    .line 508
    const-string v0, "background_block"

    const-string v1, "  \u5757\u7ea7(fallback)"

    invoke-static {v9, v4, v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->appendBucketLine(Ljava/lang/StringBuilder;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V

    .line 509
    const-string v0, "background_alt"

    const-string v1, "  \u8fb9\u754c\u4e8c\u6b21\u89c2\u5bdf"

    invoke-static {v9, v4, v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->appendBucketLine(Ljava/lang/StringBuilder;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V

    .line 510
    const-string v0, "unit_realtime"

    const-string v1, "\u65f6\u95f4\u951a\u00b7\u5f53\u524d\u6279\u6b21"

    invoke-static {v9, v4, v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->appendBucketLine(Ljava/lang/StringBuilder;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V

    .line 511
    const-string v0, "unit_background"

    const-string v1, "\u65f6\u95f4\u951a\u00b7\u540e\u53f0\u6279\u6b21"

    invoke-static {v9, v4, v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->appendBucketLine(Ljava/lang/StringBuilder;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V

    .line 512
    const-string v0, "core_semantic_ledger_v2"

    const-string v1, "Core\u00b7Semantic Ledger v2"

    invoke-static {v9, v4, v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->appendBucketLine(Ljava/lang/StringBuilder;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V

    .line 513
    const-string v0, "core_contextual_unit_v1"

    const-string v1, "Core\u00b7Contextual Unit v1"

    invoke-static {v9, v4, v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->appendBucketLine(Ljava/lang/StringBuilder;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V

    .line 514
    const-string v0, "display"

    const-string v1, "\u663e\u793a\u5207\u7247"

    invoke-static {v9, v4, v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->appendBucketLine(Ljava/lang/StringBuilder;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V

    .line 516
    invoke-static {v4}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->metricsLocked(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v0

    .line 517
    const-string v1, "background_page"

    const-string v2, "\u9875\u7ea7\u5408\u5e76"

    invoke-static {v9, v4, v1, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->appendPageEfficiencyLine(Ljava/lang/StringBuilder;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V

    .line 518
    const-string v1, "background_block"

    const-string v2, "\u5757\u7ea7(fallback)"

    invoke-static {v9, v4, v1, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->appendPageEfficiencyLine(Ljava/lang/StringBuilder;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V

    .line 519
    const-string v1, "background_alt"

    const-string v2, "\u8fb9\u754c\u4e8c\u6b21\u89c2\u5bdf"

    invoke-static {v9, v4, v1, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->appendPageEfficiencyLine(Ljava/lang/StringBuilder;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V

    .line 521
    const-string v1, "background_page"

    invoke-static {v4, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->bucketLocked(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 522
    const-string v2, "logical_requests"

    invoke-static {v1, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v10

    .line 523
    const-string v2, "blocks_completed"

    invoke-static {v1, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v1

    cmp-long v12, v10, v16

    if-lez v12, :cond_233

    .line 525
    const-string v12, "\n\u9875\u7ea7\u5408\u5e76\u63a8\u8fdb\uff1a"

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v1, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->format(J)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v12, " \u4e2a\u56fa\u5b9a\u5757\u7531 "

    .line 526
    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v10, v11}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->format(J)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v12, " \u4e2a\u9875\u7ea7\u8bf7\u6c42\u5b8c\u6210\uff08\u6bcf\u8bf7\u6c42 "

    .line 527
    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    long-to-double v1, v1

    long-to-double v10, v10

    div-double/2addr v1, v10

    .line 528
    invoke-static {v1, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->oneDecimal(D)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " \u5757\uff1b<1.0 \u8868\u793a\u5b58\u5728\u65e0\u63a8\u8fdb\u7684\u91cd\u590d\u8bf7\u6c42\uff09"

    .line 529
    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 531
    :cond_233
    const-string v1, "background_alt_armed"

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v1

    cmp-long v10, v1, v16

    if-lez v10, :cond_278

    .line 533
    const-string v10, "background_alt"

    invoke-static {v4, v10}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->bucketLocked(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v10

    .line 534
    const-string v11, "\n\u8fb9\u754c\u4e8c\u6b21\u89c2\u5bdf\uff1a\u5df2\u89e6\u53d1 "

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v1, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->format(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " \u6b21\uff08\u6bcf\u9875\u81f3\u591a 1 \u6b21\uff09\u00b7 \u5b9e\u9645\u53d1\u51fa "

    .line 535
    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "logical_requests"

    .line 536
    invoke-static {v10, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v1

    invoke-static {v1, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->format(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " \u6b21 \u00b7 \u8865\u56de "

    .line 537
    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "committed_atoms"

    invoke-static {v10, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v1

    invoke-static {v1, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->format(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " \u4e2a atom"

    .line 538
    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 540
    :cond_278
    const-string v1, "background_page_fallback_events"

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v1

    cmp-long v10, v1, v16

    if-lez v10, :cond_293

    .line 542
    const-string v10, "\n\u9875\u7ea7\u964d\u7ea7\uff1a\u5df2\u6709 "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v1, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->format(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " \u4e2a\u7f13\u5b58\u9875\u8fde\u7eed\u5931\u8d25\u8d85\u8fc7\u9608\u503c\uff0c\u964d\u7ea7\u4e3a\u9010\u5757 fallback \u8bf7\u6c42"

    .line 543
    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 545
    :cond_293
    const-string v1, "sunk_prompts"

    invoke-static {v5, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v1

    cmp-long v10, v1, v16

    if-lez v10, :cond_2c5

    .line 547
    const-string v10, "\n\u5df2\u53d1\u51fa\u4f46\u672a\u8bfb\u53d6\u7684\u8bf7\u6c42\uff1a"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v1, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->format(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " \u6b21 \u00b7 "

    .line 548
    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "sunk_prompt_bytes"

    invoke-static {v5, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v1

    invoke-static {v1, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->format(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " bytes\u3002provider \u662f\u5426\u5904\u7406\u6216\u8ba1\u8d39\u5c1a\u672a\u786e\u8ba4\uff1b\u4e0b\u65b9 token/\u6210\u672c\u4e0d\u5305\u542b\u8fd9\u4e9b\u672a\u77e5\u7528\u91cf\uff0c"

    .line 549
    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\u4e0d\u80fd\u636e\u6b64\u786e\u5b9a\u5b9e\u9645\u652f\u51fa\u3002"

    .line 550
    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 553
    :cond_2c5
    const-string v1, "display_local_success"

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v1

    .line 554
    const-string v10, "display_local_inconclusive"

    invoke-static {v0, v10}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v10

    .line 555
    const-string v12, "display_local_whole_sentence"

    invoke-static {v0, v12}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v12

    add-long v14, v1, v10

    add-long/2addr v14, v12

    cmp-long v0, v14, v16

    if-lez v0, :cond_35a

    .line 557
    const-string v0, "display"

    invoke-static {v4, v0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->bucketLocked(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 558
    const-string v14, "\n\u663e\u793a\u5207\u7247\u901a\u9053\uff1a\u672c\u5730\u96f6 Token \u76f4\u63a5\u8fbe\u6807 "

    invoke-virtual {v9, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v1, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->format(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " \u6b21"

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    cmp-long v1, v12, v16

    if-lez v1, :cond_30a

    .line 560
    const-string v1, " \u00b7 \u672c\u5730\u672a\u5207\u5206\u4fdd\u6301\u6574\u53e5 "

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v12, v13}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->format(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " \u6b21"

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_30a
    cmp-long v1, v10, v16

    if-lez v1, :cond_35a

    .line 563
    const-string v1, " \u00b7 \u672c\u5730\u672a\u8fbe\u6807\u8f6c AI "

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v10, v11}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->format(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " \u6b21"

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\uff08AI \u5b9e\u9645\u8c03\u7528 "

    .line 564
    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "attempts"

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v1

    invoke-static {v1, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->format(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " \u6b21 \u00b7 \u6210\u529f "

    .line 565
    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "usage_responses"

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v1

    invoke-static {v1, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->format(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " \u6b21 \u00b7 \u5931\u8d25 "

    .line 566
    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "failures"

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->format(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " \u6b21\uff09"

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 570
    :cond_35a
    const-string v0, "core_event_rebuild_r2"

    const-string v1, "Core\u00b7Event rebuild R2"

    invoke-static {v9, v4, v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->appendBucketLine(Ljava/lang/StringBuilder;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V

    .line 571
    const-string v0, "viewed_ms"

    invoke-static {v6, v0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v0

    .line 572
    const-string v2, "total_tokens"

    invoke-static {v7, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v10

    .line 573
    const-string v2, "\n\u5f53\u524d\u89c6\u9891\uff1a\u5df2\u8ba1\u89c2\u770b "

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    long-to-double v12, v0

    const-wide v14, 0x408f400000000000L    # 1000.0

    div-double v14, v12, v14

    invoke-static {v14, v15}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->seconds1(D)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " \u79d2"

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " \u00b7 "

    .line 574
    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v10, v11}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->format(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " tokens"

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-wide/16 v14, 0x1388

    cmp-long v0, v0, v14

    if-ltz v0, :cond_3e6

    const-wide v0, 0x40ed4c0000000000L    # 60000.0

    div-double/2addr v12, v0

    long-to-double v0, v10

    const-wide v10, 0x3f50624dd2f1a9fcL    # 0.001

    .line 577
    invoke-static {v10, v11, v12, v13}, Ljava/lang/Math;->max(DD)D

    move-result-wide v10

    div-double/2addr v0, v10

    invoke-static {v0, v1}, Ljava/lang/Math;->round(D)J

    move-result-wide v0

    .line 578
    const-string v2, " \u00b7 "

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->format(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " tokens/\u89c2\u770b\u5206\u949f"

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 579
    const-string v0, "cost_nano_cny"

    invoke-static {v7, v0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v0

    cmp-long v2, v0, v16

    if-lez v2, :cond_3e6

    .line 581
    const-string v2, " \u00b7 \u00a5"

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    long-to-double v0, v0

    const-wide v10, 0x41cdcd6500000000L    # 1.0E9

    div-double/2addr v0, v10

    div-double/2addr v0, v12

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->money(D)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "/\u5206\u949f"

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 585
    :cond_3e6
    const-string v0, "semantic_core_atoms"

    invoke-static {v8, v0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v0

    .line 586
    const-string v2, "semantic_window_atoms"

    invoke-static {v8, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v10

    .line 587
    const-string v2, "semantic_outside_atoms"

    invoke-static {v8, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v12

    cmp-long v2, v0, v16

    const/4 v14, 0x1

    if-lez v2, :cond_435

    add-long/2addr v10, v12

    long-to-double v12, v10

    move-object/from16 p0, v5

    const/4 v2, 0x0

    long-to-double v4, v0

    div-double/2addr v12, v4

    .line 590
    const-string v4, "\n\u8bed\u4e49\u7a97\u53e3\uff1a\u6838\u5fc3 "

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->format(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " atoms \u00b7 \u5b9e\u9645\u66b4\u9732 "

    .line 591
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v10, v11}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->format(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " atoms \u00b7 \u4e0a\u4e0b\u6587\u66b4\u9732\u500d\u7387 "

    .line 592
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%.2fx"

    .line 593
    invoke-static {v12, v13}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v4

    new-array v5, v14, [Ljava/lang/Object;

    aput-object v4, v5, v2

    invoke-static {v0, v1, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_438

    :cond_435
    move-object/from16 p0, v5

    const/4 v2, 0x0

    .line 595
    :goto_438
    const-string v0, "unit_target_units"

    invoke-static {v8, v0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v0

    .line 596
    const-string v4, "unit_context_units"

    invoke-static {v8, v4}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v4

    .line 597
    const-string v10, "unit_target_chars"

    invoke-static {v8, v10}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v10

    .line 598
    const-string v12, "unit_context_chars"

    invoke-static {v8, v12}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v12

    cmp-long v15, v0, v16

    if-lez v15, :cond_4a8

    .line 600
    const-string v15, "\n\u8bf7\u6c42\u5757\u7d2f\u8ba1\uff1a\u76ee\u6807 "

    invoke-virtual {v9, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->format(J)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v9, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v15, " blocks \u00b7 \u53ea\u8bfb\u4e0a\u4e0b\u6587 "

    .line 601
    invoke-virtual {v9, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v4, v5}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->format(J)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v9, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v15, " sections \u00b7 \u4e0a\u4e0b\u6587\u6bb5/\u8bf7\u6c42\u5757\u8ba1\u6570\u6bd4 "

    .line 602
    invoke-virtual {v9, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v15, Ljava/util/Locale;->US:Ljava/util/Locale;

    move/from16 v18, v2

    const-string v2, "%.2fx"

    long-to-double v4, v4

    long-to-double v0, v0

    div-double/2addr v4, v0

    .line 603
    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    new-array v1, v14, [Ljava/lang/Object;

    aput-object v0, v1, v18

    invoke-static {v15, v2, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    cmp-long v0, v10, v16

    if-lez v0, :cond_4a8

    .line 605
    const-string v0, " \u00b7 \u5b57\u7b26\u66b4\u9732\u6bd4 "

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%.2fx"

    long-to-double v4, v12

    long-to-double v10, v10

    div-double/2addr v4, v10

    .line 606
    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    new-array v4, v14, [Ljava/lang/Object;

    aput-object v2, v4, v18

    invoke-static {v0, v1, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 609
    :cond_4a8
    const-string v0, "unit_cache_lookups"

    invoke-static {v8, v0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v0

    cmp-long v2, v0, v16

    if-lez v2, :cond_4f4

    .line 611
    const-string v2, "\n\u8bf7\u6c42\u5757\u78c1\u76d8\u7f13\u5b58\uff1alookup "

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->format(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " \u00b7 \u547d\u4e2d blocks "

    .line 612
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "unit_cache_hit_units"

    invoke-static {v8, v0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->format(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " \u00b7 \u672a\u547d\u4e2d units "

    .line 613
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "unit_cache_miss_units"

    invoke-static {v8, v0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->format(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " \u00b7 \u5f53\u524d block \u547d\u4e2d "

    .line 614
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "unit_cache_current_hits"

    invoke-static {v8, v0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->format(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 616
    :cond_4f4
    const-string v0, "semantic_ledger_v2"

    const-string v1, "\u5386\u53f2\u6838\u5fc3"

    invoke-static {v9, v6, v8, v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->appendCoreRate(Ljava/lang/StringBuilder;Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V

    .line 617
    const-string v0, "contextual_unit_v1"

    const-string v1, "\u5386\u53f2\u517c\u5bb9\u6838\u5fc3"

    invoke-static {v9, v6, v8, v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->appendCoreRate(Ljava/lang/StringBuilder;Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V

    .line 618
    const-string v0, "event_rebuild_r2"

    const-string v1, "Event rebuild R2"

    invoke-static {v9, v6, v8, v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->appendCoreRate(Ljava/lang/StringBuilder;Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V

    .line 619
    const-string v0, "request_bytes"

    invoke-static {v7, v0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v0

    .line 620
    const-string v2, "attempts"

    invoke-static {v7, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v4

    cmp-long v2, v4, v16

    if-lez v2, :cond_53c

    .line 622
    const-string v2, "\n\u8bf7\u6c42\u4f53\uff1a\u7d2f\u8ba1 "

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->format(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " bytes"

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " \u00b7 \u5e73\u5747 "

    .line 623
    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    div-long/2addr v0, v4

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->format(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " bytes/API \u5c1d\u8bd5"

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 625
    :cond_53c
    const-string v0, "responses_without_usage"

    move-object/from16 v1, p0

    invoke-static {v1, v0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->value(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v0

    cmp-long v2, v0, v16

    if-lez v2, :cond_559

    .line 627
    const-string v2, "\n\u6ce8\u610f\uff1a\u6709 "

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->format(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " \u6b21 2xx \u54cd\u5e94\u672a\u63d0\u4f9b usage\uff0c\u56e0\u6b64\u8fd9\u90e8\u5206\u53ea\u80fd\u8ba1\u8bf7\u6c42\u6b21\u6570\uff0c\u4e0d\u80fd\u8ba1\u7cbe\u786e token\u3002"

    .line 628
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 630
    :cond_559
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    monitor-exit v3

    return-object v0

    :catchall_55f
    move-exception v0

    .line 631
    monitor-exit v3
    :try_end_561
    .catchall {:try_start_e .. :try_end_561} :catchall_55f

    throw v0
.end method

.method private static updateBucketsLocked(Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$BucketMutation;)V
    .registers 9

    if-eqz p0, :cond_7f

    if-nez p1, :cond_6

    goto/16 :goto_7f

    .line 717
    :cond_6
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->stateLocked()Lorg/json/JSONObject;

    move-result-object v0

    .line 718
    const-string v1, "all"

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->bucketLocked(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-interface {p1, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$BucketMutation;->apply(Lorg/json/JSONObject;)V

    .line 719
    iget-object v2, p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;->purpose:Ljava/lang/String;

    invoke-static {v0, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->bucketLocked(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-interface {p1, v2}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$BucketMutation;->apply(Lorg/json/JSONObject;)V

    .line 720
    iget-object v2, p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;->detailBucket:Ljava/lang/String;

    if-eqz v2, :cond_2a

    iget-object v2, p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;->detailBucket:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2a

    const/4 v2, 0x1

    goto :goto_2b

    :cond_2a
    const/4 v2, 0x0

    :goto_2b
    if-eqz v2, :cond_36

    .line 721
    iget-object v3, p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;->detailBucket:Ljava/lang/String;

    invoke-static {v0, v3}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->bucketLocked(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-interface {p1, v3}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$BucketMutation;->apply(Lorg/json/JSONObject;)V

    .line 722
    :cond_36
    iget-object v3, p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;->coreBucket:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_47

    .line 723
    iget-object v3, p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;->coreBucket:Ljava/lang/String;

    invoke-static {v0, v3}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->bucketLocked(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-interface {p1, v0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$BucketMutation;->apply(Lorg/json/JSONObject;)V

    .line 725
    :cond_47
    iget-wide v3, p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;->generation:J

    sget-wide v5, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->generation:J

    cmp-long v0, v3, v5

    if-nez v0, :cond_7f

    .line 726
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->sessionLocked()Lorg/json/JSONObject;

    move-result-object v0

    .line 727
    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->bucketLocked(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-interface {p1, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$BucketMutation;->apply(Lorg/json/JSONObject;)V

    .line 728
    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;->purpose:Ljava/lang/String;

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->bucketLocked(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-interface {p1, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$BucketMutation;->apply(Lorg/json/JSONObject;)V

    if-eqz v2, :cond_6e

    .line 729
    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;->detailBucket:Ljava/lang/String;

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->bucketLocked(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-interface {p1, v1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$BucketMutation;->apply(Lorg/json/JSONObject;)V

    .line 730
    :cond_6e
    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;->coreBucket:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_7f

    .line 731
    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;->coreBucket:Ljava/lang/String;

    invoke-static {v0, p0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->bucketLocked(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    invoke-interface {p1, p0}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$BucketMutation;->apply(Lorg/json/JSONObject;)V

    :cond_7f
    :goto_7f
    return-void
.end method

.method private static value(Lorg/json/JSONObject;Ljava/lang/String;)J
    .registers 4

    const-wide/16 v0, 0x0

    if-nez p0, :cond_5

    return-wide v0

    .line 933
    :cond_5
    invoke-virtual {p0, p1, v0, v1}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide p0

    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->nonNegative(J)J

    move-result-wide p0

    return-wide p0
.end method
