.class public final synthetic Ll/vs50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

.field public final synthetic b:Ll/y20;

.field public final synthetic c:Z

.field public final synthetic d:Z

.field public final synthetic e:Lcom/p1/mobile/android/app/Act;

.field public final synthetic f:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;Ll/y20;ZZLcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vs50;->a:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    iput-object p2, p0, Ll/vs50;->b:Ll/y20;

    iput-boolean p3, p0, Ll/vs50;->c:Z

    iput-boolean p4, p0, Ll/vs50;->d:Z

    iput-object p5, p0, Ll/vs50;->e:Lcom/p1/mobile/android/app/Act;

    iput-object p6, p0, Ll/vs50;->f:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/vs50;->a:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    iget-object v1, p0, Ll/vs50;->b:Ll/y20;

    iget-boolean v2, p0, Ll/vs50;->c:Z

    iget-boolean v3, p0, Ll/vs50;->d:Z

    iget-object v4, p0, Ll/vs50;->e:Lcom/p1/mobile/android/app/Act;

    iget-object v5, p0, Ll/vs50;->f:Ljava/lang/String;

    move-object v6, p1

    check-cast v6, Lcom/p1/mobile/putong/data/User;

    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/core/ui/onlinematch/a;->n(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;Ll/y20;ZZLcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method
