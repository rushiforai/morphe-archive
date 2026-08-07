.class public final synthetic Ll/pz8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;

.field public final synthetic b:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pz8;->a:Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;

    iput-object p2, p0, Ll/pz8;->b:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pz8;->a:Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;

    iget-object p0, p0, Ll/pz8;->b:Ll/y20;

    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;->k(Lcom/p1/mobile/putong/core/newui/group/CoreGroupChatHeaderView;Ll/y20;Lcom/p1/mobile/putong/core/data/CoreData;)V

    return-void
.end method
