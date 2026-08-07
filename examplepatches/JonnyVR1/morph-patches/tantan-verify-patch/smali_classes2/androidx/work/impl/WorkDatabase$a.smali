.class public final Landroidx/work/impl/WorkDatabase$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/work/impl/WorkDatabase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J/\u0010\r\u001a\u00020\u000c2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\u00082\u0006\u0010\u000b\u001a\u00020\nH\u0007\u00a2\u0006\u0004\u0008\r\u0010\u000e\u00a8\u0006\u000f"
    }
    d2 = {
        "Landroidx/work/impl/WorkDatabase$a;",
        "",
        "<init>",
        "()V",
        "Landroid/content/Context;",
        "context",
        "Ljava/util/concurrent/Executor;",
        "queryExecutor",
        "Ll/sa5;",
        "clock",
        "",
        "useTestDatabase",
        "Landroidx/work/impl/WorkDatabase;",
        "b",
        "(Landroid/content/Context;Ljava/util/concurrent/Executor;Ll/sa5;Z)Landroidx/work/impl/WorkDatabase;",
        "work-runtime_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/work/impl/WorkDatabase$a;-><init>()V

    return-void
.end method

.method public static a(Landroid/content/Context;Ll/o7h0$b;)Ll/o7h0;
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/o7h0$b;->Companion:Ll/o7h0$b$b;

    .line 5
    .line 6
    invoke-virtual {v0, p0}, Ll/o7h0$b$b;->a(Landroid/content/Context;)Ll/o7h0$b$a;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    iget-object v0, p1, Ll/o7h0$b;->b:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ll/o7h0$b$a;->d(Ljava/lang/String;)Ll/o7h0$b$a;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object p1, p1, Ll/o7h0$b;->c:Ll/o7h0$a;

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ll/o7h0$b$a;->c(Ll/o7h0$a;)Ll/o7h0$b$a;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const/4 v0, 0x1

    .line 23
    invoke-virtual {p1, v0}, Ll/o7h0$b$a;->e(Z)Ll/o7h0$b$a;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p1, v0}, Ll/o7h0$b$a;->a(Z)Ll/o7h0$b$a;

    .line 28
    .line 29
    .line 30
    new-instance p1, Ll/l8j;

    .line 31
    .line 32
    invoke-direct {p1}, Ll/l8j;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Ll/o7h0$b$a;->b()Ll/o7h0$b;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p1, p0}, Ll/l8j;->a(Ll/o7h0$b;)Ll/o7h0;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0
.end method


# virtual methods
.method public final b(Landroid/content/Context;Ljava/util/concurrent/Executor;Ll/sa5;Z)Landroidx/work/impl/WorkDatabase;
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/concurrent/Executor;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ll/sa5;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

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
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    const-class p0, Landroidx/work/impl/WorkDatabase;

    .line 11
    .line 12
    if-eqz p4, :cond_0

    .line 13
    .line 14
    invoke-static {p1, p0}, Landroidx/room/g;->c(Landroid/content/Context;Ljava/lang/Class;)Landroidx/room/RoomDatabase$a;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Landroidx/room/RoomDatabase$a;->c()Landroidx/room/RoomDatabase$a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const-string p4, "androidx.work.workdb"

    .line 24
    .line 25
    invoke-static {p1, p0, p4}, Landroidx/room/g;->a(Landroid/content/Context;Ljava/lang/Class;Ljava/lang/String;)Landroidx/room/RoomDatabase$a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    new-instance p4, Ll/biq0;

    .line 30
    .line 31
    invoke-direct {p4, p1}, Ll/biq0;-><init>(Landroid/content/Context;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, p4}, Landroidx/room/RoomDatabase$a;->f(Ll/o7h0$c;)Landroidx/room/RoomDatabase$a;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    :goto_0
    invoke-virtual {p0, p2}, Landroidx/room/RoomDatabase$a;->g(Ljava/util/concurrent/Executor;)Landroidx/room/RoomDatabase$a;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    new-instance p2, Ll/o85;

    .line 43
    .line 44
    invoke-direct {p2, p3}, Ll/o85;-><init>(Ll/sa5;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, p2}, Landroidx/room/RoomDatabase$a;->a(Landroidx/room/RoomDatabase$b;)Landroidx/room/RoomDatabase$a;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    const/4 p2, 0x1

    .line 52
    new-array p3, p2, [Ll/ua00;

    .line 53
    .line 54
    sget-object p4, Ll/za00;->INSTANCE:Ll/za00;

    .line 55
    .line 56
    const/4 v0, 0x0

    .line 57
    aput-object p4, p3, v0

    .line 58
    .line 59
    invoke-virtual {p0, p3}, Landroidx/room/RoomDatabase$a;->b([Ll/ua00;)Landroidx/room/RoomDatabase$a;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    new-instance p3, Ll/o3d0;

    .line 64
    .line 65
    const/4 p4, 0x2

    .line 66
    const/4 v1, 0x3

    .line 67
    invoke-direct {p3, p1, p4, v1}, Ll/o3d0;-><init>(Landroid/content/Context;II)V

    .line 68
    .line 69
    .line 70
    new-array p4, p2, [Ll/ua00;

    .line 71
    .line 72
    aput-object p3, p4, v0

    .line 73
    .line 74
    invoke-virtual {p0, p4}, Landroidx/room/RoomDatabase$a;->b([Ll/ua00;)Landroidx/room/RoomDatabase$a;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    new-array p3, p2, [Ll/ua00;

    .line 79
    .line 80
    sget-object p4, Ll/ab00;->INSTANCE:Ll/ab00;

    .line 81
    .line 82
    aput-object p4, p3, v0

    .line 83
    .line 84
    invoke-virtual {p0, p3}, Landroidx/room/RoomDatabase$a;->b([Ll/ua00;)Landroidx/room/RoomDatabase$a;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    new-array p3, p2, [Ll/ua00;

    .line 89
    .line 90
    sget-object p4, Ll/bb00;->INSTANCE:Ll/bb00;

    .line 91
    .line 92
    aput-object p4, p3, v0

    .line 93
    .line 94
    invoke-virtual {p0, p3}, Landroidx/room/RoomDatabase$a;->b([Ll/ua00;)Landroidx/room/RoomDatabase$a;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    new-instance p3, Ll/o3d0;

    .line 99
    .line 100
    const/4 p4, 0x5

    .line 101
    const/4 v1, 0x6

    .line 102
    invoke-direct {p3, p1, p4, v1}, Ll/o3d0;-><init>(Landroid/content/Context;II)V

    .line 103
    .line 104
    .line 105
    new-array p4, p2, [Ll/ua00;

    .line 106
    .line 107
    aput-object p3, p4, v0

    .line 108
    .line 109
    invoke-virtual {p0, p4}, Landroidx/room/RoomDatabase$a;->b([Ll/ua00;)Landroidx/room/RoomDatabase$a;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    new-array p3, p2, [Ll/ua00;

    .line 114
    .line 115
    sget-object p4, Ll/cb00;->INSTANCE:Ll/cb00;

    .line 116
    .line 117
    aput-object p4, p3, v0

    .line 118
    .line 119
    invoke-virtual {p0, p3}, Landroidx/room/RoomDatabase$a;->b([Ll/ua00;)Landroidx/room/RoomDatabase$a;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    new-array p3, p2, [Ll/ua00;

    .line 124
    .line 125
    sget-object p4, Ll/db00;->INSTANCE:Ll/db00;

    .line 126
    .line 127
    aput-object p4, p3, v0

    .line 128
    .line 129
    invoke-virtual {p0, p3}, Landroidx/room/RoomDatabase$a;->b([Ll/ua00;)Landroidx/room/RoomDatabase$a;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    new-array p3, p2, [Ll/ua00;

    .line 134
    .line 135
    sget-object p4, Ll/eb00;->INSTANCE:Ll/eb00;

    .line 136
    .line 137
    aput-object p4, p3, v0

    .line 138
    .line 139
    invoke-virtual {p0, p3}, Landroidx/room/RoomDatabase$a;->b([Ll/ua00;)Landroidx/room/RoomDatabase$a;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    new-instance p3, Ll/ziq0;

    .line 144
    .line 145
    invoke-direct {p3, p1}, Ll/ziq0;-><init>(Landroid/content/Context;)V

    .line 146
    .line 147
    .line 148
    new-array p4, p2, [Ll/ua00;

    .line 149
    .line 150
    aput-object p3, p4, v0

    .line 151
    .line 152
    invoke-virtual {p0, p4}, Landroidx/room/RoomDatabase$a;->b([Ll/ua00;)Landroidx/room/RoomDatabase$a;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    new-instance p3, Ll/o3d0;

    .line 157
    .line 158
    const/16 p4, 0xa

    .line 159
    .line 160
    const/16 v1, 0xb

    .line 161
    .line 162
    invoke-direct {p3, p1, p4, v1}, Ll/o3d0;-><init>(Landroid/content/Context;II)V

    .line 163
    .line 164
    .line 165
    new-array p4, p2, [Ll/ua00;

    .line 166
    .line 167
    aput-object p3, p4, v0

    .line 168
    .line 169
    invoke-virtual {p0, p4}, Landroidx/room/RoomDatabase$a;->b([Ll/ua00;)Landroidx/room/RoomDatabase$a;

    .line 170
    .line 171
    .line 172
    move-result-object p0

    .line 173
    new-array p3, p2, [Ll/ua00;

    .line 174
    .line 175
    sget-object p4, Ll/va00;->INSTANCE:Ll/va00;

    .line 176
    .line 177
    aput-object p4, p3, v0

    .line 178
    .line 179
    invoke-virtual {p0, p3}, Landroidx/room/RoomDatabase$a;->b([Ll/ua00;)Landroidx/room/RoomDatabase$a;

    .line 180
    .line 181
    .line 182
    move-result-object p0

    .line 183
    new-array p3, p2, [Ll/ua00;

    .line 184
    .line 185
    sget-object p4, Ll/wa00;->INSTANCE:Ll/wa00;

    .line 186
    .line 187
    aput-object p4, p3, v0

    .line 188
    .line 189
    invoke-virtual {p0, p3}, Landroidx/room/RoomDatabase$a;->b([Ll/ua00;)Landroidx/room/RoomDatabase$a;

    .line 190
    .line 191
    .line 192
    move-result-object p0

    .line 193
    new-array p3, p2, [Ll/ua00;

    .line 194
    .line 195
    sget-object p4, Ll/xa00;->INSTANCE:Ll/xa00;

    .line 196
    .line 197
    aput-object p4, p3, v0

    .line 198
    .line 199
    invoke-virtual {p0, p3}, Landroidx/room/RoomDatabase$a;->b([Ll/ua00;)Landroidx/room/RoomDatabase$a;

    .line 200
    .line 201
    .line 202
    move-result-object p0

    .line 203
    new-array p3, p2, [Ll/ua00;

    .line 204
    .line 205
    sget-object p4, Ll/ya00;->INSTANCE:Ll/ya00;

    .line 206
    .line 207
    aput-object p4, p3, v0

    .line 208
    .line 209
    invoke-virtual {p0, p3}, Landroidx/room/RoomDatabase$a;->b([Ll/ua00;)Landroidx/room/RoomDatabase$a;

    .line 210
    .line 211
    .line 212
    move-result-object p0

    .line 213
    new-instance p3, Ll/o3d0;

    .line 214
    .line 215
    const/16 p4, 0x15

    .line 216
    .line 217
    const/16 v1, 0x16

    .line 218
    .line 219
    invoke-direct {p3, p1, p4, v1}, Ll/o3d0;-><init>(Landroid/content/Context;II)V

    .line 220
    .line 221
    .line 222
    new-array p1, p2, [Ll/ua00;

    .line 223
    .line 224
    aput-object p3, p1, v0

    .line 225
    .line 226
    invoke-virtual {p0, p1}, Landroidx/room/RoomDatabase$a;->b([Ll/ua00;)Landroidx/room/RoomDatabase$a;

    .line 227
    .line 228
    .line 229
    move-result-object p0

    .line 230
    invoke-virtual {p0}, Landroidx/room/RoomDatabase$a;->e()Landroidx/room/RoomDatabase$a;

    .line 231
    .line 232
    .line 233
    move-result-object p0

    .line 234
    invoke-virtual {p0}, Landroidx/room/RoomDatabase$a;->d()Landroidx/room/RoomDatabase;

    .line 235
    .line 236
    .line 237
    move-result-object p0

    .line 238
    check-cast p0, Landroidx/work/impl/WorkDatabase;

    .line 239
    .line 240
    return-object p0
.end method
