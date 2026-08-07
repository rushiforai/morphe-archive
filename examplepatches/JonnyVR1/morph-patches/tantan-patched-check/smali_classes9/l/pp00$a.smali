.class public Ll/pp00$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/pp00;->A(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/User;

.field public final synthetic b:Ll/pp00;


# direct methods
.method public constructor <init>(Ll/pp00;Lcom/p1/mobile/putong/data/User;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/pp00$a;->b:Ll/pp00;

    .line 2
    .line 3
    iput-object p2, p0, Ll/pp00$a;->a:Lcom/p1/mobile/putong/data/User;

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
    .locals 6

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Ll/pp00$a;->b:Ll/pp00;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, v1, Ll/pp00;->m:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/pp00$a;->b:Ll/pp00;

    .line 20
    .line 21
    iget-object v0, v0, Ll/pp00;->m:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 22
    .line 23
    new-instance v1, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    const-string v2, " "

    .line 26
    .line 27
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object v3, p0, Ll/pp00$a;->b:Ll/pp00;

    .line 31
    .line 32
    iget-object v3, v3, Ll/pp00;->o:Lcom/p1/mobile/putong/core/ui/moment/MomentMessageAct;

    .line 33
    .line 34
    sget v4, Lcom/p1/mobile/putong/core/R$string;->pj:I

    .line 35
    .line 36
    new-instance v5, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    invoke-direct {v5, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iget-object v2, p0, Ll/pp00$a;->a:Lcom/p1/mobile/putong/data/User;

    .line 42
    .line 43
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-virtual {v3, v4, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_0
    iget-object v0, v1, Ll/pp00;->m:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 72
    .line 73
    const/4 v1, 0x4

    .line 74
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Ll/pp00$a;->b:Ll/pp00;

    .line 78
    .line 79
    iget-object v0, v0, Ll/pp00;->m:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 80
    .line 81
    const-string v1, ""

    .line 82
    .line 83
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 84
    .line 85
    .line 86
    :goto_0
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    xor-int/lit8 v1, v0, 0x1

    .line 99
    .line 100
    iget-object v2, p0, Ll/pp00$a;->b:Ll/pp00;

    .line 101
    .line 102
    iget-object v2, v2, Ll/pp00;->n:Landroid/widget/TextView;

    .line 103
    .line 104
    if-nez v0, :cond_1

    .line 105
    .line 106
    const-string v3, "#fffe7e1d"

    .line 107
    .line 108
    goto :goto_1

    .line 109
    :cond_1
    const-string v3, "#19000000"

    .line 110
    .line 111
    :goto_1
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 112
    .line 113
    .line 114
    move-result v3

    .line 115
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 116
    .line 117
    .line 118
    iget-object v2, p0, Ll/pp00$a;->b:Ll/pp00;

    .line 119
    .line 120
    iget-object v2, v2, Ll/pp00;->n:Landroid/widget/TextView;

    .line 121
    .line 122
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 123
    .line 124
    .line 125
    iget-object v1, p0, Ll/pp00$a;->b:Ll/pp00;

    .line 126
    .line 127
    iget-object v1, v1, Ll/pp00;->d:Landroid/widget/LinearLayout;

    .line 128
    .line 129
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 130
    .line 131
    .line 132
    iget-object v1, p0, Ll/pp00$a;->b:Ll/pp00;

    .line 133
    .line 134
    iget-object v1, v1, Ll/pp00;->c:Landroid/widget/TextView;

    .line 135
    .line 136
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 137
    .line 138
    .line 139
    iget-object v0, p0, Ll/pp00$a;->b:Ll/pp00;

    .line 140
    .line 141
    iget-object v0, v0, Ll/pp00;->p:Ll/bp00;

    .line 142
    .line 143
    invoke-virtual {v0}, Ll/bp00;->j0()Ll/v500;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    if-eqz v0, :cond_2

    .line 148
    .line 149
    iget-object v0, p0, Ll/pp00$a;->b:Ll/pp00;

    .line 150
    .line 151
    iget-object v0, v0, Ll/pp00;->p:Ll/bp00;

    .line 152
    .line 153
    invoke-virtual {v0}, Ll/bp00;->j0()Ll/v500;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    iget-object p0, p0, Ll/pp00$a;->b:Ll/pp00;

    .line 162
    .line 163
    invoke-interface {v0, p1, p0}, Ll/v500;->g(Ljava/lang/String;Ll/pp00;)V

    .line 164
    .line 165
    .line 166
    :cond_2
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    .line 1
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    .line 1
    return-void
.end method
