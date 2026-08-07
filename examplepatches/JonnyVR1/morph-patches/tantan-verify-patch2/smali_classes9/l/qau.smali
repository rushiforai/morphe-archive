.class public final synthetic Ll/qau;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;

.field public final synthetic b:J


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qau;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;

    iput-wide p2, p0, Ll/qau;->b:J

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/qau;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;

    iget-wide v1, p0, Ll/qau;->b:J

    check-cast p1, Ljava/util/List;

    invoke-static {v0, v1, v2, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->b(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;JLjava/util/List;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
