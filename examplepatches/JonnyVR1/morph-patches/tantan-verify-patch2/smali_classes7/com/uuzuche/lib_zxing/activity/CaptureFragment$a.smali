.class Lcom/uuzuche/lib_zxing/activity/CaptureFragment$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/media/MediaPlayer$OnCompletionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/uuzuche/lib_zxing/activity/CaptureFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/uuzuche/lib_zxing/activity/CaptureFragment;


# direct methods
.method public constructor <init>(Lcom/uuzuche/lib_zxing/activity/CaptureFragment;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/uuzuche/lib_zxing/activity/CaptureFragment$a;->a:Lcom/uuzuche/lib_zxing/activity/CaptureFragment;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onCompletion(Landroid/media/MediaPlayer;)V
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-virtual {p1, p0}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method
