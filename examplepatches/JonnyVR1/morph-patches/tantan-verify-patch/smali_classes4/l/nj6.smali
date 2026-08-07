.class public final synthetic Ll/nj6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;

.field public final synthetic b:Ll/y20;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;Ll/y20;Ljava/lang/String;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nj6;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;

    iput-object p2, p0, Ll/nj6;->b:Ll/y20;

    iput-object p3, p0, Ll/nj6;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/nj6;->d:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/nj6;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;

    iget-object v1, p0, Ll/nj6;->b:Ll/y20;

    iget-object v2, p0, Ll/nj6;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/nj6;->d:Ll/y20;

    check-cast p1, Landroid/util/Pair;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->a(Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;Ll/y20;Ljava/lang/String;Ll/y20;Landroid/util/Pair;)V

    return-void
.end method
