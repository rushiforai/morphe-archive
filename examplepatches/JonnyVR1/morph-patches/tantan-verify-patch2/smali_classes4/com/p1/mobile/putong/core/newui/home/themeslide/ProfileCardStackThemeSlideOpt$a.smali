.class public Lcom/p1/mobile/putong/core/newui/home/themeslide/ProfileCardStackThemeSlideOpt$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/dn4;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/home/themeslide/ProfileCardStackThemeSlideOpt;->B()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/themeslide/ProfileCardStackThemeSlideOpt;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/themeslide/ProfileCardStackThemeSlideOpt;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/themeslide/ProfileCardStackThemeSlideOpt$a;->a:Lcom/p1/mobile/putong/core/newui/home/themeslide/ProfileCardStackThemeSlideOpt;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ll/txl0;Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;Z)Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;
    .locals 9

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/themeslide/ProfileCardStackThemeSlideOpt$c;->a:[I

    .line 4
    .line 5
    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    aget p2, v1, p2

    .line 10
    .line 11
    const/4 v1, 0x3

    .line 12
    const/4 v2, 0x2

    .line 13
    const/4 v3, 0x1

    .line 14
    if-eq p2, v3, :cond_1

    .line 15
    .line 16
    if-eq p2, v2, :cond_2

    .line 17
    .line 18
    if-eq p2, v1, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 25
    .line 26
    :cond_2
    :goto_0
    sget-object p2, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->back:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 27
    .line 28
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/themeslide/ProfileCardStackThemeSlideOpt$a;->a:Lcom/p1/mobile/putong/core/newui/home/themeslide/ProfileCardStackThemeSlideOpt;

    .line 29
    .line 30
    iget-object v4, v4, Lcom/p1/mobile/putong/core/newui/home/themeslide/ProfileCardStackThemeSlideOpt;->h:Ll/pl50;

    .line 31
    .line 32
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v4

    .line 36
    if-eqz v4, :cond_9

    .line 37
    .line 38
    iget-object v4, p1, Ll/txl0;->a:Landroid/view/View;

    .line 39
    .line 40
    instance-of v5, v4, Ll/q7m;

    .line 41
    .line 42
    const-string v6, ","

    .line 43
    .line 44
    const-string v7, "\u5212\u5361\u5f02\u5e38\uff1a"

    .line 45
    .line 46
    if-eqz v5, :cond_3

    .line 47
    .line 48
    :try_start_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/themeslide/ProfileCardStackThemeSlideOpt$a;->a:Lcom/p1/mobile/putong/core/newui/home/themeslide/ProfileCardStackThemeSlideOpt;

    .line 49
    .line 50
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/themeslide/ProfileCardStackThemeSlideOpt;->h:Ll/pl50;

    .line 51
    .line 52
    check-cast v4, Ll/q7m;

    .line 53
    .line 54
    invoke-interface {p1, v4, v0, p3}, Ll/pl50;->a(Ll/xql;Lcom/p1/mobile/putong/core/data/SwipeDirection;Z)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 55
    .line 56
    .line 57
    move-result-object p2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    goto/16 :goto_1

    .line 59
    .line 60
    :catch_0
    move-exception p1

    .line 61
    new-instance p3, Ljava/lang/RuntimeException;

    .line 62
    .line 63
    new-instance v0, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    invoke-direct {v0, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v4

    .line 72
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/themeslide/ProfileCardStackThemeSlideOpt$a;->a:Lcom/p1/mobile/putong/core/newui/home/themeslide/ProfileCardStackThemeSlideOpt;

    .line 79
    .line 80
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/themeslide/ProfileCardStackThemeSlideOpt;->g:Ll/px2;

    .line 81
    .line 82
    invoke-virtual {p0}, Ll/mx2;->b()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-direct {p3, p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 94
    .line 95
    .line 96
    invoke-static {p3}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 97
    .line 98
    .line 99
    goto :goto_1

    .line 100
    :cond_3
    instance-of p3, v4, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;

    .line 101
    .line 102
    if-eqz p3, :cond_5

    .line 103
    .line 104
    iget-object p2, p1, Ll/txl0;->c:Ljava/lang/Object;

    .line 105
    .line 106
    instance-of p3, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 107
    .line 108
    if-eqz p3, :cond_4

    .line 109
    .line 110
    check-cast p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 111
    .line 112
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isVirtualCard()Z

    .line 113
    .line 114
    .line 115
    move-result p3

    .line 116
    if-nez p3, :cond_4

    .line 117
    .line 118
    new-instance p3, Ljava/lang/RuntimeException;

    .line 119
    .line 120
    new-instance v5, Ljava/lang/StringBuilder;

    .line 121
    .line 122
    const-string v8, "\u9519\u8bef\u7684\u5361\u7247\u7c7b\u578b\uff1a"

    .line 123
    .line 124
    invoke-direct {v5, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 128
    .line 129
    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object p2

    .line 136
    invoke-direct {p3, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    invoke-static {p3}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 140
    .line 141
    .line 142
    :cond_4
    :try_start_1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/themeslide/ProfileCardStackThemeSlideOpt$a;->a:Lcom/p1/mobile/putong/core/newui/home/themeslide/ProfileCardStackThemeSlideOpt;

    .line 143
    .line 144
    iget-object p2, p2, Lcom/p1/mobile/putong/core/newui/home/themeslide/ProfileCardStackThemeSlideOpt;->h:Ll/pl50;

    .line 145
    .line 146
    new-instance p3, Ll/vxl0;

    .line 147
    .line 148
    iget-object p1, p1, Ll/txl0;->c:Ljava/lang/Object;

    .line 149
    .line 150
    check-cast p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 151
    .line 152
    check-cast v4, Lcom/p1/mobile/putong/core/ui/home/VirtualCard;

    .line 153
    .line 154
    invoke-direct {p3, p1, v4}, Ll/vxl0;-><init>(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/core/ui/home/VirtualCard;)V

    .line 155
    .line 156
    .line 157
    const/4 p1, 0x0

    .line 158
    invoke-interface {p2, p3, v0, p1}, Ll/pl50;->a(Ll/xql;Lcom/p1/mobile/putong/core/data/SwipeDirection;Z)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 159
    .line 160
    .line 161
    move-result-object p2
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 162
    goto :goto_1

    .line 163
    :catch_1
    move-exception p1

    .line 164
    sget-object p2, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 165
    .line 166
    new-instance p3, Ljava/lang/RuntimeException;

    .line 167
    .line 168
    new-instance v0, Ljava/lang/StringBuilder;

    .line 169
    .line 170
    invoke-direct {v0, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 171
    .line 172
    .line 173
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v4

    .line 177
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/themeslide/ProfileCardStackThemeSlideOpt$a;->a:Lcom/p1/mobile/putong/core/newui/home/themeslide/ProfileCardStackThemeSlideOpt;

    .line 184
    .line 185
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/themeslide/ProfileCardStackThemeSlideOpt;->g:Ll/px2;

    .line 186
    .line 187
    invoke-virtual {p0}, Ll/mx2;->b()Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object p0

    .line 191
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object p0

    .line 198
    invoke-direct {p3, p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 199
    .line 200
    .line 201
    invoke-static {p3}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 202
    .line 203
    .line 204
    :cond_5
    :goto_1
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/themeslide/ProfileCardStackThemeSlideOpt$c;->b:[I

    .line 205
    .line 206
    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    .line 207
    .line 208
    .line 209
    move-result p1

    .line 210
    aget p0, p0, p1

    .line 211
    .line 212
    if-eq p0, v3, :cond_8

    .line 213
    .line 214
    if-eq p0, v2, :cond_7

    .line 215
    .line 216
    if-eq p0, v1, :cond_6

    .line 217
    .line 218
    goto :goto_2

    .line 219
    :cond_6
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;->STAY:Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;

    .line 220
    .line 221
    return-object p0

    .line 222
    :cond_7
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;->PASS:Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;

    .line 223
    .line 224
    return-object p0

    .line 225
    :cond_8
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;->BACK:Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;

    .line 226
    .line 227
    return-object p0

    .line 228
    :cond_9
    :goto_2
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;->BACK:Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;

    .line 229
    .line 230
    return-object p0
.end method
