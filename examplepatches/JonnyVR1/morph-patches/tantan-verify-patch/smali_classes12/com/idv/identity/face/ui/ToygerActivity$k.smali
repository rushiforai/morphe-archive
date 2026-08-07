.class Lcom/idv/identity/face/ui/ToygerActivity$k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/idv/identity/face/ui/ToygerActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/idv/identity/face/ui/ToygerActivity;


# direct methods
.method public constructor <init>(Lcom/idv/identity/face/ui/ToygerActivity;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/face/ui/ToygerActivity$k;->a:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)Z
    .locals 6
    .param p1    # Landroid/os/Message;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget v0, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    packed-switch v0, :pswitch_data_0

    .line 5
    .line 6
    .line 7
    packed-switch v0, :pswitch_data_1

    .line 8
    .line 9
    .line 10
    packed-switch v0, :pswitch_data_2

    .line 11
    .line 12
    .line 13
    goto/16 :goto_0

    .line 14
    .line 15
    :pswitch_0
    iget-object p0, p0, Lcom/idv/identity/face/ui/ToygerActivity$k;->a:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 16
    .line 17
    invoke-static {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->P0(Lcom/idv/identity/face/ui/ToygerActivity;)V

    .line 18
    .line 19
    .line 20
    goto/16 :goto_0

    .line 21
    .line 22
    :pswitch_1
    iget-object p0, p0, Lcom/idv/identity/face/ui/ToygerActivity$k;->a:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 23
    .line 24
    invoke-static {p0, v1}, Lcom/idv/identity/face/ui/ToygerActivity;->N0(Lcom/idv/identity/face/ui/ToygerActivity;Z)V

    .line 25
    .line 26
    .line 27
    goto/16 :goto_0

    .line 28
    .line 29
    :pswitch_2
    iget-object p0, p0, Lcom/idv/identity/face/ui/ToygerActivity$k;->a:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 30
    .line 31
    invoke-static {p0, v1}, Lcom/idv/identity/face/ui/ToygerActivity;->N0(Lcom/idv/identity/face/ui/ToygerActivity;Z)V

    .line 32
    .line 33
    .line 34
    goto/16 :goto_0

    .line 35
    .line 36
    :pswitch_3
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 37
    .line 38
    check-cast p1, Ljava/lang/String;

    .line 39
    .line 40
    iget-object p0, p0, Lcom/idv/identity/face/ui/ToygerActivity$k;->a:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 41
    .line 42
    invoke-static {p0, p1}, Lcom/idv/identity/face/ui/ToygerActivity;->v1(Lcom/idv/identity/face/ui/ToygerActivity;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    goto/16 :goto_0

    .line 46
    .line 47
    :pswitch_4
    iget-object p0, p0, Lcom/idv/identity/face/ui/ToygerActivity$k;->a:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 48
    .line 49
    invoke-static {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->R0(Lcom/idv/identity/face/ui/ToygerActivity;)V

    .line 50
    .line 51
    .line 52
    goto/16 :goto_0

    .line 53
    .line 54
    :pswitch_5
    iget-object p0, p0, Lcom/idv/identity/face/ui/ToygerActivity$k;->a:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 55
    .line 56
    iget p1, p1, Landroid/os/Message;->arg1:I

    .line 57
    .line 58
    invoke-static {p0, p1}, Lcom/idv/identity/face/ui/ToygerActivity;->Q0(Lcom/idv/identity/face/ui/ToygerActivity;I)V

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :pswitch_6
    iget-object p0, p0, Lcom/idv/identity/face/ui/ToygerActivity$k;->a:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->R()V

    .line 65
    .line 66
    .line 67
    goto :goto_0

    .line 68
    :pswitch_7
    iget-object p1, p0, Lcom/idv/identity/face/ui/ToygerActivity$k;->a:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 69
    .line 70
    invoke-static {p1, v1}, Lcom/idv/identity/face/ui/ToygerActivity;->O0(Lcom/idv/identity/face/ui/ToygerActivity;Z)Z

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, Lcom/idv/identity/face/ui/ToygerActivity$k;->a:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 74
    .line 75
    invoke-static {p1}, Lcom/idv/identity/face/ui/ToygerActivity;->Y0(Lcom/idv/identity/face/ui/ToygerActivity;)Ll/wrb;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    if-eqz p1, :cond_0

    .line 80
    .line 81
    iget-object p1, p0, Lcom/idv/identity/face/ui/ToygerActivity$k;->a:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 82
    .line 83
    invoke-static {p1}, Lcom/idv/identity/face/ui/ToygerActivity;->Y0(Lcom/idv/identity/face/ui/ToygerActivity;)Ll/wrb;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    invoke-virtual {p1}, Ll/wrb;->a()V

    .line 88
    .line 89
    .line 90
    :cond_0
    iget-object p1, p0, Lcom/idv/identity/face/ui/ToygerActivity$k;->a:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 91
    .line 92
    invoke-virtual {p1}, Lcom/idv/identity/face/ui/ToygerActivity;->s2()V

    .line 93
    .line 94
    .line 95
    iget-object p1, p0, Lcom/idv/identity/face/ui/ToygerActivity$k;->a:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 96
    .line 97
    invoke-static {p1, v1, v1}, Lcom/idv/identity/face/ui/ToygerActivity;->p1(Lcom/idv/identity/face/ui/ToygerActivity;ZZ)V

    .line 98
    .line 99
    .line 100
    invoke-static {}, Ll/wdj0;->I()Ll/wdj0;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    invoke-virtual {p1}, Ll/wdj0;->R()Z

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    if-eqz p1, :cond_1

    .line 109
    .line 110
    iget-object p0, p0, Lcom/idv/identity/face/ui/ToygerActivity$k;->a:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 111
    .line 112
    invoke-static {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->q1(Lcom/idv/identity/face/ui/ToygerActivity;)V

    .line 113
    .line 114
    .line 115
    goto :goto_0

    .line 116
    :pswitch_8
    iget-object p0, p0, Lcom/idv/identity/face/ui/ToygerActivity$k;->a:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 117
    .line 118
    iget p1, p1, Landroid/os/Message;->arg1:I

    .line 119
    .line 120
    invoke-static {p0, p1}, Lcom/idv/identity/face/ui/ToygerActivity;->u1(Lcom/idv/identity/face/ui/ToygerActivity;I)V

    .line 121
    .line 122
    .line 123
    goto :goto_0

    .line 124
    :pswitch_9
    iget-object p0, p0, Lcom/idv/identity/face/ui/ToygerActivity$k;->a:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 125
    .line 126
    iget p1, p1, Landroid/os/Message;->arg1:I

    .line 127
    .line 128
    invoke-static {p0, p1}, Lcom/idv/identity/face/ui/ToygerActivity;->t1(Lcom/idv/identity/face/ui/ToygerActivity;I)V

    .line 129
    .line 130
    .line 131
    goto :goto_0

    .line 132
    :pswitch_a
    iget-object p0, p0, Lcom/idv/identity/face/ui/ToygerActivity$k;->a:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 133
    .line 134
    invoke-static {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->L0(Lcom/idv/identity/face/ui/ToygerActivity;)V

    .line 135
    .line 136
    .line 137
    goto :goto_0

    .line 138
    :pswitch_b
    iget-object p0, p0, Lcom/idv/identity/face/ui/ToygerActivity$k;->a:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 139
    .line 140
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 141
    .line 142
    check-cast p1, Ljava/lang/String;

    .line 143
    .line 144
    invoke-virtual {p0, p1}, Lcom/idv/identity/face/ui/ToygerActivity;->S1(Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    goto :goto_0

    .line 148
    :pswitch_c
    iget-object p0, p0, Lcom/idv/identity/face/ui/ToygerActivity$k;->a:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 149
    .line 150
    invoke-static {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->r1(Lcom/idv/identity/face/ui/ToygerActivity;)V

    .line 151
    .line 152
    .line 153
    goto :goto_0

    .line 154
    :pswitch_d
    iget-object p0, p0, Lcom/idv/identity/face/ui/ToygerActivity$k;->a:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 155
    .line 156
    iget v0, p1, Landroid/os/Message;->arg1:I

    .line 157
    .line 158
    int-to-double v2, v0

    .line 159
    iget p1, p1, Landroid/os/Message;->arg2:I

    .line 160
    .line 161
    int-to-double v4, p1

    .line 162
    invoke-static {p0, v2, v3, v4, v5}, Lcom/idv/identity/face/ui/ToygerActivity;->s1(Lcom/idv/identity/face/ui/ToygerActivity;DD)V

    .line 163
    .line 164
    .line 165
    :cond_1
    :goto_0
    return v1

    .line 166
    nop

    .line 167
    :pswitch_data_0
    .packed-switch 0x385
        :pswitch_d
        :pswitch_c
        :pswitch_b
    .end packed-switch

    .line 168
    .line 169
    .line 170
    .line 171
    .line 172
    .line 173
    .line 174
    .line 175
    .line 176
    .line 177
    :pswitch_data_1
    .packed-switch 0x38e
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
    .end packed-switch

    .line 178
    .line 179
    .line 180
    .line 181
    .line 182
    .line 183
    .line 184
    .line 185
    .line 186
    .line 187
    .line 188
    .line 189
    .line 190
    .line 191
    .line 192
    .line 193
    .line 194
    .line 195
    :pswitch_data_2
    .packed-switch 0x3e9
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
