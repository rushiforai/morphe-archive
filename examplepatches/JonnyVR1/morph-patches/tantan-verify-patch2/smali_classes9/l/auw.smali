.class public final synthetic Ll/auw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView;

.field public final synthetic b:Ll/n4z;

.field public final synthetic c:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView;Ll/n4z;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/auw;->a:Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView;

    iput-object p2, p0, Ll/auw;->b:Ll/n4z;

    iput-object p3, p0, Ll/auw;->c:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/auw;->a:Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView;

    iget-object v1, p0, Ll/auw;->b:Ll/n4z;

    iget-object p0, p0, Ll/auw;->c:Ll/y20;

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView;->c(Lcom/p1/mobile/putong/core/ui/messages/question/MaleChatGuideView;Ll/n4z;Ll/y20;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method
