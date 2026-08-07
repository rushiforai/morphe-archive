.class public final synthetic Ll/kz7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/NotificationStatus;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/NotificationStatus;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/NotificationStatus;Lcom/p1/mobile/putong/core/data/NotificationStatus;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kz7;->a:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    iput-object p2, p0, Ll/kz7;->b:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    iput-object p3, p0, Ll/kz7;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/kz7;->a:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    iget-object v1, p0, Ll/kz7;->b:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    iget-object p0, p0, Ll/kz7;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/api/g;->a9(Lcom/p1/mobile/putong/core/data/NotificationStatus;Lcom/p1/mobile/putong/core/data/NotificationStatus;Ljava/lang/String;)V

    return-void
.end method
