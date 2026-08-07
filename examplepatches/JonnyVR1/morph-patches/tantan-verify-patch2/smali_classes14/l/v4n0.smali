.class public Ll/v4n0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/bno0;

.field public b:Landroid/view/View;

.field public c:I

.field public d:Landroid/widget/TextView;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lv/VDraweeView;",
            ">;"
        }
    .end annotation
.end field

.field public h:Landroid/widget/TextView;

.field public i:Landroid/widget/TextView;

.field public j:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public k:Lcom/p1/mobile/putong/data/PushMessageCustom;

.field public l:Lcom/p1/mobile/putong/data/PushMessage;


# direct methods
.method public constructor <init>(Ll/bno0;Landroid/view/View;ILcom/p1/mobile/putong/data/PushMessage;)V
    .locals 6

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/v4n0;->c:I

    .line 6
    .line 7
    new-instance v0, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/v4n0;->g:Ljava/util/List;

    .line 13
    .line 14
    iput-object p1, p0, Ll/v4n0;->a:Ll/bno0;

    .line 15
    .line 16
    iput-object p2, p0, Ll/v4n0;->b:Landroid/view/View;

    .line 17
    .line 18
    iput-object p4, p0, Ll/v4n0;->l:Lcom/p1/mobile/putong/data/PushMessage;

    .line 19
    .line 20
    iget-object p1, p4, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 21
    .line 22
    iput-object p1, p0, Ll/v4n0;->k:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 23
    .line 24
    iput p3, p0, Ll/v4n0;->c:I

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/v4n0;->d()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ll/v4n0;->g()V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Ll/v4n0;->k:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 33
    .line 34
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveId:Ljava/lang/String;

    .line 35
    .line 36
    iget-object v1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->userId:Ljava/lang/String;

    .line 37
    .line 38
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherID:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    iget-object p0, p0, Ll/v4n0;->k:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 45
    .line 46
    iget-object v5, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->source:Ljava/lang/String;

    .line 47
    .line 48
    const-string v2, "NA"

    .line 49
    .line 50
    const/4 v4, 0x1

    .line 51
    invoke-static/range {v0 .. v5}, Ll/s4n0;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLjava/lang/String;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public static synthetic a(Ll/v4n0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v4n0;->e(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/v4n0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v4n0;->f(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final c()V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/v4n0;->l:Lcom/p1/mobile/putong/data/PushMessage;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_3

    .line 12
    .line 13
    iget-object v0, p0, Ll/v4n0;->h:Landroid/widget/TextView;

    .line 14
    .line 15
    if-eqz v0, :cond_3

    .line 16
    .line 17
    if-eqz v1, :cond_3

    .line 18
    .line 19
    iget-object v0, p0, Ll/v4n0;->l:Lcom/p1/mobile/putong/data/PushMessage;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 22
    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    const-string v2, "source="

    .line 26
    .line 27
    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    iget-object v0, p0, Ll/v4n0;->l:Lcom/p1/mobile/putong/data/PushMessage;

    .line 34
    .line 35
    new-instance v2, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 38
    .line 39
    .line 40
    iget-object v3, p0, Ll/v4n0;->l:Lcom/p1/mobile/putong/data/PushMessage;

    .line 41
    .line 42
    iget-object v3, v3, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const-string v3, "&source=start-push"

    .line 48
    .line 49
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    iput-object v2, v0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 57
    .line 58
    :cond_0
    iget-object v0, p0, Ll/v4n0;->l:Lcom/p1/mobile/putong/data/PushMessage;

    .line 59
    .line 60
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 61
    .line 62
    if-eqz v0, :cond_1

    .line 63
    .line 64
    const-string v2, "liveMode=virtualAvatar"

    .line 65
    .line 66
    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-nez v0, :cond_1

    .line 71
    .line 72
    iget-object v0, p0, Ll/v4n0;->l:Lcom/p1/mobile/putong/data/PushMessage;

    .line 73
    .line 74
    new-instance v2, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 77
    .line 78
    .line 79
    iget-object v3, p0, Ll/v4n0;->l:Lcom/p1/mobile/putong/data/PushMessage;

    .line 80
    .line 81
    iget-object v3, v3, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    const-string v3, "&liveMode=virtualAvatar"

    .line 87
    .line 88
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    iput-object v2, v0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 96
    .line 97
    :cond_1
    iget-object v0, p0, Ll/v4n0;->l:Lcom/p1/mobile/putong/data/PushMessage;

    .line 98
    .line 99
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 100
    .line 101
    if-eqz v0, :cond_2

    .line 102
    .line 103
    const-string v2, "from="

    .line 104
    .line 105
    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    if-nez v0, :cond_2

    .line 110
    .line 111
    iget-object v0, p0, Ll/v4n0;->l:Lcom/p1/mobile/putong/data/PushMessage;

    .line 112
    .line 113
    new-instance v2, Ljava/lang/StringBuilder;

    .line 114
    .line 115
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 116
    .line 117
    .line 118
    iget-object v3, p0, Ll/v4n0;->l:Lcom/p1/mobile/putong/data/PushMessage;

    .line 119
    .line 120
    iget-object v3, v3, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 121
    .line 122
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    const-string v3, "&from=from_in_app_push"

    .line 126
    .line 127
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v2

    .line 134
    iput-object v2, v0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 135
    .line 136
    :cond_2
    iget-object v0, p0, Ll/v4n0;->a:Ll/bno0;

    .line 137
    .line 138
    const/4 v2, 0x0

    .line 139
    invoke-virtual {v0, v2}, Ll/bno0;->b(I)V

    .line 140
    .line 141
    .line 142
    iget-object v0, p0, Ll/v4n0;->h:Landroid/widget/TextView;

    .line 143
    .line 144
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    iget-object v2, p0, Ll/v4n0;->l:Lcom/p1/mobile/putong/data/PushMessage;

    .line 149
    .line 150
    iget-object v2, v2, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 151
    .line 152
    invoke-static {v0, v2}, Ll/s4n0;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    iget-object v3, v1, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveId:Ljava/lang/String;

    .line 156
    .line 157
    iget-object v4, v1, Lcom/p1/mobile/putong/data/PushMessageCustom;->userId:Ljava/lang/String;

    .line 158
    .line 159
    iget-object v0, v1, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherID:Ljava/lang/String;

    .line 160
    .line 161
    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    move-result v6

    .line 165
    iget v8, p0, Ll/v4n0;->c:I

    .line 166
    .line 167
    iget-object v9, v1, Lcom/p1/mobile/putong/data/PushMessageCustom;->source:Ljava/lang/String;

    .line 168
    .line 169
    const-string v5, "NA"

    .line 170
    .line 171
    const/4 v7, 0x1

    .line 172
    invoke-static/range {v3 .. v9}, Ll/s4n0;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZILjava/lang/String;)V

    .line 173
    .line 174
    .line 175
    :cond_3
    return-void
.end method

.method public final d()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/v4n0;->b:Landroid/view/View;

    .line 2
    .line 3
    sget v1, Ll/ldc0;->o2:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Landroid/widget/TextView;

    .line 10
    .line 11
    iput-object v0, p0, Ll/v4n0;->d:Landroid/widget/TextView;

    .line 12
    .line 13
    iget-object v0, p0, Ll/v4n0;->b:Landroid/view/View;

    .line 14
    .line 15
    sget v1, Ll/ldc0;->n2:I

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lv/VText;

    .line 22
    .line 23
    iput-object v0, p0, Ll/v4n0;->e:Lv/VText;

    .line 24
    .line 25
    iget-object v0, p0, Ll/v4n0;->b:Landroid/view/View;

    .line 26
    .line 27
    sget v1, Ll/ldc0;->W1:I

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Landroid/widget/TextView;

    .line 34
    .line 35
    iput-object v0, p0, Ll/v4n0;->h:Landroid/widget/TextView;

    .line 36
    .line 37
    iget-object v0, p0, Ll/v4n0;->g:Ljava/util/List;

    .line 38
    .line 39
    iget-object v1, p0, Ll/v4n0;->b:Landroid/view/View;

    .line 40
    .line 41
    sget v2, Ll/ldc0;->l:I

    .line 42
    .line 43
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    check-cast v1, Lv/VDraweeView;

    .line 48
    .line 49
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/v4n0;->g:Ljava/util/List;

    .line 53
    .line 54
    iget-object v1, p0, Ll/v4n0;->b:Landroid/view/View;

    .line 55
    .line 56
    sget v2, Ll/ldc0;->m:I

    .line 57
    .line 58
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    check-cast v1, Lv/VDraweeView;

    .line 63
    .line 64
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Ll/v4n0;->g:Ljava/util/List;

    .line 68
    .line 69
    iget-object v1, p0, Ll/v4n0;->b:Landroid/view/View;

    .line 70
    .line 71
    sget v2, Ll/ldc0;->n:I

    .line 72
    .line 73
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    check-cast v1, Lv/VDraweeView;

    .line 78
    .line 79
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Ll/v4n0;->g:Ljava/util/List;

    .line 83
    .line 84
    iget-object v1, p0, Ll/v4n0;->b:Landroid/view/View;

    .line 85
    .line 86
    sget v2, Ll/ldc0;->o:I

    .line 87
    .line 88
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    check-cast v1, Lv/VDraweeView;

    .line 93
    .line 94
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Ll/v4n0;->g:Ljava/util/List;

    .line 98
    .line 99
    iget-object v1, p0, Ll/v4n0;->b:Landroid/view/View;

    .line 100
    .line 101
    sget v2, Ll/ldc0;->p:I

    .line 102
    .line 103
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    check-cast v1, Lv/VDraweeView;

    .line 108
    .line 109
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    iget-object v0, p0, Ll/v4n0;->g:Ljava/util/List;

    .line 113
    .line 114
    iget-object v1, p0, Ll/v4n0;->b:Landroid/view/View;

    .line 115
    .line 116
    sget v2, Ll/ldc0;->q:I

    .line 117
    .line 118
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    check-cast v1, Lv/VDraweeView;

    .line 123
    .line 124
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    iget-object v0, p0, Ll/v4n0;->b:Landroid/view/View;

    .line 128
    .line 129
    sget v1, Ll/ldc0;->m2:I

    .line 130
    .line 131
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    check-cast v0, Landroid/widget/TextView;

    .line 136
    .line 137
    iput-object v0, p0, Ll/v4n0;->i:Landroid/widget/TextView;

    .line 138
    .line 139
    iget-object v0, p0, Ll/v4n0;->b:Landroid/view/View;

    .line 140
    .line 141
    sget v1, Ll/ldc0;->h:I

    .line 142
    .line 143
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    check-cast v0, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 148
    .line 149
    iput-object v0, p0, Ll/v4n0;->j:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 150
    .line 151
    iget-object v0, p0, Ll/v4n0;->b:Landroid/view/View;

    .line 152
    .line 153
    sget v1, Ll/ldc0;->i2:I

    .line 154
    .line 155
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    check-cast v0, Lv/VText;

    .line 160
    .line 161
    iput-object v0, p0, Ll/v4n0;->f:Lv/VText;

    .line 162
    .line 163
    return-void
.end method

.method public final synthetic e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/v4n0;->c()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic f(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/v4n0;->c()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final g()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/v4n0;->k:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->avatars:Ljava/lang/String;

    .line 4
    .line 5
    const-string v1, ","

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x0

    .line 12
    :goto_0
    iget-object v2, p0, Ll/v4n0;->g:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-ge v1, v2, :cond_1

    .line 19
    .line 20
    array-length v2, v0

    .line 21
    if-ge v1, v2, :cond_0

    .line 22
    .line 23
    iget-object v2, p0, Ll/v4n0;->g:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 30
    .line 31
    aget-object v3, v0, v1

    .line 32
    .line 33
    const-string v4, "context_livingAct"

    .line 34
    .line 35
    invoke-static {v4, v2, v3}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    iget-object v0, p0, Ll/v4n0;->d:Landroid/widget/TextView;

    .line 42
    .line 43
    const-string v1, "\u5728\u7ebf\u804a\u5929\u5ba4"

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/v4n0;->e:Lv/VText;

    .line 49
    .line 50
    iget-object v1, p0, Ll/v4n0;->k:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 51
    .line 52
    iget-object v1, v1, Lcom/p1/mobile/putong/data/PushMessageCustom;->text:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/v4n0;->h:Landroid/widget/TextView;

    .line 58
    .line 59
    iget-object v1, p0, Ll/v4n0;->k:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 60
    .line 61
    iget-object v1, v1, Lcom/p1/mobile/putong/data/PushMessageCustom;->buttonText:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Ll/v4n0;->i:Landroid/widget/TextView;

    .line 67
    .line 68
    iget-object v1, p0, Ll/v4n0;->k:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 69
    .line 70
    iget-object v1, v1, Lcom/p1/mobile/putong/data/PushMessageCustom;->title:Ljava/lang/String;

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Ll/v4n0;->j:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 76
    .line 77
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    const-string v1, "https://auto.tancdn.com/v1/raw/e90eea29-f0ff-4ceb-88b8-066d6ea743bb12.pdf"

    .line 86
    .line 87
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    iget-object v1, p0, Ll/v4n0;->j:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 92
    .line 93
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Ll/v4n0;->f:Lv/VText;

    .line 97
    .line 98
    iget-object v1, p0, Ll/v4n0;->k:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 99
    .line 100
    iget-object v1, v1, Lcom/p1/mobile/putong/data/PushMessageCustom;->subTitle:Ljava/lang/String;

    .line 101
    .line 102
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 103
    .line 104
    .line 105
    iget-object v0, p0, Ll/v4n0;->h:Landroid/widget/TextView;

    .line 106
    .line 107
    new-instance v1, Ll/t4n0;

    .line 108
    .line 109
    invoke-direct {v1, p0}, Ll/t4n0;-><init>(Ll/v4n0;)V

    .line 110
    .line 111
    .line 112
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 113
    .line 114
    .line 115
    iget-object v0, p0, Ll/v4n0;->b:Landroid/view/View;

    .line 116
    .line 117
    new-instance v1, Ll/u4n0;

    .line 118
    .line 119
    invoke-direct {v1, p0}, Ll/u4n0;-><init>(Ll/v4n0;)V

    .line 120
    .line 121
    .line 122
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 123
    .line 124
    .line 125
    return-void
.end method
