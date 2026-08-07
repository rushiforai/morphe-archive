.class public Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/messages/a;
.implements Landroid/view/View$OnClickListener;


# static fields
.field public static final l:Ljava/lang/String; = "ItemAudio"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;

.field public b:Lv/VText;

.field public c:I

.field public d:Lcom/p1/mobile/putong/core/data/Message;

.field public e:Landroid/widget/ImageView;

.field public f:Lv/VText;

.field public g:Lcom/p1/mobile/putong/core/ui/messages/AudioTranslationView;

.field public h:Lcom/p1/mobile/putong/core/ui/messages/AudioView;

.field public i:I

.field public final j:Ll/ga1;

.field public k:Landroid/view/View$OnClickListener;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->i:I

    .line 6
    .line 7
    new-instance p1, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio$b;

    .line 8
    .line 9
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio$b;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;)V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->j:Ll/ga1;

    .line 13
    .line 14
    new-instance p1, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio$c;

    .line 15
    .line 16
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio$c;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;)V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->k:Landroid/view/View$OnClickListener;

    .line 20
    .line 21
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 22
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 23
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->i:I

    .line 24
    new-instance p1, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio$b;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio$b;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->j:Ll/ga1;

    .line 25
    new-instance p1, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio$c;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio$c;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->k:Landroid/view/View$OnClickListener;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 26
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 27
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->i:I

    .line 28
    new-instance p1, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio$b;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio$b;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->j:Ll/ga1;

    .line 29
    new-instance p1, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio$c;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio$c;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->k:Landroid/view/View$OnClickListener;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->j(Lcom/p1/mobile/putong/core/data/Message;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->i(Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;)Lcom/p1/mobile/putong/core/data/Message;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->d:Lcom/p1/mobile/putong/core/data/Message;

    return-object p0
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;Z)Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->h(Z)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->k()V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->l()V

    return-void
.end method

.method private k()V
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->h:Lcom/p1/mobile/putong/core/ui/messages/AudioView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->g()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->l()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->h:Lcom/p1/mobile/putong/core/ui/messages/AudioView;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-virtual {v0, v1}, Landroid/view/View;->setKeepScreenOn(Z)V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Zo()Ll/nam;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-interface {v0, v1}, Ll/nam;->f(Z)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->g()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->u0()Ll/g500;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->d:Lcom/p1/mobile/putong/core/data/Message;

    .line 39
    .line 40
    invoke-virtual {v0, p0}, Ll/g500;->c1(Lcom/p1/mobile/putong/core/data/Message;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :catch_0
    move-exception p0

    .line 45
    new-instance v0, Ljava/lang/Exception;

    .line 46
    .line 47
    new-instance v1, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    const-string v2, "ItemAudio onClick exception:"

    .line 50
    .line 51
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-direct {v0, v1, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 66
    .line 67
    .line 68
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method private l()V
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->h:Lcom/p1/mobile/putong/core/ui/messages/AudioView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setKeepScreenOn(Z)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->g()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->u0()Ll/g500;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/g500;->i1()V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x3

    .line 19
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->n(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :catch_0
    move-exception p0

    .line 24
    new-instance v0, Ljava/lang/Exception;

    .line 25
    .line 26
    new-instance v1, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    const-string v2, "ItemAudio onClick exception:"

    .line 29
    .line 30
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-direct {v0, v1, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 45
    .line 46
    .line 47
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 8

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Lcom/p1/mobile/putong/data/Audio;

    .line 9
    .line 10
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->d:Lcom/p1/mobile/putong/core/data/Message;

    .line 11
    .line 12
    iget v2, v0, Lcom/p1/mobile/putong/data/Audio;->duration:F

    .line 13
    .line 14
    float-to-double v2, v2

    .line 15
    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    .line 16
    .line 17
    .line 18
    move-result-wide v2

    .line 19
    double-to-int v2, v2

    .line 20
    const/4 v3, 0x1

    .line 21
    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    iput v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->c:I

    .line 26
    .line 27
    new-instance v2, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 30
    .line 31
    .line 32
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->c:I

    .line 33
    .line 34
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string v4, "\'\'"

    .line 38
    .line 39
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    invoke-virtual {v4}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    invoke-interface {v4}, Ll/r97;->G1()Z

    .line 55
    .line 56
    .line 57
    move-result v4

    .line 58
    if-nez v4, :cond_0

    .line 59
    .line 60
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    invoke-virtual {v4}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    invoke-interface {v4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 69
    .line 70
    .line 71
    move-result v4

    .line 72
    if-eqz v4, :cond_2

    .line 73
    .line 74
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 75
    .line 76
    .line 77
    move-result-object v4

    .line 78
    check-cast v4, Landroid/view/View;

    .line 79
    .line 80
    sget v5, Ll/edc0;->j:I

    .line 81
    .line 82
    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 83
    .line 84
    .line 85
    move-result-object v4

    .line 86
    check-cast v4, Landroid/widget/ImageView;

    .line 87
    .line 88
    iput-object v4, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->e:Landroid/widget/ImageView;

    .line 89
    .line 90
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    move-result v4

    .line 94
    if-eqz v4, :cond_2

    .line 95
    .line 96
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->e:Landroid/widget/ImageView;

    .line 97
    .line 98
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 99
    .line 100
    .line 101
    move-result-object v5

    .line 102
    invoke-virtual {v5}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 103
    .line 104
    .line 105
    move-result-object v5

    .line 106
    invoke-interface {v5}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 107
    .line 108
    .line 109
    move-result v5

    .line 110
    if-eqz v5, :cond_1

    .line 111
    .line 112
    sget v5, Ll/ibc0;->j7:I

    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_1
    sget v5, Ll/ibc0;->E1:I

    .line 116
    .line 117
    :goto_0
    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 118
    .line 119
    .line 120
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 121
    .line 122
    .line 123
    move-result v4

    .line 124
    if-nez v4, :cond_3

    .line 125
    .line 126
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 127
    .line 128
    .line 129
    move-result-object v4

    .line 130
    check-cast v4, Landroid/view/View;

    .line 131
    .line 132
    sget v5, Ll/edc0;->j:I

    .line 133
    .line 134
    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 135
    .line 136
    .line 137
    move-result-object v4

    .line 138
    check-cast v4, Landroid/widget/ImageView;

    .line 139
    .line 140
    iput-object v4, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->e:Landroid/widget/ImageView;

    .line 141
    .line 142
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->audio()Lcom/p1/mobile/putong/data/Audio;

    .line 143
    .line 144
    .line 145
    move-result-object v5

    .line 146
    iget-boolean v5, v5, Lcom/p1/mobile/putong/data/Audio;->audioRead:Z

    .line 147
    .line 148
    xor-int/2addr v5, v3

    .line 149
    invoke-static {v4, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 150
    .line 151
    .line 152
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->g()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 153
    .line 154
    .line 155
    move-result-object v4

    .line 156
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->u0()Ll/g500;

    .line 157
    .line 158
    .line 159
    move-result-object v4

    .line 160
    iget-wide v5, p1, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 161
    .line 162
    invoke-virtual {v4, v5, v6}, Ll/g500;->N0(J)Z

    .line 163
    .line 164
    .line 165
    move-result v4

    .line 166
    if-eqz v4, :cond_5

    .line 167
    .line 168
    :try_start_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->g()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 169
    .line 170
    .line 171
    move-result-object v4

    .line 172
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->u0()Ll/g500;

    .line 173
    .line 174
    .line 175
    move-result-object v4

    .line 176
    invoke-virtual {v4}, Ll/g500;->I0()Lcom/p1/mobile/android/media/AudioPlayer$State;

    .line 177
    .line 178
    .line 179
    move-result-object v4

    .line 180
    sget-object v5, Lcom/p1/mobile/android/media/AudioPlayer$State;->playing:Lcom/p1/mobile/android/media/AudioPlayer$State;

    .line 181
    .line 182
    if-ne v4, v5, :cond_4

    .line 183
    .line 184
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->g()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 185
    .line 186
    .line 187
    move-result-object v4

    .line 188
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->u0()Ll/g500;

    .line 189
    .line 190
    .line 191
    move-result-object v4

    .line 192
    invoke-virtual {v4}, Ll/g500;->H0()Lcom/p1/mobile/android/media/AudioPlayer;

    .line 193
    .line 194
    .line 195
    move-result-object v4

    .line 196
    invoke-virtual {v4}, Lcom/p1/mobile/android/media/AudioPlayer;->currentPosition()I

    .line 197
    .line 198
    .line 199
    move-result v4

    .line 200
    iget v5, v0, Lcom/p1/mobile/putong/data/Audio;->duration:F

    .line 201
    .line 202
    const/high16 v6, 0x447a0000    # 1000.0f

    .line 203
    .line 204
    mul-float/2addr v5, v6

    .line 205
    float-to-int v5, v5

    .line 206
    sub-int/2addr v5, v4

    .line 207
    if-lez v5, :cond_8

    .line 208
    .line 209
    iget-object v7, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->h:Lcom/p1/mobile/putong/core/ui/messages/AudioView;

    .line 210
    .line 211
    invoke-virtual {v7, v3}, Landroid/view/View;->setKeepScreenOn(Z)V

    .line 212
    .line 213
    .line 214
    iget-object v7, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->h:Lcom/p1/mobile/putong/core/ui/messages/AudioView;

    .line 215
    .line 216
    int-to-float v4, v4

    .line 217
    iget v0, v0, Lcom/p1/mobile/putong/data/Audio;->duration:F

    .line 218
    .line 219
    mul-float/2addr v0, v6

    .line 220
    div-float/2addr v4, v0

    .line 221
    invoke-virtual {v7, v5, v4}, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->j(IF)V

    .line 222
    .line 223
    .line 224
    goto :goto_2

    .line 225
    :catch_0
    move-exception v0

    .line 226
    goto :goto_1

    .line 227
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->h:Lcom/p1/mobile/putong/core/ui/messages/AudioView;

    .line 228
    .line 229
    invoke-virtual {v0, v1}, Landroid/view/View;->setKeepScreenOn(Z)V

    .line 230
    .line 231
    .line 232
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->n(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 233
    .line 234
    .line 235
    goto :goto_2

    .line 236
    :goto_1
    new-instance v4, Ljava/lang/Exception;

    .line 237
    .line 238
    new-instance v5, Ljava/lang/StringBuilder;

    .line 239
    .line 240
    const-string v6, "ItemAudio render exception:"

    .line 241
    .line 242
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 243
    .line 244
    .line 245
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 246
    .line 247
    .line 248
    move-result-object v6

    .line 249
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 250
    .line 251
    .line 252
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object v5

    .line 256
    invoke-direct {v4, v5, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 257
    .line 258
    .line 259
    invoke-static {v4}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 260
    .line 261
    .line 262
    goto :goto_2

    .line 263
    :cond_5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->g()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 264
    .line 265
    .line 266
    move-result-object v0

    .line 267
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->u0()Ll/g500;

    .line 268
    .line 269
    .line 270
    move-result-object v0

    .line 271
    invoke-virtual {v0}, Ll/g500;->I0()Lcom/p1/mobile/android/media/AudioPlayer$State;

    .line 272
    .line 273
    .line 274
    move-result-object v0

    .line 275
    sget-object v4, Lcom/p1/mobile/android/media/AudioPlayer$State;->playing:Lcom/p1/mobile/android/media/AudioPlayer$State;

    .line 276
    .line 277
    const/4 v5, 0x2

    .line 278
    if-ne v0, v4, :cond_6

    .line 279
    .line 280
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->h:Lcom/p1/mobile/putong/core/ui/messages/AudioView;

    .line 281
    .line 282
    invoke-virtual {v0, v3}, Landroid/view/View;->setKeepScreenOn(Z)V

    .line 283
    .line 284
    .line 285
    invoke-virtual {p0, v5}, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->n(I)V

    .line 286
    .line 287
    .line 288
    goto :goto_2

    .line 289
    :cond_6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->g()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 290
    .line 291
    .line 292
    move-result-object v0

    .line 293
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->u0()Ll/g500;

    .line 294
    .line 295
    .line 296
    move-result-object v0

    .line 297
    invoke-virtual {v0}, Ll/g500;->I0()Lcom/p1/mobile/android/media/AudioPlayer$State;

    .line 298
    .line 299
    .line 300
    move-result-object v0

    .line 301
    sget-object v4, Lcom/p1/mobile/android/media/AudioPlayer$State;->stopped:Lcom/p1/mobile/android/media/AudioPlayer$State;

    .line 302
    .line 303
    if-eq v0, v4, :cond_7

    .line 304
    .line 305
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->g()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 306
    .line 307
    .line 308
    move-result-object v0

    .line 309
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->u0()Ll/g500;

    .line 310
    .line 311
    .line 312
    move-result-object v0

    .line 313
    invoke-virtual {v0}, Ll/g500;->I0()Lcom/p1/mobile/android/media/AudioPlayer$State;

    .line 314
    .line 315
    .line 316
    move-result-object v0

    .line 317
    sget-object v4, Lcom/p1/mobile/android/media/AudioPlayer$State;->finished:Lcom/p1/mobile/android/media/AudioPlayer$State;

    .line 318
    .line 319
    if-ne v0, v4, :cond_8

    .line 320
    .line 321
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->h:Lcom/p1/mobile/putong/core/ui/messages/AudioView;

    .line 322
    .line 323
    invoke-virtual {v0, v1}, Landroid/view/View;->setKeepScreenOn(Z)V

    .line 324
    .line 325
    .line 326
    invoke-virtual {p0, v5}, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->n(I)V

    .line 327
    .line 328
    .line 329
    :cond_8
    :goto_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->b:Lv/VText;

    .line 330
    .line 331
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 332
    .line 333
    .line 334
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 335
    .line 336
    .line 337
    move-result-object v0

    .line 338
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 339
    .line 340
    .line 341
    move-result-object v0

    .line 342
    invoke-interface {v0}, Ll/r97;->g1()Z

    .line 343
    .line 344
    .line 345
    move-result v0

    .line 346
    if-eqz v0, :cond_e

    .line 347
    .line 348
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->isOtherUser()Z

    .line 349
    .line 350
    .line 351
    move-result v0

    .line 352
    if-eqz v0, :cond_a

    .line 353
    .line 354
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 355
    .line 356
    .line 357
    move-result-object v0

    .line 358
    check-cast v0, Landroid/view/View;

    .line 359
    .line 360
    sget v2, Ll/edc0;->e0:I

    .line 361
    .line 362
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 363
    .line 364
    .line 365
    move-result-object v0

    .line 366
    check-cast v0, Lv/VText;

    .line 367
    .line 368
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->f:Lv/VText;

    .line 369
    .line 370
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 371
    .line 372
    .line 373
    move-result-object v0

    .line 374
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 375
    .line 376
    .line 377
    move-result-object v0

    .line 378
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 379
    .line 380
    .line 381
    move-result v0

    .line 382
    if-eqz v0, :cond_9

    .line 383
    .line 384
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->f:Lv/VText;

    .line 385
    .line 386
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 387
    .line 388
    .line 389
    move-result-object v2

    .line 390
    sget v4, Ll/g9c0;->i:I

    .line 391
    .line 392
    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 393
    .line 394
    .line 395
    move-result v2

    .line 396
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 397
    .line 398
    .line 399
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->f:Lv/VText;

    .line 400
    .line 401
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->k:Landroid/view/View$OnClickListener;

    .line 402
    .line 403
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 404
    .line 405
    .line 406
    :cond_a
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->g()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 407
    .line 408
    .line 409
    move-result-object v0

    .line 410
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 411
    .line 412
    .line 413
    move-result-object v0

    .line 414
    invoke-virtual {v0, p1}, Ll/clz;->g7(Lcom/p1/mobile/putong/core/data/Message;)Z

    .line 415
    .line 416
    .line 417
    move-result v0

    .line 418
    if-eqz v0, :cond_b

    .line 419
    .line 420
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->g:Lcom/p1/mobile/putong/core/ui/messages/AudioTranslationView;

    .line 421
    .line 422
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->localAudioText:Lcom/p1/mobile/putong/core/data/AudioText;

    .line 423
    .line 424
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/AudioText;->translationResult:Ljava/lang/String;

    .line 425
    .line 426
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/AudioTranslationView;->d(Ljava/lang/String;)V

    .line 427
    .line 428
    .line 429
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->g()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 430
    .line 431
    .line 432
    move-result-object v0

    .line 433
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 434
    .line 435
    .line 436
    move-result-object v0

    .line 437
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 438
    .line 439
    invoke-virtual {v0, v1}, Ll/clz;->o4(Ljava/lang/String;)Z

    .line 440
    .line 441
    .line 442
    move-result v0

    .line 443
    if-eqz v0, :cond_d

    .line 444
    .line 445
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->g:Lcom/p1/mobile/putong/core/ui/messages/AudioTranslationView;

    .line 446
    .line 447
    new-instance v1, Ll/c3q;

    .line 448
    .line 449
    invoke-direct {v1, p0, p1}, Ll/c3q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 450
    .line 451
    .line 452
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 453
    .line 454
    .line 455
    goto :goto_3

    .line 456
    :cond_b
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->g()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 457
    .line 458
    .line 459
    move-result-object v0

    .line 460
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 461
    .line 462
    .line 463
    move-result-object v0

    .line 464
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 465
    .line 466
    invoke-virtual {v0, v2}, Ll/clz;->p4(Ljava/lang/String;)Z

    .line 467
    .line 468
    .line 469
    move-result v0

    .line 470
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->g:Lcom/p1/mobile/putong/core/ui/messages/AudioTranslationView;

    .line 471
    .line 472
    if-eqz v0, :cond_c

    .line 473
    .line 474
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/ui/messages/AudioTranslationView;->setState(I)V

    .line 475
    .line 476
    .line 477
    goto :goto_3

    .line 478
    :cond_c
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/ui/messages/AudioTranslationView;->setState(I)V

    .line 479
    .line 480
    .line 481
    :cond_d
    :goto_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->f:Lv/VText;

    .line 482
    .line 483
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 484
    .line 485
    .line 486
    move-result v0

    .line 487
    if-eqz v0, :cond_e

    .line 488
    .line 489
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->g()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 490
    .line 491
    .line 492
    move-result-object v0

    .line 493
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->u0()Ll/g500;

    .line 494
    .line 495
    .line 496
    move-result-object v0

    .line 497
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->f:Lv/VText;

    .line 498
    .line 499
    invoke-virtual {v0, p1, p0}, Ll/g500;->g1(Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V

    .line 500
    .line 501
    .line 502
    :cond_e
    return-void
.end method

.method public J()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/ovb0<",
            "Ljava/lang/String;",
            "Ljava/lang/Runnable;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Void;",
            ">;>;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public g()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 6
    .line 7
    return-object p0
.end method

.method public final h(Z)Landroid/graphics/drawable/Drawable;
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Ll/ohc0;->a:[I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->d:Lcom/p1/mobile/putong/core/data/Message;

    .line 16
    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    sget p0, Ll/ohc0;->d:I

    .line 26
    .line 27
    invoke-virtual {v0, p0}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0

    .line 32
    :cond_0
    sget p0, Ll/ohc0;->b:I

    .line 33
    .line 34
    invoke-virtual {v0, p0}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0

    .line 39
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-eqz p0, :cond_2

    .line 44
    .line 45
    sget p0, Ll/ohc0;->e:I

    .line 46
    .line 47
    invoke-virtual {v0, p0}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    return-object p0

    .line 52
    :cond_2
    sget p0, Ll/ohc0;->c:I

    .line 53
    .line 54
    invoke-virtual {v0, p0}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    return-object p0
.end method

.method public final synthetic i(Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->R(Landroid/view/View;)Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->onLongClick(Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final synthetic j(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->g()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/clz;->t7()Ll/qzz;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v0, v0, Ll/qzz;->n1:Ll/iwl;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->g()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Ll/clz;->t7()Ll/qzz;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1}, Ll/qzz;->j0()Ll/g900;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v1}, Ll/g900;->a0()Ljava/util/List;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    add-int/lit8 v1, v1, -0x1

    .line 40
    .line 41
    :goto_0
    if-ltz v1, :cond_1

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->g()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-virtual {v2}, Ll/clz;->t7()Ll/qzz;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-virtual {v2}, Ll/qzz;->j0()Ll/g900;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-virtual {v2}, Ll/g900;->a0()Ljava/util/List;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    check-cast v2, Lcom/p1/mobile/putong/core/data/Message;

    .line 68
    .line 69
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 70
    .line 71
    iget-object v3, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 72
    .line 73
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    if-eqz v2, :cond_0

    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_0
    add-int/lit8 v1, v1, -0x1

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_1
    const/4 v1, 0x0

    .line 84
    :goto_1
    invoke-interface {v0}, Ll/iwl;->getHeaderViewsCountHook()I

    .line 85
    .line 86
    .line 87
    move-result p0

    .line 88
    add-int/2addr v1, p0

    .line 89
    invoke-interface {v0}, Ll/iwl;->getFirstVisiblePositionHook()I

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    sub-int/2addr v1, p0

    .line 94
    invoke-interface {v0, v1}, Ll/iwl;->C(I)Landroid/view/View;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    if-nez p0, :cond_2

    .line 99
    .line 100
    goto :goto_2

    .line 101
    :cond_2
    invoke-interface {v0}, Ll/iwl;->getRealView()Landroid/view/ViewGroup;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    invoke-static {p0, p1}, Ll/bnl0;->j0(Landroid/view/View;Landroid/view/View;)Ll/bnl0$g;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    iget p1, p0, Ll/bnl0$g;->b:I

    .line 110
    .line 111
    iget p0, p0, Ll/bnl0$g;->d:I

    .line 112
    .line 113
    add-int/2addr p1, p0

    .line 114
    invoke-interface {v0}, Ll/iwl;->getRealView()Landroid/view/ViewGroup;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 119
    .line 120
    .line 121
    move-result p0

    .line 122
    sub-int/2addr p1, p0

    .line 123
    invoke-interface {v0}, Ll/iwl;->getRealView()Landroid/view/ViewGroup;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 128
    .line 129
    .line 130
    move-result p0

    .line 131
    add-int/2addr p1, p0

    .line 132
    if-lez p1, :cond_3

    .line 133
    .line 134
    const/high16 p0, 0x3f800000    # 1.0f

    .line 135
    .line 136
    int-to-float v1, p1

    .line 137
    mul-float/2addr v1, p0

    .line 138
    sget p0, Ll/qa00;->y:I

    .line 139
    .line 140
    int-to-float p0, p0

    .line 141
    div-float/2addr v1, p0

    .line 142
    const/high16 p0, 0x42c80000    # 100.0f

    .line 143
    .line 144
    mul-float/2addr v1, p0

    .line 145
    float-to-int p0, v1

    .line 146
    const/16 v1, 0xc8

    .line 147
    .line 148
    invoke-static {v1, p0}, Ljava/lang/Math;->min(II)I

    .line 149
    .line 150
    .line 151
    move-result p0

    .line 152
    const/16 v1, 0x32

    .line 153
    .line 154
    invoke-static {v1, p0}, Ljava/lang/Math;->max(II)I

    .line 155
    .line 156
    .line 157
    move-result p0

    .line 158
    invoke-interface {v0, p1, p0}, Ll/iwl;->j(II)V

    .line 159
    .line 160
    .line 161
    :cond_3
    :goto_2
    return-void
.end method

.method public m(IZLcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final n(I)V
    .locals 2

    .line 1
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->l:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/pb1;->e(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->h:Lcom/p1/mobile/putong/core/ui/messages/AudioView;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->k(I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->l:Ljava/lang/String;

    .line 6
    .line 7
    sget-object v1, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->NORMAL:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->j:Ll/ga1;

    .line 10
    .line 11
    invoke-virtual {p1, v0, v1, p0}, Ll/pb1;->f(Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ll/ga1;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    iput-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;

    .line 5
    .line 6
    sget v0, Ll/edc0;->A4:I

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Lv/VText;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->b:Lv/VText;

    .line 15
    .line 16
    sget v0, Ll/edc0;->o:I

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/AudioView;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->h:Lcom/p1/mobile/putong/core/ui/messages/AudioView;

    .line 25
    .line 26
    sget v0, Ll/edc0;->l:I

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Landroid/widget/ImageView;

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->h:Lcom/p1/mobile/putong/core/ui/messages/AudioView;

    .line 35
    .line 36
    new-instance v2, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio$a;

    .line 37
    .line 38
    invoke-direct {v2, p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio$a;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;Landroid/widget/ImageView;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/ui/messages/AudioView;->setAudioListener(Lcom/p1/mobile/putong/core/ui/messages/AudioView$b;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 45
    .line 46
    .line 47
    new-instance v0, Ll/b3q;

    .line 48
    .line 49
    invoke-direct {v0, p0}, Ll/b3q;-><init>(Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public onMeasure(II)V
    .locals 4

    .line 1
    invoke-static {}, Ll/bnl0;->y0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    const v1, 0x3f28f5c3    # 0.66f

    .line 7
    .line 8
    .line 9
    mul-float/2addr v0, v1

    .line 10
    float-to-int v0, v0

    .line 11
    const/high16 v1, 0x42c40000    # 98.0f

    .line 12
    .line 13
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->c:I

    .line 18
    .line 19
    sub-int v3, v0, v1

    .line 20
    .line 21
    mul-int/2addr v2, v3

    .line 22
    div-int/lit8 v2, v2, 0x3c

    .line 23
    .line 24
    add-int/2addr v1, v2

    .line 25
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-interface {v2}, Ll/r97;->g1()Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-eqz v2, :cond_1

    .line 42
    .line 43
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->f:Lv/VText;

    .line 44
    .line 45
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-eqz v2, :cond_1

    .line 50
    .line 51
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->f:Lv/VText;

    .line 52
    .line 53
    invoke-static {v2}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    if-eqz v2, :cond_1

    .line 58
    .line 59
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->f:Lv/VText;

    .line 60
    .line 61
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    if-gtz v2, :cond_0

    .line 66
    .line 67
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->f:Lv/VText;

    .line 68
    .line 69
    invoke-virtual {v2, p1, p2}, Landroid/view/View;->measure(II)V

    .line 70
    .line 71
    .line 72
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->f:Lv/VText;

    .line 73
    .line 74
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    sget v2, Ll/qa00;->h:I

    .line 79
    .line 80
    add-int/2addr p1, v2

    .line 81
    add-int v2, v1, p1

    .line 82
    .line 83
    if-le v2, v0, :cond_1

    .line 84
    .line 85
    sub-int v1, v0, p1

    .line 86
    .line 87
    :cond_1
    invoke-static {v1}, Ll/dox;->b(I)I

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 92
    .line 93
    .line 94
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    invoke-interface {p1}, Ll/r97;->g1()Z

    .line 103
    .line 104
    .line 105
    move-result p1

    .line 106
    if-eqz p1, :cond_2

    .line 107
    .line 108
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->g:Lcom/p1/mobile/putong/core/ui/messages/AudioTranslationView;

    .line 109
    .line 110
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    move-result p1

    .line 114
    if-eqz p1, :cond_2

    .line 115
    .line 116
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->g:Lcom/p1/mobile/putong/core/ui/messages/AudioTranslationView;

    .line 117
    .line 118
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 119
    .line 120
    .line 121
    move-result p0

    .line 122
    sget p2, Ll/qa00;->f:I

    .line 123
    .line 124
    sub-int/2addr p0, p2

    .line 125
    invoke-virtual {p1, p0}, Landroid/view/View;->setMinimumWidth(I)V

    .line 126
    .line 127
    .line 128
    :cond_2
    return-void
.end method

.method public setAudioTranslationView(Lcom/p1/mobile/putong/core/ui/messages/AudioTranslationView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->g:Lcom/p1/mobile/putong/core/ui/messages/AudioTranslationView;

    .line 2
    .line 3
    return-void
.end method

.method public setAudioViewVisibleCallback(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemAudio;->g:Lcom/p1/mobile/putong/core/ui/messages/AudioTranslationView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/AudioTranslationView;->setAudioViewVisibleCallback(Ll/y20;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
