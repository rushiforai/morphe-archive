.class public Lcom/p1/mobile/putong/core/ui/messages/ItemDiceInvite;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/messages/a;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/messages/ItemDiceInvite;

.field public b:Lv/VDraweeView;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemDiceInvite;->f:Z

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemDiceInvite;->f:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 11
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemDiceInvite;->f:Z

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/messages/ItemDiceInvite;Ljava/lang/String;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/ItemDiceInvite;->e(Ljava/lang/String;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    .line 11
    .line 12
    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const-string v0, "gameId"

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0, v1, v0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemDiceInvite;->d(Lorg/json/JSONObject;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, v0, v1, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemDiceInvite;->c(Ljava/lang/String;Lorg/json/JSONObject;Lcom/p1/mobile/putong/core/data/Message;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 25
    .line 26
    .line 27
    :catch_0
    :goto_0
    return-void
.end method

.method public J()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/ovb0<",
            "Ljava/lang/String;",
            "Ljava/lang/Runnable;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Void;",
            ">;>;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/s4q;->a(Lcom/p1/mobile/putong/core/ui/messages/ItemDiceInvite;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final c(Ljava/lang/String;Lorg/json/JSONObject;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    const-string p1, "gameUrl"

    .line 2
    .line 3
    invoke-virtual {p2, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const-string p3, "eventlog"

    .line 8
    .line 9
    invoke-virtual {p2, p3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    iget-boolean p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemDiceInvite;->f:Z

    .line 14
    .line 15
    if-nez p3, :cond_0

    .line 16
    .line 17
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result p3

    .line 21
    if-nez p3, :cond_0

    .line 22
    .line 23
    const/4 p3, 0x1

    .line 24
    iput-boolean p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemDiceInvite;->f:Z

    .line 25
    .line 26
    const-string p3, "p_chat_view"

    .line 27
    .line 28
    invoke-static {p2, p3}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    new-instance p3, Ll/r4q;

    .line 32
    .line 33
    invoke-direct {p3, p0, p2, p1}, Ll/r4q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemDiceInvite;Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-static {p0, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final d(Lorg/json/JSONObject;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 8

    .line 1
    const-string v0, "iconUrl"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v3

    .line 7
    sget v0, Ll/qa00;->i:I

    .line 8
    .line 9
    int-to-float v1, v0

    .line 10
    int-to-float v2, v0

    .line 11
    int-to-float v4, v0

    .line 12
    int-to-float v0, v0

    .line 13
    invoke-static {v1, v2, v4, v0}, Lcom/facebook/drawee/generic/RoundingParams;->b(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemDiceInvite;->b:Lv/VDraweeView;

    .line 18
    .line 19
    invoke-virtual {v1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Ll/wlj;

    .line 24
    .line 25
    invoke-virtual {v1, v0}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 26
    .line 27
    .line 28
    const-string v0, "dice"

    .line 29
    .line 30
    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    if-eqz p2, :cond_0

    .line 35
    .line 36
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemDiceInvite;->b:Lv/VDraweeView;

    .line 39
    .line 40
    sget v1, Ll/ibc0;->S:I

    .line 41
    .line 42
    invoke-virtual {p2, v0, v1}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 43
    .line 44
    .line 45
    :cond_0
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    if-nez p2, :cond_1

    .line 50
    .line 51
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 52
    .line 53
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemDiceInvite;->b:Lv/VDraweeView;

    .line 54
    .line 55
    const/4 v6, 0x0

    .line 56
    const/4 v7, 0x0

    .line 57
    const/4 v4, 0x1

    .line 58
    const/4 v5, 0x0

    .line 59
    invoke-virtual/range {v1 .. v7}, Ll/fsb0;->O0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;ZZLl/q3d0;Ll/fn2;)V

    .line 60
    .line 61
    .line 62
    :cond_1
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 63
    .line 64
    .line 65
    move-result p2

    .line 66
    if-eqz p2, :cond_2

    .line 67
    .line 68
    const-string p2, "senderTitle"

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_2
    const-string p2, "receiverTitle"

    .line 72
    .line 73
    :goto_0
    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-nez v0, :cond_3

    .line 82
    .line 83
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemDiceInvite;->c:Lv/VText;

    .line 84
    .line 85
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 86
    .line 87
    .line 88
    :cond_3
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 89
    .line 90
    .line 91
    move-result p2

    .line 92
    if-eqz p2, :cond_4

    .line 93
    .line 94
    const-string p2, "senderSubtitle"

    .line 95
    .line 96
    goto :goto_1

    .line 97
    :cond_4
    const-string p2, "receiverSubtitle"

    .line 98
    .line 99
    :goto_1
    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p2

    .line 103
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 104
    .line 105
    .line 106
    move-result p3

    .line 107
    if-nez p3, :cond_5

    .line 108
    .line 109
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemDiceInvite;->d:Lv/VText;

    .line 110
    .line 111
    invoke-virtual {p3, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 112
    .line 113
    .line 114
    :cond_5
    const-string p2, "buttonText"

    .line 115
    .line 116
    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 121
    .line 122
    .line 123
    move-result p2

    .line 124
    if-nez p2, :cond_6

    .line 125
    .line 126
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemDiceInvite;->e:Lv/VText;

    .line 127
    .line 128
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 129
    .line 130
    .line 131
    :cond_6
    return-void
.end method

.method public final synthetic e(Ljava/lang/String;Ljava/lang/String;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-nez p3, :cond_0

    .line 6
    .line 7
    const-string p3, "p_chat_view"

    .line 8
    .line 9
    invoke-static {p1, p3}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    const-string p1, "http"

    .line 13
    .line 14
    invoke-virtual {p2, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    const-string p3, ""

    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    invoke-static {p1, p3, p2, v0}, Lcom/p1/mobile/putong/ui/webview/mk/MkWebViewAct;->c2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    const-string p1, "tantan"

    .line 40
    .line 41
    invoke-virtual {p2, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-eqz p1, :cond_2

    .line 46
    .line 47
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-static {p0}, Ll/bnl0;->D(Landroid/content/Context;)Landroid/app/Activity;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    invoke-interface {p1, p0, p2}, Ll/r97;->Y(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 68
    .line 69
    .line 70
    :cond_2
    return-void
.end method

.method public m(IZLcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemDiceInvite;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemDiceInvite;->c:Lv/VText;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemDiceInvite;->e:Lv/VText;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 24
    .line 25
    .line 26
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemDiceInvite;->c:Lv/VText;

    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    sget v2, Ll/g9c0;->g:I

    .line 47
    .line 48
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemDiceInvite;->d:Lv/VText;

    .line 56
    .line 57
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    sget v2, Ll/g9c0;->i:I

    .line 62
    .line 63
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemDiceInvite;->e:Lv/VText;

    .line 71
    .line 72
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    sget v1, Ll/g9c0;->j:I

    .line 77
    .line 78
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 83
    .line 84
    .line 85
    :cond_0
    return-void
.end method
