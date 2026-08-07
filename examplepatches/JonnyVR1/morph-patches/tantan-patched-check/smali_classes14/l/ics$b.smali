.class public Ll/ics$b;
.super Ll/x8e;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ics;->c3(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

.field public final synthetic c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

.field public final synthetic d:Ll/ics;


# direct methods
.method public constructor <init>(Ll/ics;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ics$b;->d:Ll/ics;

    .line 2
    .line 3
    iput-object p2, p0, Ll/ics$b;->a:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 4
    .line 5
    iput-object p3, p0, Ll/ics$b;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 6
    .line 7
    iput-object p4, p0, Ll/ics$b;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 8
    .line 9
    invoke-direct {p0}, Ll/x8e;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a(Ljava/io/File;)V
    .locals 3
    .param p1    # Ljava/io/File;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    iget-object p1, p0, Ll/ics$b;->d:Ll/ics;

    .line 2
    .line 3
    iget-object v0, p0, Ll/ics$b;->a:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 4
    .line 5
    iget-object v1, p0, Ll/ics$b;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 6
    .line 7
    iget-object v2, p0, Ll/ics$b;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 8
    .line 9
    invoke-static {p1, v0, v1, v2}, Ll/ics;->Y2(Ll/ics;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/ics$b;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 13
    .line 14
    invoke-static {p0}, Ll/muj;->k(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onFailed(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ics$b;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    invoke-static {p0}, Ll/muj;->j(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
