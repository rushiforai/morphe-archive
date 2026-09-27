.class public final synthetic Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$$ExternalSyntheticLambda4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$BucketMutation;


# instance fields
.field public final synthetic f$0:I

.field public final synthetic f$1:Z


# direct methods
.method public synthetic constructor <init>(IZ)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$$ExternalSyntheticLambda4;->f$0:I

    iput-boolean p2, p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$$ExternalSyntheticLambda4;->f$1:Z

    return-void
.end method


# virtual methods
.method public final apply(Lorg/json/JSONObject;)V
    .registers 3

    .line 0
    iget v0, p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$$ExternalSyntheticLambda4;->f$0:I

    iget-boolean p0, p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$$ExternalSyntheticLambda4;->f$1:Z

    invoke-static {v0, p0, p1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->lambda$recordSemanticOutcome$5(IZLorg/json/JSONObject;)V

    return-void
.end method
