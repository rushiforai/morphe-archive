.class public final Ll/hor;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/hor$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010 \n\u0002\u0008\u0007\u0008\u0000\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u001f\u0010\r\u001a\u00020\u000c2\u0006\u0010\t\u001a\u00020\u00082\u0006\u0010\u000b\u001a\u00020\nH\u0002\u00a2\u0006\u0004\u0008\r\u0010\u000eJ#\u0010\u0011\u001a\u00020\u000c2\u000c\u0010\u0010\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u000f2\u0006\u0010\u000b\u001a\u00020\n\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J#\u0010\u0013\u001a\u00020\u000c2\u000c\u0010\u0010\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u000f2\u0006\u0010\u000b\u001a\u00020\n\u00a2\u0006\u0004\u0008\u0013\u0010\u0012R\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\r\u0010\u0014R\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0011\u0010\u0015\u00a8\u0006\u0016"
    }
    d2 = {
        "Ll/hor;",
        "",
        "Ll/wpm;",
        "manager",
        "Ll/wjj0;",
        "triggerManager",
        "<init>",
        "(Ll/wpm;Ll/wjj0;)V",
        "Lcom/clevertap/android/sdk/inapp/evaluation/a;",
        "limit",
        "",
        "campaignId",
        "",
        "a",
        "(Lcom/clevertap/android/sdk/inapp/evaluation/a;Ljava/lang/String;)Z",
        "",
        "whenLimits",
        "b",
        "(Ljava/util/List;Ljava/lang/String;)Z",
        "c",
        "Ll/wpm;",
        "Ll/wjj0;",
        "clevertap-core_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field private final a:Ll/wpm;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final b:Ll/wjj0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/wpm;Ll/wjj0;)V
    .locals 0
    .param p1    # Ll/wpm;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/wjj0;
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
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Ll/hor;->a:Ll/wpm;

    .line 11
    .line 12
    iput-object p2, p0, Ll/hor;->b:Ll/wjj0;

    .line 13
    .line 14
    return-void
.end method

.method private final a(Lcom/clevertap/android/sdk/inapp/evaluation/a;Ljava/lang/String;)Z
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/evaluation/a;->c()Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ll/hor$a;->a:[I

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    aget v0, v1, v0

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    const/4 v2, 0x1

    .line 15
    packed-switch v0, :pswitch_data_0

    .line 16
    .line 17
    .line 18
    invoke-static {}, Ll/nbr;->a()V

    .line 19
    .line 20
    .line 21
    return v1

    .line 22
    :pswitch_0
    iget-object p0, p0, Ll/hor;->b:Ll/wjj0;

    .line 23
    .line 24
    invoke-virtual {p0, p2}, Ll/wjj0;->a(Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/evaluation/a;->b()I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-ne p0, p1, :cond_0

    .line 33
    .line 34
    return v2

    .line 35
    :cond_0
    return v1

    .line 36
    :pswitch_1
    iget-object p0, p0, Ll/hor;->b:Ll/wjj0;

    .line 37
    .line 38
    invoke-virtual {p0, p2}, Ll/wjj0;->a(Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/evaluation/a;->b()I

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    rem-int/2addr p0, p1

    .line 47
    if-nez p0, :cond_1

    .line 48
    .line 49
    return v2

    .line 50
    :cond_1
    return v1

    .line 51
    :pswitch_2
    iget-object p0, p0, Ll/hor;->a:Ll/wpm;

    .line 52
    .line 53
    invoke-virtual {p0, p2}, Ll/wpm;->c(Ljava/lang/String;)Ljava/util/List;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/evaluation/a;->b()I

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    if-ge p0, p1, :cond_2

    .line 66
    .line 67
    return v2

    .line 68
    :cond_2
    return v1

    .line 69
    :pswitch_3
    iget-object p0, p0, Ll/hor;->a:Ll/wpm;

    .line 70
    .line 71
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/evaluation/a;->a()I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    invoke-virtual {p0, p2, v0}, Ll/wpm;->j(Ljava/lang/String;I)I

    .line 76
    .line 77
    .line 78
    move-result p0

    .line 79
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/evaluation/a;->b()I

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    if-ge p0, p1, :cond_3

    .line 84
    .line 85
    return v2

    .line 86
    :cond_3
    return v1

    .line 87
    :pswitch_4
    iget-object p0, p0, Ll/hor;->a:Ll/wpm;

    .line 88
    .line 89
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/evaluation/a;->a()I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    invoke-virtual {p0, p2, v0}, Ll/wpm;->d(Ljava/lang/String;I)I

    .line 94
    .line 95
    .line 96
    move-result p0

    .line 97
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/evaluation/a;->b()I

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    if-ge p0, p1, :cond_4

    .line 102
    .line 103
    return v2

    .line 104
    :cond_4
    return v1

    .line 105
    :pswitch_5
    iget-object p0, p0, Ll/hor;->a:Ll/wpm;

    .line 106
    .line 107
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/evaluation/a;->a()I

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    invoke-virtual {p0, p2, v0}, Ll/wpm;->e(Ljava/lang/String;I)I

    .line 112
    .line 113
    .line 114
    move-result p0

    .line 115
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/evaluation/a;->b()I

    .line 116
    .line 117
    .line 118
    move-result p1

    .line 119
    if-ge p0, p1, :cond_5

    .line 120
    .line 121
    return v2

    .line 122
    :cond_5
    return v1

    .line 123
    :pswitch_6
    iget-object p0, p0, Ll/hor;->a:Ll/wpm;

    .line 124
    .line 125
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/evaluation/a;->a()I

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    invoke-virtual {p0, p2, v0}, Ll/wpm;->f(Ljava/lang/String;I)I

    .line 130
    .line 131
    .line 132
    move-result p0

    .line 133
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/evaluation/a;->b()I

    .line 134
    .line 135
    .line 136
    move-result p1

    .line 137
    if-ge p0, p1, :cond_6

    .line 138
    .line 139
    return v2

    .line 140
    :cond_6
    return v1

    .line 141
    :pswitch_7
    iget-object p0, p0, Ll/hor;->a:Ll/wpm;

    .line 142
    .line 143
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/evaluation/a;->a()I

    .line 144
    .line 145
    .line 146
    move-result v0

    .line 147
    invoke-virtual {p0, p2, v0}, Ll/wpm;->g(Ljava/lang/String;I)I

    .line 148
    .line 149
    .line 150
    move-result p0

    .line 151
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/evaluation/a;->b()I

    .line 152
    .line 153
    .line 154
    move-result p1

    .line 155
    if-ge p0, p1, :cond_7

    .line 156
    .line 157
    return v2

    .line 158
    :cond_7
    return v1

    .line 159
    :pswitch_8
    iget-object p0, p0, Ll/hor;->a:Ll/wpm;

    .line 160
    .line 161
    invoke-virtual {p0, p2}, Ll/wpm;->h(Ljava/lang/String;)I

    .line 162
    .line 163
    .line 164
    move-result p0

    .line 165
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/evaluation/a;->b()I

    .line 166
    .line 167
    .line 168
    move-result p1

    .line 169
    if-ge p0, p1, :cond_8

    .line 170
    .line 171
    return v2

    .line 172
    :cond_8
    return v1

    .line 173
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public final b(Ljava/util/List;Ljava/lang/String;)Z
    .locals 2
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/clevertap/android/sdk/inapp/evaluation/a;",
            ">;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    check-cast p1, Ljava/lang/Iterable;

    .line 8
    .line 9
    instance-of v0, p1, Ljava/util/Collection;

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    move-object v0, p1

    .line 15
    check-cast v0, Ljava/util/Collection;

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    return v1

    .line 24
    :cond_0
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    :cond_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Lcom/clevertap/android/sdk/inapp/evaluation/a;

    .line 39
    .line 40
    invoke-direct {p0, v0, p2}, Ll/hor;->a(Lcom/clevertap/android/sdk/inapp/evaluation/a;Ljava/lang/String;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-nez v0, :cond_1

    .line 45
    .line 46
    const/4 p0, 0x0

    .line 47
    return p0

    .line 48
    :cond_2
    return v1
.end method

.method public final c(Ljava/util/List;Ljava/lang/String;)Z
    .locals 4
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/clevertap/android/sdk/inapp/evaluation/a;",
            ">;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    check-cast p1, Ljava/lang/Iterable;

    .line 8
    .line 9
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const/4 v0, 0x0

    .line 14
    :cond_0
    move v1, v0

    .line 15
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-eqz v2, :cond_2

    .line 20
    .line 21
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    check-cast v2, Lcom/clevertap/android/sdk/inapp/evaluation/a;

    .line 26
    .line 27
    if-nez v1, :cond_1

    .line 28
    .line 29
    invoke-virtual {v2}, Lcom/clevertap/android/sdk/inapp/evaluation/a;->c()Lcom/clevertap/android/sdk/inapp/evaluation/LimitType;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    sget-object v3, Ll/hor$a;->a:[I

    .line 34
    .line 35
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    aget v1, v3, v1

    .line 40
    .line 41
    const/4 v3, 0x7

    .line 42
    if-ne v1, v3, :cond_0

    .line 43
    .line 44
    invoke-direct {p0, v2, p2}, Ll/hor;->a(Lcom/clevertap/android/sdk/inapp/evaluation/a;Ljava/lang/String;)Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-nez v1, :cond_0

    .line 49
    .line 50
    :cond_1
    const/4 v1, 0x1

    .line 51
    goto :goto_0

    .line 52
    :cond_2
    return v1
.end method
