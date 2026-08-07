.class public Lcom/p1/mobile/putong/core/util/bookmoviesdramas/BookMoviesDramasHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static b:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Ll/w30;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/util/bookmoviesdramas/BookMoviesDramasHelper$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/util/bookmoviesdramas/BookMoviesDramasHelper$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/util/bookmoviesdramas/BookMoviesDramasHelper;->a:Ljava/util/Map;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ll/z20;Ll/bkj0;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p1, Ljava/lang/String;

    .line 4
    .line 5
    invoke-interface {p0, p2, p1}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic b(Ll/z20;Ll/bkj0;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p1, Ljava/lang/String;

    .line 4
    .line 5
    invoke-interface {p0, p2, p1}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic c(Ll/z20;Ll/bkj0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget-object p2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 2
    .line 3
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast p1, Ljava/lang/String;

    .line 6
    .line 7
    invoke-interface {p0, p2, p1}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    const-string p0, "\u4fdd\u5b58\u5931\u8d25\uff0c\u8bf7\u518d\u8bd5\u4e00\u6b21"

    .line 11
    .line 12
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic d(Landroid/view/View;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/util/bookmoviesdramas/BookMoviesDramasHelper;->b:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    sget-object p0, Lcom/p1/mobile/putong/core/util/bookmoviesdramas/BookMoviesDramasHelper;->b:Ljava/lang/ref/WeakReference;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Ll/w30;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/data/LiteraturesComments;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/z20;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 2

    .line 1
    sget-object p4, Lcom/p1/mobile/putong/core/util/bookmoviesdramas/BookMoviesDramasHelper;->a:Ljava/util/Map;

    .line 2
    .line 3
    iget-object p6, p5, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 4
    .line 5
    invoke-interface {p4, p6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p6

    .line 9
    check-cast p6, Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p6}, Ljava/lang/String;->hashCode()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const-string v1, "delete"

    .line 16
    .line 17
    sparse-switch v0, :sswitch_data_0

    .line 18
    .line 19
    .line 20
    goto :goto_1

    .line 21
    :sswitch_0
    const-string v0, "watched"

    .line 22
    .line 23
    invoke-virtual {p6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p6

    .line 27
    if-eqz p6, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :sswitch_1
    const-string v0, "watching"

    .line 31
    .line 32
    invoke-virtual {p6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p6

    .line 36
    if-eqz p6, :cond_0

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :sswitch_2
    invoke-virtual {p6, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p6

    .line 43
    goto :goto_1

    .line 44
    :sswitch_3
    const-string v0, "to_watch"

    .line 45
    .line 46
    invoke-virtual {p6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result p6

    .line 50
    if-eqz p6, :cond_0

    .line 51
    .line 52
    :goto_0
    iget-object p6, p5, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 53
    .line 54
    invoke-interface {p4, p6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p6

    .line 58
    check-cast p6, Ljava/lang/String;

    .line 59
    .line 60
    iget-object p5, p5, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 61
    .line 62
    invoke-interface {p4, p5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object p4

    .line 66
    check-cast p4, Ljava/lang/String;

    .line 67
    .line 68
    const-string p5, "patch"

    .line 69
    .line 70
    invoke-static {p6, p5, p4}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 71
    .line 72
    .line 73
    move-result-object p4

    .line 74
    goto :goto_2

    .line 75
    :cond_0
    :goto_1
    iget-object p6, p0, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->interestLevel:Ljava/lang/String;

    .line 76
    .line 77
    iget-object p5, p5, Lv/VListCell$a;->a:Ljava/lang/CharSequence;

    .line 78
    .line 79
    invoke-interface {p4, p5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object p4

    .line 83
    check-cast p4, Ljava/lang/String;

    .line 84
    .line 85
    invoke-static {p6, v1, p4}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 86
    .line 87
    .line 88
    move-result-object p4

    .line 89
    :goto_2
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result p5

    .line 93
    if-eqz p5, :cond_1

    .line 94
    .line 95
    sget-object p5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 96
    .line 97
    iget-object p5, p5, Lcom/p1/mobile/putong/core/api/c;->s1:Lcom/p1/mobile/putong/core/api/p;

    .line 98
    .line 99
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->id:Ljava/lang/String;

    .line 100
    .line 101
    iget-object p6, p4, Ll/bkj0;->a:Ljava/lang/Object;

    .line 102
    .line 103
    check-cast p6, Ljava/lang/String;

    .line 104
    .line 105
    iget-object v0, p4, Ll/bkj0;->b:Ljava/lang/Object;

    .line 106
    .line 107
    check-cast v0, Ljava/lang/String;

    .line 108
    .line 109
    invoke-virtual {p5, p2, p0, p6, v0}, Lcom/p1/mobile/putong/core/api/p;->n3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    new-instance p1, Ll/z53;

    .line 118
    .line 119
    invoke-direct {p1, p3, p4}, Ll/z53;-><init>(Ll/z20;Ll/bkj0;)V

    .line 120
    .line 121
    .line 122
    new-instance p2, Ll/a63;

    .line 123
    .line 124
    invoke-direct {p2, p3, p4}, Ll/a63;-><init>(Ll/z20;Ll/bkj0;)V

    .line 125
    .line 126
    .line 127
    invoke-static {p1, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 132
    .line 133
    .line 134
    goto :goto_3

    .line 135
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 136
    .line 137
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->s1:Lcom/p1/mobile/putong/core/api/p;

    .line 138
    .line 139
    iget-object p5, p4, Ll/bkj0;->a:Ljava/lang/Object;

    .line 140
    .line 141
    check-cast p5, Ljava/lang/String;

    .line 142
    .line 143
    invoke-virtual {p0, p2, p5}, Lcom/p1/mobile/putong/core/api/p;->w3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    new-instance p1, Ll/b63;

    .line 152
    .line 153
    invoke-direct {p1, p3, p4}, Ll/b63;-><init>(Ll/z20;Ll/bkj0;)V

    .line 154
    .line 155
    .line 156
    new-instance p2, Ll/c63;

    .line 157
    .line 158
    invoke-direct {p2, p3, p4}, Ll/c63;-><init>(Ll/z20;Ll/bkj0;)V

    .line 159
    .line 160
    .line 161
    invoke-static {p1, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 166
    .line 167
    .line 168
    :goto_3
    sget-object p0, Lcom/p1/mobile/putong/core/util/bookmoviesdramas/BookMoviesDramasHelper;->b:Ljava/lang/ref/WeakReference;

    .line 169
    .line 170
    if-eqz p0, :cond_2

    .line 171
    .line 172
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    move-result-object p0

    .line 176
    if-eqz p0, :cond_2

    .line 177
    .line 178
    sget-object p0, Lcom/p1/mobile/putong/core/util/bookmoviesdramas/BookMoviesDramasHelper;->b:Ljava/lang/ref/WeakReference;

    .line 179
    .line 180
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 181
    .line 182
    .line 183
    move-result-object p0

    .line 184
    check-cast p0, Ll/w30;

    .line 185
    .line 186
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 187
    .line 188
    .line 189
    :cond_2
    return-void

    .line 190
    nop

    .line 191
    :sswitch_data_0
    .sparse-switch
        -0x554cd1f5 -> :sswitch_3
        -0x4f997a55 -> :sswitch_2
        0x207e6cb3 -> :sswitch_1
        0x431cd9ae -> :sswitch_0
    .end sparse-switch
.end method

.method public static synthetic f(Ll/z20;Ll/bkj0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget-object p2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 2
    .line 3
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast p1, Ljava/lang/String;

    .line 6
    .line 7
    invoke-interface {p0, p2, p1}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    const-string p0, "\u4fdd\u5b58\u5931\u8d25\uff0c\u8bf7\u518d\u8bd5\u4e00\u6b21"

    .line 11
    .line 12
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static g(Ljava/util/List;Lcom/p1/mobile/putong/core/data/Literatures;Lcom/p1/mobile/putong/core/data/LiteraturesComments;)Ll/bkj0;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LiteraturesComments;",
            ">;",
            "Lcom/p1/mobile/putong/core/data/Literatures;",
            "Lcom/p1/mobile/putong/core/data/LiteraturesComments;",
            ")",
            "Ll/bkj0<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    invoke-static {v0, v0, v0}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    goto/16 :goto_2

    .line 14
    .line 15
    :cond_0
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    const-string v2, "watched"

    .line 20
    .line 21
    const-string v3, "watching"

    .line 22
    .line 23
    const-string v4, "to_watch"

    .line 24
    .line 25
    if-nez v1, :cond_5

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    check-cast p0, Lcom/p1/mobile/putong/core/data/LiteraturesComments;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->interestLevel:Ljava/lang/String;

    .line 35
    .line 36
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->interestLevel:Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {p0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    if-eqz p0, :cond_3

    .line 43
    .line 44
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->interestLevel:Ljava/lang/String;

    .line 45
    .line 46
    invoke-static {p0, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    if-eqz p0, :cond_1

    .line 51
    .line 52
    const-string p0, "both_wish"

    .line 53
    .line 54
    iput-object p0, v0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 55
    .line 56
    const-string p0, "\u90fd\u60f3\u770b"

    .line 57
    .line 58
    iput-object p0, v0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->interestLevel:Ljava/lang/String;

    .line 62
    .line 63
    invoke-static {p0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    if-eqz p0, :cond_2

    .line 68
    .line 69
    const-string p0, "both_watching"

    .line 70
    .line 71
    iput-object p0, v0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 72
    .line 73
    const-string p0, "\u90fd\u5728\u770b"

    .line 74
    .line 75
    iput-object p0, v0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_2
    iget-object p0, p2, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->interestLevel:Ljava/lang/String;

    .line 79
    .line 80
    invoke-static {p0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    if-eqz p0, :cond_4

    .line 85
    .line 86
    const-string p0, "both_watched"

    .line 87
    .line 88
    iput-object p0, v0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 89
    .line 90
    const-string p0, "\u90fd\u770b\u8fc7"

    .line 91
    .line 92
    iput-object p0, v0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_3
    const-string p0, "both_like"

    .line 96
    .line 97
    iput-object p0, v0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 98
    .line 99
    const-string p0, "\u90fd\u611f\u5174\u8da3"

    .line 100
    .line 101
    iput-object p0, v0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 102
    .line 103
    :cond_4
    :goto_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 104
    .line 105
    const-string p2, "\u4f60\u4eec\u90fd\u5bf9\u300a"

    .line 106
    .line 107
    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Literatures;->title:Ljava/lang/String;

    .line 111
    .line 112
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    const-string p1, "\u300b\u611f\u5174\u8da3"

    .line 116
    .line 117
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    iput-object p0, v0, Ll/bkj0;->c:Ljava/lang/Object;

    .line 125
    .line 126
    return-object v0

    .line 127
    :cond_5
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 128
    .line 129
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 130
    .line 131
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->userID:Ljava/lang/String;

    .line 132
    .line 133
    invoke-virtual {p0, v1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    move-result v1

    .line 141
    if-eqz v1, :cond_6

    .line 142
    .line 143
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 144
    .line 145
    .line 146
    move-result p0

    .line 147
    if-eqz p0, :cond_6

    .line 148
    .line 149
    const-string p0, "\u5979"

    .line 150
    .line 151
    goto :goto_1

    .line 152
    :cond_6
    const-string p0, "\u4ed6"

    .line 153
    .line 154
    :goto_1
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->interestLevel:Ljava/lang/String;

    .line 155
    .line 156
    invoke-static {v1, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 157
    .line 158
    .line 159
    move-result v1

    .line 160
    if-eqz v1, :cond_7

    .line 161
    .line 162
    const-string p2, "single_wish"

    .line 163
    .line 164
    iput-object p2, v0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 165
    .line 166
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Literatures;->title:Ljava/lang/String;

    .line 167
    .line 168
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    const-string p1, "%1$s\u60f3\u770b\u300a%2$s\u300b"

    .line 173
    .line 174
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object p0

    .line 178
    iput-object p0, v0, Ll/bkj0;->c:Ljava/lang/Object;

    .line 179
    .line 180
    return-object v0

    .line 181
    :cond_7
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->interestLevel:Ljava/lang/String;

    .line 182
    .line 183
    invoke-static {v1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 184
    .line 185
    .line 186
    move-result v1

    .line 187
    if-eqz v1, :cond_8

    .line 188
    .line 189
    const-string p2, "single_watching"

    .line 190
    .line 191
    iput-object p2, v0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 192
    .line 193
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Literatures;->title:Ljava/lang/String;

    .line 194
    .line 195
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 196
    .line 197
    .line 198
    move-result-object p0

    .line 199
    const-string p1, "%1$s\u5728\u770b\u300a%2$s\u300b"

    .line 200
    .line 201
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object p0

    .line 205
    iput-object p0, v0, Ll/bkj0;->c:Ljava/lang/Object;

    .line 206
    .line 207
    return-object v0

    .line 208
    :cond_8
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->interestLevel:Ljava/lang/String;

    .line 209
    .line 210
    invoke-static {p2, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 211
    .line 212
    .line 213
    move-result p2

    .line 214
    if-eqz p2, :cond_9

    .line 215
    .line 216
    const-string p2, "single_watched"

    .line 217
    .line 218
    iput-object p2, v0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 219
    .line 220
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Literatures;->title:Ljava/lang/String;

    .line 221
    .line 222
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 223
    .line 224
    .line 225
    move-result-object p0

    .line 226
    const-string p1, "%1$s\u770b\u8fc7\u300a%2$s\u300b"

    .line 227
    .line 228
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object p0

    .line 232
    iput-object p0, v0, Ll/bkj0;->c:Ljava/lang/Object;

    .line 233
    .line 234
    :cond_9
    :goto_2
    return-object v0
.end method

.method public static h(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/LiteraturesComments;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/core/data/LiteraturesComments;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/CharSequence;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/util/bookmoviesdramas/BookMoviesDramasHelper;->a:Ljava/util/Map;

    .line 7
    .line 8
    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-eqz v2, :cond_3

    .line 21
    .line 22
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    check-cast v2, Ljava/util/Map$Entry;

    .line 27
    .line 28
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    if-eqz v3, :cond_0

    .line 33
    .line 34
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->interestLevel:Ljava/lang/String;

    .line 35
    .line 36
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v4

    .line 40
    check-cast v4, Ljava/lang/CharSequence;

    .line 41
    .line 42
    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    if-eqz v3, :cond_0

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    const-string v3, "movie"

    .line 50
    .line 51
    invoke-static {p0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    if-eqz v3, :cond_1

    .line 56
    .line 57
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    check-cast v3, Ljava/lang/CharSequence;

    .line 62
    .line 63
    const-string v4, "watching"

    .line 64
    .line 65
    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    if-eqz v3, :cond_1

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    if-nez v3, :cond_2

    .line 77
    .line 78
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    check-cast v3, Ljava/lang/CharSequence;

    .line 83
    .line 84
    const-string v4, "delete"

    .line 85
    .line 86
    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 87
    .line 88
    .line 89
    move-result v3

    .line 90
    if-eqz v3, :cond_2

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_2
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    check-cast v2, Ljava/lang/CharSequence;

    .line 98
    .line 99
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_3
    return-object v0
.end method

.method public static i(Ljava/lang/String;)Z
    .locals 1

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/util/bookmoviesdramas/BookMoviesDramasHelper;->m(Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/LiteraturesComments;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public static j(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/z20;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ll/z20<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/core/util/bookmoviesdramas/BookMoviesDramasHelper;->p(Ljava/lang/String;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lcom/p1/mobile/putong/core/data/LiteraturesComments;

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 v0, 0x0

    .line 20
    :goto_0
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-nez v1, :cond_1

    .line 25
    .line 26
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 27
    .line 28
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 29
    .line 30
    invoke-virtual {v1}, Ll/dkb;->U7()Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-nez v1, :cond_1

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-nez v1, :cond_2

    .line 42
    .line 43
    :goto_1
    return-void

    .line 44
    :cond_2
    new-instance v1, Ll/w30$b;

    .line 45
    .line 46
    invoke-direct {v1, p0}, Ll/w30$b;-><init>(Landroid/content/Context;)V

    .line 47
    .line 48
    .line 49
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/core/util/bookmoviesdramas/BookMoviesDramasHelper;->h(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/LiteraturesComments;)Ljava/util/List;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    sget v3, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 58
    .line 59
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-virtual {v1, v2}, Ll/w30$b;->I(Ljava/lang/CharSequence;)Ll/w30$b;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    new-instance v2, Ll/x53;

    .line 68
    .line 69
    invoke-direct {v2}, Ll/x53;-><init>()V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v1, v2}, Ll/w30$b;->U(Landroid/view/View$OnClickListener;)Ll/w30$b;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-virtual {v1, p2}, Ll/w30$b;->Q(Ljava/util/List;)Ll/w30$b;

    .line 77
    .line 78
    .line 79
    move-result-object p2

    .line 80
    new-instance v1, Ll/y53;

    .line 81
    .line 82
    invoke-direct {v1, v0, p0, p1, p3}, Ll/y53;-><init>(Lcom/p1/mobile/putong/core/data/LiteraturesComments;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/z20;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p2, v1}, Ll/w30$b;->V(Ll/w30$d;)Ll/w30$b;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-virtual {p0}, Ll/w30$b;->F()Ll/w30;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-virtual {p0}, Ll/w30;->f()V

    .line 94
    .line 95
    .line 96
    new-instance p1, Ljava/lang/ref/WeakReference;

    .line 97
    .line 98
    invoke-direct {p1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 99
    .line 100
    .line 101
    sput-object p1, Lcom/p1/mobile/putong/core/util/bookmoviesdramas/BookMoviesDramasHelper;->b:Ljava/lang/ref/WeakReference;

    .line 102
    .line 103
    return-void
.end method

.method public static k(Ljava/util/List;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LiteraturesComments;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Literatures;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Lcom/p1/mobile/putong/core/data/LiteraturesComments;

    .line 27
    .line 28
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->localLiteratures:Lcom/p1/mobile/putong/core/data/Literatures;

    .line 29
    .line 30
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    return-object v0
.end method

.method public static l(Ljava/lang/String;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LiteraturesComments;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ll/dkb;->g7(Ljava/lang/String;)Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-static {v1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_1

    .line 34
    .line 35
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/dkb;->x7()V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    const/4 v0, 0x0

    .line 44
    :cond_1
    :goto_0
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    if-eqz p0, :cond_2

    .line 49
    .line 50
    new-instance p0, Ljava/util/ArrayList;

    .line 51
    .line 52
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 53
    .line 54
    .line 55
    return-object p0

    .line 56
    :cond_2
    return-object v0
.end method

.method public static m(Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/LiteraturesComments;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Ll/dkb;->g7(Ljava/lang/String;)Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_1

    .line 26
    .line 27
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Lcom/p1/mobile/putong/core/data/LiteraturesComments;

    .line 42
    .line 43
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->literatureID:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {v1, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-eqz v1, :cond_0

    .line 50
    .line 51
    return-object v0

    .line 52
    :cond_1
    const/4 p0, 0x0

    .line 53
    return-object p0
.end method

.method public static n(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LiteraturesComments;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1}, Ll/dkb;->O9(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static o(Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/LiteraturesComments;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Ll/dkb;->g7(Ljava/lang/String;)Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_1

    .line 26
    .line 27
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Lcom/p1/mobile/putong/core/data/LiteraturesComments;

    .line 42
    .line 43
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->id:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {v1, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-eqz v1, :cond_0

    .line 50
    .line 51
    return-object v0

    .line 52
    :cond_1
    const/4 p0, 0x0

    .line 53
    return-object p0
.end method

.method public static p(Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LiteraturesComments;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/util/bookmoviesdramas/BookMoviesDramasHelper;->n(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method
