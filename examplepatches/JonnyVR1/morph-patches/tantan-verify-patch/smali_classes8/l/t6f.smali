.class public Ll/t6f;
.super Ll/pej0;
.source "SourceFile"


# instance fields
.field public f:Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;

.field public g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public h:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget v0, Ll/cgc0;->b:I

    .line 2
    .line 3
    invoke-direct {p0, p1, v0}, Ll/pej0;-><init>(Landroid/content/Context;I)V

    .line 4
    .line 5
    .line 6
    const/16 p1, 0xf

    .line 7
    .line 8
    iput p1, p0, Ll/t6f;->h:I

    .line 9
    .line 10
    new-instance v0, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/t6f;->g:Ljava/util/List;

    .line 16
    .line 17
    :goto_0
    const/16 v0, 0x3c

    .line 18
    .line 19
    if-gt p1, v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Ll/t6f;->g:Ljava/util/List;

    .line 22
    .line 23
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    add-int/lit8 p1, p1, 0xf

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    return-void
.end method

.method public static bridge synthetic A(Ll/t6f;I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/t6f;->h:I

    return-void
.end method

.method private synthetic C(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic x(Ll/t6f;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/t6f;->C(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic y(Ll/t6f;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/t6f;->D(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic z(Ll/t6f;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t6f;->g:Ljava/util/List;

    return-object p0
.end method


# virtual methods
.method public final synthetic D(Ljava/lang/String;Landroid/view/View;)V
    .locals 1

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->M1:Ll/cn7;

    .line 4
    .line 5
    iget v0, p0, Ll/t6f;->h:I

    .line 6
    .line 7
    invoke-virtual {p2, p1, v0}, Ll/cn7;->D3(Ljava/lang/String;I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 11
    .line 12
    .line 13
    new-instance p1, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    iget p0, p0, Ll/t6f;->h:I

    .line 19
    .line 20
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string p0, ""

    .line 24
    .line 25
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const-string p1, "private_chat_duration"

    .line 33
    .line 34
    invoke-static {p1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    filled-new-array {p0}, [Ll/pf60;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    const-string p1, "e_send_private_chat_invite"

    .line 43
    .line 44
    const-string p2, "p_private_chat_invite"

    .line 45
    .line 46
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public E(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget v0, Ll/qec0;->P3:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    sget v0, Ll/edc0;->G4:I

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;

    .line 19
    .line 20
    iput-object v0, p0, Ll/t6f;->f:Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;

    .line 21
    .line 22
    sget v0, Ll/edc0;->P:I

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/r6f;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/r6f;-><init>(Ll/t6f;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 34
    .line 35
    .line 36
    sget v0, Ll/edc0;->b:I

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    new-instance v1, Ll/s6f;

    .line 43
    .line 44
    invoke-direct {v1, p0, p2}, Ll/s6f;-><init>(Ll/t6f;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 48
    .line 49
    .line 50
    sget p2, Ll/edc0;->Q4:I

    .line 51
    .line 52
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    check-cast p2, Lv/VText;

    .line 57
    .line 58
    invoke-virtual {p2}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    const/4 v0, 0x1

    .line 63
    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 64
    .line 65
    .line 66
    new-instance p2, Ljava/util/ArrayList;

    .line 67
    .line 68
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Ll/t6f;->g:Ljava/util/List;

    .line 72
    .line 73
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    if-eqz v1, :cond_1

    .line 82
    .line 83
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    check-cast v1, Ljava/lang/Integer;

    .line 88
    .line 89
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    const/16 v3, 0x3c

    .line 94
    .line 95
    if-ne v2, v3, :cond_0

    .line 96
    .line 97
    const-string v1, "1\u5c0f\u65f6"

    .line 98
    .line 99
    invoke-interface {p2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 104
    .line 105
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v1}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    const-string v1, "\u5206\u949f"

    .line 116
    .line 117
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    invoke-interface {p2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    goto :goto_0

    .line 128
    :cond_1
    iget-object v0, p0, Ll/t6f;->f:Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;

    .line 129
    .line 130
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->setData(Ljava/util/List;)V

    .line 131
    .line 132
    .line 133
    iget-object p2, p0, Ll/t6f;->f:Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;

    .line 134
    .line 135
    new-instance v0, Ll/t6f$a;

    .line 136
    .line 137
    invoke-direct {v0, p0}, Ll/t6f$a;-><init>(Ll/t6f;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker;->setOnWheelChangeListener(Lcom/p1/mobile/putong/core/message/inner/view/MessageWheelPicker$b;)V

    .line 141
    .line 142
    .line 143
    const-class p2, Lcom/p1/mobile/android/app/Dialog;

    .line 144
    .line 145
    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object p2

    .line 149
    const-string v0, "p_private_chat_invite"

    .line 150
    .line 151
    invoke-static {v0, p2}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 152
    .line 153
    .line 154
    move-result-object p2

    .line 155
    invoke-static {p2}, Ll/w1e;->f(Ll/l4g0;)V

    .line 156
    .line 157
    .line 158
    new-instance v0, Ll/t6f$b;

    .line 159
    .line 160
    invoke-direct {v0, p0, p2}, Ll/t6f$b;-><init>(Ll/t6f;Ll/l4g0;)V

    .line 161
    .line 162
    .line 163
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 164
    .line 165
    .line 166
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {p0}, Landroid/app/Dialog;->show()V

    .line 170
    .line 171
    .line 172
    const/4 p1, 0x0

    .line 173
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCancelable(Z)V

    .line 174
    .line 175
    .line 176
    sget p1, Lcom/google/android/material/R$id;->design_bottom_sheet:I

    .line 177
    .line 178
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 179
    .line 180
    .line 181
    move-result-object p0

    .line 182
    invoke-static {p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 183
    .line 184
    .line 185
    move-result-object p0

    .line 186
    const/4 p1, 0x3

    .line 187
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 188
    .line 189
    .line 190
    return-void
.end method
