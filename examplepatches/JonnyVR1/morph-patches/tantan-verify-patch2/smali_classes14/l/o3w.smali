.class public Ll/o3w;
.super Ll/g2w;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/g2w<",
        "Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/g2w;-><init>()V

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
    const-class p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, ""

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
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .line 1
    check-cast p3, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/o3w;->populatePushMessage(Lcom/p1/mobile/putong/data/PushMessage;Ll/pq60;Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public populatePushMessage(Lcom/p1/mobile/putong/data/PushMessage;Ll/pq60;Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs;)V
    .locals 0
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .line 7
    return-void
.end method
