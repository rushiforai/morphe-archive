.class Lcom/idv/identity/ocr/ui/CardScanActivity$k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/idv/identity/ocr/ui/CardScanActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/idv/identity/ocr/ui/CardScanActivity;


# direct methods
.method public constructor <init>(Lcom/idv/identity/ocr/ui/CardScanActivity;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$k;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

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
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$k;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->L0(Lcom/idv/identity/ocr/ui/CardScanActivity;)I

    .line 4
    .line 5
    .line 6
    iget v0, p1, Landroid/os/Message;->what:I

    .line 7
    .line 8
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$k;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->L0(Lcom/idv/identity/ocr/ui/CardScanActivity;)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v1, 0x0

    .line 15
    if-gez v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$k;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 18
    .line 19
    invoke-static {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->O0(Lcom/idv/identity/ocr/ui/CardScanActivity;)V

    .line 20
    .line 21
    .line 22
    return v1

    .line 23
    :cond_0
    iget v0, p1, Landroid/os/Message;->what:I

    .line 24
    .line 25
    const/16 v2, 0x3ed

    .line 26
    .line 27
    if-ne v2, v0, :cond_1

    .line 28
    .line 29
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$k;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 30
    .line 31
    invoke-static {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->f1(Lcom/idv/identity/ocr/ui/CardScanActivity;)V

    .line 32
    .line 33
    .line 34
    goto/16 :goto_0

    .line 35
    .line 36
    :cond_1
    const/16 v2, 0x3ef

    .line 37
    .line 38
    if-ne v2, v0, :cond_2

    .line 39
    .line 40
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$k;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->w2(Landroid/os/Message;)V

    .line 43
    .line 44
    .line 45
    goto/16 :goto_0

    .line 46
    .line 47
    :cond_2
    const/16 v2, 0x3f0

    .line 48
    .line 49
    if-ne v2, v0, :cond_3

    .line 50
    .line 51
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$k;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 52
    .line 53
    const/4 p1, 0x1

    .line 54
    invoke-virtual {p0, p1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->D2(Z)V

    .line 55
    .line 56
    .line 57
    goto/16 :goto_0

    .line 58
    .line 59
    :cond_3
    const/16 v2, 0x3f1

    .line 60
    .line 61
    if-ne v2, v0, :cond_4

    .line 62
    .line 63
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$k;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 64
    .line 65
    invoke-virtual {p0, v1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->D2(Z)V

    .line 66
    .line 67
    .line 68
    goto/16 :goto_0

    .line 69
    .line 70
    :cond_4
    const/16 v2, 0x3f2

    .line 71
    .line 72
    if-ne v2, v0, :cond_5

    .line 73
    .line 74
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$k;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 75
    .line 76
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->z2()V

    .line 77
    .line 78
    .line 79
    goto/16 :goto_0

    .line 80
    .line 81
    :cond_5
    const/16 v2, 0x3f3

    .line 82
    .line 83
    if-ne v2, v0, :cond_6

    .line 84
    .line 85
    iget-object p1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$k;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 86
    .line 87
    invoke-static {p1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->N0(Lcom/idv/identity/ocr/ui/CardScanActivity;)I

    .line 88
    .line 89
    .line 90
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$k;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 91
    .line 92
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->y2()V

    .line 93
    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_6
    const/16 v2, 0x3f4

    .line 97
    .line 98
    if-ne v2, v0, :cond_7

    .line 99
    .line 100
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$k;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 101
    .line 102
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->B2()V

    .line 103
    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_7
    const/16 v2, 0x3f5

    .line 107
    .line 108
    if-ne v2, v0, :cond_8

    .line 109
    .line 110
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$k;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 111
    .line 112
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->F2()V

    .line 113
    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_8
    const/16 v2, 0x3f7

    .line 117
    .line 118
    if-ne v2, v0, :cond_9

    .line 119
    .line 120
    iget-object p1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$k;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 121
    .line 122
    invoke-static {p1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->N0(Lcom/idv/identity/ocr/ui/CardScanActivity;)I

    .line 123
    .line 124
    .line 125
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$k;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 126
    .line 127
    invoke-static {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->s1(Lcom/idv/identity/ocr/ui/CardScanActivity;)V

    .line 128
    .line 129
    .line 130
    goto :goto_0

    .line 131
    :cond_9
    const/16 v2, 0x3f8

    .line 132
    .line 133
    if-ne v2, v0, :cond_a

    .line 134
    .line 135
    iget-object p1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$k;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 136
    .line 137
    invoke-static {p1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->u1(Lcom/idv/identity/ocr/ui/CardScanActivity;)Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 142
    .line 143
    .line 144
    move-result p1

    .line 145
    if-nez p1, :cond_c

    .line 146
    .line 147
    iget-object p1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$k;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 148
    .line 149
    invoke-static {p1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->N0(Lcom/idv/identity/ocr/ui/CardScanActivity;)I

    .line 150
    .line 151
    .line 152
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$k;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 153
    .line 154
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->E2()V

    .line 155
    .line 156
    .line 157
    goto :goto_0

    .line 158
    :cond_a
    const/16 v2, 0x3f9

    .line 159
    .line 160
    if-ne v2, v0, :cond_b

    .line 161
    .line 162
    iget-object p1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$k;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 163
    .line 164
    invoke-static {p1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->N0(Lcom/idv/identity/ocr/ui/CardScanActivity;)I

    .line 165
    .line 166
    .line 167
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$k;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 168
    .line 169
    invoke-static {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->v1(Lcom/idv/identity/ocr/ui/CardScanActivity;)V

    .line 170
    .line 171
    .line 172
    goto :goto_0

    .line 173
    :cond_b
    const/16 v2, 0x3fa

    .line 174
    .line 175
    if-ne v2, v0, :cond_c

    .line 176
    .line 177
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 178
    .line 179
    if-eqz p1, :cond_c

    .line 180
    .line 181
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity$k;->a:Lcom/idv/identity/ocr/ui/CardScanActivity;

    .line 182
    .line 183
    check-cast p1, Ljava/lang/String;

    .line 184
    .line 185
    invoke-static {p0, p1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->w1(Lcom/idv/identity/ocr/ui/CardScanActivity;Ljava/lang/String;)V

    .line 186
    .line 187
    .line 188
    :cond_c
    :goto_0
    return v1
.end method
