.class public Ll/tp9;
.super Ll/qpl;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0003\u0008\u0016\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J-\u0010\u000c\u001a\u00020\u000b2\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u00062\u0008\u0010\u0008\u001a\u0004\u0018\u00010\u00062\u0008\u0010\n\u001a\u0004\u0018\u00010\tH\u0014\u00a2\u0006\u0004\u0008\u000c\u0010\r\u00a8\u0006\u000e"
    }
    d2 = {
        "Ll/tp9;",
        "Ll/qpl;",
        "Ll/hul;",
        "mkWebView",
        "<init>",
        "(Ll/hul;)V",
        "",
        "namespace",
        "method",
        "Lorg/json/JSONObject;",
        "params",
        "",
        "p",
        "(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)Z",
        "MKCore_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/hul;)V
    .locals 0
    .param p1    # Ll/hul;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Ll/qpl;-><init>(Ll/hul;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public p(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)Z
    .locals 5
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p3    # Lorg/json/JSONObject;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    const-string v0, "fdt"

    .line 2
    .line 3
    invoke-static {v0, p1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 v0, 0x0

    .line 8
    if-eqz p1, :cond_4

    .line 9
    .line 10
    invoke-static {}, Ll/rs8;->u()Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    const/4 v1, 0x1

    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    const-string p0, "\u9700\u8981\u914d\u7f6econfig\u624d\u53ef\u4ee5\u4f7f\u7528FDT\u54e6"

    .line 18
    .line 19
    invoke-static {p0}, Ll/t1j0;->m(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    return v1

    .line 23
    :cond_0
    if-nez p3, :cond_1

    .line 24
    .line 25
    invoke-static {}, Lkotlin/jvm/internal/Intrinsics;->m()V

    .line 26
    .line 27
    .line 28
    :cond_1
    const-string p1, "callback"

    .line 29
    .line 30
    invoke-virtual {p3, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    if-nez p2, :cond_2

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_2
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    const-string v3, "ok"

    .line 42
    .line 43
    const/4 v4, 0x0

    .line 44
    sparse-switch v2, :sswitch_data_0

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :sswitch_0
    const-string v0, "authDevice"

    .line 49
    .line 50
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result p2

    .line 54
    if-eqz p2, :cond_3

    .line 55
    .line 56
    new-instance p2, Ll/tp9$b;

    .line 57
    .line 58
    invoke-direct {p2, p0, p3, p1}, Ll/tp9$b;-><init>(Ll/tp9;Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-static {p2}, Ll/x310;->d(Ljava/lang/Runnable;)V

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :sswitch_1
    const-string p3, "disconnect"

    .line 66
    .line 67
    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result p2

    .line 71
    if-eqz p2, :cond_3

    .line 72
    .line 73
    sget-object p2, Ll/tp9$e;->INSTANCE:Ll/tp9$e;

    .line 74
    .line 75
    invoke-static {p2}, Ll/x310;->d(Ljava/lang/Runnable;)V

    .line 76
    .line 77
    .line 78
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p2

    .line 82
    invoke-virtual {p0, p1, v4, v3, p2}, Ll/qpl;->h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    goto :goto_0

    .line 86
    :sswitch_2
    const-string v0, "login"

    .line 87
    .line 88
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result p2

    .line 92
    if-eqz p2, :cond_3

    .line 93
    .line 94
    new-instance p2, Ll/tp9$a;

    .line 95
    .line 96
    invoke-direct {p2, p0, p3, p1}, Ll/tp9$a;-><init>(Ll/tp9;Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    invoke-static {p2}, Ll/x310;->d(Ljava/lang/Runnable;)V

    .line 100
    .line 101
    .line 102
    goto :goto_0

    .line 103
    :sswitch_3
    const-string p3, "checkDNSStatus"

    .line 104
    .line 105
    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    move-result p2

    .line 109
    if-eqz p2, :cond_3

    .line 110
    .line 111
    new-instance p2, Ll/tp9$c;

    .line 112
    .line 113
    invoke-direct {p2, p0, p1}, Ll/tp9$c;-><init>(Ll/tp9;Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    invoke-static {p2}, Ll/x310;->d(Ljava/lang/Runnable;)V

    .line 117
    .line 118
    .line 119
    goto :goto_0

    .line 120
    :sswitch_4
    const-string p3, "keepScreenAlwaysLight"

    .line 121
    .line 122
    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    move-result p2

    .line 126
    if-eqz p2, :cond_3

    .line 127
    .line 128
    new-instance p2, Ll/tp9$d;

    .line 129
    .line 130
    invoke-direct {p2, p0}, Ll/tp9$d;-><init>(Ll/tp9;)V

    .line 131
    .line 132
    .line 133
    invoke-static {p2}, Ll/x310;->d(Ljava/lang/Runnable;)V

    .line 134
    .line 135
    .line 136
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object p2

    .line 140
    invoke-virtual {p0, p1, v4, v3, p2}, Ll/qpl;->h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    :cond_3
    :goto_0
    return v1

    .line 144
    :cond_4
    return v0

    .line 145
    :sswitch_data_0
    .sparse-switch
        -0x5bd5c0ca -> :sswitch_4
        -0x4625a1ad -> :sswitch_3
        0x625ef69 -> :sswitch_2
        0x1f9d589c -> :sswitch_1
        0x5c7b0a1e -> :sswitch_0
    .end sparse-switch
.end method
