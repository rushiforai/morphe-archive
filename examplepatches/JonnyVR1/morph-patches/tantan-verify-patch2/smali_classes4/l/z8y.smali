.class public Ll/z8y;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bzl;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000^\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\r\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0016\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u001f\u0010\u0008\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0011\u0010\u000b\u001a\u0004\u0018\u00010\nH\u0016\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u000f\u0010\r\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u000f\u0010\u0010\u001a\u00020\u000fH\u0016\u00a2\u0006\u0004\u0008\u0010\u0010\u0011J\u000f\u0010\u0013\u001a\u00020\u0012H\u0016\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J\u000f\u0010\u0015\u001a\u00020\u0012H\u0016\u00a2\u0006\u0004\u0008\u0015\u0010\u0014J\u001f\u0010\u001b\u001a\u00020\u001a2\u0006\u0010\u0017\u001a\u00020\u00162\u0006\u0010\u0019\u001a\u00020\u0018H\u0016\u00a2\u0006\u0004\u0008\u001b\u0010\u001cJ\u000f\u0010\u001e\u001a\u00020\u001dH\u0016\u00a2\u0006\u0004\u0008\u001e\u0010\u001fR\u0018\u0010\"\u001a\u0004\u0018\u00010 8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u001b\u0010!R\u0018\u0010%\u001a\u0004\u0018\u00010#8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0008\u0010$\u00a8\u0006&"
    }
    d2 = {
        "Ll/z8y;",
        "Ll/bzl;",
        "<init>",
        "()V",
        "Ll/j8y;",
        "meetEntranceData",
        "",
        "acceleratePairStrategyEnable",
        "b",
        "(Ll/j8y;Z)Z",
        "Lcom/p1/mobile/putong/data/Picture$ImageUri;",
        "getAvatar",
        "()Lcom/p1/mobile/putong/data/Picture$ImageUri;",
        "c",
        "()Z",
        "",
        "f",
        "()I",
        "",
        "getTitle",
        "()Ljava/lang/CharSequence;",
        "g",
        "Lcom/p1/mobile/putong/core/newui/messages/business/meet/MeetEntranceModel;",
        "viewModel",
        "Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;",
        "_view",
        "",
        "a",
        "(Lcom/p1/mobile/putong/core/newui/messages/business/meet/MeetEntranceModel;Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;)V",
        "",
        "d",
        "()Ljava/lang/String;",
        "Lcom/p1/mobile/putong/core/data/MyMeetEntryNearby;",
        "Lcom/p1/mobile/putong/core/data/MyMeetEntryNearby;",
        "nearby",
        "Lcom/p1/mobile/putong/data/User;",
        "Lcom/p1/mobile/putong/data/User;",
        "nearbyUser",
        "b_core_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/data/MyMeetEntryNearby;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public b:Lcom/p1/mobile/putong/data/User;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


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

.method public static h(Ll/z8y;Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p2, "guidance_type"

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/z8y;->d()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p2, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    filled-new-array {p0}, [Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string p2, "e_red_dot_message_see"

    .line 16
    .line 17
    const-string v0, "p_messages_view"

    .line 18
    .line 19
    invoke-static {p2, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    const-string p2, ""

    .line 31
    .line 32
    const-string v0, "nearby"

    .line 33
    .line 34
    invoke-static {p1, p2, v0}, Lcom/p1/mobile/putong/core/newui/meet/MeetAct;->Z1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 39
    .line 40
    .line 41
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m1:Lcom/p1/mobile/putong/core/api/s;

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/s;->L5()V

    .line 46
    .line 47
    .line 48
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/core/newui/messages/business/meet/MeetEntranceModel;Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;)V
    .locals 3
    .param p1    # Lcom/p1/mobile/putong/core/newui/messages/business/meet/MeetEntranceModel;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    iget-object p1, p2, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->i:Landroid/widget/ImageView;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p2, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->h:Lv/VDraweeView;

    .line 14
    .line 15
    const/high16 v1, 0x40e00000    # 7.0f

    .line 16
    .line 17
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    invoke-static {p1, v1}, Ll/bnl0;->h0(Landroid/view/View;I)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p2, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->h:Lv/VDraweeView;

    .line 25
    .line 26
    sget v1, Ll/dbc0;->Ue:I

    .line 27
    .line 28
    invoke-virtual {p1, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 29
    .line 30
    .line 31
    invoke-static {}, Ll/gra;->z()Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    iget-object v1, p2, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->u:Lv/VImage;

    .line 36
    .line 37
    if-eqz p1, :cond_0

    .line 38
    .line 39
    sget p1, Ll/dbc0;->Sg:I

    .line 40
    .line 41
    invoke-virtual {v1, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    sget p1, Ll/dbc0;->Ze:I

    .line 46
    .line 47
    invoke-virtual {v1, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 48
    .line 49
    .line 50
    :goto_0
    iget-object p1, p2, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->u:Lv/VImage;

    .line 51
    .line 52
    const/4 v1, 0x1

    .line 53
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 54
    .line 55
    .line 56
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 57
    .line 58
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->m1:Lcom/p1/mobile/putong/core/api/s;

    .line 59
    .line 60
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/s;->i4()Z

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    iget-object v2, p2, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->z:Lv/VText;

    .line 65
    .line 66
    if-eqz p1, :cond_3

    .line 67
    .line 68
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    instance-of v2, p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 73
    .line 74
    if-eqz v2, :cond_1

    .line 75
    .line 76
    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_1
    const/4 p1, 0x0

    .line 80
    :goto_1
    if-eqz p1, :cond_2

    .line 81
    .line 82
    sget v2, Ll/qa00;->j:I

    .line 83
    .line 84
    iput v2, p1, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 85
    .line 86
    iput v2, p1, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 87
    .line 88
    sget v2, Ll/qa00;->c:I

    .line 89
    .line 90
    iput v2, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 91
    .line 92
    iget-object v2, p2, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->z:Lv/VText;

    .line 93
    .line 94
    invoke-virtual {v2, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 95
    .line 96
    .line 97
    :cond_2
    iget-object p1, p2, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->z:Lv/VText;

    .line 98
    .line 99
    sget v2, Ll/qa00;->j:I

    .line 100
    .line 101
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setMinWidth(I)V

    .line 102
    .line 103
    .line 104
    iget-object p1, p2, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->z:Lv/VText;

    .line 105
    .line 106
    const-string v2, ""

    .line 107
    .line 108
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 109
    .line 110
    .line 111
    iget-object p1, p2, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->z:Lv/VText;

    .line 112
    .line 113
    sget v2, Ll/dbc0;->Y5:I

    .line 114
    .line 115
    invoke-virtual {p1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 116
    .line 117
    .line 118
    iget-object p1, p2, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->z:Lv/VText;

    .line 119
    .line 120
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 121
    .line 122
    .line 123
    goto :goto_2

    .line 124
    :cond_3
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 125
    .line 126
    .line 127
    :goto_2
    iget-object p1, p2, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->A:Lv/VText;

    .line 128
    .line 129
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 130
    .line 131
    .line 132
    new-instance p1, Ll/y8y;

    .line 133
    .line 134
    invoke-direct {p1, p0, p2}, Ll/y8y;-><init>(Ll/z8y;Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;)V

    .line 135
    .line 136
    .line 137
    invoke-static {p2, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 138
    .line 139
    .line 140
    return-void
.end method

.method public b(Ll/j8y;Z)Z
    .locals 3
    .param p1    # Ll/j8y;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ll/j8y;->b()Lcom/p1/mobile/putong/core/data/MyMeetEntryNearby;

    .line 5
    .line 6
    .line 7
    move-result-object p2

    .line 8
    const/4 v0, 0x0

    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/MyMeetEntryNearby;->userIds:Ljava/util/List;

    .line 12
    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    check-cast p2, Ljava/util/Collection;

    .line 16
    .line 17
    invoke-interface {p2}, Ljava/util/Collection;->isEmpty()Z

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    const/4 v1, 0x1

    .line 22
    xor-int/2addr p2, v1

    .line 23
    if-ne p2, v1, :cond_0

    .line 24
    .line 25
    invoke-virtual {p1}, Ll/j8y;->b()Lcom/p1/mobile/putong/core/data/MyMeetEntryNearby;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 30
    .line 31
    .line 32
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/MyMeetEntryNearby;->userIds:Ljava/util/List;

    .line 33
    .line 34
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    check-cast p2, Ljava/lang/String;

    .line 39
    .line 40
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 41
    .line 42
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 43
    .line 44
    invoke-virtual {v2, p2}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    if-eqz p2, :cond_0

    .line 49
    .line 50
    iput-object p2, p0, Ll/z8y;->b:Lcom/p1/mobile/putong/data/User;

    .line 51
    .line 52
    invoke-virtual {p1}, Ll/j8y;->b()Lcom/p1/mobile/putong/core/data/MyMeetEntryNearby;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    iput-object p1, p0, Ll/z8y;->a:Lcom/p1/mobile/putong/core/data/MyMeetEntryNearby;

    .line 57
    .line 58
    return v1

    .line 59
    :cond_0
    return v0
.end method

.method public c()Z
    .locals 1

    .line 1
    invoke-static {}, Ll/joa;->M3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/z8y;->b:Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public d()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const-string p0, "nearby"

    .line 2
    .line 3
    return-object p0
.end method

.method public f()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public g()Ljava/lang/CharSequence;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/z8y;->a:Lcom/p1/mobile/putong/core/data/MyMeetEntryNearby;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MyMeetEntryNearby;->subText:Ljava/lang/String;

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    :goto_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_2

    .line 14
    .line 15
    iget-object p0, p0, Ll/z8y;->a:Lcom/p1/mobile/putong/core/data/MyMeetEntryNearby;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryNearby;->subText:Ljava/lang/String;

    .line 20
    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_1
    const-string p0, ""

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_2
    const-string p0, "\u5176\u4e2d\u6709\u4eba\u6b63\u5728\u627e\u4eba\u804a\u5929\uff0c\u5feb\u53bb\u770b\u770b\u5427"

    .line 28
    .line 29
    return-object p0
.end method

.method public getAvatar()Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/z8y;->b:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return-object p0
.end method

.method public getTitle()Ljava/lang/CharSequence;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/z8y;->b:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const/4 v0, 0x1

    .line 10
    if-ne p0, v0, :cond_0

    .line 11
    .line 12
    const-string p0, "\u5979"

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const-string p0, "\u4ed6"

    .line 16
    .line 17
    :goto_0
    const-string v0, "\u4e3a\u4f60\u627e\u5230\u4e86\u9644\u8fd1\u5728\u7ebf\u7684"

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method
