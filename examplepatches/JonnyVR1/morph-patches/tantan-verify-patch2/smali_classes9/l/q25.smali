.class public final synthetic Ll/q25;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q25;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q25;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatBox;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;->setCustomStyle(Lcom/p1/mobile/putong/live/base/data/BLiveChatBox;)V

    return-void
.end method
