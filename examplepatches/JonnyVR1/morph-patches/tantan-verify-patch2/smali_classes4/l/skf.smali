.class public Ll/skf;
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

.field public g:Lcom/p1/mobile/putong/data/User;

.field public h:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
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
    iget-object v1, p0, Ll/skf;->g:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->userId:Ljava/lang/String;

    .line 10
    .line 11
    const-string v1, "aboutMe"

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
    const-string v2, "https://auto.tancdn.com/v1/images/eyJpZCI6Ik1DRE41VE9HNjZPVkpISTJQQUk0R04yRlZUUjdZVzE0IiwidyI6MTI2LCJoIjoxMjYsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxMzA2ODgwOTEyMjQ3NzI2MjE1M30.png"

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const-string v2, "https://auto.tancdn.com/v1/images/eyJpZCI6IlY0UTNERFM2NlVFTEREVjVSUk4zVERBUENBSzdHMzE0IiwidyI6MTYwLCJoIjoxNjAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo1NTgwMjg5ODU4NDg0MzMzOTA1fQ.png"

    .line 33
    .line 34
    :goto_0
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;->picture:Ljava/lang/String;

    .line 35
    .line 36
    const-string v2, "\u81ea\u6211\u4ecb\u7ecd"

    .line 37
    .line 38
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;->title:Ljava/lang/String;

    .line 39
    .line 40
    iget-object p0, p0, Ll/skf;->g:Lcom/p1/mobile/putong/data/User;

    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 43
    .line 44
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;->desc:Ljava/lang/String;

    .line 45
    .line 46
    iput-boolean p1, v1, Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;->hasComment:Z

    .line 47
    .line 48
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;->toJson()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/ProfileLikeComment;->snapshot:Ljava/lang/String;

    .line 53
    .line 54
    return-object v0
.end method

.method public b(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/skf;->h:Landroid/view/View;

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
    iget-object p0, p0, Ll/skf;->h:Landroid/view/View;

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
    iput-object p2, p0, Ll/skf;->g:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Ll/skf;->f:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 12
    .line 13
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    invoke-static {}, Ll/gra;->z()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    iget-object p1, p0, Ll/skf;->e:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 25
    .line 26
    const-string p2, "\u81ea\u6211\u4ecb\u7ecd"

    .line 27
    .line 28
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Ll/skf;->d:Lv/VImage;

    .line 32
    .line 33
    sget p2, Ll/dbc0;->X1:I

    .line 34
    .line 35
    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 36
    .line 37
    .line 38
    :cond_1
    iget-object p0, p0, Ll/skf;->a:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;

    .line 39
    .line 40
    sget p1, Ll/dbc0;->dn:I

    .line 41
    .line 42
    const p2, -0xa1302

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeContentRootLayout;->b(II)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "\u8d5e\u4e86\u4f60\u7684\u81ea\u6211\u4ecb\u7ecd"

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
    invoke-virtual {p0, v0, p1}, Ll/skf;->g(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Ll/skf;->h:Landroid/view/View;

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ll/skf;->f(Landroid/view/View;)V

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
    iget-object v2, p0, Ll/skf;->h:Landroid/view/View;

    .line 28
    .line 29
    invoke-virtual {p1, v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Ll/skf;->f:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 33
    .line 34
    const/4 p1, 0x3

    .line 35
    invoke-static {p1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p0, p1, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final f(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/tkf;->a(Ll/skf;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public g(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/tkf;->b(Ll/skf;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
