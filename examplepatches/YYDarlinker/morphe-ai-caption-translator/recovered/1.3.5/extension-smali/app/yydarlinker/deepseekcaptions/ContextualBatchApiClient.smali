.class final Lapp/yydarlinker/deepseekcaptions/ContextualBatchApiClient;
.super Ljava/lang/Object;
.source "ContextualBatchApiClient.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static resetRejection()V
    .registers 0

    .line 6
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/RebuildApi;->reset()V

    return-void
.end method

.method static test(Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;)Ljava/lang/String;
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 10
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/RebuildApi;->test(Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
