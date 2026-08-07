.class public Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubTaskModelView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lv/VText;

.field public c:Lv/VText;

.field public d:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ces;->a(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubTaskModelView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/live/base/data/BLiveTask;)V
    .locals 3
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveTask;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubTaskModelView;->a:Lv/VDraweeView;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTask;->iconUrl:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    xor-int/lit8 v1, v1, 0x1

    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubTaskModelView;->a:Lv/VDraweeView;

    .line 15
    .line 16
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTask;->iconUrl:Ljava/lang/String;

    .line 17
    .line 18
    const-string v2, "context_livingAct"

    .line 19
    .line 20
    invoke-static {v2, v0, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubTaskModelView;->b:Lv/VText;

    .line 24
    .line 25
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTask;->title:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubTaskModelView;->c:Lv/VText;

    .line 31
    .line 32
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTask;->score:J

    .line 33
    .line 34
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTask;->unit:Ljava/lang/String;

    .line 39
    .line 40
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    const-string v2, "%d%s"

    .line 45
    .line 46
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubTaskModelView;->d:Lv/VText;

    .line 54
    .line 55
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTask;->btnText:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    .line 59
    .line 60
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTask;->done:Z

    .line 61
    .line 62
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubTaskModelView;->d:Lv/VText;

    .line 63
    .line 64
    const/4 v1, -0x1

    .line 65
    if-eqz p1, :cond_0

    .line 66
    .line 67
    sget p1, Ll/obc0;->S:I

    .line 68
    .line 69
    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 70
    .line 71
    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubTaskModelView;->d:Lv/VText;

    .line 73
    .line 74
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_0
    sget p1, Ll/obc0;->A0:I

    .line 79
    .line 80
    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 81
    .line 82
    .line 83
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubTaskModelView;->d:Lv/VText;

    .line 84
    .line 85
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubTaskModelView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
