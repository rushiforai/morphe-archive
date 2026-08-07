.class public Lcom/p1/mobile/putong/core/newui/main/a$r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/main/a;->H7()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y20<",
        "Ljava/lang/Double;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/main/a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/main/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/main/a$r;->a:Lcom/p1/mobile/putong/core/newui/main/a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Double;)V
    .locals 8

    .line 1
    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmpl-double p0, v0, v2

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->ig()D

    .line 16
    .line 17
    .line 18
    move-result-wide p0

    .line 19
    double-to-long p0, p0

    .line 20
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/g;->Bg()D

    .line 25
    .line 26
    .line 27
    move-result-wide v0

    .line 28
    double-to-long v0, v0

    .line 29
    goto :goto_2

    .line 30
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    .line 31
    .line 32
    .line 33
    move-result-wide v0

    .line 34
    const-wide/high16 v2, -0x4010000000000000L    # -1.0

    .line 35
    .line 36
    cmpl-double p0, v0, v2

    .line 37
    .line 38
    if-nez p0, :cond_1

    .line 39
    .line 40
    const-wide/16 p0, -0x1

    .line 41
    .line 42
    move-wide v0, p0

    .line 43
    goto :goto_2

    .line 44
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    .line 45
    .line 46
    .line 47
    move-result-wide v0

    .line 48
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->ig()D

    .line 53
    .line 54
    .line 55
    move-result-wide v2

    .line 56
    cmpg-double p0, v0, v2

    .line 57
    .line 58
    if-gez p0, :cond_2

    .line 59
    .line 60
    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    .line 61
    .line 62
    .line 63
    move-result-wide v0

    .line 64
    invoke-static {v0, v1}, Ljava/lang/Math;->round(D)J

    .line 65
    .line 66
    .line 67
    move-result-wide v0

    .line 68
    const-wide/16 v2, 0x1

    .line 69
    .line 70
    sub-long/2addr v0, v2

    .line 71
    goto :goto_0

    .line 72
    :cond_2
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 73
    .line 74
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 75
    .line 76
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->ig()D

    .line 77
    .line 78
    .line 79
    move-result-wide v0

    .line 80
    double-to-long v0, v0

    .line 81
    :goto_0
    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    .line 82
    .line 83
    .line 84
    move-result-wide v2

    .line 85
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 86
    .line 87
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 88
    .line 89
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->Bg()D

    .line 90
    .line 91
    .line 92
    move-result-wide v4

    .line 93
    cmpg-double p0, v2, v4

    .line 94
    .line 95
    if-gez p0, :cond_3

    .line 96
    .line 97
    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    .line 98
    .line 99
    .line 100
    move-result-wide p0

    .line 101
    invoke-static {p0, p1}, Ljava/lang/Math;->round(D)J

    .line 102
    .line 103
    .line 104
    move-result-wide p0

    .line 105
    const-wide/16 v2, 0x2

    .line 106
    .line 107
    sub-long/2addr p0, v2

    .line 108
    :goto_1
    move-wide v6, v0

    .line 109
    move-wide v0, p0

    .line 110
    move-wide p0, v6

    .line 111
    goto :goto_2

    .line 112
    :cond_3
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 113
    .line 114
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 115
    .line 116
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->Bg()D

    .line 117
    .line 118
    .line 119
    move-result-wide p0

    .line 120
    double-to-long p0, p0

    .line 121
    goto :goto_1

    .line 122
    :goto_2
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 123
    .line 124
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 125
    .line 126
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/g;->j0:Ll/byd0;

    .line 127
    .line 128
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    invoke-virtual {v2, p0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 136
    .line 137
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 138
    .line 139
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/g;->l0:Ll/byd0;

    .line 140
    .line 141
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 146
    .line 147
    .line 148
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 149
    .line 150
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 151
    .line 152
    sget-object p1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 153
    .line 154
    invoke-virtual {p1}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 155
    .line 156
    .line 157
    move-result-wide v0

    .line 158
    long-to-double v0, v0

    .line 159
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/api/g;->dq(D)V

    .line 160
    .line 161
    .line 162
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/Double;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/a$r;->a(Ljava/lang/Double;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
