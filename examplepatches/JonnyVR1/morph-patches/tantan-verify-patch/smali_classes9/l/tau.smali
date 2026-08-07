.class public final synthetic Ll/tau;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/alibaba/fastjson/JSONArray;


# direct methods
.method public synthetic constructor <init>(Lcom/alibaba/fastjson/JSONArray;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tau;->a:Lcom/alibaba/fastjson/JSONArray;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tau;->a:Lcom/alibaba/fastjson/JSONArray;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->p(Lcom/alibaba/fastjson/JSONArray;Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;)V

    return-void
.end method
