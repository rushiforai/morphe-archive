.class public final synthetic Ll/bhs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/nhs;

.field public final synthetic b:Ll/xbe;

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;


# direct methods
.method public synthetic constructor <init>(Ll/nhs;Ll/xbe;Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bhs;->a:Ll/nhs;

    iput-object p2, p0, Ll/bhs;->b:Ll/xbe;

    iput-object p3, p0, Ll/bhs;->c:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bhs;->a:Ll/nhs;

    iget-object v1, p0, Ll/bhs;->b:Ll/xbe;

    iget-object p0, p0, Ll/bhs;->c:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    invoke-static {v0, v1, p0, p1}, Ll/nhs;->j(Ll/nhs;Ll/xbe;Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    return-void
.end method
