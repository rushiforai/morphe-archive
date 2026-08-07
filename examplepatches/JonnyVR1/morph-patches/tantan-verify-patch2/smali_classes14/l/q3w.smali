.class public Ll/q3w;
.super Ll/o3w;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/o3w;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public b()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-super {p0}, Ll/o3w;->b()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "oms.resource"

    .line 2
    .line 3
    return-object p0
.end method

.method public g(Lcom/p1/mobile/putong/data/PushMessage;)V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic populatePushMessage(Lcom/p1/mobile/putong/data/PushMessage;Ll/pq60;Lcom/google/protobuf/q;)V
    .locals 0

    .line 1
    check-cast p3, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/q3w;->populatePushMessage(Lcom/p1/mobile/putong/data/PushMessage;Ll/pq60;Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public populatePushMessage(Lcom/p1/mobile/putong/data/PushMessage;Ll/pq60;Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs;)V
    .locals 0

    .line 7
    invoke-super {p0, p1, p2, p3}, Ll/o3w;->populatePushMessage(Lcom/p1/mobile/putong/data/PushMessage;Ll/pq60;Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs;)V

    return-void
.end method
