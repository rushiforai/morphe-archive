.class public Ll/wtk;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static a(ILjava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    packed-switch p0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    return-object v0

    .line 7
    :pswitch_0
    const-string p0, "\u5e05\u54e5/\u7f8e\u5973\u8fd9\u4e48\u591a\u53efta\u504f\u504f\u559c\u6b22\u4e86\u4f60"

    .line 8
    .line 9
    return-object p0

    .line 10
    :pswitch_1
    const-string p0, "ta\u548c\u4f60\u540c\u4e2a\u661f\u5ea7"

    .line 11
    .line 12
    return-object p0

    .line 13
    :pswitch_2
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    return-object v0

    .line 20
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string v0, "\u4f60\u4eec\u90fd\u662f"

    .line 23
    .line 24
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string p1, "\u540e"

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0

    .line 40
    :pswitch_3
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-eqz p0, :cond_1

    .line 45
    .line 46
    return-object v0

    .line 47
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    const-string v0, "\u4f60\u4eec\u90fd\u6765\u81ea"

    .line 50
    .line 51
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    return-object p0

    .line 62
    :pswitch_4
    const-string p0, "ta\u548c\u4f60\u540c\u5c81\u540c\u661f\u5ea7"

    .line 63
    .line 64
    return-object p0

    .line 65
    :pswitch_5
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    if-eqz p0, :cond_2

    .line 70
    .line 71
    return-object v0

    .line 72
    :cond_2
    new-instance p0, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    const-string v0, "\u4f60\u4eec\u7ecf\u5e38\u51fa\u6ca1\u4e8e\uff1a"

    .line 75
    .line 76
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    return-object p0

    .line 87
    :pswitch_6
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 88
    .line 89
    .line 90
    move-result p0

    .line 91
    if-eqz p0, :cond_3

    .line 92
    .line 93
    return-object v0

    .line 94
    :cond_3
    new-instance p0, Ljava/lang/StringBuilder;

    .line 95
    .line 96
    const-string v0, "\u4f60\u4eec\u90fd\u559c\u6b22"

    .line 97
    .line 98
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    return-object p0

    .line 109
    :pswitch_7
    const-string p0, "\u4f60\u4eec\u6bd5\u4e1a\u4e8e\u540c\u6240\u5b66\u6821"

    .line 110
    .line 111
    return-object p0

    .line 112
    :pswitch_8
    const-string p0, "ta\u548c\u4f60\u540c\u5929\u751f\u65e5"

    .line 113
    .line 114
    return-object p0

    .line 115
    :pswitch_9
    const-string p0, "\u4f60\u4eec\u90fd\u53eb\u540c\u4e00\u4e2a\u6635\u79f0"

    .line 116
    .line 117
    return-object p0

    .line 118
    nop

    .line 119
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_9
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

.method public static b(I)Ljava/lang/String;
    .locals 0

    .line 1
    packed-switch p0, :pswitch_data_0

    .line 2
    .line 3
    .line 4
    const-string p0, ""

    .line 5
    .line 6
    return-object p0

    .line 7
    :pswitch_0
    const-string p0, "\u5feb\u548cta\u6253\u4e2a\u62db\u547c\u5427\uff5e"

    .line 8
    .line 9
    return-object p0

    .line 10
    :pswitch_1
    const-string p0, "\u95ee\u95eeta\u5177\u4f53\u7684\u751f\u65e5\u65e5\u671f\u5427\uff5e"

    .line 11
    .line 12
    return-object p0

    .line 13
    :pswitch_2
    const-string p0, "\u804a\u804a\u4f60\u4eec\u7684\u7ae5\u5e74\u8da3\u4e8b\u5427\uff5e"

    .line 14
    .line 15
    return-object p0

    .line 16
    :pswitch_3
    const-string p0, "\u95ee\u95eeta\u6700\u559c\u6b22\u5403\u7684\u5f53\u5730\u7f8e\u98df\u5427\uff5e"

    .line 17
    .line 18
    return-object p0

    .line 19
    :pswitch_4
    const-string p0, "\u767e\u5206\u4e4b\u4e00\u7684\u7f18\u4efd\u8fd8\u4e0d\u6253\u4e2a\u62db\u547c\uff5e"

    .line 20
    .line 21
    return-object p0

    .line 22
    :pswitch_5
    const-string p0, "\u5feb\u804a\u804a\u5f53\u5730\u7684\u7f8e\u98df\u5427\uff5e"

    .line 23
    .line 24
    return-object p0

    .line 25
    :pswitch_6
    const-string p0, "\u548cta\u804a\u804a\u4f60\u4eec\u7684\u5171\u540c\u7231\u597d\u5427\uff5e"

    .line 26
    .line 27
    return-object p0

    .line 28
    :pswitch_7
    const-string p0, "\u548cta\u804a\u804a\u5b66\u6821\u91cc\u7684\u8da3\u4e8b\u5427\uff5e"

    .line 29
    .line 30
    return-object p0

    .line 31
    :pswitch_8
    const-string p0, "\u95ee\u95eeta\u80fd\u63a5\u53d7\u53e6\u4e00\u534a\u7684\u5e74\u9f84\u6bb5\uff5e"

    .line 32
    .line 33
    return-object p0

    .line 34
    :pswitch_9
    const-string p0, "\u95ee\u95eeta\u8d77\u8fd9\u4e2a\u6635\u79f0\u7684\u6765\u7531\u5427\uff5e"

    .line 35
    .line 36
    return-object p0

    .line 37
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_9
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
