.class public Ll/ab80;
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

.method public static a(Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v2, "error message = "

    .line 18
    .line 19
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v2, " cause = "

    .line 30
    .line 31
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-static {v0}, Ll/n180;->j(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 45
    .line 46
    if-eqz v0, :cond_1

    .line 47
    .line 48
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 49
    .line 50
    iget v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 51
    .line 52
    sparse-switch v0, :sswitch_data_0

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :sswitch_0
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 57
    .line 58
    if-eqz p0, :cond_2

    .line 59
    .line 60
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :sswitch_1
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->ja:I

    .line 65
    .line 66
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :sswitch_2
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Z1:I

    .line 71
    .line 72
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 73
    .line 74
    .line 75
    goto :goto_0

    .line 76
    :sswitch_3
    sget p0, Ll/fct;->n:I

    .line 77
    .line 78
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 79
    .line 80
    .line 81
    goto :goto_0

    .line 82
    :sswitch_4
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {p0}, Ll/vwt;->V3()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    goto :goto_0

    .line 94
    :sswitch_5
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Be:I

    .line 95
    .line 96
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 97
    .line 98
    .line 99
    goto :goto_0

    .line 100
    :sswitch_6
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->d3:I

    .line 101
    .line 102
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 103
    .line 104
    .line 105
    goto :goto_0

    .line 106
    :sswitch_7
    sget p0, Ll/fct;->o:I

    .line 107
    .line 108
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 109
    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_1
    const/4 v0, 0x0

    .line 113
    :cond_2
    :goto_0
    if-nez v0, :cond_3

    .line 114
    .line 115
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->G9:I

    .line 116
    .line 117
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 118
    .line 119
    .line 120
    :cond_3
    return-void

    .line 121
    :sswitch_data_0
    .sparse-switch
        0xa046 -> :sswitch_7
        0xa047 -> :sswitch_7
        0xa048 -> :sswitch_6
        0xa04a -> :sswitch_5
        0xa04b -> :sswitch_4
        0xa04f -> :sswitch_3
        0xa050 -> :sswitch_2
        0xa051 -> :sswitch_1
        0xa05d -> :sswitch_0
        0xa061 -> :sswitch_0
        0xa09a -> :sswitch_0
        0xa09b -> :sswitch_0
        0xa09c -> :sswitch_0
        0xa09d -> :sswitch_0
    .end sparse-switch
.end method
