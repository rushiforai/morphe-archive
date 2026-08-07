.class public final synthetic Ll/w160;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/zod;

.field public final synthetic b:Ll/fat;

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveOperation;


# direct methods
.method public synthetic constructor <init>(Ll/zod;Ll/fat;Lcom/p1/mobile/putong/live/base/data/BLiveOperation;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w160;->a:Ll/zod;

    iput-object p2, p0, Ll/w160;->b:Ll/fat;

    iput-object p3, p0, Ll/w160;->c:Lcom/p1/mobile/putong/live/base/data/BLiveOperation;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/w160;->a:Ll/zod;

    iget-object v1, p0, Ll/w160;->b:Ll/fat;

    iget-object p0, p0, Ll/w160;->c:Lcom/p1/mobile/putong/live/base/data/BLiveOperation;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    invoke-static {v0, v1, p0, p1}, Ll/y160;->B(Ll/zod;Ll/fat;Lcom/p1/mobile/putong/live/base/data/BLiveOperation;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)V

    return-void
.end method
