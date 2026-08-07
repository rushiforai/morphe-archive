.class public final synthetic Ll/hqo0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/tqo0;

.field public final synthetic b:Ll/noo0;

.field public final synthetic c:Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;


# direct methods
.method public synthetic constructor <init>(Ll/tqo0;Ll/noo0;Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hqo0;->a:Ll/tqo0;

    iput-object p2, p0, Ll/hqo0;->b:Ll/noo0;

    iput-object p3, p0, Ll/hqo0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hqo0;->a:Ll/tqo0;

    iget-object v1, p0, Ll/hqo0;->b:Ll/noo0;

    iget-object p0, p0, Ll/hqo0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;

    invoke-static {v0, v1, p0}, Ll/jqo0;->b(Ll/tqo0;Ll/noo0;Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;)V

    return-void
.end method
