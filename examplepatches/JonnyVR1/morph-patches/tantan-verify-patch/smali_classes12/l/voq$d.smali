.class Ll/voq$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;


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
    iput-object p1, p0, Ll/voq$d;->a:Ll/voq;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public distortionStateChanged(ZFFFF)V
    .locals 0

    .line 1
    return-void
.end method

.method public faceDetected(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public playStateChanged(IZ)V
    .locals 0

    .line 1
    return-void
.end method

.method public stickerGestureTypeChanged(Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/voq$d;->a:Ll/voq;

    .line 10
    .line 11
    invoke-static {p0}, Ll/voq;->W1(Ll/voq;)Ll/bul;

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public stickerStateChanged(II)V
    .locals 0

    .line 1
    if-lez p1, :cond_0

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/voq$d;->a:Ll/voq;

    .line 6
    .line 7
    invoke-static {p0}, Ll/voq;->W1(Ll/voq;)Ll/bul;

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method
