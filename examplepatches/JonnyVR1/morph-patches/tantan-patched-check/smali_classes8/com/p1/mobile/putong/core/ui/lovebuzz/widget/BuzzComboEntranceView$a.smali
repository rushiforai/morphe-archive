.class public final Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzComboEntranceView$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzComboEntranceView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J/\u0010\r\u001a\u0004\u0018\u00010\u000c2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\u00082\u0006\u0010\u000b\u001a\u00020\n\u00a2\u0006\u0004\u0008\r\u0010\u000e\u00a8\u0006\u000f"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzComboEntranceView$a;",
        "",
        "<init>",
        "()V",
        "",
        "type",
        "Landroid/content/Context;",
        "ctx",
        "",
        "size",
        "",
        "newUI",
        "Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzComboEntranceView;",
        "a",
        "(Ljava/lang/String;Landroid/content/Context;IZ)Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzComboEntranceView;",
        "buzz_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzComboEntranceView$a;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Landroid/content/Context;IZ)Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzComboEntranceView;
    .locals 8
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    if-eqz p4, :cond_0

    .line 8
    .line 9
    new-instance p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/NewUIBuzzComboEntranceView;

    .line 10
    .line 11
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/NewUIBuzzComboEntranceView;-><init>(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    :goto_0
    move-object v0, p0

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    new-instance p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/NormalBuzzComboEntranceView;

    .line 17
    .line 18
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/NormalBuzzComboEntranceView;-><init>(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :goto_1
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    const p2, -0x3cc540db

    .line 27
    .line 28
    .line 29
    if-eq p0, p2, :cond_7

    .line 30
    .line 31
    const p2, -0x3bda5260

    .line 32
    .line 33
    .line 34
    if-eq p0, p2, :cond_4

    .line 35
    .line 36
    const p2, 0x4f6b25ee    # 3.9451315E9f

    .line 37
    .line 38
    .line 39
    if-eq p0, p2, :cond_1

    .line 40
    .line 41
    goto/16 :goto_c

    .line 42
    .line 43
    :cond_1
    const-string p0, "videoBuzz"

    .line 44
    .line 45
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-nez p0, :cond_2

    .line 50
    .line 51
    goto/16 :goto_c

    .line 52
    .line 53
    :cond_2
    if-eqz p4, :cond_3

    .line 54
    .line 55
    sget p0, Ll/ebc0;->c0:I

    .line 56
    .line 57
    goto :goto_2

    .line 58
    :cond_3
    sget p0, Ll/ebc0;->b0:I

    .line 59
    .line 60
    :goto_2
    sget p1, Lcom/p1/mobile/putong/core/buzz/R$string;->i0:I

    .line 61
    .line 62
    :goto_3
    move v1, p0

    .line 63
    move v2, p1

    .line 64
    goto :goto_6

    .line 65
    :cond_4
    const-string p0, "textBuzz"

    .line 66
    .line 67
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    if-nez p0, :cond_5

    .line 72
    .line 73
    goto :goto_c

    .line 74
    :cond_5
    if-eqz p4, :cond_6

    .line 75
    .line 76
    sget p0, Ll/ebc0;->a0:I

    .line 77
    .line 78
    goto :goto_4

    .line 79
    :cond_6
    sget p0, Ll/ebc0;->Z:I

    .line 80
    .line 81
    :goto_4
    sget p1, Lcom/p1/mobile/putong/core/buzz/R$string;->g0:I

    .line 82
    .line 83
    goto :goto_3

    .line 84
    :cond_7
    const-string p0, "voiceBuzz"

    .line 85
    .line 86
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    if-eqz p0, :cond_d

    .line 91
    .line 92
    if-eqz p4, :cond_8

    .line 93
    .line 94
    sget p0, Ll/ebc0;->e0:I

    .line 95
    .line 96
    goto :goto_5

    .line 97
    :cond_8
    sget p0, Ll/ebc0;->d0:I

    .line 98
    .line 99
    :goto_5
    sget p1, Lcom/p1/mobile/putong/core/buzz/R$string;->k0:I

    .line 100
    .line 101
    goto :goto_3

    .line 102
    :goto_6
    if-eqz p4, :cond_9

    .line 103
    .line 104
    sget p0, Ll/ebc0;->H:I

    .line 105
    .line 106
    :goto_7
    move v3, p0

    .line 107
    goto :goto_8

    .line 108
    :cond_9
    sget p0, Ll/ebc0;->G:I

    .line 109
    .line 110
    goto :goto_7

    .line 111
    :goto_8
    const/4 p0, 0x1

    .line 112
    if-ne p3, p0, :cond_a

    .line 113
    .line 114
    :goto_9
    move v5, p0

    .line 115
    goto :goto_a

    .line 116
    :cond_a
    const/4 p0, 0x0

    .line 117
    goto :goto_9

    .line 118
    :goto_a
    const/16 v6, 0x8

    .line 119
    .line 120
    const/4 v7, 0x0

    .line 121
    const/4 v4, 0x0

    .line 122
    invoke-static/range {v0 .. v7}, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzComboEntranceView;->i0(Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzComboEntranceView;IIILjava/lang/String;ZILjava/lang/Object;)V

    .line 123
    .line 124
    .line 125
    if-eqz p4, :cond_c

    .line 126
    .line 127
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzComboEntranceView;->getIcon()Landroid/view/View;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    const/4 p1, 0x3

    .line 132
    if-ge p3, p1, :cond_b

    .line 133
    .line 134
    sget p1, Ll/qa00;->K:I

    .line 135
    .line 136
    goto :goto_b

    .line 137
    :cond_b
    sget p1, Ll/qa00;->G:I

    .line 138
    .line 139
    :goto_b
    invoke-static {p0, p1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 140
    .line 141
    .line 142
    :cond_c
    return-object v0

    .line 143
    :cond_d
    :goto_c
    const/4 p0, 0x0

    .line 144
    return-object p0
.end method
