.class public Ll/xlf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/eof;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;

.field public b:Lv/VLinear;

.field public c:Lv/VLinear;

.field public d:Lv/VImage;

.field public e:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public f:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public g:Landroid/view/View;

.field public h:Lcom/p1/mobile/putong/data/User;

.field public i:Ljava/lang/String;

.field public j:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Ll/xlf;->i:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Ll/xlf;->j:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Z)Lcom/p1/mobile/putong/core/data/ProfileLikeComment;
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->new_()Lcom/p1/mobile/putong/core/data/ProfileLikeComment;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/xlf;->h:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->userId:Ljava/lang/String;

    .line 10
    .line 11
    const-string v1, "question"

    .line 12
    .line 13
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->module:Ljava/lang/String;

    .line 14
    .line 15
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->category:Ljava/lang/String;

    .line 16
    .line 17
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->identifier:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;->new_()Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-static {}, Ll/gra;->z()Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_0

    .line 28
    .line 29
    const-string v2, "https://auto.tancdn.com/v1/images/eyJpZCI6Ik5JRE1CNzIzRzNDSUxIVVdKUTVKUVVPSExGNTNUWDE0IiwidyI6MTI2LCJoIjoxMjYsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxMTk4NTYzNzUyMTQwMjcxMzUyNn0.png"

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const-string v2, "https://auto.tancdn.com/v1/images/eyJpZCI6IlRMNkE0VUFXQ0pONVpHSE5ZUzdEUFFZQ1c0WFcyUzE0IiwidyI6MTYwLCJoIjoxNjAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo0Mjc1NTM5NDIxMjY2NDcxMjAzfQ.png"

    .line 33
    .line 34
    :goto_0
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;->picture:Ljava/lang/String;

    .line 35
    .line 36
    iget-object v2, p0, Ll/xlf;->i:Ljava/lang/String;

    .line 37
    .line 38
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;->title:Ljava/lang/String;

    .line 39
    .line 40
    iget-object p0, p0, Ll/xlf;->j:Ljava/lang/String;

    .line 41
    .line 42
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;->desc:Ljava/lang/String;

    .line 43
    .line 44
    iput-boolean p1, v1, Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;->hasComment:Z

    .line 45
    .line 46
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;->toJson()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->snapshot:Ljava/lang/String;

    .line 51
    .line 52
    return-object v0
.end method

.method public b(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xlf;->g:Landroid/view/View;

    .line 2
    .line 3
    filled-new-array {v0}, [Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p1, v0}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/xlf;->g:Landroid/view/View;

    .line 11
    .line 12
    invoke-static {p0, p1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;I)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/xlf;->h:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-ltz p3, :cond_1

    .line 4
    .line 5
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->answers:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-le p1, p3, :cond_1

    .line 14
    .line 15
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->answers:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {p1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, Lcom/p1/mobile/putong/data/Answer;

    .line 24
    .line 25
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->d0:Ll/kua;

    .line 28
    .line 29
    iget-object p3, p1, Lcom/p1/mobile/putong/data/Answer;->question:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {p2, p3}, Ll/kua;->o3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Question;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    if-eqz p2, :cond_0

    .line 36
    .line 37
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Question;->text:Ljava/lang/String;

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    const-string p2, ""

    .line 41
    .line 42
    :goto_0
    iput-object p2, p0, Ll/xlf;->i:Ljava/lang/String;

    .line 43
    .line 44
    iget-object p3, p1, Lcom/p1/mobile/putong/data/Answer;->value:Ljava/lang/String;

    .line 45
    .line 46
    iput-object p3, p0, Ll/xlf;->j:Ljava/lang/String;

    .line 47
    .line 48
    iget-object p3, p0, Ll/xlf;->e:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 49
    .line 50
    invoke-virtual {p3, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Ll/xlf;->f:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 54
    .line 55
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Answer;->value:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    .line 59
    .line 60
    :cond_1
    return-void
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "\u8d5e\u4e86\u4f60\u7684\u95ee\u7b54"

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Landroid/view/ViewGroup;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0, p1}, Ll/xlf;->g(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Ll/xlf;->g:Landroid/view/View;

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ll/xlf;->f(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 19
    .line 20
    const/4 v1, -0x1

    .line 21
    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 22
    .line 23
    .line 24
    const/4 v1, 0x1

    .line 25
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 26
    .line 27
    iget-object v2, p0, Ll/xlf;->g:Landroid/view/View;

    .line 28
    .line 29
    invoke-virtual {p1, v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Ll/xlf;->f:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 33
    .line 34
    const/4 v0, 0x3

    .line 35
    invoke-static {v0}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {p1, v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 40
    .line 41
    .line 42
    invoke-static {}, Ll/gra;->z()Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-eqz p1, :cond_0

    .line 47
    .line 48
    iget-object p1, p0, Ll/xlf;->d:Lv/VImage;

    .line 49
    .line 50
    sget v0, Ll/dbc0;->l2:I

    .line 51
    .line 52
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 53
    .line 54
    .line 55
    :cond_0
    iget-object p0, p0, Ll/xlf;->a:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;

    .line 56
    .line 57
    sget p1, Ll/dbc0;->jn:I

    .line 58
    .line 59
    const v0, -0x10514

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->b(II)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public final f(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ylf;->a(Ll/xlf;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public g(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/ylf;->b(Ll/xlf;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
