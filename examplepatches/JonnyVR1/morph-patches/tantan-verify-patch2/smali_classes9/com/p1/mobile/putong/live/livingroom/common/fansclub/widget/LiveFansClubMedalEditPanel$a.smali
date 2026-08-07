.class public Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->J()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->e:Lv/VText;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    const/4 v2, 0x0

    .line 18
    const/4 v3, 0x1

    .line 19
    if-lez v1, :cond_0

    .line 20
    .line 21
    move v1, v3

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    move v1, v2

    .line 24
    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;

    .line 28
    .line 29
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->x(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-static {v0}, Ll/q8g0;->J(Ljava/lang/CharSequence;)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    const/4 v1, 0x6

    .line 44
    if-le v0, v1, :cond_4

    .line 45
    .line 46
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->d4:I

    .line 47
    .line 48
    invoke-static {v0}, Ll/o1j0;->h(I)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;

    .line 52
    .line 53
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->d:Lv/VEditText;

    .line 54
    .line 55
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->w(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;Ljava/lang/CharSequence;)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    add-int/2addr v0, v3

    .line 60
    invoke-interface {p1, v2, v0}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 65
    .line 66
    .line 67
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;

    .line 68
    .line 69
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->d:Lv/VEditText;

    .line 70
    .line 71
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setSelection(I)V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;

    .line 92
    .line 93
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->v(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;[C)Z

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    if-nez v0, :cond_4

    .line 98
    .line 99
    new-instance v0, Ljava/lang/StringBuilder;

    .line 100
    .line 101
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 102
    .line 103
    .line 104
    array-length v1, p1

    .line 105
    :goto_1
    if-ge v2, v1, :cond_3

    .line 106
    .line 107
    aget-char v3, p1, v2

    .line 108
    .line 109
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;

    .line 110
    .line 111
    new-instance v5, Ljava/lang/StringBuilder;

    .line 112
    .line 113
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v6

    .line 120
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v5

    .line 130
    invoke-virtual {v5}, Ljava/lang/String;->toCharArray()[C

    .line 131
    .line 132
    .line 133
    move-result-object v5

    .line 134
    invoke-static {v4, v5}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->v(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;[C)Z

    .line 135
    .line 136
    .line 137
    move-result v4

    .line 138
    if-eqz v4, :cond_2

    .line 139
    .line 140
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    add-int/lit8 v2, v2, 0x1

    .line 144
    .line 145
    goto :goto_1

    .line 146
    :cond_2
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->d4:I

    .line 147
    .line 148
    invoke-static {p1}, Ll/o1j0;->h(I)V

    .line 149
    .line 150
    .line 151
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;

    .line 152
    .line 153
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->d:Lv/VEditText;

    .line 154
    .line 155
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 156
    .line 157
    .line 158
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;

    .line 159
    .line 160
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->d:Lv/VEditText;

    .line 161
    .line 162
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 167
    .line 168
    .line 169
    move-result p1

    .line 170
    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setSelection(I)V

    .line 171
    .line 172
    .line 173
    :cond_4
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
