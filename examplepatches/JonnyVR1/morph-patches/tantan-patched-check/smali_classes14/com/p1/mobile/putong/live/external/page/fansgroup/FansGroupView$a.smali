.class public Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView;->B(Lcom/p1/mobile/putong/live/base/apibean/FanbaseGroupsBean;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView$a;->a:Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView$a;->a:Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView;->p(Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView;)Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView$b;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView$a;->a:Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView;

    .line 10
    .line 11
    const-string v0, "0"

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView;->H(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView$a;->a:Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView;

    .line 17
    .line 18
    invoke-static {p0}, Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView;->p(Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView;)Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView$b;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-interface {p0}, Lcom/p1/mobile/putong/live/external/page/fansgroup/FansGroupView$b;->a()V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method
