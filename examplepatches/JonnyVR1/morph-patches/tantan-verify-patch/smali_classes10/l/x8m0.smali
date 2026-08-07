.class public final synthetic Ll/x8m0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/VirtualVoiceMembersView;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTagBubble;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/VirtualVoiceMembersView;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTagBubble;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/x8m0;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/VirtualVoiceMembersView;

    iput-object p2, p0, Ll/x8m0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/x8m0;->c:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTagBubble;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/x8m0;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/VirtualVoiceMembersView;

    iget-object v1, p0, Ll/x8m0;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/x8m0;->c:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTagBubble;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/VirtualVoiceMembersView;->e(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/member/VirtualVoiceMembersView;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTagBubble;)V

    return-void
.end method
