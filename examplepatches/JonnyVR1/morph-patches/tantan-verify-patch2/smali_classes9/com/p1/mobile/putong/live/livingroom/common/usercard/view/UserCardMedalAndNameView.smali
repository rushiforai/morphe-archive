.class public Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/royal/LiveGradientTextView;

.field public b:Lv/VText;

.field public c:Lv/VImage;

.field public d:Lv/VLinear;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Landroid/widget/LinearLayout;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public k:Landroid/widget/TextView;

.field public l:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

.field public m:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

.field public n:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

.field public o:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

.field public p:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 6
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 7
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/n9k0;->a(Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->a:Lcom/p1/mobile/putong/live/livingroom/royal/LiveGradientTextView;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->b:Lv/VText;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->i:Lv/VText;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->h:Lv/VText;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->e:Lv/VText;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->f:Lv/VText;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->j:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 34
    .line 35
    const/16 v2, 0x8

    .line 36
    .line 37
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->g:Landroid/widget/LinearLayout;

    .line 41
    .line 42
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->k:Landroid/widget/TextView;

    .line 46
    .line 47
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x2

    .line 8
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, 0x0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->i:Lv/VText;

    .line 16
    .line 17
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->b:Lv/VText;

    .line 22
    .line 23
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/UserCardMedalAndNameView;->c:Lv/VImage;

    .line 27
    .line 28
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    return-void
.end method
