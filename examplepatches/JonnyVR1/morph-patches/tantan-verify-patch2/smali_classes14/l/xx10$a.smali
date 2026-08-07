.class public Ll/xx10$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/xx10;->o(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/xx10;


# direct methods
.method public constructor <init>(Ll/xx10;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xx10$a;->a:Ll/xx10;

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
    iget-object p0, p0, Ll/xx10$a;->a:Ll/xx10;

    .line 2
    .line 3
    invoke-static {p0}, Ll/xx10;->l(Ll/xx10;)Ll/c020;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    int-to-float p1, p2

    .line 8
    const/high16 p2, 0x42c80000    # 100.0f

    .line 9
    .line 10
    div-float/2addr p1, p2

    .line 11
    invoke-virtual {p0, p1}, Ll/c020;->C2(F)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xx10$a;->a:Ll/xx10;

    .line 2
    .line 3
    invoke-static {p0}, Ll/xx10;->k(Ll/xx10;)Ljava/lang/Runnable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p1, p0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/xx10$a;->a:Ll/xx10;

    .line 2
    .line 3
    invoke-static {p0}, Ll/xx10;->k(Ll/xx10;)Ljava/lang/Runnable;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-wide/16 v0, 0x3e8

    .line 8
    .line 9
    invoke-virtual {p1, p0, v0, v1}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method
