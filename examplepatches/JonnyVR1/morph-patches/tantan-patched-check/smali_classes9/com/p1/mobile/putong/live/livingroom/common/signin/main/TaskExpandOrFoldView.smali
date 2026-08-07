.class public Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskExpandOrFoldView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/LinearLayout;

.field public b:Lv/VText;

.field public c:Lv/VImage;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/coi0;->a(Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskExpandOrFoldView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(ZZZ)V
    .locals 0

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskExpandOrFoldView;->b:Lv/VText;

    .line 8
    .line 9
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Hd:I

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const/4 p3, 0x1

    .line 16
    invoke-static {p0, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskExpandOrFoldView;->b:Lv/VText;

    .line 20
    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Hd:I

    .line 24
    .line 25
    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setText(I)V

    .line 26
    .line 27
    .line 28
    sget p1, Ll/obc0;->p8:I

    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_1
    if-eqz p2, :cond_2

    .line 32
    .line 33
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Id:I

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_2
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Nd:I

    .line 37
    .line 38
    :goto_0
    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setText(I)V

    .line 39
    .line 40
    .line 41
    sget p1, Ll/obc0;->n8:I

    .line 42
    .line 43
    :goto_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskExpandOrFoldView;->c:Lv/VImage;

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskExpandOrFoldView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
