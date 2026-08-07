.class public final synthetic Ll/o160;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/t160;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;


# direct methods
.method public synthetic constructor <init>(Ll/t160;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/o160;->a:Ll/t160;

    iput-object p2, p0, Ll/o160;->b:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/o160;->a:Ll/t160;

    iget-object p0, p0, Ll/o160;->b:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    check-cast p1, Ljava/lang/Integer;

    invoke-static {v0, p0, p1}, Ll/t160;->d4(Ll/t160;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;Ljava/lang/Integer;)V

    return-void
.end method
