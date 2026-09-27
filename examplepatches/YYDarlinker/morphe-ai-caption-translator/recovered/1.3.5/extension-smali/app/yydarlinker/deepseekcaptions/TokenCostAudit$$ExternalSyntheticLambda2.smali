.class public final synthetic Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$BucketMutation;


# instance fields
.field public final synthetic f$0:J


# direct methods
.method public synthetic constructor <init>(J)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$$ExternalSyntheticLambda2;->f$0:J

    return-void
.end method


# virtual methods
.method public final apply(Lorg/json/JSONObject;)V
    .registers 4

    .line 0
    iget-wide v0, p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$$ExternalSyntheticLambda2;->f$0:J

    invoke-static {v0, v1, p1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->lambda$recordSunkPrompt$2(JLorg/json/JSONObject;)V

    return-void
.end method
