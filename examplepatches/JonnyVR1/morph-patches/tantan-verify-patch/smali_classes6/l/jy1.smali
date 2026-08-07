.class public final synthetic Ll/jy1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInvite;

    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveData;->m(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInvite;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallInvite;

    move-result-object p0

    return-object p0
.end method
