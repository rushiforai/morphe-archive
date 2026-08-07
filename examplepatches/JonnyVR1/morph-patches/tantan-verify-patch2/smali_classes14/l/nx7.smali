.class public final synthetic Ll/nx7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;

.field public final synthetic b:Z

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/NotificationStatus;

.field public final synthetic d:Lcom/p1/mobile/putong/core/data/NotificationStatus;

.field public final synthetic e:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;ZLcom/p1/mobile/putong/core/data/NotificationStatus;Lcom/p1/mobile/putong/core/data/NotificationStatus;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nx7;->a:Lcom/p1/mobile/putong/core/api/g;

    iput-boolean p2, p0, Ll/nx7;->b:Z

    iput-object p3, p0, Ll/nx7;->c:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    iput-object p4, p0, Ll/nx7;->d:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    iput-boolean p5, p0, Ll/nx7;->e:Z

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/nx7;->a:Lcom/p1/mobile/putong/core/api/g;

    iget-boolean v1, p0, Ll/nx7;->b:Z

    iget-object v2, p0, Ll/nx7;->c:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    iget-object v3, p0, Ll/nx7;->d:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    iget-boolean p0, p0, Ll/nx7;->e:Z

    invoke-static {v0, v1, v2, v3, p0}, Lcom/p1/mobile/putong/core/api/g;->Va(Lcom/p1/mobile/putong/core/api/g;ZLcom/p1/mobile/putong/core/data/NotificationStatus;Lcom/p1/mobile/putong/core/data/NotificationStatus;Z)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
