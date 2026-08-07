.class public final Ll/vpr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xor0;


# instance fields
.field public final a:Ll/bgw0;

.field public final b:Ll/bgw0;

.field public final c:Ll/upr0;

.field public d:Ljava/util/zip/Inflater;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/bgw0;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/bgw0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/vpr0;->a:Ll/bgw0;

    .line 10
    .line 11
    new-instance v0, Ll/bgw0;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/bgw0;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/vpr0;->b:Ll/bgw0;

    .line 17
    .line 18
    new-instance v0, Ll/upr0;

    .line 19
    .line 20
    invoke-direct {v0}, Ll/upr0;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/vpr0;->c:Ll/upr0;

    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public final a([BIILl/wor0;Ll/hkv0;)V
    .locals 6

    .line 1
    add-int/2addr p3, p2

    .line 2
    iget-object p4, p0, Ll/vpr0;->a:Ll/bgw0;

    .line 3
    .line 4
    invoke-virtual {p4, p1, p3}, Ll/bgw0;->i([BI)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/vpr0;->a:Ll/bgw0;

    .line 8
    .line 9
    invoke-virtual {p1, p2}, Ll/bgw0;->k(I)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ll/vpr0;->a:Ll/bgw0;

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/bgw0;->q()I

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    if-lez p2, :cond_1

    .line 19
    .line 20
    invoke-virtual {p1}, Ll/bgw0;->u()I

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    const/16 p3, 0x78

    .line 25
    .line 26
    if-ne p2, p3, :cond_1

    .line 27
    .line 28
    iget-object p2, p0, Ll/vpr0;->d:Ljava/util/zip/Inflater;

    .line 29
    .line 30
    if-nez p2, :cond_0

    .line 31
    .line 32
    new-instance p2, Ljava/util/zip/Inflater;

    .line 33
    .line 34
    invoke-direct {p2}, Ljava/util/zip/Inflater;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object p2, p0, Ll/vpr0;->d:Ljava/util/zip/Inflater;

    .line 38
    .line 39
    :cond_0
    iget-object p2, p0, Ll/vpr0;->b:Ll/bgw0;

    .line 40
    .line 41
    iget-object p3, p0, Ll/vpr0;->d:Ljava/util/zip/Inflater;

    .line 42
    .line 43
    invoke-static {p1, p2, p3}, Ll/mpw0;->g(Ll/bgw0;Ll/bgw0;Ljava/util/zip/Inflater;)Z

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    if-eqz p2, :cond_1

    .line 48
    .line 49
    iget-object p2, p0, Ll/vpr0;->b:Ll/bgw0;

    .line 50
    .line 51
    invoke-virtual {p2}, Ll/bgw0;->m()[B

    .line 52
    .line 53
    .line 54
    move-result-object p3

    .line 55
    invoke-virtual {p2}, Ll/bgw0;->t()I

    .line 56
    .line 57
    .line 58
    move-result p2

    .line 59
    invoke-virtual {p1, p3, p2}, Ll/bgw0;->i([BI)V

    .line 60
    .line 61
    .line 62
    :cond_1
    iget-object p1, p0, Ll/vpr0;->c:Ll/upr0;

    .line 63
    .line 64
    invoke-virtual {p1}, Ll/upr0;->e()V

    .line 65
    .line 66
    .line 67
    new-instance v1, Ljava/util/ArrayList;

    .line 68
    .line 69
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 70
    .line 71
    .line 72
    :cond_2
    :goto_0
    iget-object p1, p0, Ll/vpr0;->a:Ll/bgw0;

    .line 73
    .line 74
    invoke-virtual {p1}, Ll/bgw0;->q()I

    .line 75
    .line 76
    .line 77
    move-result p2

    .line 78
    const/4 p3, 0x3

    .line 79
    if-lt p2, p3, :cond_5

    .line 80
    .line 81
    iget-object p2, p0, Ll/vpr0;->c:Ll/upr0;

    .line 82
    .line 83
    invoke-virtual {p1}, Ll/bgw0;->t()I

    .line 84
    .line 85
    .line 86
    move-result p3

    .line 87
    invoke-virtual {p1}, Ll/bgw0;->B()I

    .line 88
    .line 89
    .line 90
    move-result p4

    .line 91
    invoke-virtual {p1}, Ll/bgw0;->F()I

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    invoke-virtual {p1}, Ll/bgw0;->s()I

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    add-int/2addr v2, v0

    .line 100
    const/4 v3, 0x0

    .line 101
    if-le v2, p3, :cond_3

    .line 102
    .line 103
    invoke-virtual {p1, p3}, Ll/bgw0;->k(I)V

    .line 104
    .line 105
    .line 106
    goto :goto_2

    .line 107
    :cond_3
    const/16 p3, 0x80

    .line 108
    .line 109
    if-eq p4, p3, :cond_4

    .line 110
    .line 111
    packed-switch p4, :pswitch_data_0

    .line 112
    .line 113
    .line 114
    goto :goto_1

    .line 115
    :pswitch_0
    invoke-static {p2, p1, v0}, Ll/upr0;->c(Ll/upr0;Ll/bgw0;I)V

    .line 116
    .line 117
    .line 118
    goto :goto_1

    .line 119
    :pswitch_1
    invoke-static {p2, p1, v0}, Ll/upr0;->b(Ll/upr0;Ll/bgw0;I)V

    .line 120
    .line 121
    .line 122
    goto :goto_1

    .line 123
    :pswitch_2
    invoke-static {p2, p1, v0}, Ll/upr0;->d(Ll/upr0;Ll/bgw0;I)V

    .line 124
    .line 125
    .line 126
    goto :goto_1

    .line 127
    :cond_4
    invoke-virtual {p2}, Ll/upr0;->a()Ll/u4v0;

    .line 128
    .line 129
    .line 130
    move-result-object v3

    .line 131
    invoke-virtual {p2}, Ll/upr0;->e()V

    .line 132
    .line 133
    .line 134
    :goto_1
    invoke-virtual {p1, v2}, Ll/bgw0;->k(I)V

    .line 135
    .line 136
    .line 137
    :goto_2
    if-eqz v3, :cond_2

    .line 138
    .line 139
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    goto :goto_0

    .line 143
    :cond_5
    new-instance v0, Ll/qor0;

    .line 144
    .line 145
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 146
    .line 147
    .line 148
    .line 149
    .line 150
    move-wide v4, v2

    .line 151
    invoke-direct/range {v0 .. v5}, Ll/qor0;-><init>(Ljava/util/List;JJ)V

    .line 152
    .line 153
    .line 154
    invoke-interface {p5, v0}, Ll/hkv0;->zza(Ljava/lang/Object;)V

    .line 155
    .line 156
    .line 157
    return-void

    .line 158
    nop

    .line 159
    :pswitch_data_0
    .packed-switch 0x14
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
