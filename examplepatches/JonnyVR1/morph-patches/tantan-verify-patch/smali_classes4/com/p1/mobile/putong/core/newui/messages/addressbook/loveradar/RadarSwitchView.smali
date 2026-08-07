.class public Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VLinear;

.field public b:Lv/VImage;

.field public c:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public d:Lv/VText;

.field public e:Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;

.field public f:Ljava/lang/String;

.field public g:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 10
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 9
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const-string p1, "close"

    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;->f:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;)Ll/y20;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;->g:Ll/y20;

    return-object p0
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;->f:Ljava/lang/String;

    return-object p0
.end method


# virtual methods
.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ekc0;->a(Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d(Ljava/lang/String;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;->f:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "open"

    .line 4
    .line 5
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;->b:Lv/VImage;

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    sget p1, Ll/dbc0;->C8:I

    .line 14
    .line 15
    invoke-virtual {v1, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 16
    .line 17
    .line 18
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 19
    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;->a:Lv/VLinear;

    .line 21
    .line 22
    const-string v2, "https://fe-static.tancdn.com/v1/images/eyJpZCI6Ik5QSkgzQzJRRTQ3TkxKNUpPVFVSQ0hRTTRFQjJBTDE0IiwidyI6MTAwNSwiaCI6MzMzLCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6NzIzNzM0MjAwMjEyMzc0MTI3Mn0.webp"

    .line 23
    .line 24
    invoke-virtual {p1, v1, v2}, Ll/fsb0;->D(Landroid/view/View;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;->e:Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->e(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;->c:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 33
    .line 34
    const-string v0, "\u7f18\u5206\u96f7\u8fbe\u5df2\u5f00\u542f"

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;->d:Lv/VText;

    .line 40
    .line 41
    const-string p1, "\u81ea\u52a8\u53d1\u9001\u62db\u547c\u8bed\u7ed9\u5408\u9002\u914d\u5bf9\u597d\u53cb\uff0c\u907f\u514d\u548c\u7f18\u5206\u64e6\u80a9\u800c\u8fc7"

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    sget p1, Ll/dbc0;->B8:I

    .line 48
    .line 49
    invoke-virtual {v1, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 50
    .line 51
    .line 52
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;->a:Lv/VLinear;

    .line 55
    .line 56
    const-string v1, "https://fe-static.tancdn.com/v1/images/eyJpZCI6IlJTU1ZDU1BHTUxPS081UUFIV1gzWFNGVlBCRFIzNjE0IiwidyI6MTAwNSwiaCI6MzMzLCJkIjowLCJtdCI6ImltYWdlL2pwZWciLCJkaCI6NzgxNDM2NjgwODMwNDc1MzM3Mn0.webp"

    .line 57
    .line 58
    invoke-virtual {p1, v0, v1}, Ll/fsb0;->D(Landroid/view/View;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;->e:Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;

    .line 62
    .line 63
    const-string v0, "close"

    .line 64
    .line 65
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;->e(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;->c:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 69
    .line 70
    const-string v0, "\u7f18\u5206\u96f7\u8fbe\u5df2\u5173\u95ed"

    .line 71
    .line 72
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 73
    .line 74
    .line 75
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;->d:Lv/VText;

    .line 76
    .line 77
    const-string p1, "\u7cfb\u7edf\u4f1a\u505c\u6b62\u5bf9\u914d\u5bf9\u7528\u6237\u81ea\u52a8\u53d1\u9001\u62db\u547c\u8bed"

    .line 78
    .line 79
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public getCurState()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;->e:Lcom/p1/mobile/putong/core/newui/view/LoveRadarSwitchView;

    .line 8
    .line 9
    new-instance v1, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView$a;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView$a;-><init>(Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public setAfterChangeStateListener(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;->g:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public setCurState(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;->f:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/addressbook/loveradar/RadarSwitchView;->d(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
