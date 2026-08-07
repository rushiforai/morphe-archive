.class public Lcom/p1/mobile/putong/live/livingroom/common/debugdialog/TracetItemView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/common/debugdialog/TracetItemView;

.field public b:Landroid/view/View;

.field public c:Landroid/widget/TextView;

.field public d:Lcom/p1/mobile/putong/live/livingroom/common/debugdialog/TraceView;


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

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/wej0;->a(Lcom/p1/mobile/putong/live/livingroom/common/debugdialog/TracetItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(Ll/aej0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/debugdialog/TracetItemView;->c:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/aej0;->b()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/debugdialog/TracetItemView;->d:Lcom/p1/mobile/putong/live/livingroom/common/debugdialog/TraceView;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/debugdialog/TraceView;->a(Ll/aej0;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/debugdialog/TracetItemView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
