.class Ll/ob4$m;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ob4;->L1()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/ob4;


# direct methods
.method public constructor <init>(Ll/ob4;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ob4$m;->a:Ll/ob4;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ob4$m;->a:Ll/ob4;

    .line 2
    .line 3
    invoke-static {v0}, Ll/ob4;->I0(Ll/ob4;)Ll/ia4;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/ob4$m;->a:Ll/ob4;

    .line 10
    .line 11
    invoke-static {v0}, Ll/ob4;->n(Ll/ob4;)Ll/sow;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Ll/ob4$m;->a:Ll/ob4;

    .line 18
    .line 19
    invoke-static {v0}, Ll/ob4;->I0(Ll/ob4;)Ll/ia4;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, p0, Ll/ob4$m;->a:Ll/ob4;

    .line 24
    .line 25
    invoke-static {v1}, Ll/ob4;->n(Ll/ob4;)Ll/sow;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Ll/ia4;->e(Ll/sow;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/ob4$m;->a:Ll/ob4;

    .line 33
    .line 34
    invoke-static {v0}, Ll/ob4;->I0(Ll/ob4;)Ll/ia4;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget-object v1, p0, Ll/ob4$m;->a:Ll/ob4;

    .line 39
    .line 40
    invoke-static {v1}, Ll/ob4;->U0(Ll/ob4;)I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    iget-object v2, p0, Ll/ob4$m;->a:Ll/ob4;

    .line 45
    .line 46
    invoke-static {v2}, Ll/ob4;->T0(Ll/ob4;)Ll/qow;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-virtual {v0, v1, v2}, Ll/ia4;->h(ILl/qow;)Z

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Ll/ob4$m;->a:Ll/ob4;

    .line 54
    .line 55
    invoke-static {v0}, Ll/ob4;->c1(Ll/ob4;)Ll/v5c;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    new-instance v1, Ll/crf0;

    .line 60
    .line 61
    iget-object v2, p0, Ll/ob4$m;->a:Ll/ob4;

    .line 62
    .line 63
    invoke-static {v2}, Ll/ob4;->n(Ll/ob4;)Ll/sow;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-virtual {v2}, Ll/sow;->d()I

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    iget-object v3, p0, Ll/ob4$m;->a:Ll/ob4;

    .line 72
    .line 73
    invoke-static {v3}, Ll/ob4;->n(Ll/ob4;)Ll/sow;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    invoke-virtual {v3}, Ll/sow;->c()I

    .line 78
    .line 79
    .line 80
    move-result v3

    .line 81
    invoke-direct {v1, v2, v3}, Ll/crf0;-><init>(II)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v0, v1}, Ll/qt2;->R(Ljava/lang/Object;)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Ll/ob4$m;->a:Ll/ob4;

    .line 88
    .line 89
    invoke-static {v0}, Ll/ob4;->c1(Ll/ob4;)Ll/v5c;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    iget-object v1, p0, Ll/ob4$m;->a:Ll/ob4;

    .line 94
    .line 95
    invoke-static {v1}, Ll/ob4;->V0(Ll/ob4;)Ll/omq0$a;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-virtual {v0, v1}, Ll/qt2;->C(Ljava/lang/Object;)V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Ll/ob4$m;->a:Ll/ob4;

    .line 103
    .line 104
    invoke-static {v0}, Ll/ob4;->I0(Ll/ob4;)Ll/ia4;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-virtual {v0}, Ll/ia4;->d()Ll/ypl;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    if-eqz v0, :cond_0

    .line 113
    .line 114
    iget-object v1, p0, Ll/ob4$m;->a:Ll/ob4;

    .line 115
    .line 116
    invoke-static {v1}, Ll/ob4;->c1(Ll/ob4;)Ll/v5c;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    invoke-interface {v0}, Ll/ypl;->m()I

    .line 121
    .line 122
    .line 123
    move-result v2

    .line 124
    invoke-virtual {v1, v2}, Ll/klc0;->x0(I)V

    .line 125
    .line 126
    .line 127
    iget-object v1, p0, Ll/ob4$m;->a:Ll/ob4;

    .line 128
    .line 129
    invoke-static {v1}, Ll/ob4;->c1(Ll/ob4;)Ll/v5c;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    invoke-interface {v0}, Ll/ypl;->i()Z

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    invoke-virtual {v1, v0}, Ll/klc0;->J0(Z)V

    .line 138
    .line 139
    .line 140
    :cond_0
    iget-object v0, p0, Ll/ob4$m;->a:Ll/ob4;

    .line 141
    .line 142
    invoke-static {v0}, Ll/ob4;->c1(Ll/ob4;)Ll/v5c;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    iget-object v1, p0, Ll/ob4$m;->a:Ll/ob4;

    .line 147
    .line 148
    invoke-static {v1}, Ll/ob4;->n(Ll/ob4;)Ll/sow;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    iget-boolean v1, v1, Ll/sow;->g0:Z

    .line 153
    .line 154
    invoke-virtual {v0, v1}, Ll/v5c;->O0(Z)V

    .line 155
    .line 156
    .line 157
    iget-object v0, p0, Ll/ob4$m;->a:Ll/ob4;

    .line 158
    .line 159
    invoke-static {v0}, Ll/ob4;->I0(Ll/ob4;)Ll/ia4;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    iget-object p0, p0, Ll/ob4$m;->a:Ll/ob4;

    .line 164
    .line 165
    invoke-static {p0}, Ll/ob4;->W0(Ll/ob4;)Landroid/graphics/SurfaceTexture;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    invoke-virtual {v0, p0}, Ll/ia4;->q(Landroid/graphics/SurfaceTexture;)Z

    .line 170
    .line 171
    .line 172
    :cond_1
    return-void
.end method
