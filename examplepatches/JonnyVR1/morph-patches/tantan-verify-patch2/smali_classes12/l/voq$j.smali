.class Ll/voq$j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/voq;->d2(Lcom/momo/mcamera/mask/MaskModel;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/momo/mcamera/mask/MaskModel;

.field final synthetic b:Lcom/momo/mcamera/mask/Sticker;

.field final synthetic c:Ll/voq;


# direct methods
.method public constructor <init>(Ll/voq;Lcom/momo/mcamera/mask/MaskModel;Lcom/momo/mcamera/mask/Sticker;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/voq$j;->c:Ll/voq;

    .line 2
    .line 3
    iput-object p2, p0, Ll/voq$j;->a:Lcom/momo/mcamera/mask/MaskModel;

    .line 4
    .line 5
    iput-object p3, p0, Ll/voq$j;->b:Lcom/momo/mcamera/mask/Sticker;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/voq$j;->c:Ll/voq;

    .line 2
    .line 3
    invoke-static {v0}, Ll/voq;->Y1(Ll/voq;)Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/voq$j;->c:Ll/voq;

    .line 10
    .line 11
    invoke-static {v0}, Ll/voq;->Y1(Ll/voq;)Lcom/momo/mcamera/mask/LiveLightningEngineFilter;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Ll/voq$j;->a:Lcom/momo/mcamera/mask/MaskModel;

    .line 16
    .line 17
    iget-object v2, p0, Ll/voq$j;->b:Lcom/momo/mcamera/mask/Sticker;

    .line 18
    .line 19
    invoke-static {v1, v2}, Ll/h6x;->c(Lcom/momo/mcamera/mask/MaskModel;Lcom/momo/mcamera/mask/Sticker;)Lcom/momo/xeengine/lightningrender/StickerModel;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iget-object p0, p0, Ll/voq$j;->c:Ll/voq;

    .line 24
    .line 25
    invoke-virtual {v0, v1, p0}, Lcom/momo/mcamera/mask/LiveLightningEngineFilter;->addEnginStickerModel(Lcom/momo/xeengine/lightningrender/StickerModel;Lcom/momo/xeengine/lightningrender/ILightningRender$StickerListener;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method
