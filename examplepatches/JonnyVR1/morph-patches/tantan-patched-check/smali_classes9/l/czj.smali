.class public final synthetic Ll/czj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ezj;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;


# direct methods
.method public synthetic constructor <init>(Ll/ezj;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/czj;->a:Ll/ezj;

    iput-object p2, p0, Ll/czj;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/czj;->c:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/czj;->a:Ll/ezj;

    iget-object v1, p0, Ll/czj;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/czj;->c:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    invoke-static {v0, v1, p0, p1}, Ll/ezj;->O3(Ll/ezj;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    return-void
.end method
