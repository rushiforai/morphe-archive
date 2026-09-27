.class public final synthetic Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$$ExternalSyntheticLambda7;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$BucketMutation;


# instance fields
.field public final synthetic f$0:Lorg/json/JSONObject;

.field public final synthetic f$1:J

.field public final synthetic f$2:J

.field public final synthetic f$3:J

.field public final synthetic f$4:J

.field public final synthetic f$5:J

.field public final synthetic f$6:Z

.field public final synthetic f$7:J


# direct methods
.method public synthetic constructor <init>(Lorg/json/JSONObject;JJJJJZJ)V
    .registers 15

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$$ExternalSyntheticLambda7;->f$0:Lorg/json/JSONObject;

    iput-wide p2, p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$$ExternalSyntheticLambda7;->f$1:J

    iput-wide p4, p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$$ExternalSyntheticLambda7;->f$2:J

    iput-wide p6, p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$$ExternalSyntheticLambda7;->f$3:J

    iput-wide p8, p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$$ExternalSyntheticLambda7;->f$4:J

    iput-wide p10, p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$$ExternalSyntheticLambda7;->f$5:J

    iput-boolean p12, p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$$ExternalSyntheticLambda7;->f$6:Z

    iput-wide p13, p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$$ExternalSyntheticLambda7;->f$7:J

    return-void
.end method


# virtual methods
.method public final apply(Lorg/json/JSONObject;)V
    .registers 17

    .line 0
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$$ExternalSyntheticLambda7;->f$0:Lorg/json/JSONObject;

    iget-wide v1, p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$$ExternalSyntheticLambda7;->f$1:J

    iget-wide v3, p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$$ExternalSyntheticLambda7;->f$2:J

    iget-wide v5, p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$$ExternalSyntheticLambda7;->f$3:J

    iget-wide v7, p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$$ExternalSyntheticLambda7;->f$4:J

    iget-wide v9, p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$$ExternalSyntheticLambda7;->f$5:J

    iget-boolean v11, p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$$ExternalSyntheticLambda7;->f$6:Z

    iget-wide v12, p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$$ExternalSyntheticLambda7;->f$7:J

    move-object/from16 v14, p1

    invoke-static/range {v0 .. v14}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->lambda$recordResponse$4(Lorg/json/JSONObject;JJJJJZJLorg/json/JSONObject;)V

    return-void
.end method
