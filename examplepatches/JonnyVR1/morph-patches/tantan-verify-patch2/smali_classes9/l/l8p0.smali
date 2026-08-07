.class public final synthetic Ll/l8p0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;

.field public final synthetic b:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l8p0;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;

    iput-object p2, p0, Ll/l8p0;->b:Ll/x20;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l8p0;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;

    iget-object p0, p0, Ll/l8p0;->b:Ll/x20;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;->e(Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;Ll/x20;)V

    return-void
.end method
