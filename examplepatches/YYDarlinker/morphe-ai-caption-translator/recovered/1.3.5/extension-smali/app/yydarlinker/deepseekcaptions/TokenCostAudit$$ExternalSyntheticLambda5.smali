.class public final synthetic Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$BucketMutation;


# instance fields
.field public final synthetic f$0:I

.field public final synthetic f$1:I


# direct methods
.method public synthetic constructor <init>(II)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$$ExternalSyntheticLambda5;->f$0:I

    iput p2, p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$$ExternalSyntheticLambda5;->f$1:I

    return-void
.end method


# virtual methods
.method public final apply(Lorg/json/JSONObject;)V
    .registers 3

    .line 0
    iget v0, p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$$ExternalSyntheticLambda5;->f$0:I

    iget p0, p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$$ExternalSyntheticLambda5;->f$1:I

    invoke-static {v0, p0, p1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->lambda$beginAttempt$3(IILorg/json/JSONObject;)V

    return-void
.end method
