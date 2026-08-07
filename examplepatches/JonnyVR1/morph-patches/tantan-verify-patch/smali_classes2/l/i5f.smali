.class public final Ll/i5f;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/i5f$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000P\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\"\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0003\u0010\u0004JE\u0010\u0011\u001a\u00020\u00102\u000c\u0010\u0007\u001a\u0008\u0012\u0004\u0012\u00020\u00060\u00052\u0006\u0010\t\u001a\u00020\u00082\u0006\u0010\n\u001a\u00020\u00082\u0008\u0010\u000c\u001a\u0004\u0018\u00010\u000b2\u000c\u0010\u000f\u001a\u0008\u0012\u0004\u0012\u00020\u000e0\rH\u0002\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J\'\u0010\u0015\u001a\u00020\u00142\u0006\u0010\n\u001a\u00020\u00082\u000e\u0010\u0013\u001a\n\u0012\u0004\u0012\u00020\u0008\u0018\u00010\u0005H\u0002\u00a2\u0006\u0004\u0008\u0015\u0010\u0016J\'\u0010\u0018\u001a\u00020\u00142\u0006\u0010\n\u001a\u00020\u00082\u000e\u0010\u0017\u001a\n\u0012\u0004\u0012\u00020\u0008\u0018\u00010\u0005H\u0002\u00a2\u0006\u0004\u0008\u0018\u0010\u0016J\u001f\u0010\u001d\u001a\u00020\u001c2\u0006\u0010\u0019\u001a\u00020\u00022\u0006\u0010\u001b\u001a\u00020\u001aH\u0016\u00a2\u0006\u0004\u0008\u001d\u0010\u001e\u00a8\u0006\u001f"
    }
    d2 = {
        "Ll/i5f;",
        "",
        "Ll/e5f;",
        "<init>",
        "()V",
        "",
        "Lcom/clevertap/android/sdk/validation/pipeline/ModificationReason;",
        "modifications",
        "",
        "originalName",
        "cleanedName",
        "",
        "maxEventNameLength",
        "",
        "Ll/s0l0;",
        "errors",
        "",
        "d",
        "(Ljava/util/Set;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/util/List;)V",
        "restrictedEventNames",
        "",
        "b",
        "(Ljava/lang/String;Ljava/util/Set;)Z",
        "discardedEventNames",
        "a",
        "input",
        "Ll/i0l0;",
        "config",
        "Ll/j0l0;",
        "c",
        "(Ll/e5f;Ll/i0l0;)Ll/j0l0;",
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

.method private final a(Ljava/lang/String;Ljava/util/Set;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    if-eqz p2, :cond_2

    .line 3
    .line 4
    check-cast p2, Ljava/lang/Iterable;

    .line 5
    .line 6
    instance-of v0, p2, Ljava/util/Collection;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    move-object v0, p2

    .line 11
    check-cast v0, Ljava/util/Collection;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    return p0

    .line 20
    :cond_0
    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    :cond_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {p1, v0}, Lcom/clevertap/android/sdk/Utils;->a(Ljava/lang/String;Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    const/4 p0, 0x1

    .line 43
    :cond_2
    return p0
.end method

.method private final b(Ljava/lang/String;Ljava/util/Set;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    if-eqz p2, :cond_2

    .line 3
    .line 4
    check-cast p2, Ljava/lang/Iterable;

    .line 5
    .line 6
    instance-of v0, p2, Ljava/util/Collection;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    move-object v0, p2

    .line 11
    check-cast v0, Ljava/util/Collection;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    return p0

    .line 20
    :cond_0
    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    :cond_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {p1, v0}, Lcom/clevertap/android/sdk/Utils;->a(Ljava/lang/String;Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    const/4 p0, 0x1

    .line 43
    :cond_2
    return p0
.end method

.method private final d(Ljava/util/Set;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "+",
            "Lcom/clevertap/android/sdk/validation/pipeline/ModificationReason;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            "Ljava/util/List<",
            "Ll/s0l0;",
            ">;)V"
        }
    .end annotation

    .line 1
    check-cast p1, Ljava/lang/Iterable;

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_4

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Lcom/clevertap/android/sdk/validation/pipeline/ModificationReason;

    .line 18
    .line 19
    sget-object v0, Ll/i5f$a;->a:[I

    .line 20
    .line 21
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    aget p1, v0, p1

    .line 26
    .line 27
    const/4 v0, 0x1

    .line 28
    if-eq p1, v0, :cond_1

    .line 29
    .line 30
    const/4 v0, 0x2

    .line 31
    if-ne p1, v0, :cond_0

    .line 32
    .line 33
    sget-object p1, Lcom/clevertap/android/sdk/validation/ValidationError;->EVENT_NAME_INVALID_CHARACTERS:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 34
    .line 35
    filled-new-array {p2, p3}, [Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-static {p1, v0}, Ll/t0l0;->a(Lcom/clevertap/android/sdk/validation/ValidationError;[Ljava/lang/String;)Ll/s0l0;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-interface {p5, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    invoke-static {}, Ll/nbr;->a()V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_1
    sget-object p1, Lcom/clevertap/android/sdk/validation/ValidationError;->EVENT_NAME_TOO_LONG:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 52
    .line 53
    if-eqz p4, :cond_2

    .line 54
    .line 55
    invoke-virtual {p4}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    if-nez v0, :cond_3

    .line 60
    .line 61
    :cond_2
    const-string v0, "unknown"

    .line 62
    .line 63
    :cond_3
    filled-new-array {p2, v0, p3}, [Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-static {p1, v0}, Ll/t0l0;->a(Lcom/clevertap/android/sdk/validation/ValidationError;[Ljava/lang/String;)Ll/s0l0;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-interface {p5, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_4
    return-void
.end method


# virtual methods
.method public c(Ll/e5f;Ll/i0l0;)Ll/j0l0;
    .locals 7
    .param p1    # Ll/e5f;
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
    new-instance v5, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Ll/e5f;->c()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const/4 v6, 0x0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    sget-object p0, Lcom/clevertap/android/sdk/validation/ValidationError;->EVENT_NAME_NULL:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 20
    .line 21
    new-array p1, v6, [Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {p0, p1}, Ll/t0l0;->a(Lcom/clevertap/android/sdk/validation/ValidationError;[Ljava/lang/String;)Ll/s0l0;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-interface {v5, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    new-instance p0, Ll/j0l0$a;

    .line 31
    .line 32
    sget-object p1, Lcom/clevertap/android/sdk/validation/DropReason;->NULL_EVENT_NAME:Lcom/clevertap/android/sdk/validation/DropReason;

    .line 33
    .line 34
    invoke-direct {p0, v5, p1}, Ll/j0l0$a;-><init>(Ljava/util/List;Lcom/clevertap/android/sdk/validation/DropReason;)V

    .line 35
    .line 36
    .line 37
    return-object p0

    .line 38
    :cond_0
    invoke-virtual {p1}, Ll/e5f;->b()Ljava/util/Set;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {p1}, Ll/e5f;->c()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-virtual {p1}, Ll/e5f;->a()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    invoke-virtual {p2}, Ll/i0l0;->k()Ljava/lang/Integer;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    move-object v0, p0

    .line 55
    invoke-direct/range {v0 .. v5}, Ll/i5f;->d(Ljava/util/Set;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/util/List;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p1}, Ll/e5f;->a()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    if-nez p0, :cond_1

    .line 67
    .line 68
    sget-object p0, Lcom/clevertap/android/sdk/validation/ValidationError;->EVENT_NAME_NULL:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 69
    .line 70
    new-array p1, v6, [Ljava/lang/String;

    .line 71
    .line 72
    invoke-static {p0, p1}, Ll/t0l0;->a(Lcom/clevertap/android/sdk/validation/ValidationError;[Ljava/lang/String;)Ll/s0l0;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-interface {v5, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    new-instance p0, Ll/j0l0$a;

    .line 80
    .line 81
    sget-object p1, Lcom/clevertap/android/sdk/validation/DropReason;->NULL_EVENT_NAME:Lcom/clevertap/android/sdk/validation/DropReason;

    .line 82
    .line 83
    invoke-direct {p0, v5, p1}, Ll/j0l0$a;-><init>(Ljava/util/List;Lcom/clevertap/android/sdk/validation/DropReason;)V

    .line 84
    .line 85
    .line 86
    return-object p0

    .line 87
    :cond_1
    invoke-virtual {p1}, Ll/e5f;->a()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-virtual {p2}, Ll/i0l0;->p()Ljava/util/Set;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-direct {v0, p0, v1}, Ll/i5f;->b(Ljava/lang/String;Ljava/util/Set;)Z

    .line 96
    .line 97
    .line 98
    move-result p0

    .line 99
    if-eqz p0, :cond_2

    .line 100
    .line 101
    sget-object p0, Lcom/clevertap/android/sdk/validation/ValidationError;->RESTRICTED_EVENT_NAME:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 102
    .line 103
    invoke-virtual {p1}, Ll/e5f;->a()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    filled-new-array {p1}, [Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-static {p0, p1}, Ll/t0l0;->a(Lcom/clevertap/android/sdk/validation/ValidationError;[Ljava/lang/String;)Ll/s0l0;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    invoke-interface {v5, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    new-instance p0, Ll/j0l0$a;

    .line 119
    .line 120
    sget-object p1, Lcom/clevertap/android/sdk/validation/DropReason;->RESTRICTED_EVENT_NAME:Lcom/clevertap/android/sdk/validation/DropReason;

    .line 121
    .line 122
    invoke-direct {p0, v5, p1}, Ll/j0l0$a;-><init>(Ljava/util/List;Lcom/clevertap/android/sdk/validation/DropReason;)V

    .line 123
    .line 124
    .line 125
    return-object p0

    .line 126
    :cond_2
    invoke-virtual {p1}, Ll/e5f;->a()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    invoke-virtual {p2}, Ll/i0l0;->d()Ljava/util/Set;

    .line 131
    .line 132
    .line 133
    move-result-object p2

    .line 134
    invoke-direct {v0, p0, p2}, Ll/i5f;->a(Ljava/lang/String;Ljava/util/Set;)Z

    .line 135
    .line 136
    .line 137
    move-result p0

    .line 138
    if-eqz p0, :cond_3

    .line 139
    .line 140
    sget-object p0, Lcom/clevertap/android/sdk/validation/ValidationError;->DISCARDED_EVENT_NAME:Lcom/clevertap/android/sdk/validation/ValidationError;

    .line 141
    .line 142
    invoke-virtual {p1}, Ll/e5f;->a()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    filled-new-array {p1}, [Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    invoke-static {p0, p1}, Ll/t0l0;->a(Lcom/clevertap/android/sdk/validation/ValidationError;[Ljava/lang/String;)Ll/s0l0;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    invoke-interface {v5, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 155
    .line 156
    .line 157
    new-instance p0, Ll/j0l0$a;

    .line 158
    .line 159
    sget-object p1, Lcom/clevertap/android/sdk/validation/DropReason;->DISCARDED_EVENT_NAME:Lcom/clevertap/android/sdk/validation/DropReason;

    .line 160
    .line 161
    invoke-direct {p0, v5, p1}, Ll/j0l0$a;-><init>(Ljava/util/List;Lcom/clevertap/android/sdk/validation/DropReason;)V

    .line 162
    .line 163
    .line 164
    return-object p0

    .line 165
    :cond_3
    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    .line 166
    .line 167
    .line 168
    move-result p0

    .line 169
    if-eqz p0, :cond_4

    .line 170
    .line 171
    new-instance p0, Ll/j0l0$b;

    .line 172
    .line 173
    const/4 p1, 0x1

    .line 174
    const/4 p2, 0x0

    .line 175
    invoke-direct {p0, p2, p1, p2}, Ll/j0l0$b;-><init>(Ljava/util/List;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 176
    .line 177
    .line 178
    return-object p0

    .line 179
    :cond_4
    new-instance p0, Ll/j0l0$c;

    .line 180
    .line 181
    invoke-direct {p0, v5}, Ll/j0l0$c;-><init>(Ljava/util/List;)V

    .line 182
    .line 183
    .line 184
    return-object p0
.end method
