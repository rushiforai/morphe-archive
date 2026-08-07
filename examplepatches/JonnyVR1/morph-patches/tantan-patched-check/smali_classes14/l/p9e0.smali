.class public Ll/p9e0;
.super Ll/o5e0;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/o5e0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public c(Ll/abe0;Ll/z20;)Landroid/content/Intent;
    .locals 6
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/abe0;",
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Landroid/content/Intent;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/abe0;->f()Ljava/util/Map;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p2, "option"

    .line 6
    .line 7
    invoke-interface {p0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    const/4 v0, 0x0

    .line 18
    if-eqz p2, :cond_0

    .line 19
    .line 20
    return-object v0

    .line 21
    :cond_0
    invoke-virtual {p1}, Ll/abe0;->f()Ljava/util/Map;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    const-string v1, "userid"

    .line 26
    .line 27
    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    check-cast p2, Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-static {p1}, Ll/bnl0;->D(Landroid/content/Context;)Landroid/app/Activity;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    if-nez v1, :cond_1

    .line 46
    .line 47
    move-object v1, v0

    .line 48
    goto :goto_0

    .line 49
    :cond_1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    iget-object v1, v1, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 54
    .line 55
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    check-cast v1, Landroid/app/Activity;

    .line 60
    .line 61
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    const/4 v3, 0x1

    .line 69
    const/4 v4, 0x0

    .line 70
    const/4 v5, -0x1

    .line 71
    sparse-switch v2, :sswitch_data_0

    .line 72
    .line 73
    .line 74
    goto :goto_1

    .line 75
    :sswitch_0
    const-string v2, "newpage"

    .line 76
    .line 77
    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result p0

    .line 81
    if-nez p0, :cond_2

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_2
    const/4 v5, 0x2

    .line 85
    goto :goto_1

    .line 86
    :sswitch_1
    const-string v2, "dislike"

    .line 87
    .line 88
    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result p0

    .line 92
    if-nez p0, :cond_3

    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_3
    move v5, v3

    .line 96
    goto :goto_1

    .line 97
    :sswitch_2
    const-string v2, "like"

    .line 98
    .line 99
    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result p0

    .line 103
    if-nez p0, :cond_4

    .line 104
    .line 105
    goto :goto_1

    .line 106
    :cond_4
    move v5, v4

    .line 107
    :goto_1
    packed-switch v5, :pswitch_data_0

    .line 108
    .line 109
    .line 110
    goto :goto_2

    .line 111
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 112
    .line 113
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 114
    .line 115
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->b0:Lrx/subjects/a;

    .line 116
    .line 117
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    check-cast p0, Lcom/p1/mobile/putong/core/data/ActionData;

    .line 122
    .line 123
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    move-result p2

    .line 127
    if-eqz p2, :cond_5

    .line 128
    .line 129
    iget-object p2, p0, Lcom/p1/mobile/putong/core/data/ActionData;->pageFormat:Lcom/p1/mobile/putong/core/data/ActionPageFormat;

    .line 130
    .line 131
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/ActionPageFormat;->cardPatterns:Ljava/util/List;

    .line 132
    .line 133
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 134
    .line 135
    .line 136
    move-result p2

    .line 137
    if-nez p2, :cond_5

    .line 138
    .line 139
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ActionData;->pageFormat:Lcom/p1/mobile/putong/core/data/ActionPageFormat;

    .line 140
    .line 141
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/core/newui/suggest/SuggestersAct;->c2(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/ActionPageFormat;)V

    .line 142
    .line 143
    .line 144
    goto :goto_2

    .line 145
    :pswitch_1
    instance-of p0, v1, Lcom/p1/mobile/putong/core/newui/suggest/SuggestersAct;

    .line 146
    .line 147
    if-eqz p0, :cond_5

    .line 148
    .line 149
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 150
    .line 151
    .line 152
    move-result p0

    .line 153
    if-nez p0, :cond_5

    .line 154
    .line 155
    check-cast v1, Lcom/p1/mobile/putong/core/newui/suggest/SuggestersAct;

    .line 156
    .line 157
    invoke-virtual {v1, v4}, Lcom/p1/mobile/putong/core/newui/suggest/SuggestersAct;->b2(Z)V

    .line 158
    .line 159
    .line 160
    goto :goto_2

    .line 161
    :pswitch_2
    instance-of p0, v1, Lcom/p1/mobile/putong/core/newui/suggest/SuggestersAct;

    .line 162
    .line 163
    if-eqz p0, :cond_5

    .line 164
    .line 165
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 166
    .line 167
    .line 168
    move-result p0

    .line 169
    if-nez p0, :cond_5

    .line 170
    .line 171
    check-cast v1, Lcom/p1/mobile/putong/core/newui/suggest/SuggestersAct;

    .line 172
    .line 173
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/core/newui/suggest/SuggestersAct;->b2(Z)V

    .line 174
    .line 175
    .line 176
    :cond_5
    :goto_2
    return-object v0

    .line 177
    :sswitch_data_0
    .sparse-switch
        0x32af97 -> :sswitch_2
        0x63a33d25 -> :sswitch_1
        0x6e083c2f -> :sswitch_0
    .end sparse-switch

    .line 178
    .line 179
    .line 180
    .line 181
    .line 182
    .line 183
    .line 184
    .line 185
    .line 186
    .line 187
    .line 188
    .line 189
    .line 190
    .line 191
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
