.class public Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->h()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView$a;->a:Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView$a;->a:Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;

    .line 2
    .line 3
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->f(Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;I)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView$a;->a:Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;

    .line 7
    .line 8
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->e(Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;)I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView$a;->a:Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;

    .line 13
    .line 14
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->d(Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;)I

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView$a;->a:Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;

    .line 19
    .line 20
    if-eq p1, p2, :cond_0

    .line 21
    .line 22
    iget-object p1, p3, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->c:Landroid/widget/ImageView;

    .line 23
    .line 24
    sget p2, Ll/lbc0;->D5:I

    .line 25
    .line 26
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    iget-object p1, p3, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->c:Landroid/widget/ImageView;

    .line 31
    .line 32
    sget p2, Ll/lbc0;->E5:I

    .line 33
    .line 34
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 35
    .line 36
    .line 37
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView$a;->a:Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;

    .line 38
    .line 39
    iget-object p2, p1, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->e:Landroid/widget/TextView;

    .line 40
    .line 41
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->e(Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;)I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView$a;->a:Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;

    .line 53
    .line 54
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->g:Ll/kz10;

    .line 55
    .line 56
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-eqz p1, :cond_1

    .line 61
    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView$a;->a:Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;

    .line 63
    .line 64
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->g:Ll/kz10;

    .line 65
    .line 66
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;->e(Lcom/p1/mobile/putong/feed/newui/camera/IVMusicVolumeEditView;)I

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    div-int/lit8 p0, p0, 0x2

    .line 71
    .line 72
    invoke-interface {p1, p0}, Ll/kz10;->b(I)V

    .line 73
    .line 74
    .line 75
    :cond_1
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
