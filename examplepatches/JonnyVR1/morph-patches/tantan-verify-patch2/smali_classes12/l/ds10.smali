.class public final Ll/ds10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qkq0;


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


# virtual methods
.method public a(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Ll/d13;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/google/zxing/BarcodeFormat;",
            "II",
            "Ljava/util/Map<",
            "Lcom/google/zxing/EncodeHintType;",
            "*>;)",
            "Ll/d13;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .line 1
    sget-object p0, Ll/ds10$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    aget p0, p0, v0

    .line 8
    .line 9
    packed-switch p0, :pswitch_data_0

    .line 10
    .line 11
    .line 12
    const-string p0, "No encoder available for format "

    .line 13
    .line 14
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x0

    .line 26
    return-object p0

    .line 27
    :pswitch_0
    new-instance p0, Ll/aq1;

    .line 28
    .line 29
    invoke-direct {p0}, Ll/aq1;-><init>()V

    .line 30
    .line 31
    .line 32
    :goto_0
    move-object v0, p0

    .line 33
    move-object v1, p1

    .line 34
    move-object v2, p2

    .line 35
    move v3, p3

    .line 36
    move v4, p4

    .line 37
    move-object v5, p5

    .line 38
    goto :goto_1

    .line 39
    :pswitch_1
    new-instance p0, Ll/y5c;

    .line 40
    .line 41
    invoke-direct {p0}, Ll/y5c;-><init>()V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :pswitch_2
    new-instance p0, Ll/cc5;

    .line 46
    .line 47
    invoke-direct {p0}, Ll/cc5;-><init>()V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :pswitch_3
    new-instance p0, Ll/d960;

    .line 52
    .line 53
    invoke-direct {p0}, Ll/d960;-><init>()V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :pswitch_4
    new-instance p0, Ll/s6m;

    .line 58
    .line 59
    invoke-direct {p0}, Ll/s6m;-><init>()V

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :pswitch_5
    new-instance p0, Lcom/google/zxing/oned/Code128Writer;

    .line 64
    .line 65
    invoke-direct {p0}, Lcom/google/zxing/oned/Code128Writer;-><init>()V

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :pswitch_6
    new-instance p0, Ll/hc5;

    .line 70
    .line 71
    invoke-direct {p0}, Ll/hc5;-><init>()V

    .line 72
    .line 73
    .line 74
    goto :goto_0

    .line 75
    :pswitch_7
    new-instance p0, Ll/fc5;

    .line 76
    .line 77
    invoke-direct {p0}, Ll/fc5;-><init>()V

    .line 78
    .line 79
    .line 80
    goto :goto_0

    .line 81
    :pswitch_8
    new-instance p0, Ll/nvb0;

    .line 82
    .line 83
    invoke-direct {p0}, Ll/nvb0;-><init>()V

    .line 84
    .line 85
    .line 86
    goto :goto_0

    .line 87
    :pswitch_9
    new-instance p0, Ll/rpj0;

    .line 88
    .line 89
    invoke-direct {p0}, Ll/rpj0;-><init>()V

    .line 90
    .line 91
    .line 92
    goto :goto_0

    .line 93
    :pswitch_a
    new-instance p0, Ll/qje;

    .line 94
    .line 95
    invoke-direct {p0}, Ll/qje;-><init>()V

    .line 96
    .line 97
    .line 98
    goto :goto_0

    .line 99
    :pswitch_b
    new-instance p0, Ll/ypj0;

    .line 100
    .line 101
    invoke-direct {p0}, Ll/ypj0;-><init>()V

    .line 102
    .line 103
    .line 104
    goto :goto_0

    .line 105
    :pswitch_c
    new-instance p0, Ll/sje;

    .line 106
    .line 107
    invoke-direct {p0}, Ll/sje;-><init>()V

    .line 108
    .line 109
    .line 110
    goto :goto_0

    .line 111
    :goto_1
    invoke-interface/range {v0 .. v5}, Ll/qkq0;->a(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Ll/d13;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    return-object p0

    .line 116
    nop

    .line 117
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_c
        :pswitch_b
        :pswitch_a
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
