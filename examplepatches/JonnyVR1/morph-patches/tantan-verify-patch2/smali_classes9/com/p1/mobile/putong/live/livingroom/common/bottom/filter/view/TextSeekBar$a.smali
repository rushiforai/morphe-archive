.class public Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar;->f()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar;

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
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar;

    .line 2
    .line 3
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar;->e(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar;Landroid/widget/SeekBar;I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar;->d(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar;)Landroid/widget/SeekBar$OnSeekBarChangeListener;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar;

    .line 19
    .line 20
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar;->d(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar;)Landroid/widget/SeekBar$OnSeekBarChangeListener;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-interface {p0, p1, p2, p3}, Landroid/widget/SeekBar$OnSeekBarChangeListener;->onProgressChanged(Landroid/widget/SeekBar;IZ)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar;->c(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar;)Lv/VText;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar;->b(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar;)Ljava/lang/Runnable;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar;

    .line 21
    .line 22
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar;->d(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar;)Landroid/widget/SeekBar$OnSeekBarChangeListener;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar;

    .line 33
    .line 34
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar;->d(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar;)Landroid/widget/SeekBar$OnSeekBarChangeListener;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-interface {p0, p1}, Landroid/widget/SeekBar$OnSeekBarChangeListener;->onStartTrackingTouch(Landroid/widget/SeekBar;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar;

    .line 8
    .line 9
    invoke-static {v1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar;->b(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar;)Ljava/lang/Runnable;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-wide/16 v2, 0x12c

    .line 14
    .line 15
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar;->d(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar;)Landroid/widget/SeekBar$OnSeekBarChangeListener;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar;

    .line 31
    .line 32
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar;->d(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/TextSeekBar;)Landroid/widget/SeekBar$OnSeekBarChangeListener;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-interface {p0, p1}, Landroid/widget/SeekBar$OnSeekBarChangeListener;->onStopTrackingTouch(Landroid/widget/SeekBar;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method
