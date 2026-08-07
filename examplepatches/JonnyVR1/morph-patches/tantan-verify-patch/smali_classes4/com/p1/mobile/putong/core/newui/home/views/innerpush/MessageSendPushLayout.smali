.class public Lcom/p1/mobile/putong/core/newui/home/views/innerpush/MessageSendPushLayout;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/sum;


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lv/VText;

.field public c:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p2, p1, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->f:Ljava/lang/String;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/4 v1, 0x1

    .line 5
    invoke-static {p0, p2, v0, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l2(Landroid/content/Context;Ljava/lang/String;ZZI)Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-virtual {p0, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/ud2;->j()Ll/ud2;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->f:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ll/ud2;->e(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;Lcom/p1/mobile/putong/newui/main/base/TabName;Lcom/p1/mobile/android/app/Frag;)V
    .locals 4

    .line 1
    iget-object p3, p2, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->c:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p3

    .line 7
    const/4 p4, 0x1

    .line 8
    if-nez p3, :cond_1

    .line 9
    .line 10
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/MessageSendPushLayout;->a:Lv/VDraweeView;

    .line 11
    .line 12
    invoke-static {p3, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget-boolean p3, p2, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->e:Z

    .line 16
    .line 17
    if-eqz p3, :cond_0

    .line 18
    .line 19
    sget-object p3, Ll/uqb0;->G:Ll/fsb0;

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/MessageSendPushLayout;->a:Lv/VDraweeView;

    .line 22
    .line 23
    iget-object v1, p2, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->c:Ljava/lang/String;

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    const/16 v3, 0xa

    .line 27
    .line 28
    invoke-virtual {p3, v0, v1, v2, v3}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    sget-object p3, Ll/uqb0;->G:Ll/fsb0;

    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/MessageSendPushLayout;->a:Lv/VDraweeView;

    .line 35
    .line 36
    iget-object v1, p2, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->c:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {p3, v0, v1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    iget p3, p2, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->d:I

    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/MessageSendPushLayout;->a:Lv/VDraweeView;

    .line 45
    .line 46
    if-lez p3, :cond_2

    .line 47
    .line 48
    invoke-static {v0, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 49
    .line 50
    .line 51
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/MessageSendPushLayout;->a:Lv/VDraweeView;

    .line 52
    .line 53
    iget v0, p2, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->d:I

    .line 54
    .line 55
    invoke-virtual {p3, v0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_2
    const/4 p3, 0x0

    .line 60
    invoke-static {v0, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 61
    .line 62
    .line 63
    :goto_0
    iget-object p3, p2, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->a:Ljava/lang/CharSequence;

    .line 64
    .line 65
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result p3

    .line 69
    if-nez p3, :cond_3

    .line 70
    .line 71
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/MessageSendPushLayout;->b:Lv/VText;

    .line 72
    .line 73
    invoke-static {p3, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 74
    .line 75
    .line 76
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/MessageSendPushLayout;->b:Lv/VText;

    .line 77
    .line 78
    iget-object v0, p2, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->a:Ljava/lang/CharSequence;

    .line 79
    .line 80
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 81
    .line 82
    .line 83
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/MessageSendPushLayout;->b:Lv/VText;

    .line 84
    .line 85
    invoke-virtual {p3}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 86
    .line 87
    .line 88
    move-result-object p3

    .line 89
    invoke-virtual {p3, p4}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 90
    .line 91
    .line 92
    :cond_3
    iget-object p3, p2, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->b:Ljava/lang/CharSequence;

    .line 93
    .line 94
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 95
    .line 96
    .line 97
    move-result p3

    .line 98
    if-nez p3, :cond_4

    .line 99
    .line 100
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/MessageSendPushLayout;->c:Lv/VText;

    .line 101
    .line 102
    invoke-static {p3, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 103
    .line 104
    .line 105
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/MessageSendPushLayout;->c:Lv/VText;

    .line 106
    .line 107
    iget-object v0, p2, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->b:Ljava/lang/CharSequence;

    .line 108
    .line 109
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 110
    .line 111
    .line 112
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/MessageSendPushLayout;->c:Lv/VText;

    .line 113
    .line 114
    invoke-virtual {p3}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 115
    .line 116
    .line 117
    move-result-object p3

    .line 118
    invoke-virtual {p3, p4}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 119
    .line 120
    .line 121
    :cond_4
    iget-object p3, p2, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;->f:Ljava/lang/String;

    .line 122
    .line 123
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 124
    .line 125
    .line 126
    move-result p3

    .line 127
    if-nez p3, :cond_5

    .line 128
    .line 129
    new-instance p3, Ll/z500;

    .line 130
    .line 131
    invoke-direct {p3, p1, p2}, Ll/z500;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;)V

    .line 132
    .line 133
    .line 134
    invoke-static {p0, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 135
    .line 136
    .line 137
    :cond_5
    return-void
.end method

.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/c600;->a(Lcom/p1/mobile/putong/core/newui/home/views/innerpush/MessageSendPushLayout;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/MessageSendPushLayout;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
