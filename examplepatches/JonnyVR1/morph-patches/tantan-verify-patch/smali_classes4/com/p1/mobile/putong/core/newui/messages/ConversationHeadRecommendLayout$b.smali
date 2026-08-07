.class public Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;",
        ">;"
    }
.end annotation


# instance fields
.field public final c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final synthetic e:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->e:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->c:Ljava/util/List;

    .line 12
    .line 13
    new-instance v0, Ljava/util/HashSet;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->d:Ljava/util/Set;

    .line 19
    .line 20
    new-instance p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 21
    .line 22
    const/16 v0, 0xc

    .line 23
    .line 24
    const-string v1, ""

    .line 25
    .line 26
    invoke-direct {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;-><init>(ILjava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static synthetic E(Ljava/lang/String;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->d:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    iget p0, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->a:I

    .line 16
    .line 17
    const/4 p1, 0x1

    .line 18
    if-eq p0, p1, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 p1, 0x0

    .line 22
    :goto_0
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->N(Ljava/lang/String;Z)V

    return-void
.end method

.method public static synthetic G(Ljava/lang/String;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->d:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public static bridge synthetic H(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->c:Ljava/util/List;

    return-object p0
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->I(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 3

    .line 1
    sget v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->G:I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->e:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-ne p2, v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->P()Lcom/p1/mobile/putong/app/PutongAct;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    sget p2, Ll/kec0;->Ob:I

    .line 17
    .line 18
    invoke-virtual {p0, p2, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0

    .line 23
    :cond_0
    invoke-static {v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->M(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->e:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->P()Lcom/p1/mobile/putong/app/PutongAct;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    sget p2, Ll/kec0;->Nb:I

    .line 40
    .line 41
    invoke-virtual {p0, p2, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0

    .line 46
    :cond_1
    const/4 v0, 0x1

    .line 47
    if-eq p2, v0, :cond_9

    .line 48
    .line 49
    const/16 v0, 0xe

    .line 50
    .line 51
    if-ne p2, v0, :cond_2

    .line 52
    .line 53
    goto/16 :goto_0

    .line 54
    .line 55
    :cond_2
    const/16 v0, 0x9

    .line 56
    .line 57
    if-ne p2, v0, :cond_3

    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->e:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->P()Lcom/p1/mobile/putong/app/PutongAct;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    sget p2, Ll/kec0;->R3:I

    .line 70
    .line 71
    invoke-virtual {p0, p2, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    return-object p0

    .line 76
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->e:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 77
    .line 78
    const/16 v1, 0xa

    .line 79
    .line 80
    if-ne p2, v1, :cond_4

    .line 81
    .line 82
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->P()Lcom/p1/mobile/putong/app/PutongAct;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    sget p2, Ll/kec0;->D:I

    .line 91
    .line 92
    invoke-virtual {p0, p2, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    return-object p0

    .line 97
    :cond_4
    invoke-static {v0, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->N(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;I)Z

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    if-eqz v0, :cond_5

    .line 102
    .line 103
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->e:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 104
    .line 105
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->P()Lcom/p1/mobile/putong/app/PutongAct;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    sget p2, Ll/kec0;->a2:I

    .line 114
    .line 115
    invoke-virtual {p0, p2, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    return-object p0

    .line 120
    :cond_5
    const/16 v0, 0x14

    .line 121
    .line 122
    if-ne p2, v0, :cond_6

    .line 123
    .line 124
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->e:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 125
    .line 126
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->P()Lcom/p1/mobile/putong/app/PutongAct;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    sget p2, Ll/kec0;->G1:I

    .line 135
    .line 136
    invoke-virtual {p0, p2, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    return-object p0

    .line 141
    :cond_6
    const/16 v0, 0x16

    .line 142
    .line 143
    if-ne p2, v0, :cond_7

    .line 144
    .line 145
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->e:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 146
    .line 147
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->P()Lcom/p1/mobile/putong/app/PutongAct;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    sget p2, Ll/kec0;->F1:I

    .line 156
    .line 157
    invoke-virtual {p0, p2, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    return-object p0

    .line 162
    :cond_7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->e:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 163
    .line 164
    const/16 v0, 0x18

    .line 165
    .line 166
    if-ne p2, v0, :cond_8

    .line 167
    .line 168
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->P()Lcom/p1/mobile/putong/app/PutongAct;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 173
    .line 174
    .line 175
    move-result-object p0

    .line 176
    sget p2, Ll/kec0;->H1:I

    .line 177
    .line 178
    invoke-virtual {p0, p2, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 179
    .line 180
    .line 181
    move-result-object p0

    .line 182
    return-object p0

    .line 183
    :cond_8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->P()Lcom/p1/mobile/putong/app/PutongAct;

    .line 184
    .line 185
    .line 186
    move-result-object p0

    .line 187
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 188
    .line 189
    .line 190
    move-result-object p0

    .line 191
    sget p2, Ll/kec0;->Mb:I

    .line 192
    .line 193
    invoke-virtual {p0, p2, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 194
    .line 195
    .line 196
    move-result-object p0

    .line 197
    return-object p0

    .line 198
    :cond_9
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->e:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 199
    .line 200
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->P()Lcom/p1/mobile/putong/app/PutongAct;

    .line 201
    .line 202
    .line 203
    move-result-object p0

    .line 204
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 205
    .line 206
    .line 207
    move-result-object p0

    .line 208
    sget p2, Ll/kec0;->V1:I

    .line 209
    .line 210
    invoke-virtual {p0, p2, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 211
    .line 212
    .line 213
    move-result-object p0

    .line 214
    return-object p0
.end method

.method public I(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;II)V
    .locals 1

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->S(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    sget v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->G:I

    .line 8
    .line 9
    if-ne p3, v0, :cond_1

    .line 10
    .line 11
    check-cast p1, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->e:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 14
    .line 15
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->m:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->j:Lcom/tantan/library/svga/SVGAnimationView;

    .line 18
    .line 19
    invoke-virtual {p1, p3, p2, p0}, Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;->o(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->e:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->M(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->W(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_2
    const/4 v0, 0x1

    .line 36
    if-eq p3, v0, :cond_b

    .line 37
    .line 38
    const/16 v0, 0xe

    .line 39
    .line 40
    if-ne p3, v0, :cond_3

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_3
    const/16 v0, 0x9

    .line 44
    .line 45
    if-ne p3, v0, :cond_4

    .line 46
    .line 47
    check-cast p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadIntlSeeItem;

    .line 48
    .line 49
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadIntlSeeItem;->L(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_4
    const/16 v0, 0xa

    .line 54
    .line 55
    if-ne p3, v0, :cond_5

    .line 56
    .line 57
    invoke-virtual {p0, p1, p2, p4}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->P(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;I)V

    .line 58
    .line 59
    .line 60
    invoke-static {}, Ll/gra;->z()Z

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    if-eqz p0, :cond_a

    .line 65
    .line 66
    sget p0, Ll/dbc0;->Eh:I

    .line 67
    .line 68
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->e:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 73
    .line 74
    invoke-static {v0, p3}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->N(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;I)Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-eqz v0, :cond_6

    .line 79
    .line 80
    invoke-virtual {p0, p1, p2, p4}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->Y(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;I)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_6
    const/16 v0, 0x14

    .line 85
    .line 86
    if-ne p3, v0, :cond_7

    .line 87
    .line 88
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->T(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V

    .line 89
    .line 90
    .line 91
    invoke-static {}, Ll/gra;->z()Z

    .line 92
    .line 93
    .line 94
    move-result p0

    .line 95
    if-eqz p0, :cond_a

    .line 96
    .line 97
    sget p0, Ll/dbc0;->Eh:I

    .line 98
    .line 99
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_7
    const/16 v0, 0x16

    .line 104
    .line 105
    if-ne p3, v0, :cond_8

    .line 106
    .line 107
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->Q(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V

    .line 108
    .line 109
    .line 110
    invoke-static {}, Ll/gra;->z()Z

    .line 111
    .line 112
    .line 113
    move-result p0

    .line 114
    if-eqz p0, :cond_a

    .line 115
    .line 116
    sget p0, Ll/dbc0;->Eh:I

    .line 117
    .line 118
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 119
    .line 120
    .line 121
    return-void

    .line 122
    :cond_8
    const/16 v0, 0x18

    .line 123
    .line 124
    if-ne p3, v0, :cond_9

    .line 125
    .line 126
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->R(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V

    .line 127
    .line 128
    .line 129
    return-void

    .line 130
    :cond_9
    invoke-virtual {p0, p1, p2, p4}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->X(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;I)V

    .line 131
    .line 132
    .line 133
    invoke-static {}, Ll/gra;->z()Z

    .line 134
    .line 135
    .line 136
    move-result p0

    .line 137
    if-eqz p0, :cond_a

    .line 138
    .line 139
    sget p0, Ll/dbc0;->Eh:I

    .line 140
    .line 141
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 142
    .line 143
    .line 144
    :cond_a
    return-void

    .line 145
    :cond_b
    :goto_0
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->V(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V

    .line 146
    .line 147
    .line 148
    return-void
.end method

.method public J()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->d:Ljava/util/Set;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/Set;->clear()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public K()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->e:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->P()Lcom/p1/mobile/putong/app/PutongAct;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public L()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->c:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public M(I)Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic N(Ljava/lang/String;Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->e:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->K(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;)Lrx/subjects/a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/util/List;

    .line 12
    .line 13
    new-instance v1, Ll/d96;

    .line 14
    .line 15
    invoke-direct {v1, p1}, Ll/d96;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-ltz v1, :cond_1

    .line 23
    .line 24
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 29
    .line 30
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    if-eqz v3, :cond_0

    .line 35
    .line 36
    if-eqz p2, :cond_0

    .line 37
    .line 38
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->b()Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    if-eqz v2, :cond_0

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->c:Ljava/util/List;

    .line 49
    .line 50
    new-instance v1, Ll/e96;

    .line 51
    .line 52
    invoke-direct {v1, p1}, Ll/e96;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v0, v1}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-ltz p1, :cond_4

    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->c:Ljava/util/List;

    .line 62
    .line 63
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 68
    .line 69
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    if-eqz v1, :cond_2

    .line 74
    .line 75
    if-eqz p2, :cond_2

    .line 76
    .line 77
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->b()Z

    .line 78
    .line 79
    .line 80
    move-result p2

    .line 81
    if-eqz p2, :cond_2

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_2
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->c:Ljava/util/List;

    .line 85
    .line 86
    invoke-interface {p2, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->c:Ljava/util/List;

    .line 90
    .line 91
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    if-eqz p1, :cond_3

    .line 96
    .line 97
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->c:Ljava/util/List;

    .line 98
    .line 99
    new-instance p2, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 100
    .line 101
    const/4 v0, 0x0

    .line 102
    const-string v1, ""

    .line 103
    .line 104
    invoke-direct {p2, v0, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;-><init>(ILjava/lang/String;)V

    .line 105
    .line 106
    .line 107
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    :cond_3
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 111
    .line 112
    .line 113
    :cond_4
    :goto_0
    return-void
.end method

.method public O(Ljava/lang/String;Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->e:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->P()Lcom/p1/mobile/putong/app/PutongAct;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/c96;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1, p2}, Ll/c96;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Ljava/lang/String;Z)V

    .line 10
    .line 11
    .line 12
    const-wide/16 p0, 0x64

    .line 13
    .line 14
    invoke-static {v0, v1, p0, p1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final P(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;I)V
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->e:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->m:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;

    .line 10
    .line 11
    invoke-virtual {p1, p0, p2, p3}, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->Z(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final Q(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadBackUserTipLayout;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadBackUserTipLayout;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->e:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->P()Lcom/p1/mobile/putong/app/PutongAct;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p1, p0, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadBackUserTipLayout;->z(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final R(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->e:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->P()Lcom/p1/mobile/putong/app/PutongAct;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    iget-object p2, p2, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->d:Ljava/lang/String;

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    invoke-virtual {p1, p0, p2, v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;->l(Ll/ner;Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final S(Landroid/view/View;)V
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->F()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final T(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadLikerItemLayout;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadLikerItemLayout;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->e:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->P()Lcom/p1/mobile/putong/app/PutongAct;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p1, p0, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadLikerItemLayout;->u(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public U(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->c:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final V(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->e:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 6
    .line 7
    check-cast p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;

    .line 8
    .line 9
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->L(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->e:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 13
    .line 14
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->G(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;)Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->e:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 25
    .line 26
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->G(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;)Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->e:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->P()Lcom/p1/mobile/putong/app/PutongAct;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->e:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 37
    .line 38
    invoke-virtual {p1, v0, p0, p2}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->P(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V

    .line 39
    .line 40
    .line 41
    :cond_1
    return-void
.end method

.method public final W(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->e:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->m:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;

    .line 10
    .line 11
    invoke-virtual {p1, v0, p0, p2}, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->a0(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final X(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;I)V
    .locals 0

    .line 1
    instance-of p3, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->e:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 8
    .line 9
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->m:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;

    .line 10
    .line 11
    invoke-virtual {p1, p3, p0, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->X(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final Y(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;I)V
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;

    .line 6
    .line 7
    invoke-virtual {p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;->D0(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->M(I)Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemViewType(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 8
    .line 9
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->a:I

    .line 10
    .line 11
    sget p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->D:I

    .line 12
    .line 13
    if-eq p0, p1, :cond_1

    .line 14
    .line 15
    sget p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->E:I

    .line 16
    .line 17
    if-eq p0, p1, :cond_1

    .line 18
    .line 19
    sget p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->F:I

    .line 20
    .line 21
    if-ne p0, p1, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    return p0

    .line 25
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 26
    return p0
.end method
