.class public Ll/kh0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/rn20;

.field public final b:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

.field public final c:I

.field public final d:I

.field public final e:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

.field public final f:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/decoration/MediaItemRenderDecoration;


# direct methods
.method public constructor <init>(Ll/rn20;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/decoration/MediaItemRenderDecoration;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/kh0;->a:Ll/rn20;

    .line 5
    .line 6
    iput-object p2, p0, Ll/kh0;->b:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 7
    .line 8
    invoke-virtual {p3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->getMaxImageSelectCount()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    iput p1, p0, Ll/kh0;->c:I

    .line 13
    .line 14
    invoke-virtual {p3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;->getMaxVideoSelectCount()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iput p1, p0, Ll/kh0;->d:I

    .line 19
    .line 20
    iput-object p3, p0, Ll/kh0;->e:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 21
    .line 22
    iput-object p4, p0, Ll/kh0;->f:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/decoration/MediaItemRenderDecoration;

    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public a()Ll/rn20;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kh0;->a:Ll/rn20;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()I
    .locals 0

    .line 1
    iget p0, p0, Ll/kh0;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public c()I
    .locals 0

    .line 1
    iget p0, p0, Ll/kh0;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public d()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kh0;->b:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    .line 2
    .line 3
    return-object p0
.end method
