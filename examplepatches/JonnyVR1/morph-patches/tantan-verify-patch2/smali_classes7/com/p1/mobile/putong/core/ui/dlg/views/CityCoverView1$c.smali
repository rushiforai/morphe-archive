.class public Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1$c;
.super Landroid/os/CountDownTimer;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;->k()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;JJ)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1$c;->a:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;

    .line 2
    .line 3
    invoke-direct {p0, p2, p3, p4, p5}, Landroid/os/CountDownTimer;-><init>(JJ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onFinish()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1$c;->a:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;->b(Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;)I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    add-int/lit8 v1, v1, 0x1

    .line 8
    .line 9
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;->c(Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;I)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1$c;->a:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;->b:Landroidx/viewpager/widget/ViewPager;

    .line 15
    .line 16
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;->d(Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    invoke-virtual {v0, p0}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public onTick(J)V
    .locals 0

    return-void
.end method
