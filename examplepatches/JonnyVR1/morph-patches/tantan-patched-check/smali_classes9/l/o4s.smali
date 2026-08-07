.class public Ll/o4s;
.super Ll/f05;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/f05<",
        "Ll/mu40;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/f05;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;)V

    .line 2
    .line 3
    .line 4
    new-instance p3, Ll/n4s;

    .line 5
    .line 6
    check-cast p1, Ll/fw40;

    .line 7
    .line 8
    iget-object p2, p2, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;

    .line 9
    .line 10
    invoke-direct {p3, p1, p2}, Ll/n4s;-><init>(Ll/fw40;Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 14
    .line 15
    .line 16
    return-void
.end method
