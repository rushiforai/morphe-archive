.class public Lcom/p1/mobile/android/app/Dialog$h;
.super Landroid/widget/ArrayAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/android/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "h"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter<",
        "Ljava/lang/CharSequence;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:I

.field public final synthetic b:Lcom/p1/mobile/android/app/Dialog;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Dialog;Landroid/content/Context;II[Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/app/Dialog$h;->b:Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-direct {p0, p2, p3, p4, p5}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;II[Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/widget/ArrayAdapter;->getContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    sget p3, Ll/o8c0;->g:I

    .line 11
    .line 12
    iget p1, p1, Lcom/p1/mobile/android/app/Dialog;->F:I

    .line 13
    .line 14
    invoke-static {p2, p3, p1}, Lcom/p1/mobile/android/app/Dialog;->b0(Landroid/content/Context;II)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iput p1, p0, Lcom/p1/mobile/android/app/Dialog$h;->a:I

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public getItemId(I)J
    .locals 0

    int-to-long p0, p1

    return-wide p0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongViewCast"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    sget p3, Ll/vcc0;->R0:I

    .line 6
    .line 7
    invoke-virtual {p2, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p3

    .line 11
    check-cast p3, Landroid/widget/TextView;

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/android/app/Dialog$d;->b:[I

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/android/app/Dialog$h;->b:Lcom/p1/mobile/android/app/Dialog;

    .line 16
    .line 17
    iget-object v1, v1, Lcom/p1/mobile/android/app/Dialog;->G:Lcom/p1/mobile/android/app/Dialog$ListType;

    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    aget v0, v0, v1

    .line 24
    .line 25
    const/4 v1, 0x1

    .line 26
    if-eq v0, v1, :cond_1

    .line 27
    .line 28
    const/4 v1, 0x2

    .line 29
    if-eq v0, v1, :cond_0

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_0
    sget v0, Ll/vcc0;->B:I

    .line 33
    .line 34
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Landroid/widget/CheckBox;

    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/android/app/Dialog$h;->b:Lcom/p1/mobile/android/app/Dialog;

    .line 41
    .line 42
    iget-object v1, v1, Lcom/p1/mobile/android/app/Dialog;->H:Ljava/util/List;

    .line 43
    .line 44
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-interface {v1, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 53
    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_1
    sget v0, Ll/vcc0;->B:I

    .line 57
    .line 58
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    check-cast v0, Landroid/widget/RadioButton;

    .line 63
    .line 64
    iget-object v2, p0, Lcom/p1/mobile/android/app/Dialog$h;->b:Lcom/p1/mobile/android/app/Dialog;

    .line 65
    .line 66
    iget-object v2, v2, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 67
    .line 68
    iget v2, v2, Lcom/p1/mobile/android/app/Dialog$e;->H:I

    .line 69
    .line 70
    if-ne v2, p1, :cond_2

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_2
    const/4 v1, 0x0

    .line 74
    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 75
    .line 76
    .line 77
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog$h;->b:Lcom/p1/mobile/android/app/Dialog;

    .line 78
    .line 79
    iget-object v0, v0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 80
    .line 81
    iget-object v0, v0, Lcom/p1/mobile/android/app/Dialog$e;->n:[Ljava/lang/CharSequence;

    .line 82
    .line 83
    aget-object v0, v0, p1

    .line 84
    .line 85
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 86
    .line 87
    .line 88
    iget v0, p0, Lcom/p1/mobile/android/app/Dialog$h;->a:I

    .line 89
    .line 90
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 91
    .line 92
    .line 93
    new-instance p3, Ljava/lang/StringBuilder;

    .line 94
    .line 95
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    const-string v0, ":"

    .line 102
    .line 103
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog$h;->b:Lcom/p1/mobile/android/app/Dialog;

    .line 107
    .line 108
    iget-object v0, v0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 109
    .line 110
    iget-object v0, v0, Lcom/p1/mobile/android/app/Dialog$e;->n:[Ljava/lang/CharSequence;

    .line 111
    .line 112
    aget-object p1, v0, p1

    .line 113
    .line 114
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    invoke-virtual {p2, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 122
    .line 123
    .line 124
    iget-object p1, p0, Lcom/p1/mobile/android/app/Dialog$h;->b:Lcom/p1/mobile/android/app/Dialog;

    .line 125
    .line 126
    iget-object p1, p1, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 127
    .line 128
    iget-object p3, p1, Lcom/p1/mobile/android/app/Dialog$e;->X:Landroid/graphics/drawable/Drawable;

    .line 129
    .line 130
    if-nez p3, :cond_3

    .line 131
    .line 132
    iget-object p1, p1, Lcom/p1/mobile/android/app/Dialog$e;->a:Landroid/content/Context;

    .line 133
    .line 134
    sget p3, Ll/o8c0;->h:I

    .line 135
    .line 136
    invoke-static {p1, p3}, Lcom/p1/mobile/android/app/Dialog;->e0(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 137
    .line 138
    .line 139
    move-result-object p3

    .line 140
    if-nez p3, :cond_3

    .line 141
    .line 142
    invoke-virtual {p0}, Landroid/widget/ArrayAdapter;->getContext()Landroid/content/Context;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    sget p1, Ll/o8c0;->h:I

    .line 147
    .line 148
    invoke-static {p0, p1}, Lcom/p1/mobile/android/app/Dialog;->e0(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 149
    .line 150
    .line 151
    move-result-object p3

    .line 152
    :cond_3
    invoke-virtual {p2, p3}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 153
    .line 154
    .line 155
    return-object p2
.end method

.method public hasStableIds()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method
