.class public final synthetic Ll/th40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/xh40;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;


# direct methods
.method public synthetic constructor <init>(Ll/xh40;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/th40;->a:Ll/xh40;

    iput-object p2, p0, Ll/th40;->b:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/th40;->a:Ll/xh40;

    iget-object p0, p0, Ll/th40;->b:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {v0, p0, p1}, Ll/xh40;->C(Ll/xh40;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;Ljava/lang/Boolean;)V

    return-void
.end method
