.class public final synthetic Ll/iv50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;

.field public final synthetic b:Ljava/util/List;

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;

.field public final synthetic d:Lcom/p1/mobile/putong/data/User;

.field public final synthetic e:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;Ljava/util/List;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/iv50;->a:Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;

    iput-object p2, p0, Ll/iv50;->b:Ljava/util/List;

    iput-object p3, p0, Ll/iv50;->c:Lcom/p1/mobile/android/app/Act;

    iput-object p4, p0, Ll/iv50;->d:Lcom/p1/mobile/putong/data/User;

    iput-object p5, p0, Ll/iv50;->e:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/iv50;->a:Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;

    iget-object v1, p0, Ll/iv50;->b:Ljava/util/List;

    iget-object v2, p0, Ll/iv50;->c:Lcom/p1/mobile/android/app/Act;

    iget-object v3, p0, Ll/iv50;->d:Lcom/p1/mobile/putong/data/User;

    iget-object p0, p0, Ll/iv50;->e:Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, v1, v2, v3, p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;->o(Lcom/p1/mobile/putong/core/ui/onlinematch/view/OnlineMatchNewUiHeadView;Ljava/util/List;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method
