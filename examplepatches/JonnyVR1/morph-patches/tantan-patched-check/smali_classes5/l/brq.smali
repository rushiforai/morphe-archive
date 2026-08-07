.class public Ll/brq;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Lcom/p1/mobile/android/app/Act;)V
    .locals 5

    .line 1
    sget v0, Lcom/p1/mobile/putong/core/R$string;->J8:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget v1, Lcom/p1/mobile/putong/core/R$string;->I8:I

    .line 8
    .line 9
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    new-instance v2, Landroid/text/SpannableStringBuilder;

    .line 22
    .line 23
    invoke-direct {v2, v1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    new-instance v3, Ll/brq$a;

    .line 27
    .line 28
    const-string v4, "http://feedback.tantanapp.com/feedback-mobile/form?from=vip_complaint"

    .line 29
    .line 30
    invoke-direct {v3, p0, v0, v4}, Ll/brq$a;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    invoke-virtual {v1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    add-int/2addr v1, v0

    .line 46
    const/16 v0, 0x21

    .line 47
    .line 48
    invoke-virtual {v2, v3, v4, v1, v0}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    sget v1, Lcom/p1/mobile/putong/core/R$string;->H8:I

    .line 56
    .line 57
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->G0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    sget v1, Ll/c9c0;->T0:I

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->I0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    const/16 v1, 0x11

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->J0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    sget v3, Ll/dbc0;->lu:I

    .line 78
    .line 79
    invoke-virtual {p0, v3}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 80
    .line 81
    .line 82
    move-result-object v3

    .line 83
    invoke-virtual {v0, v3}, Lcom/p1/mobile/android/app/Dialog$e;->a0(Landroid/graphics/drawable/Drawable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    const/4 v3, 0x1

    .line 88
    invoke-virtual {v0, v3}, Lcom/p1/mobile/android/app/Dialog$e;->y(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->I(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    sget v1, Ll/c9c0;->c:I

    .line 101
    .line 102
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->H(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    const/high16 v1, 0x41600000    # 14.0f

    .line 107
    .line 108
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->K(F)Lcom/p1/mobile/android/app/Dialog$e;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-virtual {v0, v3}, Lcom/p1/mobile/android/app/Dialog$e;->J(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->u()Lcom/p1/mobile/android/app/Dialog$e;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->t()Lcom/p1/mobile/android/app/Dialog$e;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Ah:I

    .line 125
    .line 126
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    new-instance v2, Ll/arq;

    .line 131
    .line 132
    invoke-direct {v2, p0}, Ll/arq;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->v0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 144
    .line 145
    .line 146
    return-void
.end method

.method public static b(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const-string v0, "coPay"

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-static {p0}, Ll/brq;->a(Lcom/p1/mobile/android/app/Act;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
