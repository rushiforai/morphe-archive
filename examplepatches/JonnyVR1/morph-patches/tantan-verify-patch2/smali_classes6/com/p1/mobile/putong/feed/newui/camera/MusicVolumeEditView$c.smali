.class public Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


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
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView$c;->a:Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView$c;->a:Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->b:Landroid/widget/TextView;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView$c;->a:Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->b:Landroid/widget/TextView;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/high16 v1, 0x42a80000    # 84.0f

    .line 20
    .line 21
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView$c;->a:Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;

    .line 30
    .line 31
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->b:Landroid/widget/TextView;

    .line 32
    .line 33
    invoke-virtual {v1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v1, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView$c;->a:Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;

    .line 41
    .line 42
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->b:Landroid/widget/TextView;

    .line 43
    .line 44
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    check-cast v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 49
    .line 50
    iput v0, v1, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView$c;->a:Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;

    .line 53
    .line 54
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->b:Landroid/widget/TextView;

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView$c;->a:Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;

    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicVolumeEditView;->e:Landroid/widget/TextView;

    .line 62
    .line 63
    invoke-virtual {p0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 64
    .line 65
    .line 66
    :cond_0
    return-void
.end method
