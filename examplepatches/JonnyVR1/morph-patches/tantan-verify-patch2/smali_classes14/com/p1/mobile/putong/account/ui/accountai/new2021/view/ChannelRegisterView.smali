.class public Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/ChannelRegisterView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lv/VButton;

.field public d:Lv/VButton_FakeShadow;

.field public e:Ll/x20;

.field public f:Ll/x20;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 9
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/ChannelRegisterView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 8
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/ChannelRegisterView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/ChannelRegisterView;->r()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/ChannelRegisterView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/ChannelRegisterView;->S(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/ChannelRegisterView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/ChannelRegisterView;->T(Landroid/view/View;)V

    return-void
.end method

.method private synthetic S(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/ChannelRegisterView;->f:Ll/x20;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/ChannelRegisterView;->f:Ll/x20;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/x20;->call()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method private synthetic T(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/ChannelRegisterView;->e:Ll/x20;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/ChannelRegisterView;->e:Ll/x20;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/x20;->call()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method private r()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0, p0}, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/ChannelRegisterView;->R(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/ChannelRegisterView;->c:Lv/VButton;

    .line 17
    .line 18
    new-instance v1, Ll/ps4;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/ps4;-><init>(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/ChannelRegisterView;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/ChannelRegisterView;->d:Lv/VButton_FakeShadow;

    .line 27
    .line 28
    new-instance v1, Ll/qs4;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/qs4;-><init>(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/ChannelRegisterView;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 34
    .line 35
    .line 36
    invoke-static {}, Ll/gsj0;->f()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_0

    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/ChannelRegisterView;->c:Lv/VButton;

    .line 43
    .line 44
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 49
    .line 50
    sget v1, Ll/qa00;->z:I

    .line 51
    .line 52
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 53
    .line 54
    iget-object v2, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/ChannelRegisterView;->c:Lv/VButton;

    .line 55
    .line 56
    invoke-virtual {v2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/ChannelRegisterView;->d:Lv/VButton_FakeShadow;

    .line 60
    .line 61
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 66
    .line 67
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 68
    .line 69
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/ChannelRegisterView;->d:Lv/VButton_FakeShadow;

    .line 70
    .line 71
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 72
    .line 73
    .line 74
    :cond_0
    return-void
.end method


# virtual methods
.method public R(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/rs4;->b(Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/ChannelRegisterView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public setRegisterClickListener(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/ChannelRegisterView;->f:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public setUploadClickListener(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/new2021/view/ChannelRegisterView;->e:Ll/x20;

    .line 2
    .line 3
    return-void
.end method
