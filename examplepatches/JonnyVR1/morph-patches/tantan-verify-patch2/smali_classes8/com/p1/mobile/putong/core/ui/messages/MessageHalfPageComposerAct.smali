.class public Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"

# interfaces
.implements Ll/d0r;


# static fields
.field public static l:Ljava/lang/String; = "key_message_uid"

.field public static m:Ljava/lang/String; = "from"

.field public static n:Ljava/lang/String; = "from_home_card"

.field public static o:Ljava/lang/String; = "from_message"

.field public static p:Ljava/lang/String; = "from_message_impress"

.field public static q:Ljava/lang/String; = "from_match_ice_break"

.field public static r:Ljava/lang/String; = "from_card_match_pop"


# instance fields
.field public c:Landroid/widget/FrameLayout;

.field public d:Landroid/widget/LinearLayout;

.field public e:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputEditRootLayout;

.field public f:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

.field public g:Lv/VText;

.field public h:Ll/f0r;

.field public i:Ljava/lang/String;

.field public j:Ljava/lang/String;

.field public k:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->k:Z

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->y2(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public static synthetic Y1(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic Z1(Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->A2(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic a2(Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->q2(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic b2(Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->w2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c2(Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->p2(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic d2(Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->r2()V

    return-void
.end method

.method public static synthetic e2(Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->u2(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic g2(Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->s2()V

    return-void
.end method

.method public static synthetic h2(Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->v2(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic i2(Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->z2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l2(Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;)V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static m2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    sget-object p0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->l:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    sget-object p0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->m:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method private o2()V
    .locals 3

    .line 1
    new-instance v0, Ll/odz;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/odz;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;)V

    .line 4
    .line 5
    .line 6
    const-wide/16 v1, 0x96

    .line 7
    .line 8
    invoke-virtual {p0, v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->h:Ll/f0r;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    new-instance v0, Ll/f0r;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Ll/f0r;-><init>(Landroid/app/Activity;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->h:Ll/f0r;

    .line 21
    .line 22
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Ll/pdz;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/pdz;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    new-instance v1, Ll/gdz;

    .line 47
    .line 48
    invoke-direct {v1, p0}, Ll/gdz;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;)V

    .line 49
    .line 50
    .line 51
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method private synthetic q2(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->r()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private r()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->j:Ljava/lang/String;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->q:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x1

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->j:Ljava/lang/String;

    .line 13
    .line 14
    sget-object v2, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->r:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->f:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setInputType(I)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->e:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputEditRootLayout;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    sget v3, Ll/ibc0;->a2:I

    .line 34
    .line 35
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 40
    .line 41
    .line 42
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->g:Lv/VText;

    .line 43
    .line 44
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->j:Ljava/lang/String;

    .line 52
    .line 53
    sget-object v1, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->q:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_2

    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->f:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 62
    .line 63
    const-string v1, "\u8bf4\u70b9\u4ec0\u4e48"

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->setSpaceHint(Ljava/lang/CharSequence;)V

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->j:Ljava/lang/String;

    .line 70
    .line 71
    sget-object v1, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->r:Ljava/lang/String;

    .line 72
    .line 73
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->f:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 78
    .line 79
    if-eqz v0, :cond_3

    .line 80
    .line 81
    const-string v0, "\u6253\u4e2a\u62db\u547c"

    .line 82
    .line 83
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->setSpaceHint(Ljava/lang/CharSequence;)V

    .line 84
    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_3
    const-string v0, "\u6253\u4e2a\u62db\u547c\u2026"

    .line 88
    .line 89
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->setSpaceHint(Ljava/lang/CharSequence;)V

    .line 90
    .line 91
    .line 92
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->g:Lv/VText;

    .line 93
    .line 94
    new-instance v1, Ll/idz;

    .line 95
    .line 96
    invoke-direct {v1, p0}, Ll/idz;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;)V

    .line 97
    .line 98
    .line 99
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->f:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 103
    .line 104
    invoke-virtual {v0}, Lv/VEditText;->h()Lrx/c;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    new-instance v1, Ll/jdz;

    .line 109
    .line 110
    invoke-direct {v1, p0}, Ll/jdz;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;)V

    .line 111
    .line 112
    .line 113
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 118
    .line 119
    .line 120
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->c:Landroid/widget/FrameLayout;

    .line 121
    .line 122
    new-instance v1, Ll/kdz;

    .line 123
    .line 124
    invoke-direct {v1, p0}, Ll/kdz;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;)V

    .line 125
    .line 126
    .line 127
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 128
    .line 129
    .line 130
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->d:Landroid/widget/LinearLayout;

    .line 131
    .line 132
    new-instance v1, Ll/ldz;

    .line 133
    .line 134
    invoke-direct {v1}, Ll/ldz;-><init>()V

    .line 135
    .line 136
    .line 137
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 138
    .line 139
    .line 140
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->o2()V

    .line 141
    .line 142
    .line 143
    return-void
.end method

.method private synthetic v2(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->B2(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic w2(Landroid/view/View;)V
    .locals 9

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->f:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    goto/16 :goto_0

    .line 22
    .line 23
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->j:Ljava/lang/String;

    .line 24
    .line 25
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->o:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    new-instance p1, Ll/pf60;

    .line 34
    .line 35
    const-string v0, "other_uid"

    .line 36
    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->i:Ljava/lang/String;

    .line 38
    .line 39
    invoke-direct {p1, v0, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    filled-new-array {p1}, [Ll/pf60;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    const-string v0, "e_online_match_chat_send"

    .line 47
    .line 48
    const-string v1, "p_messages_view"

    .line 49
    .line 50
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 58
    .line 59
    .line 60
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->i:Ljava/lang/String;

    .line 61
    .line 62
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->f:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 63
    .line 64
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v8

    .line 76
    const/4 v2, 0x0

    .line 77
    const/4 v3, 0x0

    .line 78
    const/4 v4, 0x0

    .line 79
    const/4 v5, 0x0

    .line 80
    const/4 v6, 0x0

    .line 81
    const/16 v7, 0x8

    .line 82
    .line 83
    move-object v0, p0

    .line 84
    invoke-static/range {v0 .. v8}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->q2(Landroid/content/Context;Ljava/lang/String;ZZZZLandroid/content/Intent;ILjava/lang/String;)Landroid/content/Intent;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->finish()V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_1
    move-object v0, p0

    .line 96
    iget-object p0, v0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->j:Ljava/lang/String;

    .line 97
    .line 98
    sget-object p1, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->p:Ljava/lang/String;

    .line 99
    .line 100
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 101
    .line 102
    .line 103
    move-result p0

    .line 104
    const-string p1, "input"

    .line 105
    .line 106
    if-eqz p0, :cond_2

    .line 107
    .line 108
    iget-object p0, v0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->f:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 109
    .line 110
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 127
    .line 128
    .line 129
    new-instance v1, Landroid/content/Intent;

    .line 130
    .line 131
    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 132
    .line 133
    .line 134
    invoke-virtual {v1, p1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 135
    .line 136
    .line 137
    const/16 p0, 0x64

    .line 138
    .line 139
    invoke-virtual {v0, p0, v1}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->finish()V

    .line 143
    .line 144
    .line 145
    return-void

    .line 146
    :cond_2
    iget-object p0, v0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->j:Ljava/lang/String;

    .line 147
    .line 148
    sget-object v1, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->n:Ljava/lang/String;

    .line 149
    .line 150
    invoke-static {p0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 151
    .line 152
    .line 153
    move-result p0

    .line 154
    if-eqz p0, :cond_3

    .line 155
    .line 156
    iget-object p0, v0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->f:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 157
    .line 158
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object p0

    .line 170
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 171
    .line 172
    .line 173
    move-result-object v1

    .line 174
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 175
    .line 176
    .line 177
    new-instance v1, Landroid/content/Intent;

    .line 178
    .line 179
    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 180
    .line 181
    .line 182
    invoke-virtual {v1, p1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 183
    .line 184
    .line 185
    const/16 p0, 0xc8

    .line 186
    .line 187
    invoke-virtual {v0, p0, v1}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 188
    .line 189
    .line 190
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->finish()V

    .line 191
    .line 192
    .line 193
    return-void

    .line 194
    :cond_3
    iget-object p0, v0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->j:Ljava/lang/String;

    .line 195
    .line 196
    sget-object p1, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->q:Ljava/lang/String;

    .line 197
    .line 198
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 199
    .line 200
    .line 201
    move-result p0

    .line 202
    if-nez p0, :cond_5

    .line 203
    .line 204
    iget-object p0, v0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->j:Ljava/lang/String;

    .line 205
    .line 206
    sget-object p1, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->r:Ljava/lang/String;

    .line 207
    .line 208
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 209
    .line 210
    .line 211
    move-result p0

    .line 212
    if-eqz p0, :cond_4

    .line 213
    .line 214
    goto :goto_1

    .line 215
    :cond_4
    :goto_0
    return-void

    .line 216
    :cond_5
    :goto_1
    const/4 p0, 0x0

    .line 217
    new-array p0, p0, [Ll/sfj0$a;

    .line 218
    .line 219
    const-string p1, "e_matched_send_message"

    .line 220
    .line 221
    const-string v1, "p_successful_match_view"

    .line 222
    .line 223
    invoke-static {p1, v1, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 224
    .line 225
    .line 226
    iget-object p0, v0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->f:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 227
    .line 228
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 229
    .line 230
    .line 231
    move-result-object p0

    .line 232
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object p0

    .line 236
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 237
    .line 238
    .line 239
    move-result-object p0

    .line 240
    iget-object p1, v0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->j:Ljava/lang/String;

    .line 241
    .line 242
    sget-object v1, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->r:Ljava/lang/String;

    .line 243
    .line 244
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 245
    .line 246
    .line 247
    move-result p1

    .line 248
    if-eqz p1, :cond_6

    .line 249
    .line 250
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->B2(Ljava/lang/String;)V

    .line 251
    .line 252
    .line 253
    return-void

    .line 254
    :cond_6
    sget-object p1, Ll/uqb0;->Z:Ll/a4j;

    .line 255
    .line 256
    invoke-virtual {p1, p0}, Ll/a4j;->K(Ljava/lang/String;)Z

    .line 257
    .line 258
    .line 259
    move-result p1

    .line 260
    if-eqz p1, :cond_7

    .line 261
    .line 262
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 263
    .line 264
    .line 265
    move-result-object p1

    .line 266
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 267
    .line 268
    .line 269
    move-result-object p1

    .line 270
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->E4:I

    .line 271
    .line 272
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/app/Dialog$e;->E0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 273
    .line 274
    .line 275
    move-result-object p1

    .line 276
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->C4:I

    .line 277
    .line 278
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 279
    .line 280
    .line 281
    move-result-object p1

    .line 282
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->B4:I

    .line 283
    .line 284
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/app/Dialog$e;->k0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 285
    .line 286
    .line 287
    move-result-object p1

    .line 288
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->D4:I

    .line 289
    .line 290
    new-instance v2, Ll/ndz;

    .line 291
    .line 292
    invoke-direct {v2, v0, p0}, Ll/ndz;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;Ljava/lang/String;)V

    .line 293
    .line 294
    .line 295
    invoke-virtual {p1, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 296
    .line 297
    .line 298
    move-result-object p0

    .line 299
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 300
    .line 301
    .line 302
    new-instance p0, Ljava/util/HashSet;

    .line 303
    .line 304
    sget-object p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->r:Ll/xyd0;

    .line 305
    .line 306
    invoke-virtual {p1}, Ll/dyd0;->get()Ljava/lang/Object;

    .line 307
    .line 308
    .line 309
    move-result-object p1

    .line 310
    check-cast p1, Ljava/util/Collection;

    .line 311
    .line 312
    invoke-direct {p0, p1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 313
    .line 314
    .line 315
    iget-object p1, v0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->i:Ljava/lang/String;

    .line 316
    .line 317
    invoke-virtual {p0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 318
    .line 319
    .line 320
    sget-object p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->r:Ll/xyd0;

    .line 321
    .line 322
    invoke-virtual {p1, p0}, Ll/dyd0;->put(Ljava/lang/Object;)Z

    .line 323
    .line 324
    .line 325
    return-void

    .line 326
    :cond_7
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->B2(Ljava/lang/String;)V

    .line 327
    .line 328
    .line 329
    return-void
.end method

.method private synthetic y2(Ljava/lang/CharSequence;)V
    .locals 1

    .line 1
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->g:Lv/VText;

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    sget p1, Ll/g9c0;->B:I

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getColor(I)I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    sget p1, Ll/g9c0;->C:I

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getColor(I)I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method private synthetic z2(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 13
    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public final synthetic A2(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Integer;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->e:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputEditRootLayout;

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-static {p0, p1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final B2(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 13
    .line 14
    .line 15
    new-instance v0, Landroid/content/Intent;

    .line 16
    .line 17
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 18
    .line 19
    .line 20
    const-string v1, "input"

    .line 21
    .line 22
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 23
    .line 24
    .line 25
    const/16 p1, 0x64

    .line 26
    .line 27
    invoke-virtual {p0, p1, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->finish()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public finish()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->j:Ljava/lang/String;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->q:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->j:Ljava/lang/String;

    .line 12
    .line 13
    sget-object v1, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->r:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->e:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputEditRootLayout;

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    invoke-static {v0, v1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 29
    .line 30
    .line 31
    sget v0, Ll/y7c0;->a:I

    .line 32
    .line 33
    invoke-virtual {p0, v0, v0}, Lcom/p1/mobile/putong/app/PutongAct;->overridePendingTransition(II)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 38
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->n2(Z)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public h(II)V
    .locals 2

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->j:Ljava/lang/String;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->q:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-nez p2, :cond_1

    .line 10
    .line 11
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->j:Ljava/lang/String;

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->r:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    if-eqz p2, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->e:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputEditRootLayout;

    .line 23
    .line 24
    invoke-static {p0, p1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    :goto_0
    const/4 p2, 0x0

    .line 29
    if-nez p1, :cond_2

    .line 30
    .line 31
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->k:Z

    .line 32
    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->n2(Z)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_2
    if-lez p1, :cond_3

    .line 40
    .line 41
    const/4 v0, 0x1

    .line 42
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->k:Z

    .line 43
    .line 44
    filled-new-array {p2, p1}, [I

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    new-instance p2, Ll/mdz;

    .line 53
    .line 54
    invoke-direct {p2, p0}, Ll/mdz;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 58
    .line 59
    .line 60
    const-wide/16 v0, 0x186

    .line 61
    .line 62
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 63
    .line 64
    .line 65
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->e:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputEditRootLayout;

    .line 66
    .line 67
    invoke-virtual {p1, p0}, Landroid/animation/Animator;->setTarget(Ljava/lang/Object;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    .line 71
    .line 72
    .line 73
    :cond_3
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->k2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public initDataOnCreate()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/16 v1, 0x500

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    sget-object v1, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->l:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->i:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sget-object v1, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->m:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->j:Ljava/lang/String;

    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->i:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_0

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->finish()V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_0
    new-instance v0, Ll/fdz;

    .line 54
    .line 55
    invoke-direct {v0, p0}, Ll/fdz;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public k2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/qdz;->b(Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final n2(Z)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->k:Z

    .line 3
    .line 4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->e:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputEditRootLayout;

    .line 5
    .line 6
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 11
    .line 12
    iget v1, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 13
    .line 14
    filled-new-array {v1, v0}, [I

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/hdz;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/hdz;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 28
    .line 29
    .line 30
    const-wide/16 v1, 0x186

    .line 31
    .line 32
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->e:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputEditRootLayout;

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->setTarget(Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    if-eqz p1, :cond_0

    .line 41
    .line 42
    new-instance p1, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct$a;

    .line 43
    .line 44
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct$a;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, p1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 48
    .line 49
    .line 50
    :cond_0
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final synthetic p2(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Integer;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->e:Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputEditRootLayout;

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-static {p0, p1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic r2()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->f:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->f:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic s2()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->h:Ll/f0r;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/f0r;->h()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public shouldSwitchToGradientColoredStatusBar()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public shouldSwitchToTransparentStatus()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public final synthetic u2(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->h:Ll/f0r;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ll/f0r;->g(Ll/d0r;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 12
    .line 13
    if-ne p1, v0, :cond_1

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->h:Ll/f0r;

    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    invoke-virtual {p0, p1}, Ll/f0r;->g(Ll/d0r;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 23
    .line 24
    if-ne p1, v0, :cond_2

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->h:Ll/f0r;

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/f0r;->b()V

    .line 29
    .line 30
    .line 31
    :cond_2
    return-void
.end method
