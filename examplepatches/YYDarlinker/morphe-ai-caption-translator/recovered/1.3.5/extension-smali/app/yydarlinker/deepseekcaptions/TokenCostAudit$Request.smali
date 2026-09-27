.class final Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;
.super Ljava/lang/Object;
.source "TokenCostAudit.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Request"
.end annotation


# instance fields
.field attempts:I

.field final baseUrl:Ljava/lang/String;

.field final coreBucket:Ljava/lang/String;

.field final detailBucket:Ljava/lang/String;

.field final generation:J

.field final model:Ljava/lang/String;

.field final purpose:Ljava/lang/String;


# direct methods
.method constructor <init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 8

    .line 980
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 981
    iput-wide p1, p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;->generation:J

    if-eqz p3, :cond_d

    .line 982
    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_f

    :cond_d
    const-string p3, "background"

    :cond_f
    iput-object p3, p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;->purpose:Ljava/lang/String;

    .line 983
    const-string p1, ""

    if-nez p4, :cond_16

    move-object p4, p1

    :cond_16
    iput-object p4, p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;->model:Ljava/lang/String;

    if-nez p5, :cond_1b

    move-object p5, p1

    .line 984
    :cond_1b
    iput-object p5, p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;->baseUrl:Ljava/lang/String;

    if-nez p6, :cond_20

    move-object p6, p1

    .line 985
    :cond_20
    iput-object p6, p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;->detailBucket:Ljava/lang/String;

    .line 986
    invoke-static {p7}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->-$$Nest$smcoreBucket(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$Request;->coreBucket:Ljava/lang/String;

    return-void
.end method
