.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter$b;
.super Ll/x8e;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter;->c4(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

.field public final synthetic c:J

.field public final synthetic d:Ll/e4d0;

.field public final synthetic e:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;JLl/e4d0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter$b;->e:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter$b;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter$b;->b:Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    .line 6
    .line 7
    iput-wide p4, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter$b;->c:J

    .line 8
    .line 9
    iput-object p6, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter$b;->d:Ll/e4d0;

    .line 10
    .line 11
    invoke-direct {p0}, Ll/x8e;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public a(Ljava/io/File;)V
    .locals 4
    .param p1    # Ljava/io/File;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter$b;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter$b;->b:Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/muj;->i(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter$b;->b:Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    .line 9
    .line 10
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->id:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    iget-wide v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter$b;->c:J

    .line 17
    .line 18
    sub-long/2addr v0, v2

    .line 19
    const/4 v2, 0x1

    .line 20
    const/4 v3, 0x0

    .line 21
    invoke-static {p1, v2, v3, v0, v1}, Ll/rre;->G(Ljava/lang/String;ZZJ)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter$b;->e:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter$b;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 27
    .line 28
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter;->V3(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public onFailed(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter$b;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter$b;->b:Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/muj;->h(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter$b;->b:Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    .line 9
    .line 10
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->id:Ljava/lang/String;

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    const-wide/16 v1, -0x1

    .line 14
    .line 15
    invoke-static {p1, v0, v0, v1, v2}, Ll/rre;->G(Ljava/lang/String;ZZJ)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter$b;->d:Ll/e4d0;

    .line 19
    .line 20
    invoke-static {p1}, Ll/rre;->f(Ll/e4d0;)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter$b;->e:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter$b;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 26
    .line 27
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter;->V3(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTraysPresenter;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method
