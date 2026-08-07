.class public final synthetic Ll/kc6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kc6;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kc6;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;->d(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method
