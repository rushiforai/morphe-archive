.class public final synthetic Ll/ds50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/gs50;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager$QuickChatProduce;


# direct methods
.method public synthetic constructor <init>(Ll/gs50;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager$QuickChatProduce;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ds50;->a:Ll/gs50;

    iput-object p2, p0, Ll/ds50;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/ds50;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/ds50;->d:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager$QuickChatProduce;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ds50;->a:Ll/gs50;

    iget-object v1, p0, Ll/ds50;->b:Lcom/p1/mobile/android/app/Act;

    iget-object v2, p0, Ll/ds50;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/ds50;->d:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager$QuickChatProduce;

    invoke-static {v0, v1, v2, p0}, Ll/gs50;->m(Ll/gs50;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager$QuickChatProduce;)V

    return-void
.end method
