.class public Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;

.field public d:Lv/VLinear;

.field public e:Lv/VDraweeView;

.field public f:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public g:Lv/VLinear;

.field public h:Lv/VDraweeView;

.field public i:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public j:Lv/VLinear;

.field public k:Lv/VDraweeView;

.field public l:Lv/VDraweeView;

.field public m:Lcom/p1/mobile/putong/core/ui/VText_Bold;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 6
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 7
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final P(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/xzz;->a(Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final Q(D)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0, v0}, Ljava/util/Calendar;->get(I)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    double-to-long p1, p1

    .line 15
    invoke-virtual {v1, p1, p2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, v0}, Ljava/util/Calendar;->get(I)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-ne v0, p0, :cond_0

    .line 23
    .line 24
    new-instance p0, Ljava/text/SimpleDateFormat;

    .line 25
    .line 26
    const-string v0, "M\u6708d\u65e5 HH:mm"

    .line 27
    .line 28
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-direct {p0, v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    new-instance p0, Ljava/text/SimpleDateFormat;

    .line 37
    .line 38
    const-string v0, "yyyy\u5e74M\u6708d\u65e5 HH:mm"

    .line 39
    .line 40
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-direct {p0, v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 45
    .line 46
    .line 47
    :goto_0
    new-instance v0, Ljava/util/Date;

    .line 48
    .line 49
    invoke-direct {v0, p1, p2}, Ljava/util/Date;-><init>(J)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    return-object p0
.end method

.method public final R(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;)V
    .locals 18

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    .line 1
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->verifyInviteOwner:Ljava/lang/String;

    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    move-result-object v3

    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    .line 2
    iget-wide v3, v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->verifyInviteTime:D

    .line 3
    const-string v5, "%s %s%s\u4e86%s\uff0c\u5339\u914d\u6210\u529f"

    const-string v7, "\u4f60"

    const-string v8, "\u559c\u6b22"

    const-string v9, "\u8d85\u7ea7\u559c\u6b22"

    const-string v10, "superliked"

    const-string v11, " "

    if-eqz v2, :cond_8

    .line 4
    iget-wide v13, v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->likedByTime:D

    cmpg-double v2, v3, v13

    const-string v3, "\u5b8c\u6210\u4e86\u8ba4\u8bc1\uff0c\u5e2e\u4f60\u53d1\u51fa\u559c\u6b22\uff0c\u5339\u914d\u6210\u529f"

    const-string v4, "\u4e86\u4f60"

    const-string v15, "\u505a\u8ba4\u8bc1"

    const-string v6, " \u4f60\u9080\u8bf7"

    if-gez v2, :cond_6

    move-wide/from16 v16, v13

    .line 5
    iget-wide v12, v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->likeTime:D

    cmpg-double v12, v16, v12

    if-gez v12, :cond_1

    .line 6
    sget-object v5, Ll/uqb0;->G:Ll/fsb0;

    iget-object v7, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->e:Lv/VDraweeView;

    invoke-virtual/range {p2 .. p2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    move-result-object v12

    invoke-virtual {v12}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object v12

    invoke-virtual {v5, v7, v12}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 7
    iget-object v5, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->f:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v12, v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->verifyInviteTime:D

    .line 8
    invoke-virtual {v0, v12, v13}, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->Q(D)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v7, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/putong/data/User;->getPronoun()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 9
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    iget-object v5, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->g:Lv/VLinear;

    const/4 v2, 0x1

    invoke-static {v5, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    sget-object v5, Ll/uqb0;->G:Ll/fsb0;

    iget-object v6, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->h:Lv/VDraweeView;

    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    move-result-object v7

    invoke-virtual {v7}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 12
    iget-object v5, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->i:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v12, v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->likedByTime:D

    .line 13
    invoke-virtual {v0, v12, v13}, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->Q(D)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/putong/data/User;->getPronoun()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    iget-object v7, v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->otherState:Ljava/lang/String;

    invoke-virtual {v10, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    move-object v8, v9

    :cond_0
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 16
    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 17
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->j:Lv/VLinear;

    const/4 v2, 0x1

    invoke-static {v4, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->k:Lv/VDraweeView;

    invoke-virtual/range {p2 .. p2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    move-result-object v5

    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 19
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->l:Lv/VDraweeView;

    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    move-result-object v5

    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 20
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->m:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v5, v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->likeTime:D

    .line 21
    invoke-virtual {v0, v5, v6}, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->Q(D)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/putong/data/User;->getPronoun()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 22
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    .line 23
    :cond_1
    sget-object v3, Ll/uqb0;->G:Ll/fsb0;

    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->e:Lv/VDraweeView;

    invoke-virtual/range {p2 .. p2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    move-result-object v12

    invoke-virtual {v12}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object v12

    invoke-virtual {v3, v4, v12}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 24
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->f:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v12, v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->verifyInviteTime:D

    .line 25
    invoke-virtual {v0, v12, v13}, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->Q(D)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/putong/data/User;->getPronoun()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 26
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 27
    iget-wide v3, v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->likeTime:D

    const-wide/16 v12, 0x0

    cmpl-double v3, v3, v12

    if-lez v3, :cond_2

    .line 28
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->g:Lv/VLinear;

    const/4 v2, 0x1

    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    sget-object v3, Ll/uqb0;->G:Ll/fsb0;

    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->h:Lv/VDraweeView;

    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    move-result-object v6

    invoke-virtual {v6}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object v6

    invoke-virtual {v3, v4, v6}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 30
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->i:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v12, v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->likeTime:D

    .line 31
    invoke-virtual {v0, v12, v13}, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->Q(D)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/putong/data/User;->getPronoun()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "\u5b8c\u6210\u4e86\u8ba4\u8bc1\uff0c\u5e2e\u4f60\u53d1\u51fa\u559c\u6b22"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 32
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 33
    :cond_2
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->j:Lv/VLinear;

    const/4 v2, 0x1

    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    iget-wide v3, v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->likeTime:D

    iget-wide v11, v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->likedByTime:D

    cmpg-double v3, v3, v11

    if-gez v3, :cond_3

    const/4 v6, 0x1

    goto :goto_0

    :cond_3
    const/4 v6, 0x0

    .line 35
    :goto_0
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->k:Lv/VDraweeView;

    invoke-virtual/range {p2 .. p2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    move-result-object v4

    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 36
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->l:Lv/VDraweeView;

    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    move-result-object v4

    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 37
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->m:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    iget-wide v3, v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->likedByTime:D

    .line 38
    invoke-virtual {v0, v3, v4}, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->Q(D)Ljava/lang/String;

    move-result-object v0

    .line 39
    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/putong/data/User;->getPronoun()Ljava/lang/String;

    move-result-object v3

    .line 40
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->otherState:Ljava/lang/String;

    invoke-virtual {v10, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    move-object v8, v9

    :cond_4
    if-eqz v6, :cond_5

    goto :goto_1

    .line 41
    :cond_5
    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/putong/data/User;->getPronoun()Ljava/lang/String;

    move-result-object v7

    :goto_1
    filled-new-array {v0, v3, v8, v7}, [Ljava/lang/Object;

    move-result-object v0

    .line 42
    invoke-static {v5, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 43
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    .line 44
    :cond_6
    iget-object v5, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->d:Lv/VLinear;

    const/4 v2, 0x1

    invoke-static {v5, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 45
    sget-object v5, Ll/uqb0;->G:Ll/fsb0;

    iget-object v7, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->e:Lv/VDraweeView;

    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    move-result-object v12

    invoke-virtual {v12}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object v12

    invoke-virtual {v5, v7, v12}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 46
    iget-object v5, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->f:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v12, v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->likedByTime:D

    .line 47
    invoke-virtual {v0, v12, v13}, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->Q(D)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v7, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/putong/data/User;->getPronoun()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v7, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    iget-object v12, v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->otherState:Ljava/lang/String;

    invoke-virtual {v10, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_7

    move-object v8, v9

    :cond_7
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 50
    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 51
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->g:Lv/VLinear;

    const/4 v2, 0x1

    invoke-static {v4, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 52
    sget-object v4, Ll/uqb0;->G:Ll/fsb0;

    iget-object v5, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->h:Lv/VDraweeView;

    invoke-virtual/range {p2 .. p2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    move-result-object v7

    invoke-virtual {v7}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object v7

    invoke-virtual {v4, v5, v7}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 53
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->i:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v7, v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->verifyInviteTime:D

    .line 54
    invoke-virtual {v0, v7, v8}, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->Q(D)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/putong/data/User;->getPronoun()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 55
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 56
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->j:Lv/VLinear;

    const/4 v2, 0x1

    invoke-static {v4, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 57
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->k:Lv/VDraweeView;

    invoke-virtual/range {p2 .. p2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    move-result-object v5

    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 58
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->l:Lv/VDraweeView;

    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    move-result-object v5

    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 59
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->m:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v5, v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->likeTime:D

    .line 60
    invoke-virtual {v0, v5, v6}, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->Q(D)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/putong/data/User;->getPronoun()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 61
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    .line 62
    :cond_8
    iget-wide v12, v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->likeTime:D

    cmpg-double v3, v3, v12

    const-string v4, "\u559c\u6b22\u4e86\u4f60\uff0c\u5339\u914d\u6210\u529f"

    const-string v6, "\u4e86"

    const-string v12, " \u4f60"

    const-string v13, "\u9080\u8bf7\u4f60\u505a\u8ba4\u8bc1"

    if-gez v3, :cond_11

    .line 63
    sget-object v3, Ll/uqb0;->G:Ll/fsb0;

    iget-object v14, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->e:Lv/VDraweeView;

    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    move-result-object v15

    invoke-virtual {v15}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object v15

    invoke-virtual {v3, v14, v15}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 64
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->f:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v16, v3

    iget-wide v2, v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->verifyInviteTime:D

    .line 65
    invoke-virtual {v0, v2, v3}, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->Q(D)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v14, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/putong/data/User;->getPronoun()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v14, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v3, v16

    .line 66
    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 67
    iget-wide v2, v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->likeTime:D

    iget-wide v13, v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->likedByTime:D

    cmpg-double v2, v2, v13

    .line 68
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->g:Lv/VLinear;

    .line 69
    const-string v11, " \u4f60\u5b8c\u6210\u4e86\u8ba4\u8bc1\uff0c"

    if-gez v2, :cond_a

    const/4 v2, 0x1

    .line 70
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 71
    sget-object v3, Ll/uqb0;->G:Ll/fsb0;

    iget-object v5, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->h:Lv/VDraweeView;

    invoke-virtual/range {p2 .. p2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    move-result-object v7

    invoke-virtual {v7}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object v7

    invoke-virtual {v3, v5, v7}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 72
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->i:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v13, v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->likeTime:D

    .line 73
    invoke-virtual {v0, v13, v14}, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->Q(D)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    iget-object v7, v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->state:Ljava/lang/String;

    invoke-virtual {v10, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_9

    move-object v8, v9

    :cond_9
    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/putong/data/User;->getPronoun()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 76
    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 77
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->j:Lv/VLinear;

    const/4 v2, 0x1

    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 78
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->k:Lv/VDraweeView;

    invoke-virtual/range {p2 .. p2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    move-result-object v5

    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object v5

    invoke-virtual {v2, v3, v5}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 79
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->l:Lv/VDraweeView;

    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    move-result-object v5

    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object v5

    invoke-virtual {v2, v3, v5}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 80
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->m:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v5, v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->likedByTime:D

    .line 81
    invoke-virtual {v0, v5, v6}, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->Q(D)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/putong/data/User;->getPronoun()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 82
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :cond_a
    const/4 v2, 0x1

    .line 83
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 84
    sget-object v3, Ll/uqb0;->G:Ll/fsb0;

    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->h:Lv/VDraweeView;

    invoke-virtual/range {p2 .. p2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    move-result-object v6

    invoke-virtual {v6}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object v6

    invoke-virtual {v3, v4, v6}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 85
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->i:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v12, v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->likedByTime:D

    .line 86
    invoke-virtual {v0, v12, v13}, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->Q(D)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/putong/data/User;->getPronoun()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "\u559c\u6b22\u4e86\u4f60"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 87
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 88
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->j:Lv/VLinear;

    const/4 v2, 0x1

    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 89
    iget-wide v3, v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->likeTime:D

    iget-wide v11, v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->likedByTime:D

    cmpg-double v3, v3, v11

    if-gez v3, :cond_b

    const/4 v6, 0x1

    goto :goto_2

    :cond_b
    const/4 v6, 0x0

    .line 90
    :goto_2
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->k:Lv/VDraweeView;

    invoke-virtual/range {p2 .. p2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    move-result-object v4

    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 91
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->l:Lv/VDraweeView;

    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    move-result-object v4

    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 92
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->m:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    if-eqz v6, :cond_c

    .line 93
    iget-wide v3, v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->likedByTime:D

    goto :goto_3

    :cond_c
    iget-wide v3, v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->likeTime:D

    :goto_3
    invoke-virtual {v0, v3, v4}, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->Q(D)Ljava/lang/String;

    move-result-object v0

    if-eqz v6, :cond_d

    .line 94
    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/putong/data/User;->getPronoun()Ljava/lang/String;

    move-result-object v3

    goto :goto_4

    :cond_d
    move-object v3, v7

    :goto_4
    if-eqz v6, :cond_e

    .line 95
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->otherState:Ljava/lang/String;

    goto :goto_5

    :cond_e
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->state:Ljava/lang/String;

    :goto_5
    invoke-virtual {v10, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_f

    move-object v8, v9

    :cond_f
    if-eqz v6, :cond_10

    goto :goto_6

    .line 96
    :cond_10
    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/putong/data/User;->getPronoun()Ljava/lang/String;

    move-result-object v7

    :goto_6
    filled-new-array {v0, v3, v8, v7}, [Ljava/lang/Object;

    move-result-object v0

    .line 97
    invoke-static {v5, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 98
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    .line 99
    :cond_11
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->d:Lv/VLinear;

    const/4 v2, 0x1

    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 100
    sget-object v3, Ll/uqb0;->G:Ll/fsb0;

    iget-object v5, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->e:Lv/VDraweeView;

    invoke-virtual/range {p2 .. p2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    move-result-object v7

    invoke-virtual {v7}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object v7

    invoke-virtual {v3, v5, v7}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 101
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->f:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v14, v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->likeTime:D

    .line 102
    invoke-virtual {v0, v14, v15}, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->Q(D)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    iget-object v7, v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->state:Ljava/lang/String;

    invoke-virtual {v10, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_12

    move-object v8, v9

    :cond_12
    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/putong/data/User;->getPronoun()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 105
    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 106
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->g:Lv/VLinear;

    const/4 v2, 0x1

    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 107
    sget-object v3, Ll/uqb0;->G:Ll/fsb0;

    iget-object v5, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->h:Lv/VDraweeView;

    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    move-result-object v6

    invoke-virtual {v6}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 108
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->i:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v6, v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->verifyInviteTime:D

    .line 109
    invoke-virtual {v0, v6, v7}, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->Q(D)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/putong/data/User;->getPronoun()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 110
    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 111
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->j:Lv/VLinear;

    const/4 v2, 0x1

    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 112
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->k:Lv/VDraweeView;

    invoke-virtual/range {p2 .. p2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    move-result-object v5

    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object v5

    invoke-virtual {v2, v3, v5}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 113
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->l:Lv/VDraweeView;

    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    move-result-object v5

    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object v5

    invoke-virtual {v2, v3, v5}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 114
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->m:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v5, v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->likedByTime:D

    .line 115
    invoke-virtual {v0, v5, v6}, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->Q(D)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "  \u4f60\u5b8c\u6210\u4e86\u8ba4\u8bc1\uff0c"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p3 .. p3}, Lcom/p1/mobile/putong/data/User;->getPronoun()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 116
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final S(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->m:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 2
    .line 3
    iget-wide v0, p4, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->matchTime:D

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->Q(D)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p4, p4, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->source:Ljava/lang/String;

    .line 10
    .line 11
    filled-new-array {v0, p4}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p4

    .line 15
    const-string v0, "%s \u901a\u8fc7%s\u5339\u914d\u6210\u529f"

    .line 16
    .line 17
    invoke-static {v0, p4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p4

    .line 21
    invoke-virtual {p1, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 22
    .line 23
    .line 24
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 25
    .line 26
    iget-object p4, p0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->k:Lv/VDraweeView;

    .line 27
    .line 28
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    invoke-virtual {p1, p4, p2}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 37
    .line 38
    .line 39
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->l:Lv/VDraweeView;

    .line 42
    .line 43
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    invoke-virtual {p1, p0, p2}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final T(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V
    .locals 10

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->matchInfo:Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;

    .line 4
    .line 5
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->likeTime:D

    .line 6
    .line 7
    iget-wide v2, p1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->likedByTime:D

    .line 8
    .line 9
    cmpg-double v4, v0, v2

    .line 10
    .line 11
    if-gez v4, :cond_0

    .line 12
    .line 13
    const/4 v4, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 v4, 0x0

    .line 16
    :goto_0
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->i:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 17
    .line 18
    if-eqz v4, :cond_1

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_1
    move-wide v0, v2

    .line 22
    :goto_1
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->Q(D)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v1, "\u4f60"

    .line 27
    .line 28
    if-eqz v4, :cond_2

    .line 29
    .line 30
    move-object v2, v1

    .line 31
    goto :goto_2

    .line 32
    :cond_2
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/User;->getPronoun()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    :goto_2
    if-eqz v4, :cond_3

    .line 37
    .line 38
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->state:Ljava/lang/String;

    .line 39
    .line 40
    goto :goto_3

    .line 41
    :cond_3
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->otherState:Ljava/lang/String;

    .line 42
    .line 43
    :goto_3
    const-string v6, "superliked"

    .line 44
    .line 45
    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    const-string v7, "\u559c\u6b22"

    .line 50
    .line 51
    const-string v8, "\u8d85\u7ea7\u559c\u6b22"

    .line 52
    .line 53
    if-eqz v3, :cond_4

    .line 54
    .line 55
    move-object v3, v8

    .line 56
    goto :goto_4

    .line 57
    :cond_4
    move-object v3, v7

    .line 58
    :goto_4
    if-eqz v4, :cond_5

    .line 59
    .line 60
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/User;->getPronoun()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v9

    .line 64
    goto :goto_5

    .line 65
    :cond_5
    move-object v9, v1

    .line 66
    :goto_5
    filled-new-array {v0, v2, v3, v9}, [Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    const-string v2, "%s %s%s\u4e86%s"

    .line 71
    .line 72
    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {v5, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->m:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 80
    .line 81
    if-eqz v4, :cond_6

    .line 82
    .line 83
    iget-wide v2, p1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->likedByTime:D

    .line 84
    .line 85
    goto :goto_6

    .line 86
    :cond_6
    iget-wide v2, p1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->likeTime:D

    .line 87
    .line 88
    :goto_6
    invoke-virtual {p0, v2, v3}, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->Q(D)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    if-eqz v4, :cond_7

    .line 93
    .line 94
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/User;->getPronoun()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    goto :goto_7

    .line 99
    :cond_7
    move-object v3, v1

    .line 100
    :goto_7
    if-eqz v4, :cond_8

    .line 101
    .line 102
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->otherState:Ljava/lang/String;

    .line 103
    .line 104
    goto :goto_8

    .line 105
    :cond_8
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->state:Ljava/lang/String;

    .line 106
    .line 107
    :goto_8
    invoke-virtual {v6, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result p1

    .line 111
    if-eqz p1, :cond_9

    .line 112
    .line 113
    move-object v7, v8

    .line 114
    :cond_9
    if-eqz v4, :cond_a

    .line 115
    .line 116
    goto :goto_9

    .line 117
    :cond_a
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/User;->getPronoun()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    :goto_9
    filled-new-array {v2, v3, v7, v1}, [Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    const-string v1, "%s %s%s\u4e86%s\uff0c\u5339\u914d\u6210\u529f"

    .line 126
    .line 127
    invoke-static {v1, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 132
    .line 133
    .line 134
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 135
    .line 136
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->h:Lv/VDraweeView;

    .line 137
    .line 138
    if-eqz v4, :cond_b

    .line 139
    .line 140
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    :goto_a
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    goto :goto_b

    .line 149
    :cond_b
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    goto :goto_a

    .line 154
    :goto_b
    invoke-virtual {p1, v0, v1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 155
    .line 156
    .line 157
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 158
    .line 159
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->k:Lv/VDraweeView;

    .line 160
    .line 161
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 162
    .line 163
    .line 164
    move-result-object p2

    .line 165
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 166
    .line 167
    .line 168
    move-result-object p2

    .line 169
    invoke-virtual {p1, v0, p2}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 170
    .line 171
    .line 172
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 173
    .line 174
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->l:Lv/VDraweeView;

    .line 175
    .line 176
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 177
    .line 178
    .line 179
    move-result-object p2

    .line 180
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 181
    .line 182
    .line 183
    move-result-object p2

    .line 184
    invoke-virtual {p1, p0, p2}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 185
    .line 186
    .line 187
    return-void
.end method

.method public V(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V
    .locals 10
    .param p1    # Lcom/p1/mobile/putong/core/data/Conversation;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/data/User;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Lcom/p1/mobile/putong/data/User;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 2
    .line 3
    if-eqz v0, :cond_5

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->matchInfo:Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_2

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->d:Lv/VLinear;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->matchInfo:Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;

    .line 20
    .line 21
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {v2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->t9()Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    const-wide/16 v3, 0x0

    .line 34
    .line 35
    const/4 v5, 0x1

    .line 36
    if-eqz v2, :cond_2

    .line 37
    .line 38
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {v2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Ze()Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-eqz v2, :cond_2

    .line 51
    .line 52
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->verifyInviteOwner:Ljava/lang/String;

    .line 53
    .line 54
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    if-nez v2, :cond_2

    .line 59
    .line 60
    iget-wide v6, v0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->verifyInviteTime:D

    .line 61
    .line 62
    cmpl-double v2, v6, v3

    .line 63
    .line 64
    if-lez v2, :cond_2

    .line 65
    .line 66
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->verifyInviteOwner:Ljava/lang/String;

    .line 67
    .line 68
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 69
    .line 70
    .line 71
    move-result-object v6

    .line 72
    invoke-interface {v6}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v6

    .line 76
    invoke-static {v2, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    iget-wide v6, v0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->verifyInviteTime:D

    .line 81
    .line 82
    if-eqz v2, :cond_1

    .line 83
    .line 84
    iget-wide v8, v0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->likeTime:D

    .line 85
    .line 86
    cmpl-double v2, v6, v8

    .line 87
    .line 88
    if-lez v2, :cond_2

    .line 89
    .line 90
    :goto_0
    move v2, v1

    .line 91
    goto :goto_1

    .line 92
    :cond_1
    iget-wide v8, v0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->likedByTime:D

    .line 93
    .line 94
    cmpl-double v2, v6, v8

    .line 95
    .line 96
    if-lez v2, :cond_2

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_2
    move v2, v5

    .line 100
    :goto_1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 101
    .line 102
    .line 103
    move-result-object v6

    .line 104
    invoke-virtual {v6}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 105
    .line 106
    .line 107
    move-result-object v6

    .line 108
    invoke-interface {v6}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->t9()Z

    .line 109
    .line 110
    .line 111
    move-result v6

    .line 112
    if-eqz v6, :cond_3

    .line 113
    .line 114
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 115
    .line 116
    .line 117
    move-result-object v6

    .line 118
    invoke-virtual {v6}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 119
    .line 120
    .line 121
    move-result-object v6

    .line 122
    invoke-interface {v6}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Ze()Z

    .line 123
    .line 124
    .line 125
    move-result v6

    .line 126
    if-eqz v6, :cond_3

    .line 127
    .line 128
    iget-object v6, v0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->source:Ljava/lang/String;

    .line 129
    .line 130
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 131
    .line 132
    .line 133
    move-result v6

    .line 134
    if-eqz v6, :cond_3

    .line 135
    .line 136
    if-eqz v2, :cond_3

    .line 137
    .line 138
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->verifyInviteOwner:Ljava/lang/String;

    .line 139
    .line 140
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 141
    .line 142
    .line 143
    move-result v2

    .line 144
    if-nez v2, :cond_3

    .line 145
    .line 146
    iget-wide v6, v0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->verifyInviteTime:D

    .line 147
    .line 148
    cmpl-double v2, v6, v3

    .line 149
    .line 150
    if-lez v2, :cond_3

    .line 151
    .line 152
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->d:Lv/VLinear;

    .line 153
    .line 154
    invoke-static {v2, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 155
    .line 156
    .line 157
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->g:Lv/VLinear;

    .line 158
    .line 159
    invoke-static {v2, v1}, Ll/vnb;->M(Landroid/view/View;Z)V

    .line 160
    .line 161
    .line 162
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->j:Lv/VLinear;

    .line 163
    .line 164
    invoke-static {v2, v1}, Ll/vnb;->M(Landroid/view/View;Z)V

    .line 165
    .line 166
    .line 167
    invoke-virtual {p0, p1, p3, p2, v0}, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->R(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;)V

    .line 168
    .line 169
    .line 170
    return-void

    .line 171
    :cond_3
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->source:Ljava/lang/String;

    .line 172
    .line 173
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 174
    .line 175
    .line 176
    move-result v2

    .line 177
    if-nez v2, :cond_4

    .line 178
    .line 179
    iget-wide v6, v0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->matchTime:D

    .line 180
    .line 181
    cmpl-double v2, v6, v3

    .line 182
    .line 183
    if-lez v2, :cond_4

    .line 184
    .line 185
    invoke-virtual {p0, p1, p3, p2, v0}, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->S(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;)V

    .line 186
    .line 187
    .line 188
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->g:Lv/VLinear;

    .line 189
    .line 190
    invoke-static {p1, v1}, Ll/vnb;->M(Landroid/view/View;Z)V

    .line 191
    .line 192
    .line 193
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->j:Lv/VLinear;

    .line 194
    .line 195
    invoke-static {p0, v5}, Ll/vnb;->M(Landroid/view/View;Z)V

    .line 196
    .line 197
    .line 198
    return-void

    .line 199
    :cond_4
    iget-wide v1, v0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->likeTime:D

    .line 200
    .line 201
    cmpl-double v1, v1, v3

    .line 202
    .line 203
    if-lez v1, :cond_5

    .line 204
    .line 205
    iget-wide v0, v0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->likedByTime:D

    .line 206
    .line 207
    cmpl-double v0, v0, v3

    .line 208
    .line 209
    if-lez v0, :cond_5

    .line 210
    .line 211
    invoke-virtual {p0, p1, p3, p2}, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->T(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V

    .line 212
    .line 213
    .line 214
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->g:Lv/VLinear;

    .line 215
    .line 216
    invoke-static {p1, v5}, Ll/vnb;->M(Landroid/view/View;Z)V

    .line 217
    .line 218
    .line 219
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->j:Lv/VLinear;

    .line 220
    .line 221
    invoke-static {p0, v5}, Ll/vnb;->M(Landroid/view/View;Z)V

    .line 222
    .line 223
    .line 224
    :cond_5
    :goto_2
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->P(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->i:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    sget v2, Ll/g9c0;->i:I

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->m:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    sget v2, Ll/g9c0;->i:I

    .line 43
    .line 44
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/MessageMatchTimeLayout;->f:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 52
    .line 53
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    sget v1, Ll/g9c0;->i:I

    .line 58
    .line 59
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 64
    .line 65
    .line 66
    :cond_0
    return-void
.end method
