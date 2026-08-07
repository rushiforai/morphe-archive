.class public final synthetic Ll/gy4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gy4;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gy4;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->p(Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;Z)V

    return-void
.end method
