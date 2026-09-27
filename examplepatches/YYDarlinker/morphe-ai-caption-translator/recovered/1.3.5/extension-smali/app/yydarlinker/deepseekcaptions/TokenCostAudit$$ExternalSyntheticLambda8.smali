.class public final synthetic Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$$ExternalSyntheticLambda8;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$BucketMutation;


# instance fields
.field public final synthetic f$0:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$$ExternalSyntheticLambda8;->f$0:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final apply(Lorg/json/JSONObject;)V
    .registers 2

    .line 0
    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit$$ExternalSyntheticLambda8;->f$0:Ljava/lang/String;

    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/TokenCostAudit;->lambda$recordFailure$7(Ljava/lang/String;Lorg/json/JSONObject;)V

    return-void
.end method
