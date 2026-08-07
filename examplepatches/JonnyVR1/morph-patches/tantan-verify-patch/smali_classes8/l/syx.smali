.class public Ll/syx;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:Z

.field public c:Z

.field public d:Z

.field public e:Ljava/lang/String;

.field public f:I

.field public g:Z

.field public h:Z

.field public i:Lcom/p1/mobile/putong/data/Gender;

.field public j:Ljava/lang/String;

.field public k:Z

.field public l:Z

.field public m:I

.field public n:Z

.field public o:Z

.field public p:Ljava/lang/String;

.field public q:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Ll/syx;->a:I

    .line 6
    .line 7
    const-string v1, ""

    .line 8
    .line 9
    iput-object v1, p0, Ll/syx;->j:Ljava/lang/String;

    .line 10
    .line 11
    const/4 v1, 0x3

    .line 12
    iput v1, p0, Ll/syx;->m:I

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    iput-boolean v1, p0, Ll/syx;->n:Z

    .line 16
    .line 17
    iput-boolean v1, p0, Ll/syx;->o:Z

    .line 18
    .line 19
    iput-boolean v0, p0, Ll/syx;->q:Z

    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public a()Landroid/os/Bundle;
    .locals 3

    .line 1
    new-instance v0, Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "imageCount"

    .line 7
    .line 8
    iget v2, p0, Ll/syx;->a:I

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 11
    .line 12
    .line 13
    const-string v1, "hasCamera"

    .line 14
    .line 15
    iget-boolean v2, p0, Ll/syx;->b:Z

    .line 16
    .line 17
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 18
    .line 19
    .line 20
    const-string v1, "hasVideo"

    .line 21
    .line 22
    iget-boolean v2, p0, Ll/syx;->c:Z

    .line 23
    .line 24
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 25
    .line 26
    .line 27
    const-string v1, "cropIfSingle"

    .line 28
    .line 29
    iget-boolean v2, p0, Ll/syx;->d:Z

    .line 30
    .line 31
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 32
    .line 33
    .line 34
    const-string v1, "videoDefault"

    .line 35
    .line 36
    iget-boolean v2, p0, Ll/syx;->g:Z

    .line 37
    .line 38
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 39
    .line 40
    .line 41
    const-string v1, "from"

    .line 42
    .line 43
    iget-object v2, p0, Ll/syx;->e:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    const-string v1, "source"

    .line 49
    .line 50
    iget v2, p0, Ll/syx;->f:I

    .line 51
    .line 52
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 53
    .line 54
    .line 55
    const-string v1, "isFloatLayerExp"

    .line 56
    .line 57
    iget-boolean v2, p0, Ll/syx;->h:Z

    .line 58
    .line 59
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 60
    .line 61
    .line 62
    const-string v1, "gender"

    .line 63
    .line 64
    iget-object v2, p0, Ll/syx;->i:Lcom/p1/mobile/putong/data/Gender;

    .line 65
    .line 66
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 67
    .line 68
    .line 69
    const-string v1, "action_bar_title"

    .line 70
    .line 71
    iget-object v2, p0, Ll/syx;->j:Ljava/lang/String;

    .line 72
    .line 73
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    const-string v1, "cropNewProfilePicture"

    .line 77
    .line 78
    iget-boolean v2, p0, Ll/syx;->k:Z

    .line 79
    .line 80
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 81
    .line 82
    .line 83
    const-string v1, "use_inner_camera"

    .line 84
    .line 85
    iget-boolean v2, p0, Ll/syx;->l:Z

    .line 86
    .line 87
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 88
    .line 89
    .line 90
    const-string v1, "span_count"

    .line 91
    .line 92
    iget v2, p0, Ll/syx;->m:I

    .line 93
    .line 94
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 95
    .line 96
    .line 97
    const-string v1, "enable_back_key"

    .line 98
    .line 99
    iget-boolean v2, p0, Ll/syx;->n:Z

    .line 100
    .line 101
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 102
    .line 103
    .line 104
    const-string v1, "from_action_fake"

    .line 105
    .line 106
    iget-boolean v2, p0, Ll/syx;->o:Z

    .line 107
    .line 108
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 109
    .line 110
    .line 111
    const-string v1, "tips_message"

    .line 112
    .line 113
    iget-object v2, p0, Ll/syx;->p:Ljava/lang/String;

    .line 114
    .line 115
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    const-string v1, "show_simple_avatar"

    .line 119
    .line 120
    iget-boolean p0, p0, Ll/syx;->q:Z

    .line 121
    .line 122
    invoke-virtual {v0, v1, p0}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 123
    .line 124
    .line 125
    return-object v0
.end method
