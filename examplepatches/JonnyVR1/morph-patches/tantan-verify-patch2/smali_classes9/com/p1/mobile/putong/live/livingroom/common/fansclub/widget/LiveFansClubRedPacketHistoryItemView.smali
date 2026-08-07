.class public Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketHistoryItemView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lv/VDraweeView;

.field public e:Lv/VText;

.field public f:Landroid/view/View;

.field public g:Lv/VDraweeView;

.field public h:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketHistoryItemView;->h:Lrx/subjects/b;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final h0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ods;->a(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketHistoryItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public i0(Ll/zsc0$a;Ll/ner;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketHistoryItemView;->d:Lv/VDraweeView;

    .line 2
    .line 3
    iget-object v1, p1, Ll/zsc0$a;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageURI(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketHistoryItemView;->g:Lv/VDraweeView;

    .line 9
    .line 10
    iget-object v1, p1, Ll/zsc0$a;->b:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageURI(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketHistoryItemView;->e:Lv/VText;

    .line 16
    .line 17
    iget-object v1, p1, Ll/zsc0$a;->c:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Ll/zsc0$a;->e()Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketHistoryItemView;->h:Lrx/subjects/b;

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Lrx/c;->takeUntil(Lrx/c;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-interface {p2, p1}, Ll/ner;->duringCreated(Lrx/c;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketHistoryItemView;->f:Landroid/view/View;

    .line 37
    .line 38
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    new-instance p2, Ll/nds;

    .line 42
    .line 43
    invoke-direct {p2, p0}, Ll/nds;-><init>(Landroid/view/View;)V

    .line 44
    .line 45
    .line 46
    invoke-static {p2}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketHistoryItemView;->h:Lrx/subjects/b;

    .line 5
    .line 6
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubRedPacketHistoryItemView;->h0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
