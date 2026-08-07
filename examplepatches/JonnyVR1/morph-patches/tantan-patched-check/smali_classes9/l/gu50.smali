.class public final synthetic Ll/gu50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Z

.field public final synthetic d:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;Lcom/p1/mobile/android/app/Act;ZLl/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gu50;->a:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    iput-object p2, p0, Ll/gu50;->b:Lcom/p1/mobile/android/app/Act;

    iput-boolean p3, p0, Ll/gu50;->c:Z

    iput-object p4, p0, Ll/gu50;->d:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/gu50;->a:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    iget-object v1, p0, Ll/gu50;->b:Lcom/p1/mobile/android/app/Act;

    iget-boolean v2, p0, Ll/gu50;->c:Z

    iget-object p0, p0, Ll/gu50;->d:Ll/y20;

    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->f(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;Lcom/p1/mobile/android/app/Act;ZLl/y20;)V

    return-void
.end method
