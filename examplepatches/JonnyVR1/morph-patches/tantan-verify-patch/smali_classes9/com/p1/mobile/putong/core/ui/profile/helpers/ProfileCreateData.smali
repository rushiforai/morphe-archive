.class public Lcom/p1/mobile/putong/core/ui/profile/helpers/ProfileCreateData;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field public checkConv:Z

.field public showCountdownSendMsg:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/ProfileCreateData;->checkConv:Z

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/ProfileCreateData;->showCountdownSendMsg:Z

    .line 9
    .line 10
    return-void
.end method
