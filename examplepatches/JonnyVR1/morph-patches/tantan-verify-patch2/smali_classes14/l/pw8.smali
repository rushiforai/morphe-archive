.class public final synthetic Ll/pw8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/j;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/NotificationStatus;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/NotificationStatus;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/j;Lcom/p1/mobile/putong/core/data/NotificationStatus;Lcom/p1/mobile/putong/core/data/NotificationStatus;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pw8;->a:Lcom/p1/mobile/putong/core/api/j;

    iput-object p2, p0, Ll/pw8;->b:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    iput-object p3, p0, Ll/pw8;->c:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    iput-object p4, p0, Ll/pw8;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/pw8;->a:Lcom/p1/mobile/putong/core/api/j;

    iget-object v1, p0, Ll/pw8;->b:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    iget-object v2, p0, Ll/pw8;->c:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    iget-object p0, p0, Ll/pw8;->d:Ljava/lang/String;

    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/core/api/j;->r4(Lcom/p1/mobile/putong/core/api/j;Lcom/p1/mobile/putong/core/data/NotificationStatus;Lcom/p1/mobile/putong/core/data/NotificationStatus;Ljava/lang/String;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
