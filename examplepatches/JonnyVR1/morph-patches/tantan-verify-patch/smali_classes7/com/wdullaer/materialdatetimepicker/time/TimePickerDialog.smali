.class public Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;
.super Landroid/app/DialogFragment;
.source "SourceFile"

# interfaces
.implements Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$f;
.implements Lcom/wdullaer/materialdatetimepicker/time/a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$g;,
        Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;,
        Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Version;
    }
.end annotation


# instance fields
.field private A:I

.field private B:Z

.field private C:[Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

.field private D:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

.field private E:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

.field private F:Z

.field private G:Z

.field private H:I

.field private I:Ljava/lang/String;

.field private J:I

.field private K:Ljava/lang/String;

.field private L:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Version;

.field private M:C

.field private N:Ljava/lang/String;

.field private O:Ljava/lang/String;

.field private P:Z

.field private Q:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private R:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;

.field private S:I

.field private T:I

.field private U:Ljava/lang/String;

.field private V:Ljava/lang/String;

.field private W:Ljava/lang/String;

.field private X:Ljava/lang/String;

.field private Y:Ljava/lang/String;

.field private Z:Ljava/lang/String;

.field private a:Landroid/content/DialogInterface$OnCancelListener;

.field private b:Landroid/content/DialogInterface$OnDismissListener;

.field private c:Ll/yxk;

.field private d:Landroid/widget/Button;

.field private e:Landroid/widget/Button;

.field private f:Landroid/widget/TextView;

.field private g:Landroid/widget/TextView;

.field private h:Landroid/widget/TextView;

.field private i:Landroid/widget/TextView;

.field private j:Landroid/widget/TextView;

.field private k:Landroid/widget/TextView;

.field private l:Landroid/widget/TextView;

.field private m:Landroid/widget/TextView;

.field private n:Landroid/view/View;

.field private o:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

.field private p:I

.field private q:I

.field private r:Ljava/lang/String;

.field private s:Ljava/lang/String;

.field private t:Z

.field private u:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

.field private v:Z

.field private w:Ljava/lang/String;

.field private x:Z

.field private y:Z

.field private z:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroid/app/DialogFragment;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->A:I

    .line 6
    .line 7
    return-void
.end method

.method private A()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->R:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->Q:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Ljava/lang/Integer;

    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    invoke-virtual {v0, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;->b(I)Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    const/4 p0, 0x0

    .line 32
    return p0

    .line 33
    :cond_1
    const/4 p0, 0x1

    .line 34
    return p0
.end method

.method private C(I)Z
    .locals 4

    .line 1
    const/16 v0, 0x6f

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eq p1, v0, :cond_e

    .line 5
    .line 6
    const/4 v0, 0x4

    .line 7
    if-ne p1, v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_3

    .line 10
    .line 11
    :cond_0
    const/16 v0, 0x3d

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    if-ne p1, v0, :cond_2

    .line 15
    .line 16
    iget-boolean p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->P:Z

    .line 17
    .line 18
    if-eqz p1, :cond_9

    .line 19
    .line 20
    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->y()Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_1

    .line 25
    .line 26
    invoke-direct {p0, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->q(Z)V

    .line 27
    .line 28
    .line 29
    :cond_1
    return v1

    .line 30
    :cond_2
    const/16 v0, 0x42

    .line 31
    .line 32
    if-ne p1, v0, :cond_5

    .line 33
    .line 34
    iget-boolean p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->P:Z

    .line 35
    .line 36
    if-eqz p1, :cond_4

    .line 37
    .line 38
    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->y()Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-nez p1, :cond_3

    .line 43
    .line 44
    return v1

    .line 45
    :cond_3
    invoke-direct {p0, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->q(Z)V

    .line 46
    .line 47
    .line 48
    :cond_4
    invoke-virtual {p0}, Landroid/app/DialogFragment;->dismiss()V

    .line 49
    .line 50
    .line 51
    return v1

    .line 52
    :cond_5
    const/16 v0, 0x43

    .line 53
    .line 54
    if-ne p1, v0, :cond_8

    .line 55
    .line 56
    iget-boolean p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->P:Z

    .line 57
    .line 58
    if-eqz p1, :cond_9

    .line 59
    .line 60
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->Q:Ljava/util/ArrayList;

    .line 61
    .line 62
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    if-nez p1, :cond_9

    .line 67
    .line 68
    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->p()I

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    invoke-direct {p0, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->s(I)I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-ne p1, v0, :cond_6

    .line 77
    .line 78
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->r:Ljava/lang/String;

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_6
    invoke-direct {p0, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->s(I)I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-ne p1, v0, :cond_7

    .line 86
    .line 87
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->s:Ljava/lang/String;

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_7
    invoke-static {p1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->v(I)I

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    const-string v0, "%d"

    .line 103
    .line 104
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    :goto_0
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .line 109
    .line 110
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->O:Ljava/lang/String;

    .line 111
    .line 112
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    invoke-static {v3, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    invoke-static {v0, p1}, Ll/tnk0;->h(Landroid/view/View;Ljava/lang/CharSequence;)V

    .line 121
    .line 122
    .line 123
    invoke-direct {p0, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->K(Z)V

    .line 124
    .line 125
    .line 126
    goto :goto_1

    .line 127
    :cond_8
    const/4 v0, 0x7

    .line 128
    if-eq p1, v0, :cond_a

    .line 129
    .line 130
    const/16 v0, 0x8

    .line 131
    .line 132
    if-eq p1, v0, :cond_a

    .line 133
    .line 134
    const/16 v0, 0x9

    .line 135
    .line 136
    if-eq p1, v0, :cond_a

    .line 137
    .line 138
    const/16 v0, 0xa

    .line 139
    .line 140
    if-eq p1, v0, :cond_a

    .line 141
    .line 142
    const/16 v0, 0xb

    .line 143
    .line 144
    if-eq p1, v0, :cond_a

    .line 145
    .line 146
    const/16 v0, 0xc

    .line 147
    .line 148
    if-eq p1, v0, :cond_a

    .line 149
    .line 150
    const/16 v0, 0xd

    .line 151
    .line 152
    if-eq p1, v0, :cond_a

    .line 153
    .line 154
    const/16 v0, 0xe

    .line 155
    .line 156
    if-eq p1, v0, :cond_a

    .line 157
    .line 158
    const/16 v0, 0xf

    .line 159
    .line 160
    if-eq p1, v0, :cond_a

    .line 161
    .line 162
    const/16 v0, 0x10

    .line 163
    .line 164
    if-eq p1, v0, :cond_a

    .line 165
    .line 166
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->v:Z

    .line 167
    .line 168
    if-nez v0, :cond_9

    .line 169
    .line 170
    invoke-direct {p0, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->s(I)I

    .line 171
    .line 172
    .line 173
    move-result v0

    .line 174
    if-eq p1, v0, :cond_a

    .line 175
    .line 176
    invoke-direct {p0, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->s(I)I

    .line 177
    .line 178
    .line 179
    move-result v0

    .line 180
    if-ne p1, v0, :cond_9

    .line 181
    .line 182
    goto :goto_2

    .line 183
    :cond_9
    :goto_1
    return v2

    .line 184
    :cond_a
    :goto_2
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->P:Z

    .line 185
    .line 186
    if-nez v0, :cond_c

    .line 187
    .line 188
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .line 189
    .line 190
    if-nez v0, :cond_b

    .line 191
    .line 192
    const-string p0, "TimePickerDialog"

    .line 193
    .line 194
    const-string p1, "Unable to initiate keyboard mode, TimePicker was null."

    .line 195
    .line 196
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 197
    .line 198
    .line 199
    return v1

    .line 200
    :cond_b
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->Q:Ljava/util/ArrayList;

    .line 201
    .line 202
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 203
    .line 204
    .line 205
    invoke-direct {p0, p1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->I(I)V

    .line 206
    .line 207
    .line 208
    return v1

    .line 209
    :cond_c
    invoke-direct {p0, p1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->o(I)Z

    .line 210
    .line 211
    .line 212
    move-result p1

    .line 213
    if-eqz p1, :cond_d

    .line 214
    .line 215
    invoke-direct {p0, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->K(Z)V

    .line 216
    .line 217
    .line 218
    :cond_d
    return v1

    .line 219
    :cond_e
    :goto_3
    invoke-virtual {p0}, Landroid/app/DialogFragment;->isCancelable()Z

    .line 220
    .line 221
    .line 222
    move-result p1

    .line 223
    if-eqz p1, :cond_f

    .line 224
    .line 225
    invoke-virtual {p0}, Landroid/app/DialogFragment;->dismiss()V

    .line 226
    .line 227
    .line 228
    :cond_f
    return v1
.end method

.method private D(Lcom/wdullaer/materialdatetimepicker/time/Timepoint;)Lcom/wdullaer/materialdatetimepicker/time/Timepoint;
    .locals 1

    .line 1
    sget-object v0, Lcom/wdullaer/materialdatetimepicker/time/Timepoint$TYPE;->HOUR:Lcom/wdullaer/materialdatetimepicker/time/Timepoint$TYPE;

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->b(Lcom/wdullaer/materialdatetimepicker/time/Timepoint;Lcom/wdullaer/materialdatetimepicker/time/Timepoint$TYPE;)Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method private E(IZZZ)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->u(IZ)V

    .line 4
    .line 5
    .line 6
    const/4 p2, 0x1

    .line 7
    const-string v0, ": "

    .line 8
    .line 9
    if-eqz p1, :cond_3

    .line 10
    .line 11
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .line 12
    .line 13
    if-eq p1, p2, :cond_1

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getSeconds()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .line 20
    .line 21
    new-instance v3, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 24
    .line 25
    .line 26
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->Y:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v2, v0}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 42
    .line 43
    .line 44
    if-eqz p4, :cond_0

    .line 45
    .line 46
    iget-object p4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .line 47
    .line 48
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->Z:Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {p4, v0}, Ll/tnk0;->h(Landroid/view/View;Ljava/lang/CharSequence;)V

    .line 51
    .line 52
    .line 53
    :cond_0
    iget-object p4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->j:Landroid/widget/TextView;

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    invoke-virtual {v1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getMinutes()I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .line 61
    .line 62
    new-instance v3, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 65
    .line 66
    .line 67
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->W:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {v2, v0}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 83
    .line 84
    .line 85
    if-eqz p4, :cond_2

    .line 86
    .line 87
    iget-object p4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .line 88
    .line 89
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->X:Ljava/lang/String;

    .line 90
    .line 91
    invoke-static {p4, v0}, Ll/tnk0;->h(Landroid/view/View;Ljava/lang/CharSequence;)V

    .line 92
    .line 93
    .line 94
    :cond_2
    iget-object p4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->h:Landroid/widget/TextView;

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_3
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .line 98
    .line 99
    invoke-virtual {v1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getHours()I

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    iget-boolean v2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->v:Z

    .line 104
    .line 105
    if-nez v2, :cond_4

    .line 106
    .line 107
    rem-int/lit8 v1, v1, 0xc

    .line 108
    .line 109
    :cond_4
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .line 110
    .line 111
    new-instance v3, Ljava/lang/StringBuilder;

    .line 112
    .line 113
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 114
    .line 115
    .line 116
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->U:Ljava/lang/String;

    .line 117
    .line 118
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-virtual {v2, v0}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 132
    .line 133
    .line 134
    if-eqz p4, :cond_5

    .line 135
    .line 136
    iget-object p4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .line 137
    .line 138
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->V:Ljava/lang/String;

    .line 139
    .line 140
    invoke-static {p4, v0}, Ll/tnk0;->h(Landroid/view/View;Ljava/lang/CharSequence;)V

    .line 141
    .line 142
    .line 143
    :cond_5
    iget-object p4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->f:Landroid/widget/TextView;

    .line 144
    .line 145
    :goto_0
    if-nez p1, :cond_6

    .line 146
    .line 147
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->p:I

    .line 148
    .line 149
    goto :goto_1

    .line 150
    :cond_6
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->q:I

    .line 151
    .line 152
    :goto_1
    if-ne p1, p2, :cond_7

    .line 153
    .line 154
    iget p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->p:I

    .line 155
    .line 156
    goto :goto_2

    .line 157
    :cond_7
    iget p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->q:I

    .line 158
    .line 159
    :goto_2
    const/4 v1, 0x2

    .line 160
    if-ne p1, v1, :cond_8

    .line 161
    .line 162
    iget p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->p:I

    .line 163
    .line 164
    goto :goto_3

    .line 165
    :cond_8
    iget p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->q:I

    .line 166
    .line 167
    :goto_3
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->f:Landroid/widget/TextView;

    .line 168
    .line 169
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 170
    .line 171
    .line 172
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->h:Landroid/widget/TextView;

    .line 173
    .line 174
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 175
    .line 176
    .line 177
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->j:Landroid/widget/TextView;

    .line 178
    .line 179
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 180
    .line 181
    .line 182
    const p0, 0x3f59999a    # 0.85f

    .line 183
    .line 184
    .line 185
    const p1, 0x3f8ccccd    # 1.1f

    .line 186
    .line 187
    .line 188
    invoke-static {p4, p0, p1}, Ll/tnk0;->d(Landroid/view/View;FF)Landroid/animation/ObjectAnimator;

    .line 189
    .line 190
    .line 191
    move-result-object p0

    .line 192
    if-eqz p3, :cond_9

    .line 193
    .line 194
    const-wide/16 p1, 0x12c

    .line 195
    .line 196
    invoke-virtual {p0, p1, p2}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 197
    .line 198
    .line 199
    :cond_9
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->start()V

    .line 200
    .line 201
    .line 202
    return-void
.end method

.method private F(IZ)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->v:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string v0, "%02d"

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    rem-int/lit8 p1, p1, 0xc

    .line 9
    .line 10
    const-string v0, "%d"

    .line 11
    .line 12
    if-nez p1, :cond_1

    .line 13
    .line 14
    const/16 p1, 0xc

    .line 15
    .line 16
    :cond_1
    :goto_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->f:Landroid/widget/TextView;

    .line 29
    .line 30
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->g:Landroid/widget/TextView;

    .line 34
    .line 35
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    if-eqz p2, :cond_2

    .line 39
    .line 40
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .line 41
    .line 42
    invoke-static {p0, p1}, Ll/tnk0;->h(Landroid/view/View;Ljava/lang/CharSequence;)V

    .line 43
    .line 44
    .line 45
    :cond_2
    return-void
.end method

.method private G(I)V
    .locals 2

    .line 1
    const/16 v0, 0x3c

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    :cond_0
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const-string v1, "%02d"

    .line 19
    .line 20
    invoke-static {v0, v1, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .line 25
    .line 26
    invoke-static {v0, p1}, Ll/tnk0;->h(Landroid/view/View;Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->h:Landroid/widget/TextView;

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->i:Landroid/widget/TextView;

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method private H(I)V
    .locals 2

    .line 1
    const/16 v0, 0x3c

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    :cond_0
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const-string v1, "%02d"

    .line 19
    .line 20
    invoke-static {v0, v1, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .line 25
    .line 26
    invoke-static {v0, p1}, Ll/tnk0;->h(Landroid/view/View;Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->j:Landroid/widget/TextView;

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->k:Landroid/widget/TextView;

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method private I(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->y(Z)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    const/4 v0, -0x1

    .line 11
    if-eq p1, v0, :cond_0

    .line 12
    .line 13
    invoke-direct {p0, p1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->o(I)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    :cond_0
    const/4 p1, 0x1

    .line 20
    iput-boolean p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->P:Z

    .line 21
    .line 22
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->e:Landroid/widget/Button;

    .line 23
    .line 24
    invoke-virtual {p1, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 25
    .line 26
    .line 27
    invoke-direct {p0, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->K(Z)V

    .line 28
    .line 29
    .line 30
    :cond_1
    return-void
.end method

.method private J(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->L:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Version;

    .line 2
    .line 3
    sget-object v1, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Version;->VERSION_2:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Version;

    .line 4
    .line 5
    if-ne v0, v1, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->l:Landroid/widget/TextView;

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    iget p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->p:I

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->m:Landroid/widget/TextView;

    .line 17
    .line 18
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->q:I

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->r:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {p1, p0}, Ll/tnk0;->h(Landroid/view/View;Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    iget p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->q:I

    .line 32
    .line 33
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->m:Landroid/widget/TextView;

    .line 37
    .line 38
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->p:I

    .line 39
    .line 40
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .line 44
    .line 45
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->s:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {p1, p0}, Ll/tnk0;->h(Landroid/view/View;Ljava/lang/CharSequence;)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_1
    if-nez p1, :cond_2

    .line 52
    .line 53
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->m:Landroid/widget/TextView;

    .line 54
    .line 55
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->r:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .line 61
    .line 62
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->r:Ljava/lang/String;

    .line 63
    .line 64
    invoke-static {p1, v0}, Ll/tnk0;->h(Landroid/view/View;Ljava/lang/CharSequence;)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->m:Landroid/widget/TextView;

    .line 68
    .line 69
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->r:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {p1, p0}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_2
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->m:Landroid/widget/TextView;

    .line 76
    .line 77
    const/4 v1, 0x1

    .line 78
    if-ne p1, v1, :cond_3

    .line 79
    .line 80
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->s:Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 83
    .line 84
    .line 85
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .line 86
    .line 87
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->s:Ljava/lang/String;

    .line 88
    .line 89
    invoke-static {p1, v0}, Ll/tnk0;->h(Landroid/view/View;Ljava/lang/CharSequence;)V

    .line 90
    .line 91
    .line 92
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->m:Landroid/widget/TextView;

    .line 93
    .line 94
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->s:Ljava/lang/String;

    .line 95
    .line 96
    invoke-virtual {p1, p0}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    :cond_3
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->N:Ljava/lang/String;

    .line 101
    .line 102
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method private K(Z)V
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    if-nez p1, :cond_2

    .line 4
    .line 5
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->Q:Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_2

    .line 12
    .line 13
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getHours()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .line 20
    .line 21
    invoke-virtual {v2}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getMinutes()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .line 26
    .line 27
    invoke-virtual {v3}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getSeconds()I

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    invoke-direct {p0, p1, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->F(IZ)V

    .line 32
    .line 33
    .line 34
    invoke-direct {p0, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->G(I)V

    .line 35
    .line 36
    .line 37
    invoke-direct {p0, v3}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->H(I)V

    .line 38
    .line 39
    .line 40
    iget-boolean v2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->v:Z

    .line 41
    .line 42
    if-nez v2, :cond_1

    .line 43
    .line 44
    const/16 v2, 0xc

    .line 45
    .line 46
    if-ge p1, v2, :cond_0

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    move v0, v1

    .line 50
    :goto_0
    invoke-direct {p0, v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->J(I)V

    .line 51
    .line 52
    .line 53
    :cond_1
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .line 54
    .line 55
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getCurrentItemShowing()I

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    invoke-direct {p0, p1, v1, v1, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->E(IZZZ)V

    .line 60
    .line 61
    .line 62
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->e:Landroid/widget/Button;

    .line 63
    .line 64
    invoke-virtual {p0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_2
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 69
    .line 70
    filled-new-array {p1, p1, p1}, [Ljava/lang/Boolean;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-direct {p0, p1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->t([Ljava/lang/Boolean;)[I

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    aget-object v3, p1, v0

    .line 79
    .line 80
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 81
    .line 82
    .line 83
    move-result v3

    .line 84
    const-string v4, "%2d"

    .line 85
    .line 86
    const-string v5, "%02d"

    .line 87
    .line 88
    if-eqz v3, :cond_3

    .line 89
    .line 90
    move-object v3, v5

    .line 91
    goto :goto_1

    .line 92
    :cond_3
    move-object v3, v4

    .line 93
    :goto_1
    aget-object v6, p1, v1

    .line 94
    .line 95
    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    .line 96
    .line 97
    .line 98
    move-result v6

    .line 99
    if-eqz v6, :cond_4

    .line 100
    .line 101
    move-object v6, v5

    .line 102
    goto :goto_2

    .line 103
    :cond_4
    move-object v6, v4

    .line 104
    :goto_2
    aget-object p1, p1, v1

    .line 105
    .line 106
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 107
    .line 108
    .line 109
    move-result p1

    .line 110
    if-eqz p1, :cond_5

    .line 111
    .line 112
    move-object v4, v5

    .line 113
    :cond_5
    aget p1, v2, v0

    .line 114
    .line 115
    const/16 v0, 0x20

    .line 116
    .line 117
    const/4 v5, -0x1

    .line 118
    if-ne p1, v5, :cond_6

    .line 119
    .line 120
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->N:Ljava/lang/String;

    .line 121
    .line 122
    goto :goto_3

    .line 123
    :cond_6
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    invoke-static {v3, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    iget-char v3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->M:C

    .line 136
    .line 137
    invoke-virtual {p1, v0, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    :goto_3
    aget v3, v2, v1

    .line 142
    .line 143
    if-ne v3, v5, :cond_7

    .line 144
    .line 145
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->N:Ljava/lang/String;

    .line 146
    .line 147
    goto :goto_4

    .line 148
    :cond_7
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 149
    .line 150
    .line 151
    move-result-object v3

    .line 152
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    move-result-object v3

    .line 156
    invoke-static {v6, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v3

    .line 160
    iget-char v6, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->M:C

    .line 161
    .line 162
    invoke-virtual {v3, v0, v6}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v3

    .line 166
    :goto_4
    const/4 v6, 0x2

    .line 167
    aget v6, v2, v6

    .line 168
    .line 169
    if-ne v6, v5, :cond_8

    .line 170
    .line 171
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->N:Ljava/lang/String;

    .line 172
    .line 173
    goto :goto_5

    .line 174
    :cond_8
    aget v1, v2, v1

    .line 175
    .line 176
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 177
    .line 178
    .line 179
    move-result-object v1

    .line 180
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 181
    .line 182
    .line 183
    move-result-object v1

    .line 184
    invoke-static {v4, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object v1

    .line 188
    iget-char v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->M:C

    .line 189
    .line 190
    invoke-virtual {v1, v0, v4}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    :goto_5
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->f:Landroid/widget/TextView;

    .line 195
    .line 196
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 197
    .line 198
    .line 199
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->g:Landroid/widget/TextView;

    .line 200
    .line 201
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 202
    .line 203
    .line 204
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->f:Landroid/widget/TextView;

    .line 205
    .line 206
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->q:I

    .line 207
    .line 208
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 209
    .line 210
    .line 211
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->h:Landroid/widget/TextView;

    .line 212
    .line 213
    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 214
    .line 215
    .line 216
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->i:Landroid/widget/TextView;

    .line 217
    .line 218
    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 219
    .line 220
    .line 221
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->h:Landroid/widget/TextView;

    .line 222
    .line 223
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->q:I

    .line 224
    .line 225
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 226
    .line 227
    .line 228
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->j:Landroid/widget/TextView;

    .line 229
    .line 230
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 231
    .line 232
    .line 233
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->k:Landroid/widget/TextView;

    .line 234
    .line 235
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 236
    .line 237
    .line 238
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->j:Landroid/widget/TextView;

    .line 239
    .line 240
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->q:I

    .line 241
    .line 242
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 243
    .line 244
    .line 245
    iget-boolean p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->v:Z

    .line 246
    .line 247
    if-nez p1, :cond_9

    .line 248
    .line 249
    const/4 p1, 0x3

    .line 250
    aget p1, v2, p1

    .line 251
    .line 252
    invoke-direct {p0, p1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->J(I)V

    .line 253
    .line 254
    .line 255
    :cond_9
    return-void
.end method

.method public static synthetic i(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;IZZZ)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->E(IZZZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic j(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->P:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic k(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->y()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic l(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->q(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic m(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;)Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic n(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;I)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->C(I)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private o(I)Z
    .locals 5

    .line 1
    const/4 v0, 0x7

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    iget-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->G:Z

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    iget-boolean v2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->F:Z

    .line 11
    .line 12
    if-nez v2, :cond_0

    .line 13
    .line 14
    const/4 v2, 0x4

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v2, 0x6

    .line 17
    :goto_0
    if-nez v1, :cond_1

    .line 18
    .line 19
    iget-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->F:Z

    .line 20
    .line 21
    if-nez v1, :cond_1

    .line 22
    .line 23
    const/4 v2, 0x2

    .line 24
    :cond_1
    iget-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->v:Z

    .line 25
    .line 26
    const/4 v3, 0x0

    .line 27
    if-eqz v1, :cond_2

    .line 28
    .line 29
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->Q:Ljava/util/ArrayList;

    .line 30
    .line 31
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eq v1, v2, :cond_3

    .line 36
    .line 37
    :cond_2
    iget-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->v:Z

    .line 38
    .line 39
    if-nez v1, :cond_4

    .line 40
    .line 41
    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->y()Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_4

    .line 46
    .line 47
    :cond_3
    return v3

    .line 48
    :cond_4
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->Q:Ljava/util/ArrayList;

    .line 49
    .line 50
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->A()Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-nez v1, :cond_5

    .line 62
    .line 63
    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->p()I

    .line 64
    .line 65
    .line 66
    return v3

    .line 67
    :cond_5
    invoke-static {p1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->v(I)I

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .line 72
    .line 73
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    const-string v3, "%d"

    .line 82
    .line 83
    invoke-static {v3, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    invoke-static {v1, p1}, Ll/tnk0;->h(Landroid/view/View;Ljava/lang/CharSequence;)V

    .line 88
    .line 89
    .line 90
    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->y()Z

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    const/4 v1, 0x1

    .line 95
    if-eqz p1, :cond_7

    .line 96
    .line 97
    iget-boolean p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->v:Z

    .line 98
    .line 99
    if-nez p1, :cond_6

    .line 100
    .line 101
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->Q:Ljava/util/ArrayList;

    .line 102
    .line 103
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 104
    .line 105
    .line 106
    move-result p1

    .line 107
    sub-int/2addr v2, v1

    .line 108
    if-gt p1, v2, :cond_6

    .line 109
    .line 110
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->Q:Ljava/util/ArrayList;

    .line 111
    .line 112
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 113
    .line 114
    .line 115
    move-result v2

    .line 116
    sub-int/2addr v2, v1

    .line 117
    invoke-virtual {p1, v2, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 118
    .line 119
    .line 120
    iget-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->Q:Ljava/util/ArrayList;

    .line 121
    .line 122
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 123
    .line 124
    .line 125
    move-result v2

    .line 126
    sub-int/2addr v2, v1

    .line 127
    invoke-virtual {p1, v2, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 128
    .line 129
    .line 130
    :cond_6
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->e:Landroid/widget/Button;

    .line 131
    .line 132
    invoke-virtual {p0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 133
    .line 134
    .line 135
    :cond_7
    return v1
.end method

.method private p()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->Q:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    add-int/lit8 v1, v1, -0x1

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ljava/lang/Integer;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->y()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_0

    .line 24
    .line 25
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->e:Landroid/widget/Button;

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    invoke-virtual {p0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return v0
.end method

.method private q(Z)V
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->P:Z

    .line 3
    .line 4
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->Q:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, 0x1

    .line 11
    if-nez v1, :cond_1

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-direct {p0, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->t([Ljava/lang/Boolean;)[I

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .line 19
    .line 20
    new-instance v4, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 21
    .line 22
    aget v5, v1, v0

    .line 23
    .line 24
    aget v6, v1, v2

    .line 25
    .line 26
    const/4 v7, 0x2

    .line 27
    aget v7, v1, v7

    .line 28
    .line 29
    invoke-direct {v4, v5, v6, v7}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;-><init>(III)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v3, v4}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->setTime(Lcom/wdullaer/materialdatetimepicker/time/Timepoint;)V

    .line 33
    .line 34
    .line 35
    iget-boolean v3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->v:Z

    .line 36
    .line 37
    if-nez v3, :cond_0

    .line 38
    .line 39
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .line 40
    .line 41
    const/4 v4, 0x3

    .line 42
    aget v1, v1, v4

    .line 43
    .line 44
    invoke-virtual {v3, v1}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->setAmOrPm(I)V

    .line 45
    .line 46
    .line 47
    :cond_0
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->Q:Ljava/util/ArrayList;

    .line 48
    .line 49
    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 50
    .line 51
    .line 52
    :cond_1
    if-eqz p1, :cond_2

    .line 53
    .line 54
    invoke-direct {p0, v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->K(Z)V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .line 58
    .line 59
    invoke-virtual {p0, v2}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->y(Z)Z

    .line 60
    .line 61
    .line 62
    :cond_2
    return-void
.end method

.method private r()V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    new-instance v1, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    new-array v3, v2, [I

    .line 7
    .line 8
    invoke-direct {v1, v3}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;-><init>([I)V

    .line 9
    .line 10
    .line 11
    iput-object v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->R:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;

    .line 12
    .line 13
    iget-boolean v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->G:Z

    .line 14
    .line 15
    const/4 v3, 0x7

    .line 16
    const/16 v4, 0x8

    .line 17
    .line 18
    const/16 v5, 0x9

    .line 19
    .line 20
    const/16 v6, 0xa

    .line 21
    .line 22
    if-nez v1, :cond_0

    .line 23
    .line 24
    iget-boolean v7, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->v:Z

    .line 25
    .line 26
    if-eqz v7, :cond_0

    .line 27
    .line 28
    new-instance v1, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;

    .line 29
    .line 30
    filled-new-array {v3, v4}, [I

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-direct {v1, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;-><init>([I)V

    .line 35
    .line 36
    .line 37
    iget-object v2, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->R:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;

    .line 38
    .line 39
    invoke-virtual {v2, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;->a(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;)V

    .line 40
    .line 41
    .line 42
    new-instance v2, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;

    .line 43
    .line 44
    new-array v7, v6, [I

    .line 45
    .line 46
    fill-array-data v7, :array_0

    .line 47
    .line 48
    .line 49
    invoke-direct {v2, v7}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;-><init>([I)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;->a(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;)V

    .line 53
    .line 54
    .line 55
    new-instance v1, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;

    .line 56
    .line 57
    filled-new-array {v5}, [I

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-direct {v1, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;-><init>([I)V

    .line 62
    .line 63
    .line 64
    iget-object v0, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->R:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;

    .line 65
    .line 66
    invoke-virtual {v0, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;->a(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;)V

    .line 67
    .line 68
    .line 69
    new-instance v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;

    .line 70
    .line 71
    filled-new-array {v3, v4, v5, v6}, [I

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-direct {v0, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;-><init>([I)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v1, v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;->a(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;)V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :cond_0
    const/4 v7, 0x1

    .line 83
    if-nez v1, :cond_1

    .line 84
    .line 85
    iget-boolean v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->v:Z

    .line 86
    .line 87
    if-nez v1, :cond_1

    .line 88
    .line 89
    new-instance v1, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;

    .line 90
    .line 91
    invoke-direct {v0, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->s(I)I

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    invoke-direct {v0, v7}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->s(I)I

    .line 96
    .line 97
    .line 98
    move-result v6

    .line 99
    filled-new-array {v2, v6}, [I

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    invoke-direct {v1, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;-><init>([I)V

    .line 104
    .line 105
    .line 106
    new-instance v2, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;

    .line 107
    .line 108
    filled-new-array {v4}, [I

    .line 109
    .line 110
    .line 111
    move-result-object v6

    .line 112
    invoke-direct {v2, v6}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;-><init>([I)V

    .line 113
    .line 114
    .line 115
    iget-object v6, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->R:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;

    .line 116
    .line 117
    invoke-virtual {v6, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;->a(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v2, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;->a(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;)V

    .line 121
    .line 122
    .line 123
    new-instance v6, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;

    .line 124
    .line 125
    filled-new-array {v3, v4, v5}, [I

    .line 126
    .line 127
    .line 128
    move-result-object v3

    .line 129
    invoke-direct {v6, v3}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;-><init>([I)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {v2, v6}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;->a(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v6, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;->a(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;)V

    .line 136
    .line 137
    .line 138
    new-instance v2, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;

    .line 139
    .line 140
    new-array v3, v4, [I

    .line 141
    .line 142
    fill-array-data v3, :array_1

    .line 143
    .line 144
    .line 145
    invoke-direct {v2, v3}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;-><init>([I)V

    .line 146
    .line 147
    .line 148
    iget-object v0, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->R:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;

    .line 149
    .line 150
    invoke-virtual {v0, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;->a(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v2, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;->a(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;)V

    .line 154
    .line 155
    .line 156
    return-void

    .line 157
    :cond_1
    iget-boolean v1, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->v:Z

    .line 158
    .line 159
    const/4 v8, 0x6

    .line 160
    const/16 v10, 0xc

    .line 161
    .line 162
    const/16 v11, 0xd

    .line 163
    .line 164
    const/16 v12, 0xe

    .line 165
    .line 166
    const/16 v13, 0xf

    .line 167
    .line 168
    const/16 v14, 0x10

    .line 169
    .line 170
    if-eqz v1, :cond_3

    .line 171
    .line 172
    new-instance v1, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;

    .line 173
    .line 174
    new-array v2, v8, [I

    .line 175
    .line 176
    fill-array-data v2, :array_2

    .line 177
    .line 178
    .line 179
    invoke-direct {v1, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;-><init>([I)V

    .line 180
    .line 181
    .line 182
    new-instance v2, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;

    .line 183
    .line 184
    new-array v7, v6, [I

    .line 185
    .line 186
    fill-array-data v7, :array_3

    .line 187
    .line 188
    .line 189
    invoke-direct {v2, v7}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;-><init>([I)V

    .line 190
    .line 191
    .line 192
    invoke-virtual {v1, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;->a(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;)V

    .line 193
    .line 194
    .line 195
    iget-boolean v7, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->F:Z

    .line 196
    .line 197
    if-eqz v7, :cond_2

    .line 198
    .line 199
    new-instance v7, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;

    .line 200
    .line 201
    new-array v15, v8, [I

    .line 202
    .line 203
    fill-array-data v15, :array_4

    .line 204
    .line 205
    .line 206
    invoke-direct {v7, v15}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;-><init>([I)V

    .line 207
    .line 208
    .line 209
    new-instance v15, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;

    .line 210
    .line 211
    new-array v9, v6, [I

    .line 212
    .line 213
    fill-array-data v9, :array_5

    .line 214
    .line 215
    .line 216
    invoke-direct {v15, v9}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;-><init>([I)V

    .line 217
    .line 218
    .line 219
    invoke-virtual {v7, v15}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;->a(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;)V

    .line 220
    .line 221
    .line 222
    invoke-virtual {v2, v7}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;->a(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;)V

    .line 223
    .line 224
    .line 225
    :cond_2
    new-instance v7, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;

    .line 226
    .line 227
    filled-new-array {v3, v4}, [I

    .line 228
    .line 229
    .line 230
    move-result-object v9

    .line 231
    invoke-direct {v7, v9}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;-><init>([I)V

    .line 232
    .line 233
    .line 234
    iget-object v9, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->R:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;

    .line 235
    .line 236
    invoke-virtual {v9, v7}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;->a(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;)V

    .line 237
    .line 238
    .line 239
    new-instance v9, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;

    .line 240
    .line 241
    new-array v8, v8, [I

    .line 242
    .line 243
    fill-array-data v8, :array_6

    .line 244
    .line 245
    .line 246
    invoke-direct {v9, v8}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;-><init>([I)V

    .line 247
    .line 248
    .line 249
    invoke-virtual {v7, v9}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;->a(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;)V

    .line 250
    .line 251
    .line 252
    invoke-virtual {v9, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;->a(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;)V

    .line 253
    .line 254
    .line 255
    new-instance v8, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;

    .line 256
    .line 257
    filled-new-array {v11, v12, v13, v14}, [I

    .line 258
    .line 259
    .line 260
    move-result-object v15

    .line 261
    invoke-direct {v8, v15}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;-><init>([I)V

    .line 262
    .line 263
    .line 264
    invoke-virtual {v9, v8}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;->a(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;)V

    .line 265
    .line 266
    .line 267
    new-instance v8, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;

    .line 268
    .line 269
    filled-new-array {v11, v12, v13, v14}, [I

    .line 270
    .line 271
    .line 272
    move-result-object v9

    .line 273
    invoke-direct {v8, v9}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;-><init>([I)V

    .line 274
    .line 275
    .line 276
    invoke-virtual {v7, v8}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;->a(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;)V

    .line 277
    .line 278
    .line 279
    invoke-virtual {v8, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;->a(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;)V

    .line 280
    .line 281
    .line 282
    new-instance v7, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;

    .line 283
    .line 284
    filled-new-array {v5}, [I

    .line 285
    .line 286
    .line 287
    move-result-object v8

    .line 288
    invoke-direct {v7, v8}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;-><init>([I)V

    .line 289
    .line 290
    .line 291
    iget-object v8, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->R:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;

    .line 292
    .line 293
    invoke-virtual {v8, v7}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;->a(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;)V

    .line 294
    .line 295
    .line 296
    new-instance v8, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;

    .line 297
    .line 298
    filled-new-array {v3, v4, v5, v6}, [I

    .line 299
    .line 300
    .line 301
    move-result-object v4

    .line 302
    invoke-direct {v8, v4}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;-><init>([I)V

    .line 303
    .line 304
    .line 305
    invoke-virtual {v7, v8}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;->a(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;)V

    .line 306
    .line 307
    .line 308
    invoke-virtual {v8, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;->a(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;)V

    .line 309
    .line 310
    .line 311
    new-instance v4, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;

    .line 312
    .line 313
    const/16 v5, 0xb

    .line 314
    .line 315
    filled-new-array {v5, v10}, [I

    .line 316
    .line 317
    .line 318
    move-result-object v5

    .line 319
    invoke-direct {v4, v5}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;-><init>([I)V

    .line 320
    .line 321
    .line 322
    invoke-virtual {v7, v4}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;->a(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;)V

    .line 323
    .line 324
    .line 325
    invoke-virtual {v4, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;->a(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;)V

    .line 326
    .line 327
    .line 328
    new-instance v2, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;

    .line 329
    .line 330
    new-array v3, v3, [I

    .line 331
    .line 332
    fill-array-data v3, :array_7

    .line 333
    .line 334
    .line 335
    invoke-direct {v2, v3}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;-><init>([I)V

    .line 336
    .line 337
    .line 338
    iget-object v0, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->R:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;

    .line 339
    .line 340
    invoke-virtual {v0, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;->a(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;)V

    .line 341
    .line 342
    .line 343
    invoke-virtual {v2, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;->a(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;)V

    .line 344
    .line 345
    .line 346
    return-void

    .line 347
    :cond_3
    new-instance v1, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;

    .line 348
    .line 349
    invoke-direct {v0, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->s(I)I

    .line 350
    .line 351
    .line 352
    move-result v2

    .line 353
    invoke-direct {v0, v7}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->s(I)I

    .line 354
    .line 355
    .line 356
    move-result v7

    .line 357
    filled-new-array {v2, v7}, [I

    .line 358
    .line 359
    .line 360
    move-result-object v2

    .line 361
    invoke-direct {v1, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;-><init>([I)V

    .line 362
    .line 363
    .line 364
    new-instance v2, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;

    .line 365
    .line 366
    new-array v7, v8, [I

    .line 367
    .line 368
    fill-array-data v7, :array_8

    .line 369
    .line 370
    .line 371
    invoke-direct {v2, v7}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;-><init>([I)V

    .line 372
    .line 373
    .line 374
    new-instance v7, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;

    .line 375
    .line 376
    new-array v9, v6, [I

    .line 377
    .line 378
    fill-array-data v9, :array_9

    .line 379
    .line 380
    .line 381
    invoke-direct {v7, v9}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;-><init>([I)V

    .line 382
    .line 383
    .line 384
    invoke-virtual {v7, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;->a(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;)V

    .line 385
    .line 386
    .line 387
    invoke-virtual {v2, v7}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;->a(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;)V

    .line 388
    .line 389
    .line 390
    new-instance v7, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;

    .line 391
    .line 392
    filled-new-array {v4}, [I

    .line 393
    .line 394
    .line 395
    move-result-object v9

    .line 396
    invoke-direct {v7, v9}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;-><init>([I)V

    .line 397
    .line 398
    .line 399
    iget-object v9, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->R:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;

    .line 400
    .line 401
    invoke-virtual {v9, v7}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;->a(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;)V

    .line 402
    .line 403
    .line 404
    invoke-virtual {v7, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;->a(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;)V

    .line 405
    .line 406
    .line 407
    new-instance v9, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;

    .line 408
    .line 409
    filled-new-array {v3, v4, v5}, [I

    .line 410
    .line 411
    .line 412
    move-result-object v3

    .line 413
    invoke-direct {v9, v3}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;-><init>([I)V

    .line 414
    .line 415
    .line 416
    invoke-virtual {v7, v9}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;->a(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;)V

    .line 417
    .line 418
    .line 419
    invoke-virtual {v9, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;->a(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;)V

    .line 420
    .line 421
    .line 422
    new-instance v3, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;

    .line 423
    .line 424
    new-array v5, v8, [I

    .line 425
    .line 426
    fill-array-data v5, :array_a

    .line 427
    .line 428
    .line 429
    invoke-direct {v3, v5}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;-><init>([I)V

    .line 430
    .line 431
    .line 432
    invoke-virtual {v9, v3}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;->a(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;)V

    .line 433
    .line 434
    .line 435
    invoke-virtual {v3, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;->a(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;)V

    .line 436
    .line 437
    .line 438
    new-instance v5, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;

    .line 439
    .line 440
    new-array v15, v6, [I

    .line 441
    .line 442
    fill-array-data v15, :array_b

    .line 443
    .line 444
    .line 445
    invoke-direct {v5, v15}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;-><init>([I)V

    .line 446
    .line 447
    .line 448
    invoke-virtual {v3, v5}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;->a(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;)V

    .line 449
    .line 450
    .line 451
    invoke-virtual {v5, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;->a(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;)V

    .line 452
    .line 453
    .line 454
    iget-boolean v3, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->F:Z

    .line 455
    .line 456
    if-eqz v3, :cond_4

    .line 457
    .line 458
    invoke-virtual {v5, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;->a(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;)V

    .line 459
    .line 460
    .line 461
    :cond_4
    new-instance v3, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;

    .line 462
    .line 463
    filled-new-array {v11, v12, v13, v14}, [I

    .line 464
    .line 465
    .line 466
    move-result-object v5

    .line 467
    invoke-direct {v3, v5}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;-><init>([I)V

    .line 468
    .line 469
    .line 470
    invoke-virtual {v9, v3}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;->a(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;)V

    .line 471
    .line 472
    .line 473
    invoke-virtual {v3, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;->a(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;)V

    .line 474
    .line 475
    .line 476
    iget-boolean v5, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->F:Z

    .line 477
    .line 478
    if-eqz v5, :cond_5

    .line 479
    .line 480
    invoke-virtual {v3, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;->a(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;)V

    .line 481
    .line 482
    .line 483
    :cond_5
    new-instance v3, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;

    .line 484
    .line 485
    const/16 v5, 0xb

    .line 486
    .line 487
    filled-new-array {v6, v5, v10}, [I

    .line 488
    .line 489
    .line 490
    move-result-object v5

    .line 491
    invoke-direct {v3, v5}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;-><init>([I)V

    .line 492
    .line 493
    .line 494
    invoke-virtual {v7, v3}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;->a(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;)V

    .line 495
    .line 496
    .line 497
    new-instance v5, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;

    .line 498
    .line 499
    new-array v7, v6, [I

    .line 500
    .line 501
    fill-array-data v7, :array_c

    .line 502
    .line 503
    .line 504
    invoke-direct {v5, v7}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;-><init>([I)V

    .line 505
    .line 506
    .line 507
    invoke-virtual {v3, v5}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;->a(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;)V

    .line 508
    .line 509
    .line 510
    invoke-virtual {v5, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;->a(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;)V

    .line 511
    .line 512
    .line 513
    iget-boolean v3, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->F:Z

    .line 514
    .line 515
    if-eqz v3, :cond_6

    .line 516
    .line 517
    invoke-virtual {v5, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;->a(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;)V

    .line 518
    .line 519
    .line 520
    :cond_6
    new-instance v3, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;

    .line 521
    .line 522
    new-array v4, v4, [I

    .line 523
    .line 524
    fill-array-data v4, :array_d

    .line 525
    .line 526
    .line 527
    invoke-direct {v3, v4}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;-><init>([I)V

    .line 528
    .line 529
    .line 530
    iget-object v4, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->R:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;

    .line 531
    .line 532
    invoke-virtual {v4, v3}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;->a(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;)V

    .line 533
    .line 534
    .line 535
    invoke-virtual {v3, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;->a(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;)V

    .line 536
    .line 537
    .line 538
    new-instance v4, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;

    .line 539
    .line 540
    new-array v5, v8, [I

    .line 541
    .line 542
    fill-array-data v5, :array_e

    .line 543
    .line 544
    .line 545
    invoke-direct {v4, v5}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;-><init>([I)V

    .line 546
    .line 547
    .line 548
    invoke-virtual {v3, v4}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;->a(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;)V

    .line 549
    .line 550
    .line 551
    new-instance v3, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;

    .line 552
    .line 553
    new-array v5, v6, [I

    .line 554
    .line 555
    fill-array-data v5, :array_f

    .line 556
    .line 557
    .line 558
    invoke-direct {v3, v5}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;-><init>([I)V

    .line 559
    .line 560
    .line 561
    invoke-virtual {v4, v3}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;->a(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;)V

    .line 562
    .line 563
    .line 564
    invoke-virtual {v3, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;->a(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;)V

    .line 565
    .line 566
    .line 567
    iget-boolean v0, v0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->F:Z

    .line 568
    .line 569
    if-eqz v0, :cond_7

    .line 570
    .line 571
    invoke-virtual {v3, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;->a(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$h;)V

    .line 572
    .line 573
    .line 574
    :cond_7
    return-void

    .line 575
    :array_0
    .array-data 4
        0x7
        0x8
        0x9
        0xa
        0xb
        0xc
        0xd
        0xe
        0xf
        0x10
    .end array-data

    .line 576
    .line 577
    .line 578
    .line 579
    .line 580
    .line 581
    .line 582
    .line 583
    .line 584
    .line 585
    .line 586
    .line 587
    .line 588
    .line 589
    .line 590
    .line 591
    .line 592
    .line 593
    .line 594
    .line 595
    .line 596
    .line 597
    .line 598
    .line 599
    :array_1
    .array-data 4
        0x9
        0xa
        0xb
        0xc
        0xd
        0xe
        0xf
        0x10
    .end array-data

    .line 600
    .line 601
    .line 602
    .line 603
    .line 604
    .line 605
    .line 606
    .line 607
    .line 608
    .line 609
    .line 610
    .line 611
    .line 612
    .line 613
    .line 614
    .line 615
    .line 616
    .line 617
    .line 618
    .line 619
    :array_2
    .array-data 4
        0x7
        0x8
        0x9
        0xa
        0xb
        0xc
    .end array-data

    .line 620
    .line 621
    .line 622
    .line 623
    .line 624
    .line 625
    .line 626
    .line 627
    .line 628
    .line 629
    .line 630
    .line 631
    .line 632
    .line 633
    .line 634
    .line 635
    :array_3
    .array-data 4
        0x7
        0x8
        0x9
        0xa
        0xb
        0xc
        0xd
        0xe
        0xf
        0x10
    .end array-data

    .line 636
    .line 637
    .line 638
    .line 639
    .line 640
    .line 641
    .line 642
    .line 643
    .line 644
    .line 645
    .line 646
    .line 647
    .line 648
    .line 649
    .line 650
    .line 651
    .line 652
    .line 653
    .line 654
    .line 655
    .line 656
    .line 657
    .line 658
    .line 659
    :array_4
    .array-data 4
        0x7
        0x8
        0x9
        0xa
        0xb
        0xc
    .end array-data

    .line 660
    .line 661
    .line 662
    .line 663
    .line 664
    .line 665
    .line 666
    .line 667
    .line 668
    .line 669
    .line 670
    .line 671
    .line 672
    .line 673
    .line 674
    .line 675
    :array_5
    .array-data 4
        0x7
        0x8
        0x9
        0xa
        0xb
        0xc
        0xd
        0xe
        0xf
        0x10
    .end array-data

    .line 676
    .line 677
    .line 678
    .line 679
    .line 680
    .line 681
    .line 682
    .line 683
    .line 684
    .line 685
    .line 686
    .line 687
    .line 688
    .line 689
    .line 690
    .line 691
    .line 692
    .line 693
    .line 694
    .line 695
    .line 696
    .line 697
    .line 698
    .line 699
    :array_6
    .array-data 4
        0x7
        0x8
        0x9
        0xa
        0xb
        0xc
    .end array-data

    .line 700
    .line 701
    .line 702
    .line 703
    .line 704
    .line 705
    .line 706
    .line 707
    .line 708
    .line 709
    .line 710
    .line 711
    .line 712
    .line 713
    .line 714
    .line 715
    :array_7
    .array-data 4
        0xa
        0xb
        0xc
        0xd
        0xe
        0xf
        0x10
    .end array-data

    .line 716
    .line 717
    .line 718
    .line 719
    .line 720
    .line 721
    .line 722
    .line 723
    .line 724
    .line 725
    .line 726
    .line 727
    .line 728
    .line 729
    .line 730
    .line 731
    .line 732
    .line 733
    :array_8
    .array-data 4
        0x7
        0x8
        0x9
        0xa
        0xb
        0xc
    .end array-data

    .line 734
    .line 735
    .line 736
    .line 737
    .line 738
    .line 739
    .line 740
    .line 741
    .line 742
    .line 743
    .line 744
    .line 745
    .line 746
    .line 747
    .line 748
    .line 749
    :array_9
    .array-data 4
        0x7
        0x8
        0x9
        0xa
        0xb
        0xc
        0xd
        0xe
        0xf
        0x10
    .end array-data

    .line 750
    .line 751
    .line 752
    .line 753
    .line 754
    .line 755
    .line 756
    .line 757
    .line 758
    .line 759
    .line 760
    .line 761
    .line 762
    .line 763
    .line 764
    .line 765
    .line 766
    .line 767
    .line 768
    .line 769
    .line 770
    .line 771
    .line 772
    .line 773
    :array_a
    .array-data 4
        0x7
        0x8
        0x9
        0xa
        0xb
        0xc
    .end array-data

    .line 774
    .line 775
    .line 776
    .line 777
    .line 778
    .line 779
    .line 780
    .line 781
    .line 782
    .line 783
    .line 784
    .line 785
    .line 786
    .line 787
    .line 788
    .line 789
    :array_b
    .array-data 4
        0x7
        0x8
        0x9
        0xa
        0xb
        0xc
        0xd
        0xe
        0xf
        0x10
    .end array-data

    .line 790
    .line 791
    .line 792
    .line 793
    .line 794
    .line 795
    .line 796
    .line 797
    .line 798
    .line 799
    .line 800
    .line 801
    .line 802
    .line 803
    .line 804
    .line 805
    .line 806
    .line 807
    .line 808
    .line 809
    .line 810
    .line 811
    .line 812
    .line 813
    :array_c
    .array-data 4
        0x7
        0x8
        0x9
        0xa
        0xb
        0xc
        0xd
        0xe
        0xf
        0x10
    .end array-data

    .line 814
    .line 815
    .line 816
    .line 817
    .line 818
    .line 819
    .line 820
    .line 821
    .line 822
    .line 823
    .line 824
    .line 825
    .line 826
    .line 827
    .line 828
    .line 829
    .line 830
    .line 831
    .line 832
    .line 833
    .line 834
    .line 835
    .line 836
    .line 837
    :array_d
    .array-data 4
        0x9
        0xa
        0xb
        0xc
        0xd
        0xe
        0xf
        0x10
    .end array-data

    .line 838
    .line 839
    .line 840
    .line 841
    .line 842
    .line 843
    .line 844
    .line 845
    .line 846
    .line 847
    .line 848
    .line 849
    .line 850
    .line 851
    .line 852
    .line 853
    .line 854
    .line 855
    .line 856
    .line 857
    :array_e
    .array-data 4
        0x7
        0x8
        0x9
        0xa
        0xb
        0xc
    .end array-data

    .line 858
    .line 859
    .line 860
    .line 861
    .line 862
    .line 863
    .line 864
    .line 865
    .line 866
    .line 867
    .line 868
    .line 869
    .line 870
    .line 871
    .line 872
    .line 873
    :array_f
    .array-data 4
        0x7
        0x8
        0x9
        0xa
        0xb
        0xc
        0xd
        0xe
        0xf
        0x10
    .end array-data
.end method

.method private s(I)I
    .locals 8

    .line 1
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->S:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, -0x1

    .line 5
    if-eq v0, v2, :cond_0

    .line 6
    .line 7
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->T:I

    .line 8
    .line 9
    if-ne v0, v2, :cond_3

    .line 10
    .line 11
    :cond_0
    invoke-static {v2}, Landroid/view/KeyCharacterMap;->load(I)Landroid/view/KeyCharacterMap;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v3, 0x0

    .line 16
    move v4, v3

    .line 17
    :goto_0
    iget-object v5, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->r:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    .line 20
    .line 21
    .line 22
    move-result v5

    .line 23
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->s:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    .line 26
    .line 27
    .line 28
    move-result v6

    .line 29
    invoke-static {v5, v6}, Ljava/lang/Math;->max(II)I

    .line 30
    .line 31
    .line 32
    move-result v5

    .line 33
    if-ge v4, v5, :cond_3

    .line 34
    .line 35
    iget-object v5, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->r:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 38
    .line 39
    .line 40
    move-result-object v6

    .line 41
    invoke-virtual {v5, v6}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v5

    .line 45
    invoke-virtual {v5, v4}, Ljava/lang/String;->charAt(I)C

    .line 46
    .line 47
    .line 48
    move-result v5

    .line 49
    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->s:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 52
    .line 53
    .line 54
    move-result-object v7

    .line 55
    invoke-virtual {v6, v7}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v6

    .line 59
    invoke-virtual {v6, v4}, Ljava/lang/String;->charAt(I)C

    .line 60
    .line 61
    .line 62
    move-result v6

    .line 63
    if-eq v5, v6, :cond_2

    .line 64
    .line 65
    const/4 v4, 0x2

    .line 66
    new-array v7, v4, [C

    .line 67
    .line 68
    aput-char v5, v7, v3

    .line 69
    .line 70
    aput-char v6, v7, v1

    .line 71
    .line 72
    invoke-virtual {v0, v7}, Landroid/view/KeyCharacterMap;->getEvents([C)[Landroid/view/KeyEvent;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    if-eqz v0, :cond_1

    .line 77
    .line 78
    array-length v5, v0

    .line 79
    const/4 v6, 0x4

    .line 80
    if-ne v5, v6, :cond_1

    .line 81
    .line 82
    aget-object v3, v0, v3

    .line 83
    .line 84
    invoke-virtual {v3}, Landroid/view/KeyEvent;->getKeyCode()I

    .line 85
    .line 86
    .line 87
    move-result v3

    .line 88
    iput v3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->S:I

    .line 89
    .line 90
    aget-object v0, v0, v4

    .line 91
    .line 92
    invoke-virtual {v0}, Landroid/view/KeyEvent;->getKeyCode()I

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->T:I

    .line 97
    .line 98
    goto :goto_1

    .line 99
    :cond_1
    const-string v0, "TimePickerDialog"

    .line 100
    .line 101
    const-string v3, "Unable to find keycodes for AM and PM."

    .line 102
    .line 103
    invoke-static {v0, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 104
    .line 105
    .line 106
    goto :goto_1

    .line 107
    :cond_2
    add-int/lit8 v4, v4, 0x1

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_3
    :goto_1
    if-nez p1, :cond_4

    .line 111
    .line 112
    iget p0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->S:I

    .line 113
    .line 114
    return p0

    .line 115
    :cond_4
    if-ne p1, v1, :cond_5

    .line 116
    .line 117
    iget p0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->T:I

    .line 118
    .line 119
    return p0

    .line 120
    :cond_5
    return v2
.end method

.method private t([Ljava/lang/Boolean;)[I
    .locals 13

    .line 1
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->v:Z

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    const/4 v2, 0x0

    .line 5
    const/4 v3, -0x1

    .line 6
    const/4 v4, 0x1

    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->y()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->Q:Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 18
    .line 19
    .line 20
    move-result v5

    .line 21
    sub-int/2addr v5, v4

    .line 22
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Ljava/lang/Integer;

    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    invoke-direct {p0, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->s(I)I

    .line 33
    .line 34
    .line 35
    move-result v5

    .line 36
    if-ne v0, v5, :cond_0

    .line 37
    .line 38
    move v0, v2

    .line 39
    goto :goto_0

    .line 40
    :cond_0
    invoke-direct {p0, v4}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->s(I)I

    .line 41
    .line 42
    .line 43
    move-result v5

    .line 44
    if-ne v0, v5, :cond_1

    .line 45
    .line 46
    move v0, v4

    .line 47
    goto :goto_0

    .line 48
    :cond_1
    move v0, v3

    .line 49
    :goto_0
    move v5, v1

    .line 50
    goto :goto_1

    .line 51
    :cond_2
    move v0, v3

    .line 52
    move v5, v4

    .line 53
    :goto_1
    iget-boolean v6, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->F:Z

    .line 54
    .line 55
    if-eqz v6, :cond_3

    .line 56
    .line 57
    move v6, v1

    .line 58
    goto :goto_2

    .line 59
    :cond_3
    move v6, v2

    .line 60
    :goto_2
    move v9, v2

    .line 61
    move v7, v3

    .line 62
    move v8, v5

    .line 63
    :goto_3
    iget-object v10, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->Q:Ljava/util/ArrayList;

    .line 64
    .line 65
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    .line 66
    .line 67
    .line 68
    move-result v10

    .line 69
    if-gt v8, v10, :cond_c

    .line 70
    .line 71
    iget-object v10, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->Q:Ljava/util/ArrayList;

    .line 72
    .line 73
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    .line 74
    .line 75
    .line 76
    move-result v11

    .line 77
    sub-int/2addr v11, v8

    .line 78
    invoke-virtual {v10, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v10

    .line 82
    check-cast v10, Ljava/lang/Integer;

    .line 83
    .line 84
    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    .line 85
    .line 86
    .line 87
    move-result v10

    .line 88
    invoke-static {v10}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->v(I)I

    .line 89
    .line 90
    .line 91
    move-result v10

    .line 92
    iget-boolean v11, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->F:Z

    .line 93
    .line 94
    if-eqz v11, :cond_5

    .line 95
    .line 96
    if-ne v8, v5, :cond_4

    .line 97
    .line 98
    move v9, v10

    .line 99
    goto :goto_4

    .line 100
    :cond_4
    add-int/lit8 v11, v5, 0x1

    .line 101
    .line 102
    if-ne v8, v11, :cond_5

    .line 103
    .line 104
    mul-int/lit8 v11, v10, 0xa

    .line 105
    .line 106
    add-int/2addr v9, v11

    .line 107
    if-eqz p1, :cond_5

    .line 108
    .line 109
    if-nez v10, :cond_5

    .line 110
    .line 111
    sget-object v11, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 112
    .line 113
    aput-object v11, p1, v1

    .line 114
    .line 115
    :cond_5
    :goto_4
    iget-boolean v11, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->G:Z

    .line 116
    .line 117
    if-eqz v11, :cond_9

    .line 118
    .line 119
    add-int v11, v5, v6

    .line 120
    .line 121
    if-ne v8, v11, :cond_6

    .line 122
    .line 123
    move v7, v10

    .line 124
    goto :goto_6

    .line 125
    :cond_6
    add-int/lit8 v12, v11, 0x1

    .line 126
    .line 127
    if-ne v8, v12, :cond_7

    .line 128
    .line 129
    mul-int/lit8 v11, v10, 0xa

    .line 130
    .line 131
    add-int/2addr v7, v11

    .line 132
    if-eqz p1, :cond_b

    .line 133
    .line 134
    if-nez v10, :cond_b

    .line 135
    .line 136
    sget-object v10, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 137
    .line 138
    aput-object v10, p1, v4

    .line 139
    .line 140
    goto :goto_6

    .line 141
    :cond_7
    add-int/lit8 v12, v11, 0x2

    .line 142
    .line 143
    if-ne v8, v12, :cond_8

    .line 144
    .line 145
    goto :goto_5

    .line 146
    :cond_8
    add-int/lit8 v11, v11, 0x3

    .line 147
    .line 148
    if-ne v8, v11, :cond_b

    .line 149
    .line 150
    mul-int/lit8 v11, v10, 0xa

    .line 151
    .line 152
    add-int/2addr v3, v11

    .line 153
    if-eqz p1, :cond_b

    .line 154
    .line 155
    if-nez v10, :cond_b

    .line 156
    .line 157
    sget-object v10, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 158
    .line 159
    aput-object v10, p1, v2

    .line 160
    .line 161
    goto :goto_6

    .line 162
    :cond_9
    add-int v11, v5, v6

    .line 163
    .line 164
    if-ne v8, v11, :cond_a

    .line 165
    .line 166
    :goto_5
    move v3, v10

    .line 167
    goto :goto_6

    .line 168
    :cond_a
    add-int/lit8 v11, v11, 0x1

    .line 169
    .line 170
    if-ne v8, v11, :cond_b

    .line 171
    .line 172
    mul-int/lit8 v11, v10, 0xa

    .line 173
    .line 174
    add-int/2addr v3, v11

    .line 175
    if-eqz p1, :cond_b

    .line 176
    .line 177
    if-nez v10, :cond_b

    .line 178
    .line 179
    sget-object v10, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 180
    .line 181
    aput-object v10, p1, v2

    .line 182
    .line 183
    :cond_b
    :goto_6
    add-int/lit8 v8, v8, 0x1

    .line 184
    .line 185
    goto :goto_3

    .line 186
    :cond_c
    filled-new-array {v3, v7, v9, v0}, [I

    .line 187
    .line 188
    .line 189
    move-result-object p0

    .line 190
    return-object p0
.end method

.method private static v(I)I
    .locals 0

    .line 1
    packed-switch p0, :pswitch_data_0

    const/4 p0, -0x1

    return p0

    :pswitch_0
    const/16 p0, 0x9

    return p0

    :pswitch_1
    const/16 p0, 0x8

    return p0

    :pswitch_2
    const/4 p0, 0x7

    return p0

    :pswitch_3
    const/4 p0, 0x6

    return p0

    :pswitch_4
    const/4 p0, 0x5

    return p0

    :pswitch_5
    const/4 p0, 0x4

    return p0

    :pswitch_6
    const/4 p0, 0x3

    return p0

    :pswitch_7
    const/4 p0, 0x2

    return p0

    :pswitch_8
    const/4 p0, 0x1

    return p0

    :pswitch_9
    const/4 p0, 0x0

    return p0

    nop

    :pswitch_data_0
    .packed-switch 0x7
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

.method private y()Z
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->v:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-direct {p0, v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->t([Ljava/lang/Boolean;)[I

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    aget v0, p0, v2

    .line 13
    .line 14
    if-ltz v0, :cond_0

    .line 15
    .line 16
    aget v0, p0, v1

    .line 17
    .line 18
    if-ltz v0, :cond_0

    .line 19
    .line 20
    const/16 v3, 0x3c

    .line 21
    .line 22
    if-ge v0, v3, :cond_0

    .line 23
    .line 24
    const/4 v0, 0x2

    .line 25
    aget p0, p0, v0

    .line 26
    .line 27
    if-ltz p0, :cond_0

    .line 28
    .line 29
    if-ge p0, v3, :cond_0

    .line 30
    .line 31
    return v1

    .line 32
    :cond_0
    return v2

    .line 33
    :cond_1
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->Q:Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-direct {p0, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->s(I)I

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_3

    .line 48
    .line 49
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->Q:Ljava/util/ArrayList;

    .line 50
    .line 51
    invoke-direct {p0, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->s(I)I

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    if-eqz p0, :cond_2

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_2
    return v2

    .line 67
    :cond_3
    :goto_0
    return v1
.end method


# virtual methods
.method public B()V
    .locals 0

    .line 1
    return-void
.end method

.method public a()Z
    .locals 6

    .line 1
    new-instance v0, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 2
    .line 3
    const/16 v1, 0xc

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;-><init>(I)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->D:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 9
    .line 10
    const/4 v2, 0x1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->a(Lcom/wdullaer/materialdatetimepicker/time/Timepoint;)I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-lez v1, :cond_0

    .line 18
    .line 19
    return v2

    .line 20
    :cond_0
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->C:[Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    if-eqz p0, :cond_3

    .line 24
    .line 25
    array-length v3, p0

    .line 26
    move v4, v1

    .line 27
    :goto_0
    if-ge v4, v3, :cond_2

    .line 28
    .line 29
    aget-object v5, p0, v4

    .line 30
    .line 31
    invoke-virtual {v5, v0}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->a(Lcom/wdullaer/materialdatetimepicker/time/Timepoint;)I

    .line 32
    .line 33
    .line 34
    move-result v5

    .line 35
    if-gez v5, :cond_1

    .line 36
    .line 37
    return v1

    .line 38
    :cond_1
    add-int/lit8 v4, v4, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_2
    return v2

    .line 42
    :cond_3
    return v1
.end method

.method public b(Lcom/wdullaer/materialdatetimepicker/time/Timepoint;Lcom/wdullaer/materialdatetimepicker/time/Timepoint$TYPE;)Lcom/wdullaer/materialdatetimepicker/time/Timepoint;
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->D:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->a(Lcom/wdullaer/materialdatetimepicker/time/Timepoint;)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->D:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->E:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->a(Lcom/wdullaer/materialdatetimepicker/time/Timepoint;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-gez v0, :cond_1

    .line 23
    .line 24
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->E:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_1
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->C:[Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 28
    .line 29
    if-eqz p0, :cond_5

    .line 30
    .line 31
    array-length v0, p0

    .line 32
    const v1, 0x7fffffff

    .line 33
    .line 34
    .line 35
    const/4 v2, 0x0

    .line 36
    move-object v3, p1

    .line 37
    :goto_0
    if-ge v2, v0, :cond_4

    .line 38
    .line 39
    aget-object v4, p0, v2

    .line 40
    .line 41
    sget-object v5, Lcom/wdullaer/materialdatetimepicker/time/Timepoint$TYPE;->MINUTE:Lcom/wdullaer/materialdatetimepicker/time/Timepoint$TYPE;

    .line 42
    .line 43
    if-ne p2, v5, :cond_2

    .line 44
    .line 45
    invoke-virtual {v4}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->b()I

    .line 46
    .line 47
    .line 48
    move-result v5

    .line 49
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->b()I

    .line 50
    .line 51
    .line 52
    move-result v6

    .line 53
    if-eq v5, v6, :cond_2

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_2
    sget-object v5, Lcom/wdullaer/materialdatetimepicker/time/Timepoint$TYPE;->SECOND:Lcom/wdullaer/materialdatetimepicker/time/Timepoint$TYPE;

    .line 57
    .line 58
    if-ne p2, v5, :cond_3

    .line 59
    .line 60
    invoke-virtual {v4}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->b()I

    .line 61
    .line 62
    .line 63
    move-result v5

    .line 64
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->b()I

    .line 65
    .line 66
    .line 67
    move-result v6

    .line 68
    if-eq v5, v6, :cond_3

    .line 69
    .line 70
    invoke-virtual {v4}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->f()I

    .line 71
    .line 72
    .line 73
    move-result v5

    .line 74
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->f()I

    .line 75
    .line 76
    .line 77
    move-result v6

    .line 78
    if-eq v5, v6, :cond_3

    .line 79
    .line 80
    goto :goto_1

    .line 81
    :cond_3
    invoke-virtual {v4, p1}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->a(Lcom/wdullaer/materialdatetimepicker/time/Timepoint;)I

    .line 82
    .line 83
    .line 84
    move-result v5

    .line 85
    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    .line 86
    .line 87
    .line 88
    move-result v5

    .line 89
    if-ge v5, v1, :cond_4

    .line 90
    .line 91
    move-object v3, v4

    .line 92
    move v1, v5

    .line 93
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_4
    return-object v3

    .line 97
    :cond_5
    return-object p1
.end method

.method public c(Lcom/wdullaer/materialdatetimepicker/time/Timepoint;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->b()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-direct {p0, v0, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->F(IZ)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .line 10
    .line 11
    new-instance v1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->U:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v2, ": "

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->b()I

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v0, v1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->f()I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    invoke-direct {p0, v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->G(I)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .line 48
    .line 49
    new-instance v1, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 52
    .line 53
    .line 54
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->W:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->f()I

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-virtual {v0, v1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->g()I

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    invoke-direct {p0, v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->H(I)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .line 84
    .line 85
    new-instance v1, Ljava/lang/StringBuilder;

    .line 86
    .line 87
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 88
    .line 89
    .line 90
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->Y:Ljava/lang/String;

    .line 91
    .line 92
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->g()I

    .line 99
    .line 100
    .line 101
    move-result v2

    .line 102
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    invoke-virtual {v0, v1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 110
    .line 111
    .line 112
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->v:Z

    .line 113
    .line 114
    if-nez v0, :cond_0

    .line 115
    .line 116
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->h()Z

    .line 117
    .line 118
    .line 119
    move-result p1

    .line 120
    xor-int/lit8 p1, p1, 0x1

    .line 121
    .line 122
    invoke-direct {p0, p1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->J(I)V

    .line 123
    .line 124
    .line 125
    :cond_0
    return-void
.end method

.method public d()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->y()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->Q:Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 10
    .line 11
    .line 12
    :cond_0
    const/4 v0, 0x1

    .line 13
    invoke-direct {p0, v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->q(Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public e(I)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->t:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-string v0, ". "

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    const/4 v2, 0x1

    .line 10
    if-nez p1, :cond_1

    .line 11
    .line 12
    iget-boolean v3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->G:Z

    .line 13
    .line 14
    if-eqz v3, :cond_1

    .line 15
    .line 16
    invoke-direct {p0, v2, v2, v2, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->E(IZZZ)V

    .line 17
    .line 18
    .line 19
    new-instance p1, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->V:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getMinutes()I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .line 46
    .line 47
    invoke-static {p0, p1}, Ll/tnk0;->h(Landroid/view/View;Ljava/lang/CharSequence;)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_1
    if-ne p1, v2, :cond_2

    .line 52
    .line 53
    iget-boolean p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->F:Z

    .line 54
    .line 55
    if-eqz p1, :cond_2

    .line 56
    .line 57
    const/4 p1, 0x2

    .line 58
    invoke-direct {p0, p1, v2, v2, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->E(IZZZ)V

    .line 59
    .line 60
    .line 61
    new-instance p1, Ljava/lang/StringBuilder;

    .line 62
    .line 63
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 64
    .line 65
    .line 66
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->X:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .line 75
    .line 76
    invoke-virtual {v0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getSeconds()I

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .line 88
    .line 89
    invoke-static {p0, p1}, Ll/tnk0;->h(Landroid/view/View;Ljava/lang/CharSequence;)V

    .line 90
    .line 91
    .line 92
    :cond_2
    :goto_0
    return-void
.end method

.method public f()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->v:Z

    .line 2
    .line 3
    return p0
.end method

.method public g()Z
    .locals 6

    .line 1
    new-instance v0, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 2
    .line 3
    const/16 v1, 0xc

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;-><init>(I)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->E:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 9
    .line 10
    const/4 v2, 0x1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->a(Lcom/wdullaer/materialdatetimepicker/time/Timepoint;)I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-gez v1, :cond_0

    .line 18
    .line 19
    return v2

    .line 20
    :cond_0
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->C:[Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    if-eqz p0, :cond_3

    .line 24
    .line 25
    array-length v3, p0

    .line 26
    move v4, v1

    .line 27
    :goto_0
    if-ge v4, v3, :cond_2

    .line 28
    .line 29
    aget-object v5, p0, v4

    .line 30
    .line 31
    invoke-virtual {v5, v0}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->a(Lcom/wdullaer/materialdatetimepicker/time/Timepoint;)I

    .line 32
    .line 33
    .line 34
    move-result v5

    .line 35
    if-ltz v5, :cond_1

    .line 36
    .line 37
    return v1

    .line 38
    :cond_1
    add-int/lit8 v4, v4, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_2
    return v2

    .line 42
    :cond_3
    return v1
.end method

.method public getVersion()Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Version;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->L:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Version;

    .line 2
    .line 3
    return-object p0
.end method

.method public h(Lcom/wdullaer/materialdatetimepicker/time/Timepoint;I)Z
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 v1, 0x1

    .line 6
    if-nez p2, :cond_6

    .line 7
    .line 8
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->D:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 9
    .line 10
    if-eqz p2, :cond_1

    .line 11
    .line 12
    invoke-virtual {p2}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->b()I

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->b()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-le p2, v2, :cond_1

    .line 21
    .line 22
    return v1

    .line 23
    :cond_1
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->E:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 24
    .line 25
    if-eqz p2, :cond_2

    .line 26
    .line 27
    invoke-virtual {p2}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->b()I

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    add-int/2addr p2, v1

    .line 32
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->b()I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-gt p2, v2, :cond_2

    .line 37
    .line 38
    return v1

    .line 39
    :cond_2
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->C:[Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 40
    .line 41
    if-eqz p0, :cond_5

    .line 42
    .line 43
    array-length p2, p0

    .line 44
    move v2, v0

    .line 45
    :goto_0
    if-ge v2, p2, :cond_4

    .line 46
    .line 47
    aget-object v3, p0, v2

    .line 48
    .line 49
    invoke-virtual {v3}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->b()I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->b()I

    .line 54
    .line 55
    .line 56
    move-result v4

    .line 57
    if-ne v3, v4, :cond_3

    .line 58
    .line 59
    return v0

    .line 60
    :cond_3
    add-int/lit8 v2, v2, 0x1

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_4
    return v1

    .line 64
    :cond_5
    return v0

    .line 65
    :cond_6
    if-ne p2, v1, :cond_c

    .line 66
    .line 67
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->D:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 68
    .line 69
    if-eqz p2, :cond_7

    .line 70
    .line 71
    new-instance p2, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 72
    .line 73
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->D:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 74
    .line 75
    invoke-virtual {v2}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->b()I

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->D:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 80
    .line 81
    invoke-virtual {v3}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->f()I

    .line 82
    .line 83
    .line 84
    move-result v3

    .line 85
    invoke-direct {p2, v2, v3}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;-><init>(II)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p2, p1}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->a(Lcom/wdullaer/materialdatetimepicker/time/Timepoint;)I

    .line 89
    .line 90
    .line 91
    move-result p2

    .line 92
    if-lez p2, :cond_7

    .line 93
    .line 94
    return v1

    .line 95
    :cond_7
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->E:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 96
    .line 97
    if-eqz p2, :cond_8

    .line 98
    .line 99
    new-instance p2, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 100
    .line 101
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->E:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 102
    .line 103
    invoke-virtual {v2}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->b()I

    .line 104
    .line 105
    .line 106
    move-result v2

    .line 107
    iget-object v3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->E:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 108
    .line 109
    invoke-virtual {v3}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->f()I

    .line 110
    .line 111
    .line 112
    move-result v3

    .line 113
    const/16 v4, 0x3b

    .line 114
    .line 115
    invoke-direct {p2, v2, v3, v4}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;-><init>(III)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p2, p1}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->a(Lcom/wdullaer/materialdatetimepicker/time/Timepoint;)I

    .line 119
    .line 120
    .line 121
    move-result p2

    .line 122
    if-gez p2, :cond_8

    .line 123
    .line 124
    return v1

    .line 125
    :cond_8
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->C:[Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 126
    .line 127
    if-eqz p0, :cond_b

    .line 128
    .line 129
    array-length p2, p0

    .line 130
    move v2, v0

    .line 131
    :goto_1
    if-ge v2, p2, :cond_a

    .line 132
    .line 133
    aget-object v3, p0, v2

    .line 134
    .line 135
    invoke-virtual {v3}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->b()I

    .line 136
    .line 137
    .line 138
    move-result v4

    .line 139
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->b()I

    .line 140
    .line 141
    .line 142
    move-result v5

    .line 143
    if-ne v4, v5, :cond_9

    .line 144
    .line 145
    invoke-virtual {v3}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->f()I

    .line 146
    .line 147
    .line 148
    move-result v3

    .line 149
    invoke-virtual {p1}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->f()I

    .line 150
    .line 151
    .line 152
    move-result v4

    .line 153
    if-ne v3, v4, :cond_9

    .line 154
    .line 155
    return v0

    .line 156
    :cond_9
    add-int/lit8 v2, v2, 0x1

    .line 157
    .line 158
    goto :goto_1

    .line 159
    :cond_a
    return v1

    .line 160
    :cond_b
    return v0

    .line 161
    :cond_c
    invoke-virtual {p0, p1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->x(Lcom/wdullaer/materialdatetimepicker/time/Timepoint;)Z

    .line 162
    .line 163
    .line 164
    move-result p0

    .line 165
    return p0
.end method

.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/app/DialogFragment;->onCancel(Landroid/content/DialogInterface;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->a:Landroid/content/DialogInterface$OnCancelListener;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0, p1}, Landroid/content/DialogInterface$OnCancelListener;->onCancel(Landroid/content/DialogInterface;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/app/Fragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Fragment;->getView()Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Landroid/view/ViewGroup;

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViewsInLayout()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-virtual {p0, v0, p1, v1}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Landroid/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    const-string v0, "initial_time"

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    const-string v1, "is_24_hour_view"

    .line 15
    .line 16
    invoke-virtual {p1, v1}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 27
    .line 28
    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->u:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 29
    .line 30
    invoke-virtual {p1, v1}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    iput-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->v:Z

    .line 35
    .line 36
    const-string v0, "in_kb_mode"

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->P:Z

    .line 43
    .line 44
    const-string v0, "dialog_title"

    .line 45
    .line 46
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->w:Ljava/lang/String;

    .line 51
    .line 52
    const-string v0, "theme_dark"

    .line 53
    .line 54
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    iput-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->x:Z

    .line 59
    .line 60
    const-string v0, "theme_dark_changed"

    .line 61
    .line 62
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    iput-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->y:Z

    .line 67
    .line 68
    const-string v0, "accent"

    .line 69
    .line 70
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->A:I

    .line 75
    .line 76
    const-string v0, "vibrate"

    .line 77
    .line 78
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    iput-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->z:Z

    .line 83
    .line 84
    const-string v0, "dismiss"

    .line 85
    .line 86
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    iput-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->B:Z

    .line 91
    .line 92
    const-string v0, "selectable_times"

    .line 93
    .line 94
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelableArray(Ljava/lang/String;)[Landroid/os/Parcelable;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    check-cast v0, [Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 99
    .line 100
    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->C:[Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 101
    .line 102
    const-string v0, "min_time"

    .line 103
    .line 104
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    check-cast v0, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 109
    .line 110
    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->D:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 111
    .line 112
    const-string v0, "max_time"

    .line 113
    .line 114
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    check-cast v0, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 119
    .line 120
    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->E:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 121
    .line 122
    const-string v0, "enable_seconds"

    .line 123
    .line 124
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    iput-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->F:Z

    .line 129
    .line 130
    const-string v0, "enable_minutes"

    .line 131
    .line 132
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    iput-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->G:Z

    .line 137
    .line 138
    const-string v0, "ok_resid"

    .line 139
    .line 140
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->H:I

    .line 145
    .line 146
    const-string v0, "ok_string"

    .line 147
    .line 148
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->I:Ljava/lang/String;

    .line 153
    .line 154
    const-string v0, "cancel_resid"

    .line 155
    .line 156
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 157
    .line 158
    .line 159
    move-result v0

    .line 160
    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->J:I

    .line 161
    .line 162
    const-string v0, "cancel_string"

    .line 163
    .line 164
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    iput-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->K:Ljava/lang/String;

    .line 169
    .line 170
    const-string v0, "version"

    .line 171
    .line 172
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    check-cast p1, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Version;

    .line 177
    .line 178
    iput-object p1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->L:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Version;

    .line 179
    .line 180
    :cond_0
    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/app/DialogFragment;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, 0x1

    .line 6
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->requestWindowFeature(I)Z

    .line 7
    .line 8
    .line 9
    return-object p0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->L:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Version;

    sget-object v1, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Version;->VERSION_1:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Version;

    if-ne v0, v1, :cond_0

    .line 2
    sget v0, Ll/cfc0;->c:I

    goto :goto_0

    .line 3
    :cond_0
    sget v0, Ll/cfc0;->d:I

    :goto_0
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 5
    new-instance p2, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$g;

    const/4 v0, 0x0

    invoke-direct {p2, p0, v0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$g;-><init>(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$a;)V

    .line 6
    sget v0, Ll/qdc0;->z:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 7
    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->A:I

    const/4 v2, -0x1

    if-ne v0, v2, :cond_1

    .line 8
    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Ll/tnk0;->c(Landroid/content/Context;)I

    move-result v0

    iput v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->A:I

    .line 9
    :cond_1
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->y:Z

    if-nez v0, :cond_2

    .line 10
    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-boolean v3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->x:Z

    invoke-static {v0, v3}, Ll/tnk0;->e(Landroid/content/Context;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->x:Z

    .line 11
    :cond_2
    invoke-virtual {p0}, Landroid/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 12
    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    .line 13
    sget v4, Lcom/wdullaer/materialdatetimepicker/R$string;->h:I

    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->U:Ljava/lang/String;

    .line 14
    sget v4, Lcom/wdullaer/materialdatetimepicker/R$string;->s:I

    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->V:Ljava/lang/String;

    .line 15
    sget v4, Lcom/wdullaer/materialdatetimepicker/R$string;->j:I

    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->W:Ljava/lang/String;

    .line 16
    sget v4, Lcom/wdullaer/materialdatetimepicker/R$string;->t:I

    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->X:Ljava/lang/String;

    .line 17
    sget v4, Lcom/wdullaer/materialdatetimepicker/R$string;->q:I

    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->Y:Ljava/lang/String;

    .line 18
    sget v4, Lcom/wdullaer/materialdatetimepicker/R$string;->u:I

    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->Z:Ljava/lang/String;

    .line 19
    sget v4, Ll/q9c0;->u:I

    invoke-static {v3, v4}, Ll/j26;->c(Landroid/content/Context;I)I

    move-result v4

    iput v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->p:I

    .line 20
    sget v4, Ll/q9c0;->b:I

    invoke-static {v3, v4}, Ll/j26;->c(Landroid/content/Context;I)I

    move-result v4

    iput v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->q:I

    .line 21
    sget v4, Ll/qdc0;->n:I

    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->f:Landroid/widget/TextView;

    .line 22
    invoke-virtual {v4, p2}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 23
    sget v4, Ll/qdc0;->m:I

    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->g:Landroid/widget/TextView;

    .line 24
    sget v4, Ll/qdc0;->p:I

    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->i:Landroid/widget/TextView;

    .line 25
    sget v4, Ll/qdc0;->o:I

    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->h:Landroid/widget/TextView;

    .line 26
    invoke-virtual {v4, p2}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 27
    sget v4, Ll/qdc0;->t:I

    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->k:Landroid/widget/TextView;

    .line 28
    sget v4, Ll/qdc0;->s:I

    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->j:Landroid/widget/TextView;

    .line 29
    invoke-virtual {v4, p2}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 30
    sget v4, Ll/qdc0;->a:I

    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->l:Landroid/widget/TextView;

    .line 31
    invoke-virtual {v4, p2}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 32
    sget v4, Ll/qdc0;->r:I

    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->m:Landroid/widget/TextView;

    .line 33
    invoke-virtual {v4, p2}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 34
    sget v4, Ll/qdc0;->b:I

    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    iput-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->n:Landroid/view/View;

    .line 35
    new-instance v4, Ljava/text/DateFormatSymbols;

    invoke-direct {v4}, Ljava/text/DateFormatSymbols;-><init>()V

    invoke-virtual {v4}, Ljava/text/DateFormatSymbols;->getAmPmStrings()[Ljava/lang/String;

    move-result-object v4

    .line 36
    aget-object v5, v4, v1

    iput-object v5, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->r:Ljava/lang/String;

    const/4 v5, 0x1

    .line 37
    aget-object v4, v4, v5

    iput-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->s:Ljava/lang/String;

    .line 38
    new-instance v4, Ll/yxk;

    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v6

    invoke-direct {v4, v6}, Ll/yxk;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->c:Ll/yxk;

    .line 39
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    if-eqz v4, :cond_3

    .line 40
    new-instance v4, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .line 41
    invoke-virtual {v6}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getHours()I

    move-result v6

    iget-object v7, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    invoke-virtual {v7}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getMinutes()I

    move-result v7

    iget-object v8, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    invoke-virtual {v8}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getSeconds()I

    move-result v8

    invoke-direct {v4, v6, v7, v8}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;-><init>(III)V

    iput-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->u:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 42
    :cond_3
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->u:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    invoke-direct {p0, v4}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->D(Lcom/wdullaer/materialdatetimepicker/time/Timepoint;)Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    move-result-object v4

    iput-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->u:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 43
    sget v4, Ll/qdc0;->y:I

    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    iput-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .line 44
    invoke-virtual {v4, p0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->setOnValueSelectedListener(Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout$f;)V

    .line 45
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    invoke-virtual {v4, p2}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 46
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v6

    iget-object v7, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->u:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    iget-boolean v8, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->v:Z

    invoke-virtual {v4, v6, p0, v7, v8}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->p(Landroid/content/Context;Lcom/wdullaer/materialdatetimepicker/time/a;Lcom/wdullaer/materialdatetimepicker/time/Timepoint;Z)V

    if-eqz p3, :cond_4

    .line 47
    const-string v4, "current_item_showing"

    invoke-virtual {p3, v4}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 48
    invoke-virtual {p3, v4}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    move-result v4

    goto :goto_1

    :cond_4
    move v4, v1

    .line 49
    :goto_1
    invoke-direct {p0, v4, v1, v5, v5}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->E(IZZZ)V

    .line 50
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    invoke-virtual {v4}, Landroid/view/View;->invalidate()V

    .line 51
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->f:Landroid/widget/TextView;

    new-instance v6, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$a;

    invoke-direct {v6, p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$a;-><init>(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;)V

    invoke-virtual {v4, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 52
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->h:Landroid/widget/TextView;

    new-instance v6, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$b;

    invoke-direct {v6, p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$b;-><init>(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;)V

    invoke-virtual {v4, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 53
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->j:Landroid/widget/TextView;

    new-instance v6, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$c;

    invoke-direct {v6, p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$c;-><init>(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;)V

    invoke-virtual {v4, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 54
    sget v4, Ll/qdc0;->q:I

    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/Button;

    iput-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->e:Landroid/widget/Button;

    .line 55
    new-instance v6, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$d;

    invoke-direct {v6, p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$d;-><init>(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;)V

    invoke-virtual {v4, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 56
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->e:Landroid/widget/Button;

    invoke-virtual {v4, p2}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 57
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->e:Landroid/widget/Button;

    invoke-static {}, Ll/na00;->a()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ll/ooj0;->a(Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v4

    invoke-virtual {p2, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 58
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->I:Ljava/lang/String;

    .line 59
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->e:Landroid/widget/Button;

    if-eqz p2, :cond_5

    .line 60
    invoke-virtual {v4, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_2

    .line 61
    :cond_5
    iget p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->H:I

    invoke-virtual {v4, p2}, Landroid/widget/TextView;->setText(I)V

    .line 62
    :goto_2
    sget p2, Ll/qdc0;->d:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/Button;

    iput-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->d:Landroid/widget/Button;

    .line 63
    new-instance v4, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$e;

    invoke-direct {v4, p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$e;-><init>(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;)V

    invoke-virtual {p2, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 64
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->d:Landroid/widget/Button;

    invoke-static {}, Ll/na00;->a()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ll/ooj0;->a(Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v4

    invoke-virtual {p2, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 65
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->K:Ljava/lang/String;

    .line 66
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->d:Landroid/widget/Button;

    if-eqz p2, :cond_6

    .line 67
    invoke-virtual {v4, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_3

    .line 68
    :cond_6
    iget p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->J:I

    invoke-virtual {v4, p2}, Landroid/widget/TextView;->setText(I)V

    .line 69
    :goto_3
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->d:Landroid/widget/Button;

    invoke-virtual {p0}, Landroid/app/DialogFragment;->isCancelable()Z

    move-result v4

    const/16 v6, 0x8

    if-eqz v4, :cond_7

    move v4, v1

    goto :goto_4

    :cond_7
    move v4, v6

    :goto_4
    invoke-virtual {p2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 70
    iget-boolean p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->v:Z

    if-eqz p2, :cond_8

    .line 71
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->n:Landroid/view/View;

    invoke-virtual {p2, v6}, Landroid/view/View;->setVisibility(I)V

    goto :goto_5

    .line 72
    :cond_8
    new-instance p2, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$f;

    invoke-direct {p2, p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$f;-><init>(Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;)V

    .line 73
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->l:Landroid/widget/TextView;

    invoke-virtual {v4, v6}, Landroid/view/View;->setVisibility(I)V

    .line 74
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->m:Landroid/widget/TextView;

    invoke-virtual {v4, v1}, Landroid/view/View;->setVisibility(I)V

    .line 75
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->n:Landroid/view/View;

    invoke-virtual {v4, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 76
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->L:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Version;

    sget-object v4, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Version;->VERSION_2:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Version;

    if-ne p2, v4, :cond_9

    .line 77
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->l:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->r:Ljava/lang/String;

    invoke-virtual {p2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 78
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->m:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->s:Ljava/lang/String;

    invoke-virtual {p2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 79
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->l:Landroid/widget/TextView;

    invoke-virtual {p2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 80
    :cond_9
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->u:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    invoke-virtual {p2}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->h()Z

    move-result p2

    xor-int/2addr p2, v5

    invoke-direct {p0, p2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->J(I)V

    .line 81
    :goto_5
    iget-boolean p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->F:Z

    if-nez p2, :cond_a

    .line 82
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->j:Landroid/widget/TextView;

    invoke-virtual {p2, v6}, Landroid/view/View;->setVisibility(I)V

    .line 83
    sget p2, Ll/qdc0;->v:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    invoke-virtual {p2, v6}, Landroid/view/View;->setVisibility(I)V

    .line 84
    :cond_a
    iget-boolean p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->G:Z

    if-nez p2, :cond_b

    .line 85
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->i:Landroid/widget/TextView;

    invoke-virtual {p2, v6}, Landroid/view/View;->setVisibility(I)V

    .line 86
    sget p2, Ll/qdc0;->u:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    invoke-virtual {p2, v6}, Landroid/view/View;->setVisibility(I)V

    .line 87
    :cond_b
    invoke-virtual {p0}, Landroid/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p2

    iget p2, p2, Landroid/content/res/Configuration;->orientation:I

    const/16 v4, 0xd

    const/4 v7, 0x2

    const/4 v8, -0x2

    if-ne p2, v7, :cond_10

    .line 88
    iget-boolean p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->G:Z

    const/16 v9, 0xe

    if-nez p2, :cond_c

    iget-boolean p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->F:Z

    if-nez p2, :cond_c

    .line 89
    new-instance p2, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {p2, v8, v8}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 90
    sget v4, Ll/qdc0;->e:I

    invoke-virtual {p2, v7, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 91
    invoke-virtual {p2, v9}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 92
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->g:Landroid/widget/TextView;

    invoke-virtual {v4, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 93
    iget-boolean p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->v:Z

    if-eqz p2, :cond_14

    .line 94
    new-instance p2, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {p2, v8, v8}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 95
    sget v4, Ll/qdc0;->m:I

    invoke-virtual {p2, v5, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 96
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->n:Landroid/view/View;

    invoke-virtual {v4, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto/16 :goto_6

    .line 97
    :cond_c
    iget-boolean p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->F:Z

    if-nez p2, :cond_d

    iget-boolean v10, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->v:Z

    if-eqz v10, :cond_d

    .line 98
    new-instance p2, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {p2, v8, v8}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 99
    invoke-virtual {p2, v9}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 100
    sget v4, Ll/qdc0;->e:I

    invoke-virtual {p2, v7, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 101
    sget v4, Ll/qdc0;->u:I

    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 102
    invoke-virtual {v4, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto/16 :goto_6

    :cond_d
    const/4 v10, 0x3

    if-nez p2, :cond_e

    .line 103
    new-instance p2, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {p2, v8, v8}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 104
    invoke-virtual {p2, v9}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 105
    sget v9, Ll/qdc0;->e:I

    invoke-virtual {p2, v7, v9}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 106
    sget v7, Ll/qdc0;->u:I

    invoke-virtual {p1, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    .line 107
    invoke-virtual {v7, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 108
    new-instance p2, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {p2, v8, v8}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 109
    invoke-virtual {p2, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 110
    sget v4, Ll/qdc0;->e:I

    invoke-virtual {p2, v10, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 111
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->n:Landroid/view/View;

    invoke-virtual {v4, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto/16 :goto_6

    .line 112
    :cond_e
    iget-boolean p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->v:Z

    if-eqz p2, :cond_f

    .line 113
    new-instance p2, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {p2, v8, v8}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 114
    invoke-virtual {p2, v9}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 115
    sget v9, Ll/qdc0;->t:I

    invoke-virtual {p2, v7, v9}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 116
    sget v7, Ll/qdc0;->u:I

    invoke-virtual {p1, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    .line 117
    invoke-virtual {v7, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 118
    new-instance p2, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {p2, v8, v8}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 119
    invoke-virtual {p2, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 120
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->k:Landroid/widget/TextView;

    invoke-virtual {v4, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto/16 :goto_6

    .line 121
    :cond_f
    new-instance p2, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {p2, v8, v8}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 122
    invoke-virtual {p2, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 123
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->k:Landroid/widget/TextView;

    invoke-virtual {v4, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 124
    new-instance p2, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {p2, v8, v8}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 125
    invoke-virtual {p2, v9}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 126
    sget v4, Ll/qdc0;->t:I

    invoke-virtual {p2, v7, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 127
    sget v4, Ll/qdc0;->u:I

    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 128
    invoke-virtual {v4, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 129
    new-instance p2, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {p2, v8, v8}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 130
    invoke-virtual {p2, v9}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 131
    sget v4, Ll/qdc0;->t:I

    invoke-virtual {p2, v10, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 132
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->n:Landroid/view/View;

    invoke-virtual {v4, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto/16 :goto_6

    .line 133
    :cond_10
    iget-boolean p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->v:Z

    if-eqz p2, :cond_11

    iget-boolean p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->F:Z

    if-nez p2, :cond_11

    iget-boolean p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->G:Z

    if-eqz p2, :cond_11

    .line 134
    new-instance p2, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {p2, v8, v8}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 135
    invoke-virtual {p2, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 136
    sget v4, Ll/qdc0;->u:I

    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 137
    invoke-virtual {v4, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_6

    .line 138
    :cond_11
    iget-boolean p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->G:Z

    if-nez p2, :cond_12

    iget-boolean p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->F:Z

    if-nez p2, :cond_12

    .line 139
    new-instance p2, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {p2, v8, v8}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 140
    invoke-virtual {p2, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 141
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->g:Landroid/widget/TextView;

    invoke-virtual {v4, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 142
    iget-boolean p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->v:Z

    if-nez p2, :cond_14

    .line 143
    new-instance p2, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {p2, v8, v8}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 144
    sget v4, Ll/qdc0;->m:I

    invoke-virtual {p2, v5, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    const/4 v4, 0x4

    .line 145
    sget v7, Ll/qdc0;->m:I

    invoke-virtual {p2, v4, v7}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 146
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->n:Landroid/view/View;

    invoke-virtual {v4, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_6

    .line 147
    :cond_12
    iget-boolean p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->F:Z

    if-eqz p2, :cond_14

    .line 148
    sget p2, Ll/qdc0;->u:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    .line 149
    new-instance v7, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v7, v8, v8}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 150
    sget v9, Ll/qdc0;->p:I

    invoke-virtual {v7, v1, v9}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    const/16 v9, 0xf

    .line 151
    invoke-virtual {v7, v9, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 152
    invoke-virtual {p2, v7}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 153
    iget-boolean p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->v:Z

    if-nez p2, :cond_13

    .line 154
    new-instance p2, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {p2, v8, v8}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 155
    invoke-virtual {p2, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 156
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->i:Landroid/widget/TextView;

    invoke-virtual {v4, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_6

    .line 157
    :cond_13
    new-instance p2, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {p2, v8, v8}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 158
    sget v4, Ll/qdc0;->e:I

    invoke-virtual {p2, v5, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 159
    iget-object v4, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->i:Landroid/widget/TextView;

    invoke-virtual {v4, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 160
    :cond_14
    :goto_6
    iput-boolean v5, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->t:Z

    .line 161
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->u:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    invoke-virtual {p2}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->b()I

    move-result p2

    invoke-direct {p0, p2, v5}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->F(IZ)V

    .line 162
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->u:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    invoke-virtual {p2}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->f()I

    move-result p2

    invoke-direct {p0, p2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->G(I)V

    .line 163
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->u:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    invoke-virtual {p2}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->g()I

    move-result p2

    invoke-direct {p0, p2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->H(I)V

    .line 164
    sget p2, Lcom/wdullaer/materialdatetimepicker/R$string;->A:I

    invoke-virtual {v0, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->N:Ljava/lang/String;

    .line 165
    sget p2, Lcom/wdullaer/materialdatetimepicker/R$string;->g:I

    invoke-virtual {v0, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->O:Ljava/lang/String;

    .line 166
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->N:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/String;->charAt(I)C

    move-result p2

    iput-char p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->M:C

    .line 167
    iput v2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->T:I

    iput v2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->S:I

    .line 168
    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->r()V

    .line 169
    iget-boolean p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->P:Z

    if-eqz p2, :cond_15

    .line 170
    const-string p2, "typed_times"

    invoke-virtual {p3, p2}, Landroid/os/Bundle;->getIntegerArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p2

    iput-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->Q:Ljava/util/ArrayList;

    .line 171
    invoke-direct {p0, v2}, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->I(I)V

    .line 172
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->f:Landroid/widget/TextView;

    invoke-virtual {p2}, Landroid/view/View;->invalidate()V

    goto :goto_7

    .line 173
    :cond_15
    iget-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->Q:Ljava/util/ArrayList;

    if-nez p2, :cond_16

    .line 174
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->Q:Ljava/util/ArrayList;

    .line 175
    :cond_16
    :goto_7
    sget p2, Ll/qdc0;->A:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    .line 176
    iget-object p3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->w:Ljava/lang/String;

    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z

    move-result p3

    if-nez p3, :cond_17

    .line 177
    invoke-virtual {p2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 178
    iget-object p3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->w:Ljava/lang/String;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 179
    :cond_17
    iget-object p3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->e:Landroid/widget/Button;

    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->A:I

    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 180
    iget-object p3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->d:Landroid/widget/Button;

    iget v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->A:I

    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 181
    iget p3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->A:I

    invoke-static {p3}, Ll/tnk0;->a(I)I

    move-result p3

    invoke-virtual {p2, p3}, Landroid/view/View;->setBackgroundColor(I)V

    .line 182
    sget p2, Ll/qdc0;->x:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iget p3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->A:I

    invoke-virtual {p2, p3}, Landroid/view/View;->setBackgroundColor(I)V

    .line 183
    sget p2, Ll/qdc0;->w:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iget p3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->A:I

    invoke-virtual {p2, p3}, Landroid/view/View;->setBackgroundColor(I)V

    .line 184
    invoke-virtual {p0}, Landroid/app/DialogFragment;->getDialog()Landroid/app/Dialog;

    move-result-object p2

    if-nez p2, :cond_18

    .line 185
    sget p2, Ll/qdc0;->l:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    invoke-virtual {p2, v6}, Landroid/view/View;->setVisibility(I)V

    .line 186
    :cond_18
    sget p2, Ll/q9c0;->e:I

    invoke-static {v3, p2}, Ll/j26;->c(Landroid/content/Context;I)I

    move-result p2

    .line 187
    sget p3, Ll/q9c0;->d:I

    invoke-static {v3, p3}, Ll/j26;->c(Landroid/content/Context;I)I

    move-result p3

    .line 188
    sget v0, Ll/q9c0;->r:I

    invoke-static {v3, v0}, Ll/j26;->c(Landroid/content/Context;I)I

    move-result v0

    .line 189
    sget v1, Ll/q9c0;->r:I

    invoke-static {v3, v1}, Ll/j26;->c(Landroid/content/Context;I)I

    move-result v1

    .line 190
    iget-object v2, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    iget-boolean v3, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->x:Z

    if-eqz v3, :cond_19

    move p2, v1

    :cond_19
    invoke-virtual {v2, p2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 191
    sget p2, Ll/qdc0;->z:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    .line 192
    iget-boolean p0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->x:Z

    if-eqz p0, :cond_1a

    move p3, v0

    :cond_1a
    invoke-virtual {p2, p3}, Landroid/view/View;->setBackgroundColor(I)V

    return-object p1
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/app/DialogFragment;->onDismiss(Landroid/content/DialogInterface;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->b:Landroid/content/DialogInterface$OnDismissListener;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0, p1}, Landroid/content/DialogInterface$OnDismissListener;->onDismiss(Landroid/content/DialogInterface;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public onPause()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/app/Fragment;->onPause()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->c:Ll/yxk;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/yxk;->g()V

    .line 7
    .line 8
    .line 9
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->B:Z

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/app/DialogFragment;->dismiss()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/app/Fragment;->onResume()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->c:Ll/yxk;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/yxk;->f()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    const-string v1, "initial_time"

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getTime()Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 12
    .line 13
    .line 14
    const-string v0, "is_24_hour_view"

    .line 15
    .line 16
    iget-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->v:Z

    .line 17
    .line 18
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->o:Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/wdullaer/materialdatetimepicker/time/RadialPickerLayout;->getCurrentItemShowing()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    const-string v1, "current_item_showing"

    .line 28
    .line 29
    invoke-virtual {p1, v1, v0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 30
    .line 31
    .line 32
    const-string v0, "in_kb_mode"

    .line 33
    .line 34
    iget-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->P:Z

    .line 35
    .line 36
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 37
    .line 38
    .line 39
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->P:Z

    .line 40
    .line 41
    if-eqz v0, :cond_0

    .line 42
    .line 43
    const-string v0, "typed_times"

    .line 44
    .line 45
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->Q:Ljava/util/ArrayList;

    .line 46
    .line 47
    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putIntegerArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 48
    .line 49
    .line 50
    :cond_0
    const-string v0, "dialog_title"

    .line 51
    .line 52
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->w:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    const-string v0, "theme_dark"

    .line 58
    .line 59
    iget-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->x:Z

    .line 60
    .line 61
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 62
    .line 63
    .line 64
    const-string v0, "theme_dark_changed"

    .line 65
    .line 66
    iget-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->y:Z

    .line 67
    .line 68
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 69
    .line 70
    .line 71
    const-string v0, "accent"

    .line 72
    .line 73
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->A:I

    .line 74
    .line 75
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 76
    .line 77
    .line 78
    const-string v0, "vibrate"

    .line 79
    .line 80
    iget-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->z:Z

    .line 81
    .line 82
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 83
    .line 84
    .line 85
    const-string v0, "dismiss"

    .line 86
    .line 87
    iget-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->B:Z

    .line 88
    .line 89
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 90
    .line 91
    .line 92
    const-string v0, "selectable_times"

    .line 93
    .line 94
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->C:[Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 95
    .line 96
    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelableArray(Ljava/lang/String;[Landroid/os/Parcelable;)V

    .line 97
    .line 98
    .line 99
    const-string v0, "min_time"

    .line 100
    .line 101
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->D:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 102
    .line 103
    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 104
    .line 105
    .line 106
    const-string v0, "max_time"

    .line 107
    .line 108
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->E:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 109
    .line 110
    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 111
    .line 112
    .line 113
    const-string v0, "enable_seconds"

    .line 114
    .line 115
    iget-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->F:Z

    .line 116
    .line 117
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 118
    .line 119
    .line 120
    const-string v0, "enable_minutes"

    .line 121
    .line 122
    iget-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->G:Z

    .line 123
    .line 124
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 125
    .line 126
    .line 127
    const-string v0, "ok_resid"

    .line 128
    .line 129
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->H:I

    .line 130
    .line 131
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 132
    .line 133
    .line 134
    const-string v0, "ok_string"

    .line 135
    .line 136
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->I:Ljava/lang/String;

    .line 137
    .line 138
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    const-string v0, "cancel_resid"

    .line 142
    .line 143
    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->J:I

    .line 144
    .line 145
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 146
    .line 147
    .line 148
    const-string v0, "cancel_string"

    .line 149
    .line 150
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->K:Ljava/lang/String;

    .line 151
    .line 152
    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    const-string v0, "version"

    .line 156
    .line 157
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->L:Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog$Version;

    .line 158
    .line 159
    invoke-virtual {p1, v0, p0}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 160
    .line 161
    .line 162
    :cond_1
    return-void
.end method

.method public u()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->A:I

    .line 2
    .line 3
    return p0
.end method

.method public w()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->z:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->c:Ll/yxk;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/yxk;->h()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public x(Lcom/wdullaer/materialdatetimepicker/time/Timepoint;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->D:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->a(Lcom/wdullaer/materialdatetimepicker/time/Timepoint;)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-lez v0, :cond_0

    .line 11
    .line 12
    return v1

    .line 13
    :cond_0
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->E:Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Lcom/wdullaer/materialdatetimepicker/time/Timepoint;->a(Lcom/wdullaer/materialdatetimepicker/time/Timepoint;)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-gez v0, :cond_1

    .line 22
    .line 23
    return v1

    .line 24
    :cond_1
    iget-object p0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->C:[Lcom/wdullaer/materialdatetimepicker/time/Timepoint;

    .line 25
    .line 26
    if-eqz p0, :cond_2

    .line 27
    .line 28
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    xor-int/2addr p0, v1

    .line 37
    return p0

    .line 38
    :cond_2
    const/4 p0, 0x0

    .line 39
    return p0
.end method

.method public z()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/wdullaer/materialdatetimepicker/time/TimePickerDialog;->x:Z

    .line 2
    .line 3
    return p0
.end method
