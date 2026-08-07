.class public final synthetic Ll/zb6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/util/HashSet;

.field public final synthetic b:Ll/sj6;

.field public final synthetic c:Ljava/util/HashSet;


# direct methods
.method public synthetic constructor <init>(Ljava/util/HashSet;Ll/sj6;Ljava/util/HashSet;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zb6;->a:Ljava/util/HashSet;

    iput-object p2, p0, Ll/zb6;->b:Ll/sj6;

    iput-object p3, p0, Ll/zb6;->c:Ljava/util/HashSet;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zb6;->a:Ljava/util/HashSet;

    iget-object v1, p0, Ll/zb6;->b:Ll/sj6;

    iget-object p0, p0, Ll/zb6;->c:Ljava/util/HashSet;

    check-cast p1, Lcom/p1/mobile/putong/core/data/Message;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemRightBtnView;->i1(Ljava/util/HashSet;Ll/sj6;Ljava/util/HashSet;Lcom/p1/mobile/putong/core/data/Message;)V

    return-void
.end method
