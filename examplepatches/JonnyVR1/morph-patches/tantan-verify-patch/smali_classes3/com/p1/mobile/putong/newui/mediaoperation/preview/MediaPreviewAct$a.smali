.class public Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$j;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->D2()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$a;->a:Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .locals 0

    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    return-void
.end method

.method public onPageSelected(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$a;->a:Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->x:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$a;->a:Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;

    .line 12
    .line 13
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->p2(Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;Lcom/p1/mobile/putong/data/Media;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$a;->a:Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->A2()Ljava/util/ArrayList;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$a;->a:Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;

    .line 29
    .line 30
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->q2(Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;Lcom/p1/mobile/putong/data/Media;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct$a;->a:Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;

    .line 34
    .line 35
    invoke-static {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->o2(Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;)Ll/fme0;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 40
    .line 41
    .line 42
    return-void
.end method
