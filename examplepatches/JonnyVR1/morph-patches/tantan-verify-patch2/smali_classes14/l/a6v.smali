.class public final synthetic Ll/a6v;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;

.field public final synthetic b:Ll/j0v;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;Ll/j0v;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a6v;->a:Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;

    iput-object p2, p0, Ll/a6v;->b:Ll/j0v;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/a6v;->a:Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;

    iget-object p0, p0, Ll/a6v;->b:Ll/j0v;

    check-cast p1, Ljava/lang/Long;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;->e(Lcom/p1/mobile/putong/live/external/voiceslipcard/chatroom/LiveVoiceEntryView;Ll/j0v;Ljava/lang/Long;)V

    return-void
.end method
