.class public Ll/y2h0$d;
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
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/home/b;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/ActionData;

.field public final synthetic d:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;

.field public final synthetic e:Ll/y2h0;


# direct methods
.method public constructor <init>(Ll/y2h0;Lcom/p1/mobile/putong/core/data/ActionToastStyle;Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/data/ActionData;Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/y2h0$d;->e:Ll/y2h0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/y2h0$d;->a:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 4
    .line 5
    iput-object p3, p0, Ll/y2h0$d;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 6
    .line 7
    iput-object p4, p0, Ll/y2h0$d;->c:Lcom/p1/mobile/putong/core/data/ActionData;

    .line 8
    .line 9
    iput-object p5, p0, Ll/y2h0$d;->d:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 9

    .line 1
    iget-object p1, p0, Ll/y2h0$d;->a:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->toastLink:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    goto/16 :goto_1

    .line 12
    .line 13
    :cond_0
    iget-object p1, p0, Ll/y2h0$d;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_3

    .line 24
    .line 25
    new-instance p1, Ll/abe0$a;

    .line 26
    .line 27
    iget-object v0, p0, Ll/y2h0$d;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object v1, p0, Ll/y2h0$d;->a:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 34
    .line 35
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->toastLink:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-direct {p1, v0, v1}, Ll/abe0$a;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1}, Ll/abe0$a;->d()Ll/abe0;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p1}, Ll/abe0;->d()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-nez p1, :cond_1

    .line 61
    .line 62
    iget-object p1, p0, Ll/y2h0$d;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 63
    .line 64
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    iget-object v0, p0, Ll/y2h0$d;->a:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 69
    .line 70
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->toastLink:Ljava/lang/String;

    .line 71
    .line 72
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-static {p1, v0}, Ll/xwa;->D(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 77
    .line 78
    .line 79
    iget-object p1, p0, Ll/y2h0$d;->e:Ll/y2h0;

    .line 80
    .line 81
    const/4 v0, 0x0

    .line 82
    iget-object v1, p0, Ll/y2h0$d;->c:Lcom/p1/mobile/putong/core/data/ActionData;

    .line 83
    .line 84
    const-string v2, "tapPop"

    .line 85
    .line 86
    const/4 v3, 0x1

    .line 87
    invoke-virtual {p1, v2, v3, v0, v1}, Ll/y2h0;->d(Ljava/lang/String;ZLjava/lang/String;Lcom/p1/mobile/putong/core/data/ActionData;)V

    .line 88
    .line 89
    .line 90
    iget-object p1, p0, Ll/y2h0$d;->d:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;

    .line 91
    .line 92
    invoke-virtual {p1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;->I()V

    .line 93
    .line 94
    .line 95
    :cond_1
    const-string p1, "popup_page"

    .line 96
    .line 97
    invoke-static {}, Ll/y2h0;->f()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    iget-object p1, p0, Ll/y2h0$d;->a:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 106
    .line 107
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->buttons:Ljava/util/List;

    .line 108
    .line 109
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 110
    .line 111
    .line 112
    move-result p1

    .line 113
    if-eqz p1, :cond_2

    .line 114
    .line 115
    const-string p1, ""

    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_2
    iget-object p1, p0, Ll/y2h0$d;->a:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 119
    .line 120
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->buttons:Ljava/util/List;

    .line 121
    .line 122
    const/4 v0, 0x0

    .line 123
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    check-cast p1, Lcom/p1/mobile/putong/core/data/ActionToastStyleButton;

    .line 128
    .line 129
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ActionToastStyleButton;->buttonMessage:Ljava/lang/String;

    .line 130
    .line 131
    :goto_0
    const-string v0, "button_text"

    .line 132
    .line 133
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 134
    .line 135
    .line 136
    move-result-object v2

    .line 137
    iget-object p1, p0, Ll/y2h0$d;->a:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 138
    .line 139
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->toastLink:Ljava/lang/String;

    .line 140
    .line 141
    const-string v0, "area_link"

    .line 142
    .line 143
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 144
    .line 145
    .line 146
    move-result-object v3

    .line 147
    iget-object p1, p0, Ll/y2h0$d;->a:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 148
    .line 149
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->localReportId:Ljava/lang/String;

    .line 150
    .line 151
    const-string v0, "from_female_id"

    .line 152
    .line 153
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 154
    .line 155
    .line 156
    move-result-object v4

    .line 157
    iget-object p1, p0, Ll/y2h0$d;->a:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 158
    .line 159
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->business:Ljava/lang/String;

    .line 160
    .line 161
    const-string v0, "business"

    .line 162
    .line 163
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 164
    .line 165
    .line 166
    move-result-object v5

    .line 167
    iget-object p1, p0, Ll/y2h0$d;->a:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 168
    .line 169
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->title:Ljava/lang/String;

    .line 170
    .line 171
    const-string v0, "popup_title"

    .line 172
    .line 173
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 174
    .line 175
    .line 176
    move-result-object v6

    .line 177
    iget-object p1, p0, Ll/y2h0$d;->a:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 178
    .line 179
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->message:Ljava/lang/String;

    .line 180
    .line 181
    const-string v0, "popup_subtitle"

    .line 182
    .line 183
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 184
    .line 185
    .line 186
    move-result-object v7

    .line 187
    iget-object p0, p0, Ll/y2h0$d;->a:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 188
    .line 189
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->localReportId:Ljava/lang/String;

    .line 190
    .line 191
    const-string p1, "other_user_id"

    .line 192
    .line 193
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 194
    .line 195
    .line 196
    move-result-object v8

    .line 197
    filled-new-array/range {v1 .. v8}, [Ll/pf60;

    .line 198
    .line 199
    .line 200
    move-result-object p0

    .line 201
    const-string p1, "e_friends_online_popup"

    .line 202
    .line 203
    const-string v0, "p_suggest_users_home_view"

    .line 204
    .line 205
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 206
    .line 207
    .line 208
    invoke-static {}, Lcom/p1/mobile/android/ui/poplevel/a;->p()Lcom/p1/mobile/android/ui/poplevel/a;

    .line 209
    .line 210
    .line 211
    move-result-object p0

    .line 212
    sget-object p1, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->SEE_TOAST:Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;

    .line 213
    .line 214
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->getOnlyName()Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object p1

    .line 218
    sget-object v0, Lcom/p1/mobile/android/ui/poplevel/PopAction;->OTHER_ACTION:Lcom/p1/mobile/android/ui/poplevel/PopAction;

    .line 219
    .line 220
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/android/ui/poplevel/a;->o(Ljava/lang/String;Lcom/p1/mobile/android/ui/poplevel/PopAction;)V

    .line 221
    .line 222
    .line 223
    :cond_3
    :goto_1
    return-void
.end method
