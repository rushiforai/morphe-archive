.class public Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VText;

.field public b:Lv/VLinear;

.field public c:Lv/VImage;

.field public d:Lv/VText;

.field public e:Lv/VLinear;

.field public f:Lv/VLinear;

.field public g:Lv/VText;

.field public h:Landroid/view/View;

.field public i:Lv/VText;

.field public j:Lv/VText;

.field public k:Lv/VLinear;

.field public l:Lv/VDraweeView;

.field public m:Lv/VDraweeView;

.field public n:Landroid/widget/TextView;

.field public o:Lv/VText;

.field public p:Lv/VDraweeView;

.field public q:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

.field public r:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

.field public s:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

.field public t:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;


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
    invoke-static {p0, p1}, Ll/ldm0;->a(Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->a:Lv/VText;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->o:Lv/VText;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->p:Lv/VDraweeView;

    .line 14
    .line 15
    const/16 v1, 0x8

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->k:Lv/VLinear;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->f:Lv/VLinear;

    .line 26
    .line 27
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
