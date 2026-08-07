.class public Ll/y2h0$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/y2h0;->k(Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/data/ActionData;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/b;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/ActionToastStyleButton;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

.field public final synthetic d:Lcom/p1/mobile/putong/core/data/ActionData;

.field public final synthetic e:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;

.field public final synthetic f:Ll/y2h0;


# direct methods
.method public constructor <init>(Ll/y2h0;Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/data/ActionToastStyleButton;Lcom/p1/mobile/putong/core/data/ActionToastStyle;Lcom/p1/mobile/putong/core/data/ActionData;Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/y2h0$e;->f:Ll/y2h0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/y2h0$e;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 4
    .line 5
    iput-object p3, p0, Ll/y2h0$e;->b:Lcom/p1/mobile/putong/core/data/ActionToastStyleButton;

    .line 6
    .line 7
    iput-object p4, p0, Ll/y2h0$e;->c:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 8
    .line 9
    iput-object p5, p0, Ll/y2h0$e;->d:Lcom/p1/mobile/putong/core/data/ActionData;

    .line 10
    .line 11
    iput-object p6, p0, Ll/y2h0$e;->e:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 8

    .line 1
    iget-object p1, p0, Ll/y2h0$e;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Ll/y2h0$e;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iget-object v0, p0, Ll/y2h0$e;->b:Lcom/p1/mobile/putong/core/data/ActionToastStyleButton;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyleButton;->buttonLink:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {p1, v0}, Ll/xwa;->D(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 28
    .line 29
    .line 30
    new-instance p1, Ll/abe0$a;

    .line 31
    .line 32
    iget-object v0, p0, Ll/y2h0$e;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget-object v1, p0, Ll/y2h0$e;->b:Lcom/p1/mobile/putong/core/data/ActionToastStyleButton;

    .line 39
    .line 40
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ActionToastStyleButton;->buttonLink:Ljava/lang/String;

    .line 41
    .line 42
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-direct {p1, v0, v1}, Ll/abe0$a;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1}, Ll/abe0$a;->d()Ll/abe0;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    const-string v0, "popup_page"

    .line 58
    .line 59
    invoke-static {}, Ll/y2h0;->f()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    iget-object v0, p0, Ll/y2h0$e;->c:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 68
    .line 69
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->buttons:Ljava/util/List;

    .line 70
    .line 71
    const/4 v1, 0x0

    .line 72
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    check-cast v0, Lcom/p1/mobile/putong/core/data/ActionToastStyleButton;

    .line 77
    .line 78
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyleButton;->buttonMessage:Ljava/lang/String;

    .line 79
    .line 80
    const-string v1, "button_text"

    .line 81
    .line 82
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    iget-object v0, p0, Ll/y2h0$e;->c:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 87
    .line 88
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->showClose:Z

    .line 89
    .line 90
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    const-string v1, "has_close_button"

    .line 95
    .line 96
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 97
    .line 98
    .line 99
    move-result-object v4

    .line 100
    const-string v0, "button_link"

    .line 101
    .line 102
    invoke-virtual {p1}, Ll/abe0;->d()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 107
    .line 108
    .line 109
    move-result-object v5

    .line 110
    iget-object p1, p0, Ll/y2h0$e;->c:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 111
    .line 112
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->business:Ljava/lang/String;

    .line 113
    .line 114
    const-string v0, "business"

    .line 115
    .line 116
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 117
    .line 118
    .line 119
    move-result-object v6

    .line 120
    iget-object p1, p0, Ll/y2h0$e;->c:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 121
    .line 122
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->localReportId:Ljava/lang/String;

    .line 123
    .line 124
    const-string v0, "other_user_id"

    .line 125
    .line 126
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 127
    .line 128
    .line 129
    move-result-object v7

    .line 130
    filled-new-array/range {v2 .. v7}, [Ll/pf60;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    const-string v0, "e_friends_online_button_click"

    .line 135
    .line 136
    const-string v1, "p_suggest_users_home_view"

    .line 137
    .line 138
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 139
    .line 140
    .line 141
    invoke-static {}, Lcom/p1/mobile/android/ui/poplevel/a;->p()Lcom/p1/mobile/android/ui/poplevel/a;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    sget-object v0, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->SEE_TOAST:Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;

    .line 146
    .line 147
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->getOnlyName()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    sget-object v1, Lcom/p1/mobile/android/ui/poplevel/PopAction;->OTHER_ACTION:Lcom/p1/mobile/android/ui/poplevel/PopAction;

    .line 152
    .line 153
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/android/ui/poplevel/a;->o(Ljava/lang/String;Lcom/p1/mobile/android/ui/poplevel/PopAction;)V

    .line 154
    .line 155
    .line 156
    :cond_0
    iget-object p1, p0, Ll/y2h0$e;->f:Ll/y2h0;

    .line 157
    .line 158
    const/4 v0, 0x0

    .line 159
    iget-object v1, p0, Ll/y2h0$e;->d:Lcom/p1/mobile/putong/core/data/ActionData;

    .line 160
    .line 161
    const-string v2, "tapButton"

    .line 162
    .line 163
    const/4 v3, 0x1

    .line 164
    invoke-virtual {p1, v2, v3, v0, v1}, Ll/y2h0;->d(Ljava/lang/String;ZLjava/lang/String;Lcom/p1/mobile/putong/core/data/ActionData;)V

    .line 165
    .line 166
    .line 167
    iget-object p0, p0, Ll/y2h0$e;->e:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;

    .line 168
    .line 169
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;->I()V

    .line 170
    .line 171
    .line 172
    return-void
.end method
