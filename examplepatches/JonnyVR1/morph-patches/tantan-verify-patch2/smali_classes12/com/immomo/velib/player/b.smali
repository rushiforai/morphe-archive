.class public Lcom/immomo/velib/player/b;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:Ll/gre;

.field private b:Z

.field private c:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/immomo/velib/player/b;->b:Z

    .line 6
    .line 7
    const-string v0, ""

    .line 8
    .line 9
    iput-object v0, p0, Lcom/immomo/velib/player/b;->c:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Lcom/immomo/velib/player/b;Lcom/immomo/velib/anim/model/VideoEffectModel;Ljava/util/List;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/immomo/velib/player/b;->c(Lcom/immomo/velib/anim/model/VideoEffectModel;Ljava/util/List;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Lcom/immomo/velib/player/b;Lcom/immomo/velib/anim/model/Element;III)Ll/dkl0;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/immomo/velib/player/b;->d(Lcom/immomo/velib/anim/model/Element;III)Ll/dkl0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private c(Lcom/immomo/velib/anim/model/VideoEffectModel;Ljava/util/List;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/immomo/velib/anim/model/VideoEffectModel;",
            "Ljava/util/List<",
            "Lcom/immomo/velib/anim/model/Element;",
            ">;)",
            "Ljava/util/List<",
            "Ll/dkl0;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    :cond_0
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_2

    .line 15
    .line 16
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Lcom/immomo/velib/anim/model/Element;

    .line 21
    .line 22
    invoke-virtual {v1}, Lcom/immomo/velib/anim/model/Element;->getType()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    const/4 v3, 0x1

    .line 27
    if-ne v2, v3, :cond_1

    .line 28
    .line 29
    iput-boolean v3, v1, Lcom/immomo/velib/anim/model/Element;->useCircle:Z

    .line 30
    .line 31
    :cond_1
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getWidth()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getHeight()I

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getOriginVideoWidth()I

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    invoke-direct {p0, v1, v2, v3, v4}, Lcom/immomo/velib/player/b;->d(Lcom/immomo/velib/anim/model/Element;III)Ll/dkl0;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    if-eqz v1, :cond_0

    .line 48
    .line 49
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_2
    return-object v0
.end method

.method private d(Lcom/immomo/velib/anim/model/Element;III)Ll/dkl0;
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/Element;->getType()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    if-ne v0, v2, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/Element;->getUrl()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/Element;->getUrl()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v3, "http"

    .line 24
    .line 25
    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/Element;->getUrl()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    invoke-static {p2}, Ll/l33;->b(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    goto :goto_0

    .line 40
    :cond_0
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/Element;->getType()I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    const/4 v3, 0x2

    .line 45
    if-ne v0, v3, :cond_3

    .line 46
    .line 47
    iget-object v0, p0, Lcom/immomo/velib/player/b;->a:Ll/gre;

    .line 48
    .line 49
    if-nez v0, :cond_1

    .line 50
    .line 51
    new-instance v0, Ll/gre;

    .line 52
    .line 53
    invoke-direct {v0}, Ll/gre;-><init>()V

    .line 54
    .line 55
    .line 56
    iput-object v0, p0, Lcom/immomo/velib/player/b;->a:Ll/gre;

    .line 57
    .line 58
    :cond_1
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/Element;->getFontPixel()I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    iget-object v3, p0, Lcom/immomo/velib/player/b;->a:Ll/gre;

    .line 63
    .line 64
    if-nez v0, :cond_2

    .line 65
    .line 66
    invoke-virtual {v3, p1}, Ll/gre;->a(Lcom/immomo/velib/anim/model/Element;)Landroid/graphics/Bitmap;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    goto :goto_0

    .line 71
    :cond_2
    invoke-virtual {v3, p1, p2, p3, p4}, Ll/gre;->b(Lcom/immomo/velib/anim/model/Element;III)Landroid/graphics/Bitmap;

    .line 72
    .line 73
    .line 74
    move-result-object p2

    .line 75
    goto :goto_0

    .line 76
    :cond_3
    move-object p2, v1

    .line 77
    :goto_0
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/Element;->getType()I

    .line 78
    .line 79
    .line 80
    move-result p3

    .line 81
    if-ne p3, v2, :cond_4

    .line 82
    .line 83
    if-nez p2, :cond_4

    .line 84
    .line 85
    iget-boolean p3, p0, Lcom/immomo/velib/player/b;->b:Z

    .line 86
    .line 87
    if-eqz p3, :cond_4

    .line 88
    .line 89
    iget-object p3, p0, Lcom/immomo/velib/player/b;->c:Ljava/lang/String;

    .line 90
    .line 91
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 92
    .line 93
    .line 94
    move-result p3

    .line 95
    if-nez p3, :cond_4

    .line 96
    .line 97
    iget-object p2, p0, Lcom/immomo/velib/player/b;->c:Ljava/lang/String;

    .line 98
    .line 99
    invoke-static {p2}, Ll/l33;->b(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 100
    .line 101
    .line 102
    move-result-object p2

    .line 103
    :cond_4
    if-eqz p2, :cond_5

    .line 104
    .line 105
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 106
    .line 107
    .line 108
    move-result p3

    .line 109
    if-nez p3, :cond_5

    .line 110
    .line 111
    new-instance p3, Ll/dkl0;

    .line 112
    .line 113
    invoke-direct {p3}, Ll/dkl0;-><init>()V

    .line 114
    .line 115
    .line 116
    iput-object p1, p3, Ll/dkl0;->a:Lcom/immomo/velib/anim/model/Element;

    .line 117
    .line 118
    const-string p1, "avatar"

    .line 119
    .line 120
    invoke-virtual {p3, p1}, Ll/dkl0;->g(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    const-wide/16 v0, 0x1388

    .line 124
    .line 125
    invoke-virtual {p3, v0, v1}, Ll/dkl0;->d(J)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 129
    .line 130
    .line 131
    move-result p1

    .line 132
    int-to-float p1, p1

    .line 133
    invoke-virtual {p3, p1}, Ll/dkl0;->h(F)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    .line 137
    .line 138
    .line 139
    move-result p1

    .line 140
    int-to-float p1, p1

    .line 141
    invoke-virtual {p3, p1}, Ll/dkl0;->e(F)V

    .line 142
    .line 143
    .line 144
    new-instance p1, Lcom/immomo/velib/player/b$c;

    .line 145
    .line 146
    invoke-direct {p1, p0, p2}, Lcom/immomo/velib/player/b$c;-><init>(Lcom/immomo/velib/player/b;Landroid/graphics/Bitmap;)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {p3, p1}, Ll/dkl0;->f(Ll/dkl0$a;)V

    .line 150
    .line 151
    .line 152
    return-object p3

    .line 153
    :cond_5
    return-object v1
.end method

.method private e(Lcom/immomo/velib/anim/model/VideoEffectModel;Ll/dam;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/immomo/velib/player/b$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/immomo/velib/player/b$a;-><init>(Lcom/immomo/velib/player/b;Lcom/immomo/velib/anim/model/VideoEffectModel;Ll/dam;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/nre;->a(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private f(Lcom/immomo/velib/anim/model/VideoEffectModel;Ll/dam;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/immomo/velib/player/b$b;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/immomo/velib/player/b$b;-><init>(Lcom/immomo/velib/player/b;Lcom/immomo/velib/anim/model/VideoEffectModel;Ll/dam;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/nre;->a(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public g(Lcom/immomo/velib/player/a;Ll/dam;)Z
    .locals 2
    .param p2    # Ll/dam;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    iget-object v0, p1, Lcom/immomo/velib/player/a;->e:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    iget-boolean v1, p1, Lcom/immomo/velib/player/a;->g:Z

    .line 9
    .line 10
    iput-boolean v1, p0, Lcom/immomo/velib/player/b;->b:Z

    .line 11
    .line 12
    iget-object v1, p1, Lcom/immomo/velib/player/a;->h:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v1, p0, Lcom/immomo/velib/player/b;->c:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/immomo/velib/anim/model/VideoEffectModel;->getElements()Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object p1, p1, Lcom/immomo/velib/player/a;->e:Lcom/immomo/velib/anim/model/VideoEffectModel;

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    invoke-direct {p0, p1, p2}, Lcom/immomo/velib/player/b;->e(Lcom/immomo/velib/anim/model/VideoEffectModel;Ll/dam;)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    invoke-direct {p0, p1, p2}, Lcom/immomo/velib/player/b;->f(Lcom/immomo/velib/anim/model/VideoEffectModel;Ll/dam;)V

    .line 29
    .line 30
    .line 31
    :goto_0
    const/4 p0, 0x0

    .line 32
    return p0

    .line 33
    :cond_2
    :goto_1
    new-instance p0, Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-interface {p2, p0}, Ll/dam;->onEffectElementComplete(Ljava/util/List;)V

    .line 39
    .line 40
    .line 41
    const/4 p0, 0x1

    .line 42
    return p0
.end method
