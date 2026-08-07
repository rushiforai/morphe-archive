.class public final synthetic Ll/r08;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/NotificationStatus;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/NotificationStatus;

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(ZLcom/p1/mobile/putong/core/data/NotificationStatus;Lcom/p1/mobile/putong/core/data/NotificationStatus;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/r08;->a:Z

    iput-object p2, p0, Ll/r08;->b:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    iput-object p3, p0, Ll/r08;->c:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    iput-boolean p4, p0, Ll/r08;->d:Z

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/r08;->a:Z

    iget-object v1, p0, Ll/r08;->b:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    iget-object v2, p0, Ll/r08;->c:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    iget-boolean p0, p0, Ll/r08;->d:Z

    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/core/api/g;->p6(ZLcom/p1/mobile/putong/core/data/NotificationStatus;Lcom/p1/mobile/putong/core/data/NotificationStatus;Z)V

    return-void
.end method
