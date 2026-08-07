.class public final synthetic Ll/n740;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/c;

.field public final synthetic b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

.field public final synthetic c:Ll/q7m;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/c;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Ll/q7m;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n740;->a:Lcom/p1/mobile/putong/core/newui/home/c;

    iput-object p2, p0, Ll/n740;->b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    iput-object p3, p0, Ll/n740;->c:Ll/q7m;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/n740;->a:Lcom/p1/mobile/putong/core/newui/home/c;

    iget-object v1, p0, Ll/n740;->b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    iget-object p0, p0, Ll/n740;->c:Ll/q7m;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/newui/home/c;->t(Lcom/p1/mobile/putong/core/newui/home/c;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Ll/q7m;)V

    return-void
.end method
