.class public Lcom/p1/mobile/putong/core/ui/messages/group/at/GroupAtItemViewContent;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/LinearLayout;

.field public b:Lv/VDraweeView;

.field public c:Landroid/widget/TextView;

.field public d:Landroid/widget/TextView;

.field public e:Ll/wdk;

.field public f:Ll/dek;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

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

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/messages/group/at/GroupAtItemViewContent;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/group/at/GroupAtItemViewContent;->c(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ydk;->a(Lcom/p1/mobile/putong/core/ui/messages/group/at/GroupAtItemViewContent;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic c(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/group/at/GroupAtItemViewContent;->e:Ll/wdk;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/group/at/GroupAtItemViewContent;->e:Ll/wdk;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/group/at/GroupAtItemViewContent;->f:Ll/dek;

    .line 12
    .line 13
    invoke-interface {p1, p0}, Ll/wdk;->a(Ll/dek;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public d(Ll/dek;I)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/group/at/GroupAtItemViewContent;->f:Ll/dek;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/group/at/GroupAtItemViewContent;->a:Landroid/widget/LinearLayout;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/group/at/GroupAtItemViewContent;->d:Landroid/widget/TextView;

    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    if-nez p2, :cond_1

    .line 16
    .line 17
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/group/at/GroupAtItemViewContent;->a:Landroid/widget/LinearLayout;

    .line 18
    .line 19
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-boolean p2, p1, Ll/dek;->d:Z

    .line 23
    .line 24
    if-eqz p2, :cond_0

    .line 25
    .line 26
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/group/at/GroupAtItemViewContent;->b:Lv/VDraweeView;

    .line 29
    .line 30
    iget-object v1, p1, Ll/dek;->h:Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    .line 31
    .line 32
    invoke-static {v1}, Ll/jek;->j(Lcom/p1/mobile/putong/core/data/ChatGroupMember;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {p2, v0, v1}, Ll/fsb0;->Z0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/group/at/GroupAtItemViewContent;->b:Lv/VDraweeView;

    .line 43
    .line 44
    iget-object v1, p1, Ll/dek;->c:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {p2, v0, v1}, Ll/fsb0;->Z0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/group/at/GroupAtItemViewContent;->c:Landroid/widget/TextView;

    .line 50
    .line 51
    iget-object p1, p1, Ll/dek;->b:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_1
    if-ne p2, v0, :cond_2

    .line 58
    .line 59
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/group/at/GroupAtItemViewContent;->d:Landroid/widget/TextView;

    .line 60
    .line 61
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 62
    .line 63
    .line 64
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/group/at/GroupAtItemViewContent;->d:Landroid/widget/TextView;

    .line 65
    .line 66
    iget-object p1, p1, Ll/dek;->f:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_2
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/group/at/GroupAtItemViewContent;->a:Landroid/widget/LinearLayout;

    .line 73
    .line 74
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 75
    .line 76
    .line 77
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 78
    .line 79
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/group/at/GroupAtItemViewContent;->b:Lv/VDraweeView;

    .line 80
    .line 81
    sget v1, Ll/ibc0;->H0:I

    .line 82
    .line 83
    invoke-virtual {p2, v0, v1}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 84
    .line 85
    .line 86
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/group/at/GroupAtItemViewContent;->c:Landroid/widget/TextView;

    .line 87
    .line 88
    iget-object p1, p1, Ll/dek;->f:Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/group/at/GroupAtItemViewContent;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/group/at/GroupAtItemViewContent;->a:Landroid/widget/LinearLayout;

    .line 8
    .line 9
    new-instance v1, Ll/xdk;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/xdk;-><init>(Lcom/p1/mobile/putong/core/ui/messages/group/at/GroupAtItemViewContent;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public setItemClickListener(Ll/wdk;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/group/at/GroupAtItemViewContent;->e:Ll/wdk;

    .line 2
    .line 3
    return-void
.end method
