.class public Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView$a;,
        Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView$b;
    }
.end annotation


# instance fields
.field public a:Lv/VLinear;

.field public b:Lv/VCheckBox;

.field public c:Lv/VDraweeView;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Ll/dek;

.field public g:Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView$b;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 6
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

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

    .line 7
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView;Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView;->h(Landroid/widget/CompoundButton;Z)V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView;Lv/VLinear;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView;->a:Lv/VLinear;

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView;Lv/VDraweeView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView;->c:Lv/VDraweeView;

    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView;->d:Lv/VText;

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView;Lv/VCheckBox;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView;->b:Lv/VCheckBox;

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView;->e:Lv/VText;

    return-void
.end method


# virtual methods
.method public final g(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView$a;->a(Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic h(Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView;->g:Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView$b;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView;->g:Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView$b;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView;->f:Ll/dek;

    .line 12
    .line 13
    invoke-interface {p1, p0, p2}, Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView$b;->d(Ll/dek;Z)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public i(Ll/dek;IZ)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView;->f:Ll/dek;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView;->a:Lv/VLinear;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView;->e:Lv/VText;

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
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView;->a:Lv/VLinear;

    .line 18
    .line 19
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView;->b:Lv/VCheckBox;

    .line 23
    .line 24
    invoke-virtual {p2, p3}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 25
    .line 26
    .line 27
    iget-boolean p2, p1, Ll/dek;->d:Z

    .line 28
    .line 29
    if-eqz p2, :cond_0

    .line 30
    .line 31
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 32
    .line 33
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView;->c:Lv/VDraweeView;

    .line 34
    .line 35
    iget-object v0, p1, Ll/dek;->h:Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    .line 36
    .line 37
    invoke-static {v0}, Ll/jek;->j(Lcom/p1/mobile/putong/core/data/ChatGroupMember;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p2, p3, v0}, Ll/fsb0;->Z0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 46
    .line 47
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView;->c:Lv/VDraweeView;

    .line 48
    .line 49
    iget-object v0, p1, Ll/dek;->c:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {p2, p3, v0}, Ll/fsb0;->Z0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView;->d:Lv/VText;

    .line 55
    .line 56
    iget-object p1, p1, Ll/dek;->b:Ljava/lang/String;

    .line 57
    .line 58
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_1
    if-ne p2, v0, :cond_2

    .line 63
    .line 64
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView;->e:Lv/VText;

    .line 65
    .line 66
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 67
    .line 68
    .line 69
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView;->e:Lv/VText;

    .line 70
    .line 71
    iget-object p1, p1, Ll/dek;->f:Ljava/lang/String;

    .line 72
    .line 73
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 74
    .line 75
    .line 76
    :cond_2
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView;->g(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView;->b:Lv/VCheckBox;

    .line 8
    .line 9
    new-instance v1, Ll/ujk;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/ujk;-><init>(Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public setOnGroupMemberRemoveChangeListener(Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView;->g:Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView$b;

    .line 2
    .line 3
    return-void
.end method
