.class public Lcom/immomo/velib/player/a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/velib/player/a$a;
    }
.end annotation


# instance fields
.field final a:Landroid/net/Uri;

.field final b:I

.field final c:I

.field final d:I

.field final e:Lcom/immomo/velib/anim/model/VideoEffectModel;

.field final f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/immomo/velib/anim/model/VideoEffectMatchInfo;",
            ">;"
        }
    .end annotation
.end field

.field final g:Z

.field final h:Ljava/lang/String;

.field final i:Ljava/lang/String;

.field final j:Z

.field final k:I

.field final l:I

.field public final m:Ll/txl;


# direct methods
.method public constructor <init>(Lcom/immomo/velib/player/a$a;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/immomo/velib/player/a$a;->a(Lcom/immomo/velib/player/a$a;)I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    iput v0, p0, Lcom/immomo/velib/player/a;->b:I

    .line 9
    .line 10
    invoke-static {p1}, Lcom/immomo/velib/player/a$a;->b(Lcom/immomo/velib/player/a$a;)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iput v0, p0, Lcom/immomo/velib/player/a;->c:I

    .line 15
    .line 16
    invoke-static {p1}, Lcom/immomo/velib/player/a$a;->g(Lcom/immomo/velib/player/a$a;)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iput v0, p0, Lcom/immomo/velib/player/a;->d:I

    .line 21
    .line 22
    invoke-static {p1}, Lcom/immomo/velib/player/a$a;->h(Lcom/immomo/velib/player/a$a;)Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Lcom/immomo/velib/player/a;->e:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 27
    .line 28
    invoke-static {p1}, Lcom/immomo/velib/player/a$a;->i(Lcom/immomo/velib/player/a$a;)Ljava/util/List;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iput-object v1, p0, Lcom/immomo/velib/player/a;->f:Ljava/util/List;

    .line 33
    .line 34
    invoke-static {p1}, Lcom/immomo/velib/player/a$a;->j(Lcom/immomo/velib/player/a$a;)Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    iput-boolean v2, p0, Lcom/immomo/velib/player/a;->g:Z

    .line 39
    .line 40
    invoke-static {p1}, Lcom/immomo/velib/player/a$a;->k(Lcom/immomo/velib/player/a$a;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    iput-object v2, p0, Lcom/immomo/velib/player/a;->h:Ljava/lang/String;

    .line 45
    .line 46
    invoke-static {p1}, Lcom/immomo/velib/player/a$a;->l(Lcom/immomo/velib/player/a$a;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    iput-object v2, p0, Lcom/immomo/velib/player/a;->i:Ljava/lang/String;

    .line 51
    .line 52
    invoke-static {p1}, Lcom/immomo/velib/player/a$a;->m(Lcom/immomo/velib/player/a$a;)Z

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    iput-boolean v2, p0, Lcom/immomo/velib/player/a;->j:Z

    .line 57
    .line 58
    invoke-static {p1}, Lcom/immomo/velib/player/a$a;->n(Lcom/immomo/velib/player/a$a;)I

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    iput v2, p0, Lcom/immomo/velib/player/a;->k:I

    .line 63
    .line 64
    invoke-static {p1}, Lcom/immomo/velib/player/a$a;->c(Lcom/immomo/velib/player/a$a;)I

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    iput v2, p0, Lcom/immomo/velib/player/a;->l:I

    .line 69
    .line 70
    invoke-static {p1}, Lcom/immomo/velib/player/a$a;->d(Lcom/immomo/velib/player/a$a;)Ll/txl;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    iput-object v2, p0, Lcom/immomo/velib/player/a;->m:Ll/txl;

    .line 75
    .line 76
    invoke-direct {p0, v0, v1}, Lcom/immomo/velib/player/a;->c(Lcom/immomo/velib/anim/model/VideoEffectModel;Ljava/util/List;)V

    .line 77
    .line 78
    .line 79
    invoke-static {p1}, Lcom/immomo/velib/player/a$a;->e(Lcom/immomo/velib/player/a$a;)Landroid/net/Uri;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    if-eqz v1, :cond_0

    .line 84
    .line 85
    invoke-static {p1}, Lcom/immomo/velib/player/a$a;->e(Lcom/immomo/velib/player/a$a;)Landroid/net/Uri;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    iput-object p1, p0, Lcom/immomo/velib/player/a;->a:Landroid/net/Uri;

    .line 90
    .line 91
    return-void

    .line 92
    :cond_0
    invoke-static {p1}, Lcom/immomo/velib/player/a$a;->f(Lcom/immomo/velib/player/a$a;)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    if-nez v1, :cond_1

    .line 101
    .line 102
    invoke-static {p1}, Lcom/immomo/velib/player/a$a;->f(Lcom/immomo/velib/player/a$a;)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-direct {p0, p1}, Lcom/immomo/velib/player/a;->e(Ljava/lang/String;)Landroid/net/Uri;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    iput-object p1, p0, Lcom/immomo/velib/player/a;->a:Landroid/net/Uri;

    .line 111
    .line 112
    return-void

    .line 113
    :cond_1
    if-eqz v0, :cond_2

    .line 114
    .line 115
    invoke-virtual {v0}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getVideoPath()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 120
    .line 121
    .line 122
    move-result p1

    .line 123
    if-nez p1, :cond_2

    .line 124
    .line 125
    invoke-virtual {v0}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getVideoPath()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    invoke-direct {p0, p1}, Lcom/immomo/velib/player/a;->e(Ljava/lang/String;)Landroid/net/Uri;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    iput-object p1, p0, Lcom/immomo/velib/player/a;->a:Landroid/net/Uri;

    .line 134
    .line 135
    return-void

    .line 136
    :cond_2
    const/4 p1, 0x0

    .line 137
    iput-object p1, p0, Lcom/immomo/velib/player/a;->a:Landroid/net/Uri;

    .line 138
    .line 139
    return-void
.end method

.method private a(Lcom/immomo/velib/anim/model/VideoEffectModel;Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/immomo/velib/anim/model/VideoEffectModel;",
            "Ljava/util/List<",
            "Lcom/immomo/velib/anim/model/VideoEffectMatchInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getElements()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_5

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Lcom/immomo/velib/anim/model/Element;

    .line 20
    .line 21
    const-string v0, ""

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Lcom/immomo/velib/anim/model/Element;->setUrl(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, v0}, Lcom/immomo/velib/anim/model/Element;->setText(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_0

    .line 38
    .line 39
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    check-cast v1, Lcom/immomo/velib/anim/model/VideoEffectMatchInfo;

    .line 44
    .line 45
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/Element;->getType()I

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    const/4 v3, 0x1

    .line 50
    if-ne v2, v3, :cond_3

    .line 51
    .line 52
    invoke-virtual {v1}, Lcom/immomo/velib/anim/model/VideoEffectMatchInfo;->getId()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    if-nez v2, :cond_2

    .line 61
    .line 62
    invoke-virtual {v1}, Lcom/immomo/velib/anim/model/VideoEffectMatchInfo;->getId()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/Element;->getId()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    if-eqz v2, :cond_1

    .line 75
    .line 76
    :cond_2
    invoke-virtual {v1}, Lcom/immomo/velib/anim/model/VideoEffectMatchInfo;->getImgId()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {p1, v0}, Lcom/immomo/velib/anim/model/Element;->setUrl(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_3
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/Element;->getType()I

    .line 85
    .line 86
    .line 87
    move-result v2

    .line 88
    const/4 v3, 0x2

    .line 89
    if-ne v2, v3, :cond_1

    .line 90
    .line 91
    invoke-virtual {v1}, Lcom/immomo/velib/anim/model/VideoEffectMatchInfo;->getId()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    if-nez v2, :cond_4

    .line 100
    .line 101
    invoke-virtual {v1}, Lcom/immomo/velib/anim/model/VideoEffectMatchInfo;->getId()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/Element;->getId()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v3

    .line 109
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 110
    .line 111
    .line 112
    move-result v2

    .line 113
    if-eqz v2, :cond_1

    .line 114
    .line 115
    :cond_4
    invoke-virtual {v1}, Lcom/immomo/velib/anim/model/VideoEffectMatchInfo;->getText()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-virtual {p1, v0}, Lcom/immomo/velib/anim/model/Element;->setText(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_5
    return-void
.end method

.method private b(Lcom/immomo/velib/anim/model/VideoEffectModel;Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/immomo/velib/anim/model/VideoEffectModel;",
            "Ljava/util/List<",
            "Lcom/immomo/velib/anim/model/VideoEffectMatchInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p2, :cond_5

    .line 2
    .line 3
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const-string p2, ""

    .line 15
    .line 16
    move-object v0, p2

    .line 17
    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_3

    .line 22
    .line 23
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Lcom/immomo/velib/anim/model/VideoEffectMatchInfo;

    .line 28
    .line 29
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-eqz v2, :cond_2

    .line 34
    .line 35
    invoke-virtual {v1}, Lcom/immomo/velib/anim/model/VideoEffectMatchInfo;->getImgId()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-nez v2, :cond_2

    .line 44
    .line 45
    invoke-virtual {v1}, Lcom/immomo/velib/anim/model/VideoEffectMatchInfo;->getImgId()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    :cond_2
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    if-eqz v2, :cond_1

    .line 54
    .line 55
    invoke-virtual {v1}, Lcom/immomo/velib/anim/model/VideoEffectMatchInfo;->getText()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    if-nez v2, :cond_1

    .line 64
    .line 65
    invoke-virtual {v1}, Lcom/immomo/velib/anim/model/VideoEffectMatchInfo;->getText()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    goto :goto_0

    .line 70
    :cond_3
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getAvatar()Lcom/immomo/velib/anim/model/Element;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    if-eqz p0, :cond_4

    .line 75
    .line 76
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getAvatar()Lcom/immomo/velib/anim/model/Element;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {p0, p2}, Lcom/immomo/velib/anim/model/Element;->setUrl(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    :cond_4
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getText()Lcom/immomo/velib/anim/model/Element;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    if-eqz p0, :cond_5

    .line 88
    .line 89
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getText()Lcom/immomo/velib/anim/model/Element;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-virtual {p0, v0}, Lcom/immomo/velib/anim/model/Element;->setText(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    :cond_5
    :goto_1
    return-void
.end method

.method private c(Lcom/immomo/velib/anim/model/VideoEffectModel;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/immomo/velib/anim/model/VideoEffectModel;",
            "Ljava/util/List<",
            "Lcom/immomo/velib/anim/model/VideoEffectMatchInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    if-eqz p2, :cond_2

    .line 4
    .line 5
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getElements()Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-direct {p0, p1, p2}, Lcom/immomo/velib/player/a;->a(Lcom/immomo/velib/anim/model/VideoEffectModel;Ljava/util/List;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    invoke-direct {p0, p1, p2}, Lcom/immomo/velib/player/a;->b(Lcom/immomo/velib/anim/model/VideoEffectModel;Ljava/util/List;)V

    .line 23
    .line 24
    .line 25
    :cond_2
    :goto_0
    return-void
.end method

.method public static d(Lcom/immomo/velib/player/a;)Z
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    iget-object p0, p0, Lcom/immomo/velib/player/a;->i:Ljava/lang/String;

    .line 6
    .line 7
    const-string v1, "highp"

    .line 8
    .line 9
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_2

    .line 14
    .line 15
    const-string v1, "mediump"

    .line 16
    .line 17
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_2

    .line 22
    .line 23
    const-string v1, "lowp"

    .line 24
    .line 25
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    return v0

    .line 33
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 34
    return p0
.end method

.method private e(Ljava/lang/String;)Landroid/net/Uri;
    .locals 1

    .line 1
    const-string p0, "file://"

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    invoke-virtual {p0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method
