.class public Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeFrag$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeFrag;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeData;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeFrag;Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeData;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeFrag$a;->b:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeFrag;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeFrag$a;->a:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeData;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "\\s+"

    .line 20
    .line 21
    const-string v2, ""

    .line 22
    .line 23
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-nez v1, :cond_0

    .line 36
    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeFrag$a;->b:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeFrag;

    .line 38
    .line 39
    invoke-static {v1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeFrag;->Z4(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeFrag;)Lv/VEditText;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 44
    .line 45
    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeFrag$a;->b:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeFrag;

    .line 47
    .line 48
    invoke-static {v1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeFrag;->Z4(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeFrag;)Lv/VEditText;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setSelection(I)V

    .line 57
    .line 58
    .line 59
    :cond_0
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeFrag$a;->a:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeData;

    .line 64
    .line 65
    iget v2, v1, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeData;->maxCount:I

    .line 66
    .line 67
    const/4 v3, 0x0

    .line 68
    if-le v0, v2, :cond_1

    .line 69
    .line 70
    invoke-interface {p1, v3, v2}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeFrag$a;->a:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeData;

    .line 75
    .line 76
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    iput-object v0, v1, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeData;->text1:Ljava/lang/String;

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    iput-object v0, v1, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeData;->text1:Ljava/lang/String;

    .line 96
    .line 97
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeFrag$a;->b:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeFrag;

    .line 98
    .line 99
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeFrag;->a5(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeFrag;)Lv/VLinear;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeFrag$a;->b:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeFrag;

    .line 107
    .line 108
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;->A:Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;

    .line 109
    .line 110
    iget v0, v0, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;->inputContentType:I

    .line 111
    .line 112
    const/4 v1, 0x5

    .line 113
    const/4 v2, 0x1

    .line 114
    if-ne v0, v1, :cond_3

    .line 115
    .line 116
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeFrag$a;->a:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeData;

    .line 117
    .line 118
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeData;->text1:Ljava/lang/String;

    .line 119
    .line 120
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    if-eqz v0, :cond_2

    .line 125
    .line 126
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeFrag$a;->a:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeData;

    .line 127
    .line 128
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeData;->errorTips:Ljava/lang/String;

    .line 129
    .line 130
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    if-nez v0, :cond_2

    .line 135
    .line 136
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeFrag$a;->b:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeFrag;

    .line 137
    .line 138
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeFrag;->Y4(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeFrag;)Lv/VLinear;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    sget v1, Ll/dbc0;->ms:I

    .line 143
    .line 144
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 145
    .line 146
    .line 147
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeFrag$a;->b:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeFrag;

    .line 148
    .line 149
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeFrag;->a5(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeFrag;)Lv/VLinear;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 154
    .line 155
    .line 156
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeFrag$a;->b:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeFrag;

    .line 157
    .line 158
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeFrag;->b5(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeFrag;)Lv/VText;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeFrag$a;->a:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeData;

    .line 163
    .line 164
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeData;->errorTips:Ljava/lang/String;

    .line 165
    .line 166
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 167
    .line 168
    .line 169
    goto :goto_1

    .line 170
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeFrag$a;->b:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeFrag;

    .line 171
    .line 172
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeFrag;->Y4(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeFrag;)Lv/VLinear;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    sget v1, Ll/dbc0;->ls:I

    .line 177
    .line 178
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 179
    .line 180
    .line 181
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeFrag$a;->b:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeFrag;

    .line 182
    .line 183
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeFrag;->a5(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeFrag;)Lv/VLinear;

    .line 184
    .line 185
    .line 186
    move-result-object v0

    .line 187
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 188
    .line 189
    .line 190
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeFrag$a;->b:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeFrag;

    .line 191
    .line 192
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeFrag;->X4(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeFrag;)Landroid/view/View;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object p1

    .line 200
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object p1

    .line 204
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 205
    .line 206
    .line 207
    move-result p1

    .line 208
    xor-int/2addr p1, v2

    .line 209
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 210
    .line 211
    .line 212
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeFrag$a;->b:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopTextTypeFrag;

    .line 213
    .line 214
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;->R4(Z)V

    .line 215
    .line 216
    .line 217
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method
