.class public final synthetic Ll/xt50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

.field public final synthetic c:Ll/x20;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;Ll/x20;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xt50;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/xt50;->b:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    iput-object p3, p0, Ll/xt50;->c:Ll/x20;

    iput-object p4, p0, Ll/xt50;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/xt50;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/xt50;->b:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    iget-object v2, p0, Ll/xt50;->c:Ll/x20;

    iget-object p0, p0, Ll/xt50;->d:Ljava/lang/String;

    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;Ll/x20;Ljava/lang/String;)V

    return-void
.end method
