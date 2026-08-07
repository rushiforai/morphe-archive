.class public Lcom/p1/mobile/putong/core/data/ImpressSignalCardWrapper;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private broadcastCard:Lcom/p1/mobile/putong/data/PushMessageCustom;

.field public hasShowPrivilegeNotify:Z

.field public userId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/data/PushMessageCustom;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/ImpressSignalCardWrapper;->hasShowPrivilegeNotify:Z

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ImpressSignalCardWrapper;->broadcastCard:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->userId:Ljava/lang/String;

    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ImpressSignalCardWrapper;->userId:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public getPushCustom()Lcom/p1/mobile/putong/data/PushMessageCustom;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ImpressSignalCardWrapper;->broadcastCard:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 2
    .line 3
    return-object p0
.end method
