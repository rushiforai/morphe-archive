.class public final synthetic Ll/oiy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public synthetic a:Ll/fiy0;


# direct methods
.method public synthetic constructor <init>(Ll/fiy0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/oiy0;->a:Ll/fiy0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    .line 1
    iget-object p0, p0, Ll/oiy0;->a:Ll/fiy0;

    .line 2
    .line 3
    iget-object v0, p0, Ll/fiy0;->c:Ll/iiy0;

    .line 4
    .line 5
    iget-wide v1, p0, Ll/fiy0;->a:J

    .line 6
    .line 7
    iget-wide v3, p0, Ll/fiy0;->b:J

    .line 8
    .line 9
    iget-object p0, v0, Ll/iiy0;->b:Ll/thy0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/yyx0;->h()V

    .line 12
    .line 13
    .line 14
    iget-object p0, v0, Ll/iiy0;->b:Ll/thy0;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Ll/d6x0;->z()Ll/l8x0;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-string v5, "Application going to the background"

    .line 25
    .line 26
    invoke-virtual {p0, v5}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-object p0, v0, Ll/iiy0;->b:Ll/thy0;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/yyx0;->d()Ll/ajx0;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    iget-object p0, p0, Ll/ajx0;->u:Ll/dhx0;

    .line 36
    .line 37
    const/4 v5, 0x1

    .line 38
    invoke-virtual {p0, v5}, Ll/dhx0;->a(Z)V

    .line 39
    .line 40
    .line 41
    iget-object p0, v0, Ll/iiy0;->b:Ll/thy0;

    .line 42
    .line 43
    invoke-virtual {p0, v5}, Ll/thy0;->x(Z)V

    .line 44
    .line 45
    .line 46
    iget-object p0, v0, Ll/iiy0;->b:Ll/thy0;

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/yyx0;->a()Ll/ajr0;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p0}, Ll/ajr0;->P()Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    if-nez p0, :cond_1

    .line 57
    .line 58
    iget-object p0, v0, Ll/iiy0;->b:Ll/thy0;

    .line 59
    .line 60
    invoke-virtual {p0}, Ll/yyx0;->a()Ll/ajr0;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    sget-object v5, Ll/whs0;->Q0:Ll/zpw0;

    .line 65
    .line 66
    invoke-virtual {p0, v5}, Ll/ajr0;->n(Ll/zpw0;)Z

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    iget-object v5, v0, Ll/iiy0;->b:Ll/thy0;

    .line 71
    .line 72
    const/4 v6, 0x0

    .line 73
    if-eqz p0, :cond_0

    .line 74
    .line 75
    invoke-virtual {v5, v6, v6, v3, v4}, Ll/thy0;->y(ZZJ)Z

    .line 76
    .line 77
    .line 78
    iget-object p0, v0, Ll/iiy0;->b:Ll/thy0;

    .line 79
    .line 80
    iget-object p0, p0, Ll/thy0;->f:Ll/liy0;

    .line 81
    .line 82
    invoke-virtual {p0, v3, v4}, Ll/liy0;->e(J)V

    .line 83
    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_0
    iget-object p0, v5, Ll/thy0;->f:Ll/liy0;

    .line 87
    .line 88
    invoke-virtual {p0, v3, v4}, Ll/liy0;->e(J)V

    .line 89
    .line 90
    .line 91
    iget-object p0, v0, Ll/iiy0;->b:Ll/thy0;

    .line 92
    .line 93
    invoke-virtual {p0, v6, v6, v3, v4}, Ll/thy0;->y(ZZJ)Z

    .line 94
    .line 95
    .line 96
    :cond_1
    :goto_0
    iget-object p0, v0, Ll/iiy0;->b:Ll/thy0;

    .line 97
    .line 98
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-virtual {p0}, Ll/d6x0;->D()Ll/l8x0;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    const-string v3, "Application backgrounded at: timestamp_millis"

    .line 107
    .line 108
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    invoke-virtual {p0, v3, v1}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 113
    .line 114
    .line 115
    iget-object p0, v0, Ll/iiy0;->b:Ll/thy0;

    .line 116
    .line 117
    invoke-virtual {p0}, Ll/yyx0;->a()Ll/ajr0;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    sget-object v1, Ll/whs0;->e1:Ll/zpw0;

    .line 122
    .line 123
    invoke-virtual {p0, v1}, Ll/ajr0;->n(Ll/zpw0;)Z

    .line 124
    .line 125
    .line 126
    move-result p0

    .line 127
    if-eqz p0, :cond_2

    .line 128
    .line 129
    iget-object p0, v0, Ll/iiy0;->b:Ll/thy0;

    .line 130
    .line 131
    invoke-virtual {p0}, Ll/v1v0;->l()Lcom/google/android/gms/measurement/internal/g;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/g;->v0()V

    .line 136
    .line 137
    .line 138
    :cond_2
    return-void
.end method
