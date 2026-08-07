.class public Ll/di5;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
        ">;"
    }
.end annotation


# instance fields
.field public final c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/StickerInfo;",
            ">;"
        }
    .end annotation
.end field

.field public final e:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;>;"
        }
    .end annotation
.end field

.field public final f:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;>;"
        }
    .end annotation
.end field

.field public final g:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public final h:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public final i:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final j:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/Links;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/di5;->c:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/di5;->d:Ljava/util/List;

    .line 17
    .line 18
    new-instance v0, Ljava/util/HashMap;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/di5;->e:Ljava/util/Map;

    .line 24
    .line 25
    new-instance v0, Ljava/util/HashMap;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Ll/di5;->f:Ljava/util/Map;

    .line 31
    .line 32
    new-instance v0, Ljava/util/HashMap;

    .line 33
    .line 34
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Ll/di5;->g:Ljava/util/Map;

    .line 38
    .line 39
    new-instance v0, Ljava/util/HashMap;

    .line 40
    .line 41
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Ll/di5;->h:Ljava/util/Map;

    .line 45
    .line 46
    new-instance v0, Ljava/util/ArrayList;

    .line 47
    .line 48
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 49
    .line 50
    .line 51
    iput-object v0, p0, Ll/di5;->i:Ljava/util/List;

    .line 52
    .line 53
    new-instance v0, Ljava/util/HashMap;

    .line 54
    .line 55
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 56
    .line 57
    .line 58
    iput-object v0, p0, Ll/di5;->j:Ljava/util/Map;

    .line 59
    .line 60
    return-void
.end method

.method public static synthetic E(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic F(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic G(Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic H(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/CommentInfo;->isBottom:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/CommentInfo;->parentMessageId:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public static synthetic I(Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic J(Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->replyCommentId:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic K(Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic L(Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic M(Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic N(Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static W(Lcom/p1/mobile/putong/data/Links;)Z
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/di5;->O(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/MomentMessage;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public O(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/MomentMessage;II)V
    .locals 0

    .line 1
    return-void
.end method

.method public P(ILjava/lang/String;Ljava/util/List;Lcom/p1/mobile/putong/data/Links;Z)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;",
            "Lcom/p1/mobile/putong/data/Links;",
            "Z)V"
        }
    .end annotation

    .line 1
    if-eqz p5, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Ll/di5;->V(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p5

    .line 7
    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/di5;->f:Ljava/util/Map;

    .line 14
    .line 15
    invoke-interface {v0, p5, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    :cond_0
    invoke-virtual {p0, p2, p4}, Ll/di5;->f0(Ljava/lang/String;Lcom/p1/mobile/putong/data/Links;)V

    .line 19
    .line 20
    .line 21
    iget-object p4, p0, Ll/di5;->e:Ljava/util/Map;

    .line 22
    .line 23
    invoke-interface {p4, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p4

    .line 27
    check-cast p4, Ljava/util/List;

    .line 28
    .line 29
    const/4 p5, 0x0

    .line 30
    move v0, p5

    .line 31
    :goto_0
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-ge v0, v1, :cond_2

    .line 36
    .line 37
    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    check-cast v1, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 42
    .line 43
    new-instance v2, Ll/bi5;

    .line 44
    .line 45
    invoke-direct {v2, v1}, Ll/bi5;-><init>(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 46
    .line 47
    .line 48
    invoke-static {p4, v2}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    if-nez v2, :cond_1

    .line 53
    .line 54
    invoke-interface {p4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    iget-object p3, p0, Ll/di5;->e:Ljava/util/Map;

    .line 61
    .line 62
    invoke-interface {p3, p2, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    iget-object p3, p0, Ll/di5;->h:Ljava/util/Map;

    .line 66
    .line 67
    invoke-interface {p3, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object p3

    .line 71
    check-cast p3, Ljava/lang/Integer;

    .line 72
    .line 73
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 74
    .line 75
    .line 76
    move-result p3

    .line 77
    invoke-interface {p4}, Ljava/util/List;->size()I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    sub-int/2addr v0, p3

    .line 82
    new-instance v1, Ljava/util/ArrayList;

    .line 83
    .line 84
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 85
    .line 86
    .line 87
    move v2, p3

    .line 88
    :goto_1
    const/4 v3, 0x3

    .line 89
    invoke-static {v0, v3}, Ljava/lang/Math;->min(II)I

    .line 90
    .line 91
    .line 92
    move-result v4

    .line 93
    add-int/2addr v4, p3

    .line 94
    if-ge v2, v4, :cond_3

    .line 95
    .line 96
    invoke-interface {p4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v3

    .line 100
    check-cast v3, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 101
    .line 102
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    add-int/lit8 v2, v2, 0x1

    .line 106
    .line 107
    goto :goto_1

    .line 108
    :cond_3
    iget-object v2, p0, Ll/di5;->c:Ljava/util/List;

    .line 109
    .line 110
    invoke-virtual {p0, p2}, Ll/di5;->R(Ljava/lang/String;)I

    .line 111
    .line 112
    .line 113
    move-result v4

    .line 114
    invoke-interface {v2, v4, v1}, Ljava/util/List;->addAll(ILjava/util/Collection;)Z

    .line 115
    .line 116
    .line 117
    invoke-virtual {p0, p2}, Ll/di5;->X(Ljava/lang/String;)Z

    .line 118
    .line 119
    .line 120
    move-result v2

    .line 121
    const/4 v4, 0x1

    .line 122
    if-nez v2, :cond_4

    .line 123
    .line 124
    if-le v0, v3, :cond_5

    .line 125
    .line 126
    :cond_4
    move p5, v4

    .line 127
    :cond_5
    iget-object v0, p0, Ll/di5;->g:Ljava/util/Map;

    .line 128
    .line 129
    xor-int/lit8 v2, p5, 0x1

    .line 130
    .line 131
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    invoke-interface {v0, p2, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    iget-object v0, p0, Ll/di5;->h:Ljava/util/Map;

    .line 139
    .line 140
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 141
    .line 142
    .line 143
    move-result v2

    .line 144
    add-int/2addr p3, v2

    .line 145
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 146
    .line 147
    .line 148
    move-result-object p3

    .line 149
    invoke-interface {v0, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    add-int/lit8 p3, p1, 0x1

    .line 153
    .line 154
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 155
    .line 156
    .line 157
    move-result v0

    .line 158
    invoke-virtual {p0, p3, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRangeInserted(II)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {p0}, Ll/jic0;->getItemCount()I

    .line 162
    .line 163
    .line 164
    move-result v0

    .line 165
    sub-int/2addr v0, p1

    .line 166
    const-string p1, "change_position"

    .line 167
    .line 168
    invoke-virtual {p0, p3, v0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRangeChanged(IILjava/lang/Object;)V

    .line 169
    .line 170
    .line 171
    if-nez p5, :cond_6

    .line 172
    .line 173
    invoke-interface {p4}, Ljava/util/List;->size()I

    .line 174
    .line 175
    .line 176
    move-result p3

    .line 177
    if-gt p3, v3, :cond_6

    .line 178
    .line 179
    invoke-virtual {p0, p2}, Ll/di5;->R(Ljava/lang/String;)I

    .line 180
    .line 181
    .line 182
    move-result p2

    .line 183
    iget-object p3, p0, Ll/di5;->c:Ljava/util/List;

    .line 184
    .line 185
    invoke-interface {p3, p2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 186
    .line 187
    .line 188
    invoke-virtual {p0, p2, v4}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRangeRemoved(II)V

    .line 189
    .line 190
    .line 191
    add-int/lit8 p3, p2, -0x2

    .line 192
    .line 193
    invoke-virtual {p0}, Ll/jic0;->getItemCount()I

    .line 194
    .line 195
    .line 196
    move-result p4

    .line 197
    sub-int/2addr p4, p2

    .line 198
    add-int/lit8 p4, p4, 0x2

    .line 199
    .line 200
    invoke-virtual {p0, p3, p4, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRangeChanged(IILjava/lang/Object;)V

    .line 201
    .line 202
    .line 203
    :cond_6
    invoke-virtual {p0}, Ll/di5;->h0()V

    .line 204
    .line 205
    .line 206
    return-void
.end method

.method public Q(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/util/List;Z)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;Z)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
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
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_2

    .line 11
    .line 12
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-lez v1, :cond_2

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    :goto_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-ge v1, v2, :cond_2

    .line 24
    .line 25
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 30
    .line 31
    iget-boolean v3, v2, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isBottom:Z

    .line 32
    .line 33
    if-nez v3, :cond_1

    .line 34
    .line 35
    iget-object v3, v2, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 36
    .line 37
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    if-eqz v3, :cond_0

    .line 42
    .line 43
    iget-object v3, v2, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 44
    .line 45
    iget-boolean v3, v3, Lcom/p1/mobile/putong/feed/data/CommentInfo;->isBottom:Z

    .line 46
    .line 47
    if-eqz v3, :cond_0

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_0
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    :cond_1
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_2
    iget-object p2, p0, Ll/di5;->h:Ljava/util/Map;

    .line 57
    .line 58
    iget-object v1, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 59
    .line 60
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-interface {p2, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0, p1}, Ll/di5;->b0(Lcom/p1/mobile/putong/feed/data/MomentMessage;)Z

    .line 72
    .line 73
    .line 74
    move-result p2

    .line 75
    if-eqz p2, :cond_3

    .line 76
    .line 77
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 78
    .line 79
    .line 80
    move-result p2

    .line 81
    const/4 v1, 0x3

    .line 82
    if-gt p2, v1, :cond_3

    .line 83
    .line 84
    goto :goto_3

    .line 85
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->new_()Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 86
    .line 87
    .line 88
    move-result-object p2

    .line 89
    const/4 v1, 0x1

    .line 90
    if-eqz p3, :cond_4

    .line 91
    .line 92
    iget-object p3, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 93
    .line 94
    iput-object p3, p2, Lcom/p1/mobile/putong/feed/data/MomentMessage;->parentCommentId:Ljava/lang/String;

    .line 95
    .line 96
    iput-boolean v1, p2, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isBottom:Z

    .line 97
    .line 98
    iget-object p3, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->moreSubComments:Ljava/lang/String;

    .line 99
    .line 100
    iput-object p3, p2, Lcom/p1/mobile/putong/feed/data/MomentMessage;->moreSubComments:Ljava/lang/String;

    .line 101
    .line 102
    goto :goto_2

    .line 103
    :cond_4
    iget-object p3, p2, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 104
    .line 105
    iget-object v2, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 106
    .line 107
    iput-object v2, p3, Lcom/p1/mobile/putong/feed/data/CommentInfo;->parentMessageId:Ljava/lang/String;

    .line 108
    .line 109
    iput-boolean v1, p3, Lcom/p1/mobile/putong/feed/data/CommentInfo;->isBottom:Z

    .line 110
    .line 111
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 112
    .line 113
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/CommentInfo;->moreSubMessages:Ljava/lang/String;

    .line 114
    .line 115
    iput-object v1, p3, Lcom/p1/mobile/putong/feed/data/CommentInfo;->moreSubMessages:Ljava/lang/String;

    .line 116
    .line 117
    :goto_2
    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    :goto_3
    iget-object p2, p0, Ll/di5;->g:Ljava/util/Map;

    .line 121
    .line 122
    iget-object p3, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 123
    .line 124
    invoke-virtual {p0, p1}, Ll/di5;->b0(Lcom/p1/mobile/putong/feed/data/MomentMessage;)Z

    .line 125
    .line 126
    .line 127
    move-result p0

    .line 128
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    invoke-interface {p2, p3, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    return-object v0
.end method

.method public R(Ljava/lang/String;)I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/di5;->c:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/ai5;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/ai5;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 13
    .line 14
    iget-object v1, p0, Ll/di5;->c:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v1, v0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const/4 v1, -0x1

    .line 21
    if-ne v0, v1, :cond_1

    .line 22
    .line 23
    instance-of v0, p0, Ll/hi00;

    .line 24
    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    check-cast p0, Ll/hi00;

    .line 28
    .line 29
    iget-object p0, p0, Ll/hi00;->n:Ll/hj00;

    .line 30
    .line 31
    iget-object p0, p0, Ll/hj00;->o:Ljava/lang/String;

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const/4 p0, 0x0

    .line 35
    :goto_0
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/feed/helper/exception/BottomCommentIndexException;->reportBottomCommentIndexOutOfBounds(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    const/4 p0, 0x0

    .line 39
    return p0

    .line 40
    :cond_1
    return v0
.end method

.method public S(Ljava/lang/String;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/di5;->e:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/util/List;

    .line 8
    .line 9
    return-object p0
.end method

.method public T(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Links;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/di5;->j:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/data/Links;

    .line 8
    .line 9
    return-object p0
.end method

.method public U(I)Lcom/p1/mobile/putong/feed/data/MomentMessage;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public V(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return-object v1

    .line 9
    :cond_0
    iget-object p0, p0, Ll/di5;->c:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ll/ci5;

    .line 12
    .line 13
    invoke-direct {v0, p1}, Ll/ci5;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 21
    .line 22
    if-nez p0, :cond_1

    .line 23
    .line 24
    return-object v1

    .line 25
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 26
    .line 27
    if-nez p0, :cond_2

    .line 28
    .line 29
    return-object v1

    .line 30
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/CommentInfo;->moreSubMessages:Ljava/lang/String;

    .line 31
    .line 32
    return-object p0
.end method

.method public X(Ljava/lang/String;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/di5;->j:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/di5;->j:Ljava/util/Map;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/p1/mobile/putong/data/Links;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-nez p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public Y(Ljava/lang/String;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/di5;->e:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/util/List;

    .line 8
    .line 9
    iget-object p0, p0, Ll/di5;->h:Ljava/util/Map;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ljava/lang/Integer;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-le p1, p0, :cond_0

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    return p0
.end method

.method public Z(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/di5;->e:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/util/List;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_3

    .line 21
    .line 22
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    new-instance v1, Ll/yh5;

    .line 29
    .line 30
    invoke-direct {v1, p1}, Ll/yh5;-><init>(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    if-nez v1, :cond_2

    .line 38
    .line 39
    :cond_1
    invoke-virtual {p0, p1, v0}, Ll/di5;->g0(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/util/List;)Ljava/util/List;

    .line 40
    .line 41
    .line 42
    :cond_2
    iget-object p0, p0, Ll/di5;->e:Ljava/util/Map;

    .line 43
    .line 44
    invoke-interface {p0, p2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    :cond_3
    return-void
.end method

.method public a0(Lcom/p1/mobile/putong/feed/data/MomentMessage;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/data/CommentInfo;->isBottom:Z

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public b0(Lcom/p1/mobile/putong/feed/data/MomentMessage;)Z
    .locals 8

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_6

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/CommentInfo;->moreSubMessages:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    goto/16 :goto_1

    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Ll/di5;->f:Ljava/util/Map;

    .line 17
    .line 18
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 19
    .line 20
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/CommentInfo;->moreSubMessages:Ljava/lang/String;

    .line 21
    .line 22
    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Ljava/util/List;

    .line 27
    .line 28
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    const/4 v3, 0x0

    .line 33
    if-eqz v2, :cond_5

    .line 34
    .line 35
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-lez v2, :cond_5

    .line 40
    .line 41
    move v2, v3

    .line 42
    move v4, v2

    .line 43
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 44
    .line 45
    .line 46
    move-result v5

    .line 47
    if-ge v2, v5, :cond_4

    .line 48
    .line 49
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v5

    .line 53
    check-cast v5, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 54
    .line 55
    iget-object v6, p0, Ll/di5;->e:Ljava/util/Map;

    .line 56
    .line 57
    iget-object v7, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 58
    .line 59
    invoke-interface {v6, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v6

    .line 63
    check-cast v6, Ljava/util/List;

    .line 64
    .line 65
    new-instance v7, Ll/zh5;

    .line 66
    .line 67
    invoke-direct {v7, v5}, Ll/zh5;-><init>(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 68
    .line 69
    .line 70
    invoke-static {v6, v7}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v6

    .line 74
    if-eqz v6, :cond_2

    .line 75
    .line 76
    iget-object v0, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {p0, v0}, Ll/di5;->T(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Links;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-eqz v0, :cond_1

    .line 87
    .line 88
    iget-object p1, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {p0, p1}, Ll/di5;->T(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Links;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 95
    .line 96
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 97
    .line 98
    .line 99
    move-result p0

    .line 100
    if-nez p0, :cond_1

    .line 101
    .line 102
    return v3

    .line 103
    :cond_1
    return v1

    .line 104
    :cond_2
    iget-object v6, p0, Ll/di5;->i:Ljava/util/List;

    .line 105
    .line 106
    invoke-static {v6}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 107
    .line 108
    .line 109
    move-result v6

    .line 110
    if-nez v6, :cond_3

    .line 111
    .line 112
    iget-object v6, p0, Ll/di5;->i:Ljava/util/List;

    .line 113
    .line 114
    iget-object v5, v5, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 115
    .line 116
    invoke-interface {v6, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    move-result v5

    .line 120
    if-eqz v5, :cond_3

    .line 121
    .line 122
    add-int/lit8 v4, v4, 0x1

    .line 123
    .line 124
    :cond_3
    add-int/lit8 v2, v2, 0x1

    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_4
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 128
    .line 129
    .line 130
    move-result p0

    .line 131
    if-ne v4, p0, :cond_5

    .line 132
    .line 133
    return v1

    .line 134
    :cond_5
    return v3

    .line 135
    :cond_6
    :goto_1
    iget-object p0, p0, Ll/di5;->f:Ljava/util/Map;

    .line 136
    .line 137
    iget-object p1, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 138
    .line 139
    const/4 v0, 0x0

    .line 140
    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    return v1
.end method

.method public c0(ILjava/lang/String;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/di5;->e:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x3

    .line 14
    sub-int/2addr v0, v1

    .line 15
    sub-int/2addr p1, v0

    .line 16
    add-int/lit8 v2, p1, 0x1

    .line 17
    .line 18
    invoke-virtual {p0, p2}, Ll/di5;->R(Ljava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    add-int/lit8 v3, v3, -0x1

    .line 23
    .line 24
    const/4 v4, 0x0

    .line 25
    :goto_0
    if-ge v4, v0, :cond_0

    .line 26
    .line 27
    iget-object v5, p0, Ll/di5;->c:Ljava/util/List;

    .line 28
    .line 29
    invoke-interface {v5, v3}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    add-int/lit8 v3, v3, -0x1

    .line 33
    .line 34
    add-int/lit8 v4, v4, 0x1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    iget-object v3, p0, Ll/di5;->g:Ljava/util/Map;

    .line 38
    .line 39
    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 40
    .line 41
    invoke-interface {v3, p2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    iget-object v3, p0, Ll/di5;->h:Ljava/util/Map;

    .line 45
    .line 46
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-interface {v3, p2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0, v2, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRangeRemoved(II)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0}, Ll/jic0;->getItemCount()I

    .line 57
    .line 58
    .line 59
    move-result p2

    .line 60
    sub-int/2addr p2, v2

    .line 61
    add-int/lit8 p2, p2, 0x2

    .line 62
    .line 63
    const-string v0, "change_position"

    .line 64
    .line 65
    invoke-virtual {p0, p1, p2, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRangeChanged(IILjava/lang/Object;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public d0(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/di5;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/di5;->c:Ljava/util/List;

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

.method public e0(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isChildComment()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/CommentInfo;->parentMessageId:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v1, p0, Ll/di5;->e:Ljava/util/Map;

    .line 12
    .line 13
    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/di5;->i:Ljava/util/List;

    .line 23
    .line 24
    iget-object p1, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 25
    .line 26
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public f0(Ljava/lang/String;Lcom/p1/mobile/putong/data/Links;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/di5;->j:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final g0(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/util/List;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Ll/di5;->a0(Lcom/p1/mobile/putong/feed/data/MomentMessage;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_1

    .line 6
    .line 7
    iget-boolean p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isNewComment:Z

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->replyCommentId:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    invoke-interface {p2, p0, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    return-object p2

    .line 24
    :cond_0
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    :cond_1
    return-object p2
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/di5;->U(I)Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public h0()V
    .locals 0

    .line 1
    return-void
.end method

.method public i0(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/di5;->e:Ljava/util/Map;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Ljava/util/List;

    .line 10
    .line 11
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/CommentInfo;->subMessageIds:Ljava/util/List;

    .line 14
    .line 15
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-eqz v2, :cond_0

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    new-instance v2, Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 25
    .line 26
    .line 27
    const/4 v3, 0x0

    .line 28
    :goto_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 29
    .line 30
    .line 31
    move-result v4

    .line 32
    if-ge v3, v4, :cond_2

    .line 33
    .line 34
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    check-cast v4, Ljava/lang/String;

    .line 39
    .line 40
    new-instance v5, Ll/th5;

    .line 41
    .line 42
    invoke-direct {v5, v4}, Ll/th5;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-static {v0, v5}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    check-cast v4, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 50
    .line 51
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v5

    .line 55
    if-eqz v5, :cond_1

    .line 56
    .line 57
    new-instance v5, Ll/uh5;

    .line 58
    .line 59
    invoke-direct {v5, v4}, Ll/uh5;-><init>(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 60
    .line 61
    .line 62
    invoke-static {v2, v5}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v5

    .line 66
    if-nez v5, :cond_1

    .line 67
    .line 68
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    :cond_1
    add-int/lit8 v3, v3, 0x1

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_2
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    :cond_3
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 79
    .line 80
    .line 81
    move-result v3

    .line 82
    if-eqz v3, :cond_4

    .line 83
    .line 84
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    check-cast v3, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 89
    .line 90
    iget-boolean v4, v3, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isNewComment:Z

    .line 91
    .line 92
    if-nez v4, :cond_3

    .line 93
    .line 94
    new-instance v4, Ll/vh5;

    .line 95
    .line 96
    invoke-direct {v4, v3}, Ll/vh5;-><init>(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 97
    .line 98
    .line 99
    invoke-static {v2, v4}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object v4

    .line 103
    if-nez v4, :cond_3

    .line 104
    .line 105
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    goto :goto_1

    .line 109
    :cond_4
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    :cond_5
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 114
    .line 115
    .line 116
    move-result v1

    .line 117
    if-eqz v1, :cond_7

    .line 118
    .line 119
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    check-cast v1, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 124
    .line 125
    iget-boolean v3, v1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isNewComment:Z

    .line 126
    .line 127
    if-eqz v3, :cond_5

    .line 128
    .line 129
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->replyCommentId:Ljava/lang/String;

    .line 130
    .line 131
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 132
    .line 133
    .line 134
    move-result v3

    .line 135
    if-nez v3, :cond_6

    .line 136
    .line 137
    invoke-interface {v2, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    new-instance v3, Ll/wh5;

    .line 141
    .line 142
    invoke-direct {v3, v1}, Ll/wh5;-><init>(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 143
    .line 144
    .line 145
    invoke-static {v2, v3}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 146
    .line 147
    .line 148
    move-result v3

    .line 149
    add-int/lit8 v3, v3, 0x1

    .line 150
    .line 151
    invoke-interface {v2, v3, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 152
    .line 153
    .line 154
    goto :goto_2

    .line 155
    :cond_6
    new-instance v3, Ll/xh5;

    .line 156
    .line 157
    invoke-direct {v3, v1}, Ll/xh5;-><init>(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 158
    .line 159
    .line 160
    invoke-static {v2, v3}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    move-result-object v3

    .line 164
    if-nez v3, :cond_5

    .line 165
    .line 166
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 167
    .line 168
    .line 169
    goto :goto_2

    .line 170
    :cond_7
    iget-object p0, p0, Ll/di5;->e:Ljava/util/Map;

    .line 171
    .line 172
    iget-object p1, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 173
    .line 174
    invoke-interface {p0, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 175
    .line 176
    .line 177
    return-void
.end method
