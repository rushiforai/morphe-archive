.class public Ll/snt;
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
    .locals 2

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 2
    .line 3
    if-eqz v0, :cond_8

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 6
    .line 7
    iget v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 8
    .line 9
    const v1, 0xa411

    .line 10
    .line 11
    .line 12
    if-ne v0, v1, :cond_0

    .line 13
    .line 14
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 15
    .line 16
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->kd:I

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    const v1, 0xa414

    .line 27
    .line 28
    .line 29
    if-ne v0, v1, :cond_1

    .line 30
    .line 31
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 32
    .line 33
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->oc:I

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    const v1, 0xa412

    .line 44
    .line 45
    .line 46
    if-ne v0, v1, :cond_2

    .line 47
    .line 48
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 49
    .line 50
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Xj:I

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_2
    const v1, 0xa416

    .line 61
    .line 62
    .line 63
    if-eq v0, v1, :cond_7

    .line 64
    .line 65
    const v1, 0xa417

    .line 66
    .line 67
    .line 68
    if-ne v0, v1, :cond_3

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_3
    const v1, 0xa413

    .line 72
    .line 73
    .line 74
    if-ne v0, v1, :cond_4

    .line 75
    .line 76
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 77
    .line 78
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->K0:I

    .line 79
    .line 80
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :cond_4
    const v1, 0xa415

    .line 89
    .line 90
    .line 91
    if-ne v0, v1, :cond_5

    .line 92
    .line 93
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 94
    .line 95
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->d2:I

    .line 96
    .line 97
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
    :cond_5
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 106
    .line 107
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-nez v0, :cond_6

    .line 112
    .line 113
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :cond_6
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 118
    .line 119
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->kd:I

    .line 120
    .line 121
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    return-void

    .line 129
    :cond_7
    :goto_0
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 130
    .line 131
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->y:I

    .line 132
    .line 133
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    return-void

    .line 141
    :cond_8
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 142
    .line 143
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->kd:I

    .line 144
    .line 145
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    return-void
.end method
