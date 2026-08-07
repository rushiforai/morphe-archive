.class Ll/voq$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/mcamera/mask/StickerAdjustFilter$StickerMaskFinishListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/voq;->l2()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/voq;


# direct methods
.method public constructor <init>(Ll/voq;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/voq$b;->a:Ll/voq;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public stickerRenderFinished(ILcom/momo/mcamera/mask/Sticker;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/voq$b;->a:Ll/voq;

    .line 2
    .line 3
    invoke-static {v0}, Ll/voq;->V1(Ll/voq;)Ll/dul;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/voq$b;->a:Ll/voq;

    .line 10
    .line 11
    invoke-static {p0}, Ll/voq;->V1(Ll/voq;)Ll/dul;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0, p1, p2}, Ll/dul;->a(ILcom/momo/mcamera/mask/Sticker;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method
