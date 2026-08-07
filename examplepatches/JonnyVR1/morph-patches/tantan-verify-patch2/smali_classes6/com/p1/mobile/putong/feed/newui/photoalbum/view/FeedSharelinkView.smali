.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Landroid/widget/TextView;

.field public c:Landroid/widget/TextView;

.field public d:Lcom/p1/mobile/putong/feed/data/MomentShareInfo;

.field public e:Z

.field public f:Ljava/lang/String;

.field public g:Ljava/lang/String;

.field public h:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;->e:Z

    .line 6
    .line 7
    const-string p1, ""

    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;->f:Ljava/lang/String;

    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;->g:Ljava/lang/String;

    .line 12
    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;->h:Ljava/lang/String;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 16
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x1

    .line 17
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;->e:Z

    .line 18
    const-string p1, ""

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;->f:Ljava/lang/String;

    .line 19
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;->g:Ljava/lang/String;

    .line 20
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;->h:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 21
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x1

    .line 22
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;->e:Z

    .line 23
    const-string p1, ""

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;->f:Ljava/lang/String;

    .line 24
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;->g:Ljava/lang/String;

    .line 25
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;->h:Ljava/lang/String;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;->d(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/g1i;->a(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final c()V
    .locals 1

    .line 1
    new-instance v0, Ll/f1i;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/f1i;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic d(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;->e:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;->d:Lcom/p1/mobile/putong/feed/data/MomentShareInfo;

    .line 7
    .line 8
    if-eqz p1, :cond_3

    .line 9
    .line 10
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->landingPage:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;->g()V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;->d:Lcom/p1/mobile/putong/feed/data/MomentShareInfo;

    .line 23
    .line 24
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->landingPage:Ljava/lang/String;

    .line 25
    .line 26
    const-string v0, "tantan"

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-eqz p1, :cond_2

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    instance-of p1, p1, Landroid/app/Activity;

    .line 39
    .line 40
    if-eqz p1, :cond_3

    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    check-cast p1, Landroid/app/Activity;

    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;->d:Lcom/p1/mobile/putong/feed/data/MomentShareInfo;

    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->landingPage:Ljava/lang/String;

    .line 51
    .line 52
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-static {p1, p0}, Ll/ryh;->b(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_2
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;->d:Lcom/p1/mobile/putong/feed/data/MomentShareInfo;

    .line 69
    .line 70
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->title:Ljava/lang/String;

    .line 71
    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->landingPage:Ljava/lang/String;

    .line 73
    .line 74
    invoke-static {v0, v1, p0}, Ll/orb0;->j(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 79
    .line 80
    .line 81
    :cond_3
    :goto_0
    return-void
.end method

.method public e(Lcom/p1/mobile/putong/feed/data/MomentShareInfo;Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "-1"

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, v0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;->f(Lcom/p1/mobile/putong/feed/data/MomentShareInfo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public f(Lcom/p1/mobile/putong/feed/data/MomentShareInfo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;->d:Lcom/p1/mobile/putong/feed/data/MomentShareInfo;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;->f:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;->g:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;->h:Ljava/lang/String;

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;->b:Landroid/widget/TextView;

    .line 13
    .line 14
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->title:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;->c:Landroid/widget/TextView;

    .line 20
    .line 21
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;->d:Lcom/p1/mobile/putong/feed/data/MomentShareInfo;

    .line 22
    .line 23
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->description:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 29
    .line 30
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;->a:Lv/VDraweeView;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;->d:Lcom/p1/mobile/putong/feed/data/MomentShareInfo;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->url:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {p1, p2, p0}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final g()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;->f:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;->d:Lcom/p1/mobile/putong/feed/data/MomentShareInfo;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->getTrackInfomation()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "information"

    .line 10
    .line 11
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;->d:Lcom/p1/mobile/putong/feed/data/MomentShareInfo;

    .line 16
    .line 17
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->name:Ljava/lang/String;

    .line 18
    .line 19
    const-string v3, "link_style"

    .line 20
    .line 21
    invoke-static {v3, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    const-string v3, "other_user_id"

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;->h:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v3, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    filled-new-array {v1, v2, p0}, [Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const-string v1, "e_share_link"

    .line 38
    .line 39
    invoke-static {v1, v0, p0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;->c()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setCanClick(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;->e:Z

    .line 2
    .line 3
    return-void
.end method
