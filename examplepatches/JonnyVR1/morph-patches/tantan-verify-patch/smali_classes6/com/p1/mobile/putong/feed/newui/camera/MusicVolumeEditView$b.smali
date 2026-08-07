.class public Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->g()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView$b;->a:Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView$b;->a:Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;

    .line 2
    .line 3
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->d(Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;I)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView$b;->a:Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;

    .line 7
    .line 8
    iget-object p2, p1, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->g:Landroid/widget/TextView;

    .line 9
    .line 10
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->b(Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;)I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView$b;->a:Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;

    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->h:Ll/kz10;

    .line 24
    .line 25
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView$b;->a:Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;

    .line 32
    .line 33
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->h:Ll/kz10;

    .line 34
    .line 35
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->b(Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;)I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    div-int/lit8 p0, p0, 0x2

    .line 40
    .line 41
    invoke-interface {p1, p0}, Ll/kz10;->b(I)V

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method
