.class public final Ll/g4f;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/g4f$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000>\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0005\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\n\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0003\u0010\u0004JW\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0006\u001a\u00020\u00052\u0008\u0010\u0008\u001a\u0004\u0018\u00010\u00072\u0008\u0010\t\u001a\u0004\u0018\u00010\u00072\u0008\u0010\n\u001a\u0004\u0018\u00010\u00072\u0008\u0010\u000b\u001a\u0004\u0018\u00010\u00072\u0008\u0010\u000c\u001a\u0004\u0018\u00010\u00072\u000c\u0010\u000f\u001a\u0008\u0012\u0004\u0012\u00020\u000e0\rH\u0002\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J/\u0010\u0014\u001a\u00020\u00102\u0006\u0010\u0006\u001a\u00020\u00052\u0008\u0010\u0013\u001a\u0004\u0018\u00010\u00072\u000c\u0010\u000f\u001a\u0008\u0012\u0004\u0012\u00020\u000e0\rH\u0002\u00a2\u0006\u0004\u0008\u0014\u0010\u0015J/\u0010\u0017\u001a\u00020\u00102\u0006\u0010\u0006\u001a\u00020\u00052\u0008\u0010\u0016\u001a\u0004\u0018\u00010\u00072\u000c\u0010\u000f\u001a\u0008\u0012\u0004\u0012\u00020\u000e0\rH\u0002\u00a2\u0006\u0004\u0008\u0017\u0010\u0015J%\u0010\u0018\u001a\u00020\u00102\u0006\u0010\u0006\u001a\u00020\u00052\u000c\u0010\u000f\u001a\u0008\u0012\u0004\u0012\u00020\u000e0\rH\u0002\u00a2\u0006\u0004\u0008\u0018\u0010\u0019J\u001f\u0010\u001e\u001a\u00020\u001d2\u0006\u0010\u001a\u001a\u00020\u00022\u0006\u0010\u001c\u001a\u00020\u001bH\u0016\u00a2\u0006\u0004\u0008\u001e\u0010\u001f\u00a8\u0006 "
    }
    d2 = {
        "Ll/g4f;",
        "",
        "Ll/c4f;",
        "<init>",
        "()V",
        "Ll/b4f;",
        "metrics",
        "",
        "maxDepth",
        "maxArrayKeyCount",
        "maxObjectKeyCount",
        "maxArrayLength",
        "maxKVPairCount",
        "",
        "Ll/s0l0;",
        "errors",
        "",
        "c",
        "(Ll/b4f;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/util/List;)V",
        "maxKeyLength",
        "b",
        "(Ll/b4f;Ljava/lang/Integer;Ljava/util/List;)V",
        "maxValueLength",
        "d",
        "a",
        "(Ll/b4f;Ljava/util/List;)V",
        "input",
        "Ll/i0l0;",
        "config",
        "Ll/j0l0;",
        "e",
        "(Ll/c4f;Ll/i0l0;)Ll/j0l0;",
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

.method private final a(Ll/b4f;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/b4f;",
            "Ljava/util/List<",
            "Ll/s0l0;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/b4f;->a()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Iterable;

    .line 6
    .line 7
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_2

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Ll/dzc0;

    .line 22
    .line 23
    invoke-virtual {p1}, Ll/dzc0;->c()Lcom/clevertap/android/sdk/validation/pipeline/RemovalReason;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    sget-object v1, Ll/g4f$a;->b:[I

    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    aget v0, v1, v0

    .line 34
    .line 35
    packed-switch v0, :pswitch_data_0

    .line 36
    .line 37
    .line 38
    invoke-static {}, Ll/nbr;->a()V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :pswitch_0
    sget-object v0, Lcom/clevertap/android/sdk/validation/ValidationError;->RESTRICTED_MULTI_VALUE_KEY:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 43
    .line 44
    invoke-virtual {p1}, Ll/dzc0;->a()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    filled-new-array {p1}, [Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-static {v0, p1}, Ll/t0l0;->a(Lcom/clevertap/android/sdk/validation/ValidationError;[Ljava/lang/String;)Ll/s0l0;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    goto :goto_1

    .line 57
    :pswitch_1
    sget-object v0, Lcom/clevertap/android/sdk/validation/ValidationError;->INVALID_COUNTRY_CODE:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 58
    .line 59
    invoke-virtual {p1}, Ll/dzc0;->b()Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    filled-new-array {p1}, [Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-static {v0, p1}, Ll/t0l0;->a(Lcom/clevertap/android/sdk/validation/ValidationError;[Ljava/lang/String;)Ll/s0l0;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    goto :goto_1

    .line 76
    :pswitch_2
    sget-object p1, Lcom/clevertap/android/sdk/validation/ValidationError;->INVALID_PHONE:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 77
    .line 78
    const/4 v0, 0x0

    .line 79
    new-array v0, v0, [Ljava/lang/String;

    .line 80
    .line 81
    invoke-static {p1, v0}, Ll/t0l0;->a(Lcom/clevertap/android/sdk/validation/ValidationError;[Ljava/lang/String;)Ll/s0l0;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    goto :goto_1

    .line 86
    :pswitch_3
    sget-object v0, Lcom/clevertap/android/sdk/validation/ValidationError;->PROP_VALUE_NOT_PRIMITIVE:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 87
    .line 88
    invoke-virtual {p1}, Ll/dzc0;->a()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    invoke-virtual {p1}, Ll/dzc0;->b()Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    if-eqz p1, :cond_0

    .line 97
    .line 98
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    invoke-static {p1}, Lkotlin/jvm/internal/Reflection;->b(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-interface {p1}, Lkotlin/reflect/KClass;->s()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    if-nez p1, :cond_1

    .line 111
    .line 112
    :cond_0
    const-string p1, "null"

    .line 113
    .line 114
    :cond_1
    filled-new-array {v1, p1}, [Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    invoke-static {v0, p1}, Ll/t0l0;->a(Lcom/clevertap/android/sdk/validation/ValidationError;[Ljava/lang/String;)Ll/s0l0;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    goto :goto_1

    .line 123
    :pswitch_4
    sget-object v0, Lcom/clevertap/android/sdk/validation/ValidationError;->EMPTY_KEY:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 124
    .line 125
    invoke-virtual {p1}, Ll/dzc0;->a()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    filled-new-array {p1}, [Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    invoke-static {v0, p1}, Ll/t0l0;->a(Lcom/clevertap/android/sdk/validation/ValidationError;[Ljava/lang/String;)Ll/s0l0;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    goto :goto_1

    .line 138
    :pswitch_5
    sget-object v0, Lcom/clevertap/android/sdk/validation/ValidationError;->EMPTY_VALUE_REMOVED:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 139
    .line 140
    invoke-virtual {p1}, Ll/dzc0;->a()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    filled-new-array {p1}, [Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    invoke-static {v0, p1}, Ll/t0l0;->a(Lcom/clevertap/android/sdk/validation/ValidationError;[Ljava/lang/String;)Ll/s0l0;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    goto :goto_1

    .line 153
    :pswitch_6
    sget-object v0, Lcom/clevertap/android/sdk/validation/ValidationError;->NULL_VALUE_REMOVED:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 154
    .line 155
    invoke-virtual {p1}, Ll/dzc0;->a()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object p1

    .line 159
    filled-new-array {p1}, [Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object p1

    .line 163
    invoke-static {v0, p1}, Ll/t0l0;->a(Lcom/clevertap/android/sdk/validation/ValidationError;[Ljava/lang/String;)Ll/s0l0;

    .line 164
    .line 165
    .line 166
    move-result-object p1

    .line 167
    :goto_1
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 168
    .line 169
    .line 170
    goto/16 :goto_0

    .line 171
    .line 172
    :cond_2
    return-void

    .line 173
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private final b(Ll/b4f;Ljava/lang/Integer;Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/b4f;",
            "Ljava/lang/Integer;",
            "Ljava/util/List<",
            "Ll/s0l0;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/b4f;->b()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Iterable;

    .line 6
    .line 7
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_5

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Ll/mzq;

    .line 22
    .line 23
    invoke-virtual {p1}, Ll/mzq;->c()Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Ljava/lang/Iterable;

    .line 28
    .line 29
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_0

    .line 38
    .line 39
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    check-cast v1, Lcom/clevertap/android/sdk/validation/pipeline/ModificationReason;

    .line 44
    .line 45
    sget-object v2, Ll/g4f$a;->a:[I

    .line 46
    .line 47
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    aget v1, v2, v1

    .line 52
    .line 53
    const/4 v2, 0x1

    .line 54
    if-eq v1, v2, :cond_3

    .line 55
    .line 56
    const/4 v2, 0x2

    .line 57
    if-ne v1, v2, :cond_2

    .line 58
    .line 59
    if-eqz p2, :cond_1

    .line 60
    .line 61
    invoke-virtual {p2}, Ljava/lang/Number;->intValue()I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    sget-object v2, Lcom/clevertap/android/sdk/validation/ValidationError;->KEY_LENGTH_EXCEEDED:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 66
    .line 67
    invoke-virtual {p1}, Ll/mzq;->b()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-virtual {p1}, Ll/mzq;->a()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v4

    .line 79
    filled-new-array {v3, v1, v4}, [Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    invoke-static {v2, v1}, Ll/t0l0;->a(Lcom/clevertap/android/sdk/validation/ValidationError;[Ljava/lang/String;)Ll/s0l0;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    if-nez v1, :cond_4

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_2
    invoke-static {}, Ll/nbr;->a()V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :cond_3
    sget-object v1, Lcom/clevertap/android/sdk/validation/ValidationError;->KEY_INVALID_CHARACTERS:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 95
    .line 96
    invoke-virtual {p1}, Ll/mzq;->b()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    invoke-virtual {p1}, Ll/mzq;->a()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v3

    .line 104
    filled-new-array {v2, v3}, [Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    invoke-static {v1, v2}, Ll/t0l0;->a(Lcom/clevertap/android/sdk/validation/ValidationError;[Ljava/lang/String;)Ll/s0l0;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    :cond_4
    invoke-interface {p3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_5
    return-void
.end method

.method private final c(Ll/b4f;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/b4f;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            "Ljava/util/List<",
            "Ll/s0l0;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/lang/Number;->intValue()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-virtual {p1}, Ll/b4f;->e()I

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-le p2, p0, :cond_0

    .line 12
    .line 13
    sget-object p2, Lcom/clevertap/android/sdk/validation/ValidationError;->DEPTH_LIMIT_EXCEEDED:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/b4f;->e()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    filled-new-array {v0, p0}, [Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p2, p0}, Ll/t0l0;->a(Lcom/clevertap/android/sdk/validation/ValidationError;[Ljava/lang/String;)Ll/s0l0;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-interface {p7, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    :cond_0
    if-eqz p3, :cond_1

    .line 39
    .line 40
    invoke-virtual {p3}, Ljava/lang/Number;->intValue()I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    invoke-virtual {p1}, Ll/b4f;->c()I

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    if-le p2, p0, :cond_1

    .line 49
    .line 50
    sget-object p2, Lcom/clevertap/android/sdk/validation/ValidationError;->ARRAY_KEY_COUNT_LIMIT_EXCEEDED:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 51
    .line 52
    invoke-virtual {p1}, Ll/b4f;->c()I

    .line 53
    .line 54
    .line 55
    move-result p3

    .line 56
    invoke-static {p3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p3

    .line 60
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    filled-new-array {p3, p0}, [Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-static {p2, p0}, Ll/t0l0;->a(Lcom/clevertap/android/sdk/validation/ValidationError;[Ljava/lang/String;)Ll/s0l0;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-interface {p7, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    :cond_1
    if-eqz p4, :cond_2

    .line 76
    .line 77
    invoke-virtual {p4}, Ljava/lang/Number;->intValue()I

    .line 78
    .line 79
    .line 80
    move-result p0

    .line 81
    invoke-virtual {p1}, Ll/b4f;->g()I

    .line 82
    .line 83
    .line 84
    move-result p2

    .line 85
    if-le p2, p0, :cond_2

    .line 86
    .line 87
    sget-object p2, Lcom/clevertap/android/sdk/validation/ValidationError;->OBJECT_KEY_COUNT_LIMIT_EXCEEDED:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 88
    .line 89
    invoke-virtual {p1}, Ll/b4f;->g()I

    .line 90
    .line 91
    .line 92
    move-result p3

    .line 93
    invoke-static {p3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p3

    .line 97
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    filled-new-array {p3, p0}, [Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    invoke-static {p2, p0}, Ll/t0l0;->a(Lcom/clevertap/android/sdk/validation/ValidationError;[Ljava/lang/String;)Ll/s0l0;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-interface {p7, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    :cond_2
    if-eqz p5, :cond_3

    .line 113
    .line 114
    invoke-virtual {p5}, Ljava/lang/Number;->intValue()I

    .line 115
    .line 116
    .line 117
    move-result p0

    .line 118
    invoke-virtual {p1}, Ll/b4f;->d()I

    .line 119
    .line 120
    .line 121
    move-result p2

    .line 122
    if-le p2, p0, :cond_3

    .line 123
    .line 124
    sget-object p2, Lcom/clevertap/android/sdk/validation/ValidationError;->ARRAY_LENGTH_LIMIT_EXCEEDED:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 125
    .line 126
    invoke-virtual {p1}, Ll/b4f;->d()I

    .line 127
    .line 128
    .line 129
    move-result p3

    .line 130
    invoke-static {p3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object p3

    .line 134
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    filled-new-array {p3, p0}, [Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    invoke-static {p2, p0}, Ll/t0l0;->a(Lcom/clevertap/android/sdk/validation/ValidationError;[Ljava/lang/String;)Ll/s0l0;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    invoke-interface {p7, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    :cond_3
    if-eqz p6, :cond_4

    .line 150
    .line 151
    invoke-virtual {p6}, Ljava/lang/Number;->intValue()I

    .line 152
    .line 153
    .line 154
    move-result p0

    .line 155
    invoke-virtual {p1}, Ll/b4f;->f()I

    .line 156
    .line 157
    .line 158
    move-result p2

    .line 159
    if-le p2, p0, :cond_4

    .line 160
    .line 161
    sget-object p2, Lcom/clevertap/android/sdk/validation/ValidationError;->KV_PAIR_COUNT_LIMIT_EXCEEDED:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 162
    .line 163
    invoke-virtual {p1}, Ll/b4f;->f()I

    .line 164
    .line 165
    .line 166
    move-result p1

    .line 167
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object p1

    .line 171
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    filled-new-array {p1, p0}, [Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object p0

    .line 179
    invoke-static {p2, p0}, Ll/t0l0;->a(Lcom/clevertap/android/sdk/validation/ValidationError;[Ljava/lang/String;)Ll/s0l0;

    .line 180
    .line 181
    .line 182
    move-result-object p0

    .line 183
    invoke-interface {p7, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 184
    .line 185
    .line 186
    :cond_4
    return-void
.end method

.method private final d(Ll/b4f;Ljava/lang/Integer;Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/b4f;",
            "Ljava/lang/Integer;",
            "Ljava/util/List<",
            "Ll/s0l0;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/b4f;->h()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Iterable;

    .line 6
    .line 7
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_5

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Ll/y0l0;

    .line 22
    .line 23
    invoke-virtual {p1}, Ll/y0l0;->d()Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Ljava/lang/Iterable;

    .line 28
    .line 29
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_0

    .line 38
    .line 39
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    check-cast v1, Lcom/clevertap/android/sdk/validation/pipeline/ModificationReason;

    .line 44
    .line 45
    sget-object v2, Ll/g4f$a;->a:[I

    .line 46
    .line 47
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    aget v1, v2, v1

    .line 52
    .line 53
    const/4 v2, 0x1

    .line 54
    if-eq v1, v2, :cond_3

    .line 55
    .line 56
    const/4 v2, 0x2

    .line 57
    if-ne v1, v2, :cond_2

    .line 58
    .line 59
    if-eqz p2, :cond_1

    .line 60
    .line 61
    invoke-virtual {p2}, Ljava/lang/Number;->intValue()I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    sget-object v2, Lcom/clevertap/android/sdk/validation/ValidationError;->VALUE_CHARS_LIMIT_EXCEEDED:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 66
    .line 67
    invoke-virtual {p1}, Ll/y0l0;->c()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    invoke-virtual {p1}, Ll/y0l0;->b()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-virtual {p1}, Ll/y0l0;->a()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v5

    .line 83
    filled-new-array {v3, v4, v1, v5}, [Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    invoke-static {v2, v1}, Ll/t0l0;->a(Lcom/clevertap/android/sdk/validation/ValidationError;[Ljava/lang/String;)Ll/s0l0;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    if-nez v1, :cond_4

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_2
    invoke-static {}, Ll/nbr;->a()V

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :cond_3
    sget-object v1, Lcom/clevertap/android/sdk/validation/ValidationError;->VALUE_INVALID_CHARACTERS:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 99
    .line 100
    invoke-virtual {p1}, Ll/y0l0;->c()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    invoke-virtual {p1}, Ll/y0l0;->b()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    invoke-virtual {p1}, Ll/y0l0;->a()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v4

    .line 112
    filled-new-array {v2, v3, v4}, [Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    invoke-static {v1, v2}, Ll/t0l0;->a(Lcom/clevertap/android/sdk/validation/ValidationError;[Ljava/lang/String;)Ll/s0l0;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    :cond_4
    invoke-interface {p3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_5
    return-void
.end method


# virtual methods
.method public e(Ll/c4f;Ll/i0l0;)Ll/j0l0;
    .locals 8
    .param p1    # Ll/c4f;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/i0l0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
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
    new-instance v7, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Ll/c4f;->b()Ll/b4f;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {p2}, Ll/i0l0;->j()Ljava/lang/Integer;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {p2}, Ll/i0l0;->g()Ljava/lang/Integer;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    invoke-virtual {p2}, Ll/i0l0;->n()Ljava/lang/Integer;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    invoke-virtual {p2}, Ll/i0l0;->h()Ljava/lang/Integer;

    .line 29
    .line 30
    .line 31
    move-result-object v5

    .line 32
    invoke-virtual {p2}, Ll/i0l0;->l()Ljava/lang/Integer;

    .line 33
    .line 34
    .line 35
    move-result-object v6

    .line 36
    move-object v0, p0

    .line 37
    invoke-direct/range {v0 .. v7}, Ll/g4f;->c(Ll/b4f;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/util/List;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1}, Ll/c4f;->b()Ll/b4f;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p2}, Ll/i0l0;->m()Ljava/lang/Integer;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-direct {v0, p0, v1, v7}, Ll/g4f;->b(Ll/b4f;Ljava/lang/Integer;Ljava/util/List;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1}, Ll/c4f;->b()Ll/b4f;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p2}, Ll/i0l0;->o()Ljava/lang/Integer;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    invoke-direct {v0, p0, p2, v7}, Ll/g4f;->d(Ll/b4f;Ljava/lang/Integer;Ljava/util/List;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1}, Ll/c4f;->b()Ll/b4f;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-direct {v0, p0, v7}, Ll/g4f;->a(Ll/b4f;Ljava/util/List;)V

    .line 67
    .line 68
    .line 69
    invoke-interface {v7}, Ljava/util/List;->isEmpty()Z

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    if-eqz p0, :cond_0

    .line 74
    .line 75
    new-instance p0, Ll/j0l0$b;

    .line 76
    .line 77
    const/4 p1, 0x1

    .line 78
    const/4 p2, 0x0

    .line 79
    invoke-direct {p0, p2, p1, p2}, Ll/j0l0$b;-><init>(Ljava/util/List;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 80
    .line 81
    .line 82
    return-object p0

    .line 83
    :cond_0
    new-instance p0, Ll/j0l0$c;

    .line 84
    .line 85
    invoke-direct {p0, v7}, Ll/j0l0$c;-><init>(Ljava/util/List;)V

    .line 86
    .line 87
    .line 88
    return-object p0
.end method
