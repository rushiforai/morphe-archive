.class public final synthetic Ll/vt50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vt50;->a:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    iput-object p2, p0, Ll/vt50;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/vt50;->c:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/vt50;->a:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    iget-object v1, p0, Ll/vt50;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/vt50;->c:Lcom/p1/mobile/android/app/Act;

    check-cast p1, Ll/pf60;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->e(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ll/pf60;)V

    return-void
.end method
