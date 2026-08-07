.class public final Ll/h1c0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0006\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\r\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0005\u0010\u0003J\u0017\u0010\u0008\u001a\u00020\u00062\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0017\u0010\u000b\u001a\u00020\u00062\u0008\u0010\n\u001a\u0004\u0018\u00010\u0006\u00a2\u0006\u0004\u0008\u000b\u0010\t\u00a8\u0006\u000c"
    }
    d2 = {
        "Ll/h1c0;",
        "",
        "<init>",
        "()V",
        "",
        "c",
        "",
        "friendPurpose",
        "a",
        "(Ljava/lang/String;)Ljava/lang/String;",
        "fitReason",
        "b",
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


# static fields
.field public static final INSTANCE:Ll/h1c0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/h1c0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/h1c0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/h1c0;->INSTANCE:Ll/h1c0;

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


# virtual methods
.method public final a(Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    sparse-switch p0, :sswitch_data_0

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :sswitch_0
    const-string p0, "marriage"

    .line 12
    .line 13
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const-string p0, "\u4f60\u4eec\u90fd\u5728\u627e\u7ed3\u5a5a\u5bf9\u8c61"

    .line 21
    .line 22
    return-object p0

    .line 23
    :sswitch_1
    const-string p0, "date"

    .line 24
    .line 25
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-nez p0, :cond_1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    const-string p0, "\u4f60\u4eec\u90fd\u60f3\u51fa\u6765\u7ea6\u4f1a"

    .line 33
    .line 34
    return-object p0

    .line 35
    :sswitch_2
    const-string p0, "fall-in-love"

    .line 36
    .line 37
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-nez p0, :cond_2

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    const-string p0, "\u4f60\u4eec\u90fd\u60f3\u8c08\u4e2a\u604b\u7231"

    .line 45
    .line 46
    return-object p0

    .line 47
    :sswitch_3
    const-string p0, "friend"

    .line 48
    .line 49
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    :cond_3
    :goto_0
    const-string p0, "\u4f60\u4eec\u90fd\u60f3\u4ea4\u4e2a\u670b\u53cb"

    .line 53
    .line 54
    return-object p0

    .line 55
    :sswitch_data_0
    .sparse-switch
        -0x4b79f562 -> :sswitch_3
        -0x3550a538 -> :sswitch_2
        0x2eefae -> :sswitch_1
        0xf1cb0ca -> :sswitch_0
    .end sparse-switch
.end method

.method public final b(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    if-eqz p1, :cond_6

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const v0, -0x78770360

    .line 8
    .line 9
    .line 10
    if-eq p0, v0, :cond_4

    .line 11
    .line 12
    const v0, -0x298587e4

    .line 13
    .line 14
    .line 15
    if-eq p0, v0, :cond_2

    .line 16
    .line 17
    const v0, 0x11318bf5

    .line 18
    .line 19
    .line 20
    if-eq p0, v0, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const-string p0, "distance"

    .line 24
    .line 25
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-nez p1, :cond_1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    return-object p0

    .line 33
    :cond_2
    const-string p0, "zodiac"

    .line 34
    .line 35
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-nez p0, :cond_3

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_3
    const-string p0, "constellation"

    .line 43
    .line 44
    return-object p0

    .line 45
    :cond_4
    const-string p0, "friendPurpose"

    .line 46
    .line 47
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-nez p0, :cond_5

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_5
    const-string p0, "purpose"

    .line 55
    .line 56
    return-object p0

    .line 57
    :cond_6
    :goto_0
    const-string p0, "default"

    .line 58
    .line 59
    return-object p0
.end method

.method public final c()V
    .locals 1

    .line 1
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    const-string v0, "https://static.tancdn.com/pe-webplatform/tYf1HL7yBDpDDckT28xVYZNJ.png"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/fsb0;->r0(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
