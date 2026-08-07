.class public Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;->e()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView$a;->a:Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView$a;->a:Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;->a:Landroid/widget/LinearLayout;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView$a;->a:Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;->b:Lcom/p1/mobile/putong/live/base/view/LiveFooterTipsView;

    .line 12
    .line 13
    const/16 v0, 0x8

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView$a;->a:Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;

    .line 19
    .line 20
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;->a(Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;)Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView$b;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView$a;->a:Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;

    .line 27
    .line 28
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;->a(Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView;)Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView$b;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-interface {p0}, Lcom/p1/mobile/putong/live/base/view/LoadMoreFooterView$b;->e()V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method
