.class public final synthetic Ll/jz8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;

.field public final synthetic b:Lv/VLinear;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;Lv/VLinear;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jz8;->a:Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;

    iput-object p2, p0, Ll/jz8;->b:Lv/VLinear;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jz8;->a:Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;

    iget-object p0, p0, Ll/jz8;->b:Lv/VLinear;

    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatGroupTag;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->h(Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;Lv/VLinear;Lcom/p1/mobile/putong/core/data/ChatGroupTag;)V

    return-void
.end method
