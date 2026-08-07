.class public final synthetic Ll/kau;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/gcg0;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;Ljava/lang/String;Ll/gcg0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kau;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;

    iput-object p2, p0, Ll/kau;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/kau;->c:Ll/gcg0;

    iput-object p4, p0, Ll/kau;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/kau;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;

    iget-object v1, p0, Ll/kau;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/kau;->c:Ll/gcg0;

    iget-object v3, p0, Ll/kau;->d:Ljava/lang/String;

    move-object v4, p1

    check-cast v4, Lcom/p1/mobile/putong/ui/download/DownloadTask;

    move-object v5, p2

    check-cast v5, Ljava/lang/Throwable;

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->d(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;Ljava/lang/String;Ll/gcg0;Ljava/lang/String;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/lang/Throwable;)V

    return-void
.end method
