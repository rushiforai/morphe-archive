.class public Ll/r230;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/r230$j;,
        Ll/r230$e;,
        Ll/r230$d;,
        Ll/r230$h;,
        Ll/r230$g;,
        Ll/r230$i;,
        Ll/r230$f;
    }
.end annotation


# static fields
.field public static final e:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/LinkedHashSet<",
            "Ll/r230$h;",
            ">;>;"
        }
    .end annotation
.end field

.field public static f:Ll/jxd0;

.field public static g:Ljava/lang/Integer;


# instance fields
.field public a:Ll/r230$j;

.field public b:Ll/r230$e;

.field public c:Ll/r230$d;

.field public d:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/r230;->e:Ljava/util/Map;

    .line 7
    .line 8
    new-instance v0, Ll/jxd0;

    .line 9
    .line 10
    const-string v1, "live_no_image_mode"

    .line 11
    .line 12
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Ll/r230;->f:Ll/jxd0;

    .line 18
    .line 19
    return-void
.end method

.method public constructor <init>(Ll/r230$d;)V
    .locals 1

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 14
    iput-boolean v0, p0, Ll/r230;->d:Z

    .line 15
    iput-object p1, p0, Ll/r230;->c:Ll/r230$d;

    return-void
.end method

.method public constructor <init>(Ll/r230$e;)V
    .locals 1

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 11
    iput-boolean v0, p0, Ll/r230;->d:Z

    .line 12
    iput-object p1, p0, Ll/r230;->b:Ll/r230$e;

    return-void
.end method

.method public constructor <init>(Ll/r230$j;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/r230;->d:Z

    .line 6
    .line 7
    iput-object p1, p0, Ll/r230;->a:Ll/r230$j;

    .line 8
    .line 9
    return-void
.end method

.method public static G(Landroid/content/Context;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static J(Ll/qim;)Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "imageInfo h = "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p0}, Ll/qim;->getHeight()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, " w = "

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-interface {p0}, Ll/qim;->getWidth()I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method

.method public static synthetic a(Ll/r230$h;)Lcom/facebook/imagepipeline/request/ImageRequest;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r230$h;->b:Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Ll/r230;Lcom/facebook/drawee/view/SimpleDraweeView;Ll/q3d0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/r230;->C(Lcom/facebook/drawee/view/SimpleDraweeView;Ll/q3d0;)V

    return-void
.end method

.method public static synthetic c(Ll/r230;Ljava/lang/String;Landroid/view/View;Lcom/facebook/imagepipeline/request/ImageRequest;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/r230;->B(Ljava/lang/String;Landroid/view/View;Lcom/facebook/imagepipeline/request/ImageRequest;)V

    return-void
.end method

.method public static synthetic d(Ljava/lang/String;Ll/gcg0;)V
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ll/am2;->n(Ljava/lang/String;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->a()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 12
    .line 13
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    new-instance v1, Ll/vrb0;

    .line 17
    .line 18
    invoke-direct {v1, p1}, Ll/vrb0;-><init>(Ll/gcg0;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p0, v1}, Ll/fsb0;->F(Lcom/facebook/imagepipeline/request/ImageRequest;Ll/y20;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static bridge synthetic e(Ll/r230;)Ll/r230$d;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r230;->c:Ll/r230$d;

    return-object p0
.end method

.method public static bridge synthetic f(Ll/r230;)Ll/r230$j;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r230;->a:Ll/r230$j;

    return-object p0
.end method

.method public static bridge synthetic g(Ll/r230;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/r230;->d:Z

    return-void
.end method

.method public static bridge synthetic h(Ll/r230;Lcom/facebook/imagepipeline/request/ImageRequest;Landroid/view/View;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/r230;->m(Lcom/facebook/imagepipeline/request/ImageRequest;Landroid/view/View;Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic i(Ll/r230;Landroid/view/View;)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/r230;->y(Landroid/view/View;)I

    move-result p0

    return p0
.end method

.method public static bridge synthetic j(Ll/r230;Landroid/view/View;)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/r230;->z(Landroid/view/View;)I

    move-result p0

    return p0
.end method

.method public static bridge synthetic k(Ll/r230;I)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/r230;->A(I)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic l(Ll/r230;Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ll/qim;Ljava/lang/String;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Ll/r230;->F(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ll/qim;Ljava/lang/String;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V

    return-void
.end method

.method public static o(Ljava/lang/String;)V
    .locals 4
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 1
    sget-object v0, Ll/r230;->e:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    :try_start_0
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Ljava/util/LinkedHashSet;

    .line 20
    .line 21
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Ljava/util/LinkedHashSet;

    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->size()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    add-int/lit8 v0, v0, -0x32

    .line 32
    .line 33
    invoke-static {p0, v1, v0}, Ll/r230;->q(Ljava/lang/String;Ljava/util/LinkedHashSet;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :catch_0
    move-exception v0

    .line 38
    new-instance v1, Ljava/lang/RuntimeException;

    .line 39
    .line 40
    new-instance v2, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    const-string v3, "evictOverSizeScene "

    .line 43
    .line 44
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-direct {v1, p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 55
    .line 56
    .line 57
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 58
    .line 59
    .line 60
    :cond_0
    return-void
.end method

.method public static p(Ljava/lang/String;)V
    .locals 4
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 1
    sget-object v0, Ll/r230;->e:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    :try_start_0
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Ljava/util/LinkedHashSet;

    .line 20
    .line 21
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Ljava/util/LinkedHashSet;

    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->size()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    invoke-static {p0, v1, v0}, Ll/r230;->q(Ljava/lang/String;Ljava/util/LinkedHashSet;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :catch_0
    move-exception v0

    .line 36
    new-instance v1, Ljava/lang/RuntimeException;

    .line 37
    .line 38
    new-instance v2, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    const-string v3, "evictOverSizeScene "

    .line 41
    .line 42
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-direct {v1, p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 56
    .line 57
    .line 58
    :cond_0
    return-void
.end method

.method public static q(Ljava/lang/String;Ljava/util/LinkedHashSet;I)V
    .locals 6
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/LinkedHashSet<",
            "Ll/r230$h;",
            ">;I)V"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    if-gez p2, :cond_0

    .line 3
    .line 4
    move p2, p0

    .line 5
    :cond_0
    invoke-virtual {p1}, Ljava/util/AbstractCollection;->size()I

    .line 6
    .line 7
    .line 8
    new-instance v0, Ljava/util/HashSet;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/util/AbstractCollection;->size()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-ne v1, p2, :cond_1

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Ljava/util/AbstractCollection;->clear()V

    .line 23
    .line 24
    .line 25
    goto :goto_2

    .line 26
    :cond_1
    invoke-virtual {p1}, Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    new-instance v2, Ljava/util/HashMap;

    .line 31
    .line 32
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 33
    .line 34
    .line 35
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    if-eqz v3, :cond_6

    .line 40
    .line 41
    if-ge p0, p2, :cond_6

    .line 42
    .line 43
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    check-cast v3, Ll/r230$h;

    .line 48
    .line 49
    iget-object v4, v3, Ll/r230$h;->a:Ljava/lang/ref/WeakReference;

    .line 50
    .line 51
    if-nez v4, :cond_2

    .line 52
    .line 53
    const/4 v4, 0x0

    .line 54
    goto :goto_1

    .line 55
    :cond_2
    invoke-virtual {v4}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    check-cast v4, Landroid/view/View;

    .line 60
    .line 61
    :goto_1
    if-nez v4, :cond_3

    .line 62
    .line 63
    invoke-virtual {v0, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_3
    invoke-static {v4}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 68
    .line 69
    .line 70
    move-result v5

    .line 71
    if-nez v5, :cond_4

    .line 72
    .line 73
    invoke-virtual {v0, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    add-int/lit8 p0, p0, 0x1

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_4
    invoke-virtual {v2, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v5

    .line 83
    if-eqz v5, :cond_5

    .line 84
    .line 85
    add-int/lit8 p0, p0, 0x1

    .line 86
    .line 87
    invoke-virtual {v2, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v5

    .line 91
    check-cast v5, Ll/r230$h;

    .line 92
    .line 93
    invoke-virtual {v0, v5}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    :cond_5
    invoke-virtual {v2, v4, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_6
    invoke-virtual {p1, v0}, Ljava/util/AbstractCollection;->removeAll(Ljava/util/Collection;)Z

    .line 101
    .line 102
    .line 103
    :goto_2
    invoke-virtual {v0}, Ljava/util/HashSet;->isEmpty()Z

    .line 104
    .line 105
    .line 106
    move-result p0

    .line 107
    if-nez p0, :cond_7

    .line 108
    .line 109
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 110
    .line 111
    new-instance p1, Ljava/util/HashSet;

    .line 112
    .line 113
    new-instance p2, Ll/m230;

    .line 114
    .line 115
    invoke-direct {p2}, Ll/m230;-><init>()V

    .line 116
    .line 117
    .line 118
    invoke-static {v0, p2}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 119
    .line 120
    .line 121
    move-result-object p2

    .line 122
    invoke-direct {p1, p2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p0, p1}, Ll/fsb0;->U(Ljava/util/Set;)V

    .line 126
    .line 127
    .line 128
    :cond_7
    return-void
.end method

.method public static s()V
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/fsb0;->V()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static t(ZLjava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ll/q3d0;)Ljava/lang/String;
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    return-object p1

    .line 4
    :cond_0
    const-string v0, "?"

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    const-string v0, "\\?"

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const/4 v0, 0x0

    .line 19
    aget-object p1, p1, v0

    .line 20
    .line 21
    invoke-static {p0, p1, p2, p3}, Ll/r230;->t(ZLjava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ll/q3d0;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0

    .line 26
    :cond_1
    invoke-static {p1, p2, p3}, Ll/wim;->b(Ljava/lang/String;Landroid/view/View;Ll/q3d0;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public static w()I
    .locals 2

    .line 1
    sget-object v0, Ll/r230;->g:Ljava/lang/Integer;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 6
    .line 7
    const-string v1, "window"

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Landroid/view/WindowManager;

    .line 14
    .line 15
    invoke-static {v0}, Ll/yn80;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Landroid/view/WindowManager;

    .line 20
    .line 21
    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Landroid/graphics/Point;

    .line 26
    .line 27
    invoke-direct {v1}, Landroid/graphics/Point;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/view/Display;->getSize(Landroid/graphics/Point;)V

    .line 31
    .line 32
    .line 33
    iget v0, v1, Landroid/graphics/Point;->x:I

    .line 34
    .line 35
    iget v1, v1, Landroid/graphics/Point;->y:I

    .line 36
    .line 37
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    sput-object v0, Ll/r230;->g:Ljava/lang/Integer;

    .line 46
    .line 47
    :cond_0
    sget-object v0, Ll/r230;->g:Ljava/lang/Integer;

    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    return v0
.end method


# virtual methods
.method public final A(I)Z
    .locals 0

    .line 1
    if-gtz p1, :cond_1

    .line 2
    .line 3
    const/high16 p0, -0x80000000

    .line 4
    .line 5
    if-ne p1, p0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0

    .line 10
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 11
    return p0
.end method

.method public final synthetic B(Ljava/lang/String;Landroid/view/View;Lcom/facebook/imagepipeline/request/ImageRequest;)V
    .locals 3

    .line 1
    sget-object v0, Ll/r230;->e:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ljava/util/LinkedHashSet;

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    new-instance v0, Ljava/util/LinkedHashSet;

    .line 18
    .line 19
    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    .line 20
    .line 21
    .line 22
    :cond_0
    new-instance v1, Ll/r230$h;

    .line 23
    .line 24
    invoke-direct {v1, p2, p3}, Ll/r230$h;-><init>(Landroid/view/View;Lcom/facebook/imagepipeline/request/ImageRequest;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    new-instance v1, Ljava/util/LinkedHashSet;

    .line 32
    .line 33
    invoke-direct {v1}, Ljava/util/LinkedHashSet;-><init>()V

    .line 34
    .line 35
    .line 36
    new-instance v2, Ll/r230$h;

    .line 37
    .line 38
    invoke-direct {v2, p2, p3}, Ll/r230$h;-><init>(Landroid/view/View;Lcom/facebook/imagepipeline/request/ImageRequest;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1, v2}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    :goto_0
    const-string p2, "context_common"

    .line 48
    .line 49
    const/16 p3, 0x50

    .line 50
    .line 51
    invoke-virtual {p0, p1, p2, p3}, Ll/r230;->r(Ljava/lang/String;Ljava/lang/String;I)V

    .line 52
    .line 53
    .line 54
    const-string p2, "context_livingAct"

    .line 55
    .line 56
    const/16 p3, 0x12c

    .line 57
    .line 58
    invoke-virtual {p0, p1, p2, p3}, Ll/r230;->r(Ljava/lang/String;Ljava/lang/String;I)V

    .line 59
    .line 60
    .line 61
    const-string p2, "context_single_room"

    .line 62
    .line 63
    const/16 p3, 0xc8

    .line 64
    .line 65
    invoke-virtual {p0, p1, p2, p3}, Ll/r230;->r(Ljava/lang/String;Ljava/lang/String;I)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public final synthetic C(Lcom/facebook/drawee/view/SimpleDraweeView;Ll/q3d0;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/r230;->c:Ll/r230$d;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iget-object v2, v0, Ll/r230$f;->b:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {v1, v2, p1, p2}, Ll/r230;->t(ZLjava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ll/q3d0;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    iput-object p2, v0, Ll/r230$f;->b:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {}, Ll/f9j;->g()Ll/lq70;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    iget-object v0, p0, Ll/r230;->c:Ll/r230$d;

    .line 17
    .line 18
    iget-object v0, v0, Ll/r230$f;->b:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p2, v0}, Ll/lq70;->N(Landroid/net/Uri;)Ll/lq70;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    iget-object v0, p0, Ll/r230;->c:Ll/r230$d;

    .line 29
    .line 30
    iget-boolean v0, v0, Ll/r230$j;->k:Z

    .line 31
    .line 32
    invoke-virtual {p2, v0}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->z(Z)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    check-cast p2, Ll/lq70;

    .line 37
    .line 38
    new-instance v0, Ll/r230$c;

    .line 39
    .line 40
    invoke-direct {v0, p0, p1}, Ll/r230$c;-><init>(Ll/r230;Lcom/facebook/drawee/view/SimpleDraweeView;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p2, v0}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->B(Ll/v36;)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    check-cast p2, Ll/lq70;

    .line 48
    .line 49
    invoke-virtual {p2}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->n()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    check-cast v0, Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 54
    .line 55
    iget-object v1, p0, Ll/r230;->c:Ll/r230$d;

    .line 56
    .line 57
    iget-object v1, v1, Ll/r230$f;->a:Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {p0, v0, p1, v1}, Ll/r230;->m(Lcom/facebook/imagepipeline/request/ImageRequest;Landroid/view/View;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p2}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->c()Ll/c7;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p1, p0}, Lcom/facebook/drawee/view/DraweeView;->setController(Ll/lde;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public D(Lcom/facebook/drawee/view/SimpleDraweeView;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-object v0, p0, Ll/r230;->c:Ll/r230$d;

    .line 5
    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    return-void

    .line 9
    :cond_1
    iget-object v1, v0, Ll/r230$f;->b:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v1, :cond_2

    .line 12
    .line 13
    iget-object v1, v0, Ll/r230$f;->c:Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 14
    .line 15
    if-nez v1, :cond_2

    .line 16
    .line 17
    :goto_0
    return-void

    .line 18
    :cond_2
    iget v1, v0, Ll/r230$j;->d:I

    .line 19
    .line 20
    iget v0, v0, Ll/r230$j;->e:I

    .line 21
    .line 22
    new-instance v2, Ll/n230;

    .line 23
    .line 24
    invoke-direct {v2, p0, p1}, Ll/n230;-><init>(Ll/r230;Lcom/facebook/drawee/view/SimpleDraweeView;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p1, v1, v0, v2}, Ll/r230;->n(Landroid/view/View;IILl/r230$g;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public E(Lcom/facebook/drawee/view/SimpleDraweeView;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    iget-object v0, p0, Ll/r230;->a:Ll/r230$j;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v1, v0, Ll/r230$f;->b:Ljava/lang/String;

    .line 9
    .line 10
    if-nez v1, :cond_1

    .line 11
    .line 12
    iget-object v1, v0, Ll/r230$f;->c:Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 13
    .line 14
    if-nez v1, :cond_1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    invoke-static {v0}, Ll/r230$j;->e(Ll/r230$j;)Z

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/r230;->a:Ll/r230$j;

    .line 21
    .line 22
    iget v1, v0, Ll/r230$j;->d:I

    .line 23
    .line 24
    iget v0, v0, Ll/r230$j;->e:I

    .line 25
    .line 26
    new-instance v2, Ll/r230$a;

    .line 27
    .line 28
    invoke-direct {v2, p0, p1}, Ll/r230$a;-><init>(Ll/r230;Lcom/facebook/drawee/view/SimpleDraweeView;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, p1, v1, v0, v2}, Ll/r230;->n(Landroid/view/View;IILl/r230$g;)V

    .line 32
    .line 33
    .line 34
    :cond_2
    :goto_0
    return-void
.end method

.method public final F(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ll/qim;Ljava/lang/String;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2}, Ll/r230;->H(Lcom/facebook/drawee/view/SimpleDraweeView;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    invoke-static {p3}, Ll/r230;->J(Ll/qim;)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/r230;->a:Ll/r230$j;

    .line 8
    .line 9
    iget-object p6, p0, Ll/r230;->c:Ll/r230$d;

    .line 10
    .line 11
    invoke-virtual {p0, p1, p6}, Ll/r230;->K(Ll/r230$j;Ll/r230$d;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p4, p5}, Ll/r230;->I(Ljava/lang/String;Lcom/p1/mobile/putong/data/Picture$ImageUri;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    invoke-interface {p3}, Ll/qim;->getHeight()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    int-to-float p0, p0

    .line 22
    const/high16 p1, 0x3f800000    # 1.0f

    .line 23
    .line 24
    mul-float/2addr p0, p1

    .line 25
    invoke-virtual {p2}, Landroid/view/View;->getMeasuredHeight()I

    .line 26
    .line 27
    .line 28
    move-result p4

    .line 29
    int-to-float p4, p4

    .line 30
    div-float/2addr p0, p4

    .line 31
    const p4, 0x3f99999a    # 1.2f

    .line 32
    .line 33
    .line 34
    cmpl-float p0, p0, p4

    .line 35
    .line 36
    if-gtz p0, :cond_1

    .line 37
    .line 38
    invoke-interface {p3}, Ll/qim;->getWidth()I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    int-to-float p0, p0

    .line 43
    mul-float/2addr p0, p1

    .line 44
    invoke-virtual {p2}, Landroid/view/View;->getMeasuredWidth()I

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    int-to-float p1, p1

    .line 49
    div-float/2addr p0, p1

    .line 50
    cmpl-float p0, p0, p4

    .line 51
    .line 52
    if-lez p0, :cond_0

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_0
    return-void

    .line 56
    :cond_1
    :goto_0
    :try_start_0
    invoke-virtual {p2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p2}, Landroid/view/View;->getId()I

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :catch_0
    invoke-virtual {p2}, Landroid/view/View;->getId()I

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public final H(Lcom/facebook/drawee/view/SimpleDraweeView;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const-string p0, "origin view is gone "

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_2

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-nez p0, :cond_1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    const-string v0, "origin view size h = "

    .line 26
    .line 27
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string v0, " w = "

    .line 38
    .line 39
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    return-object p0

    .line 54
    :cond_2
    :goto_0
    const-string p0, "origin view size = 0"

    .line 55
    .line 56
    return-object p0
.end method

.method public final I(Ljava/lang/String;Lcom/p1/mobile/putong/data/Picture$ImageUri;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const-string v0, " url = "

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    new-instance p0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_0
    if-eqz p2, :cond_1

    .line 23
    .line 24
    new-instance p0, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0

    .line 41
    :cond_1
    const-string p0, "url = null"

    .line 42
    .line 43
    return-object p0
.end method

.method public final K(Ll/r230$j;Ll/r230$d;)Ljava/lang/String;
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    const-string p0, ""

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    if-eqz p1, :cond_1

    .line 9
    .line 10
    iget p0, p1, Ll/r230$j;->d:I

    .line 11
    .line 12
    iget p1, p1, Ll/r230$j;->e:I

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    const/4 p0, 0x0

    .line 16
    move p1, p0

    .line 17
    :goto_0
    if-eqz p2, :cond_2

    .line 18
    .line 19
    iget p0, p2, Ll/r230$j;->d:I

    .line 20
    .line 21
    iget p1, p2, Ll/r230$j;->e:I

    .line 22
    .line 23
    :cond_2
    new-instance p2, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    const-string v0, " suggest size w = "

    .line 26
    .line 27
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string p0, " h = "

    .line 34
    .line 35
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method

.method public L(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/r230;->b:Ll/r230$e;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, v0, Ll/r230$f;->b:Ljava/lang/String;

    .line 7
    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    return-void

    .line 11
    :cond_1
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Ll/am2;->n(Ljava/lang/String;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v1, p0, Ll/r230;->b:Ll/r230$e;

    .line 18
    .line 19
    invoke-static {v1}, Ll/r230$e;->d(Ll/r230$e;)Lcom/facebook/imagepipeline/common/Priority;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->N(Lcom/facebook/imagepipeline/common/Priority;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->a()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object v1, p0, Ll/r230;->b:Ll/r230$e;

    .line 32
    .line 33
    iget-object v1, v1, Ll/r230$f;->a:Ljava/lang/String;

    .line 34
    .line 35
    const/4 v2, 0x0

    .line 36
    invoke-virtual {p0, v0, v2, v1}, Ll/r230;->m(Lcom/facebook/imagepipeline/request/ImageRequest;Landroid/view/View;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    if-eqz p1, :cond_2

    .line 40
    .line 41
    invoke-static {}, Ll/f9j;->a()Ll/rjm;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0, v0, v2}, Ll/rjm;->w(Lcom/facebook/imagepipeline/request/ImageRequest;Ljava/lang/Object;)Ll/i6c;

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_2
    invoke-static {}, Ll/f9j;->a()Ll/rjm;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0, v0, v2}, Ll/rjm;->u(Lcom/facebook/imagepipeline/request/ImageRequest;Ljava/lang/Object;)Ll/i6c;

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public final m(Lcom/facebook/imagepipeline/request/ImageRequest;Landroid/view/View;Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ll/p230;

    .line 2
    .line 3
    invoke-direct {v0, p0, p3, p2, p1}, Ll/p230;-><init>(Ll/r230;Ljava/lang/String;Landroid/view/View;Lcom/facebook/imagepipeline/request/ImageRequest;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final n(Landroid/view/View;IILl/r230$g;)V
    .locals 1

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    if-nez p3, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 10
    .line 11
    .line 12
    move-result p3

    .line 13
    :cond_0
    if-nez p2, :cond_1

    .line 14
    .line 15
    if-nez p3, :cond_1

    .line 16
    .line 17
    new-instance v0, Ll/r230$b;

    .line 18
    .line 19
    invoke-direct {v0, p0, p1, p4}, Ll/r230$b;-><init>(Ll/r230;Landroid/view/View;Ll/r230$g;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 23
    .line 24
    .line 25
    :cond_1
    if-lez p2, :cond_2

    .line 26
    .line 27
    if-lez p3, :cond_2

    .line 28
    .line 29
    new-instance p0, Ll/q3d0;

    .line 30
    .line 31
    invoke-direct {p0, p2, p3}, Ll/q3d0;-><init>(II)V

    .line 32
    .line 33
    .line 34
    invoke-interface {p4, p0}, Ll/r230$g;->a(Ll/q3d0;)V

    .line 35
    .line 36
    .line 37
    :cond_2
    return-void
.end method

.method public final r(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 3

    .line 1
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Ll/r230;->e:Ljava/util/Map;

    .line 8
    .line 9
    invoke-interface {p0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ljava/util/LinkedHashSet;

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/util/AbstractCollection;->size()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-le v0, p3, :cond_0

    .line 20
    .line 21
    int-to-float v0, p3

    .line 22
    const v1, 0x3ecccccd    # 0.4f

    .line 23
    .line 24
    .line 25
    mul-float/2addr v0, v1

    .line 26
    float-to-int v0, v0

    .line 27
    :try_start_0
    invoke-static {p2, p0, v0}, Ll/r230;->q(Ljava/lang/String;Ljava/util/LinkedHashSet;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :catch_0
    move-exception p0

    .line 32
    new-instance v0, Ljava/lang/RuntimeException;

    .line 33
    .line 34
    new-instance v1, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    const-string v2, "evictOverSizeScene "

    .line 37
    .line 38
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string p1, " "

    .line 45
    .line 46
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-direct {v0, p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 63
    .line 64
    .line 65
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 66
    .line 67
    .line 68
    :cond_0
    return-void
.end method

.method public u(Ll/y20;)Lcom/facebook/imagepipeline/request/ImageRequest;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Landroid/graphics/Bitmap;",
            ">;)",
            "Lcom/facebook/imagepipeline/request/ImageRequest;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/r230;->b:Ll/r230$e;

    .line 2
    .line 3
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 4
    .line 5
    iget-object v0, v0, Ll/r230$f;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Ll/am2;->n(Ljava/lang/String;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->a()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 16
    .line 17
    invoke-virtual {v1, v0, p1}, Ll/fsb0;->F(Lcom/facebook/imagepipeline/request/ImageRequest;Ll/y20;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Ll/r230;->b:Ll/r230$e;

    .line 21
    .line 22
    iget-object p1, p1, Ll/r230$f;->a:Ljava/lang/String;

    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    invoke-virtual {p0, v0, v1, p1}, Ll/r230;->m(Lcom/facebook/imagepipeline/request/ImageRequest;Landroid/view/View;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-object v0
.end method

.method public v()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/r230;->b:Ll/r230$e;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/r230$e;

    .line 6
    .line 7
    const-string v1, "context_square"

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ll/r230$e;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/r230;->b:Ll/r230$e;

    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Ll/r230;->b:Ll/r230$e;

    .line 15
    .line 16
    invoke-static {v0}, Ll/r230$e;->e(Ll/r230$e;)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-lez v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Ll/r230;->b:Ll/r230$e;

    .line 23
    .line 24
    invoke-static {v0}, Ll/r230$e;->c(Ll/r230$e;)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-lez v0, :cond_1

    .line 29
    .line 30
    iget-object v0, p0, Ll/r230;->b:Ll/r230$e;

    .line 31
    .line 32
    iget-object v0, v0, Ll/r230$f;->b:Ljava/lang/String;

    .line 33
    .line 34
    new-instance v1, Ll/q3d0;

    .line 35
    .line 36
    iget-object v2, p0, Ll/r230;->b:Ll/r230$e;

    .line 37
    .line 38
    invoke-static {v2}, Ll/r230$e;->e(Ll/r230$e;)I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    iget-object p0, p0, Ll/r230;->b:Ll/r230$e;

    .line 43
    .line 44
    invoke-static {p0}, Ll/r230$e;->c(Ll/r230$e;)I

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    invoke-direct {v1, v2, p0}, Ll/q3d0;-><init>(II)V

    .line 49
    .line 50
    .line 51
    const/4 p0, 0x0

    .line 52
    const/4 v2, 0x0

    .line 53
    invoke-static {p0, v0, v2, v1}, Ll/r230;->t(ZLjava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ll/q3d0;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    goto :goto_0

    .line 58
    :cond_1
    iget-object p0, p0, Ll/r230;->b:Ll/r230$e;

    .line 59
    .line 60
    iget-object p0, p0, Ll/r230$f;->b:Ljava/lang/String;

    .line 61
    .line 62
    :goto_0
    new-instance v0, Ll/o230;

    .line 63
    .line 64
    invoke-direct {v0, p0}, Ll/o230;-><init>(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    return-object p0
.end method

.method public final x(Landroid/view/View;III)I
    .locals 0

    .line 1
    sub-int p0, p3, p4

    .line 2
    .line 3
    if-lez p0, :cond_0

    .line 4
    .line 5
    return p0

    .line 6
    :cond_0
    sub-int/2addr p2, p4

    .line 7
    if-lez p2, :cond_1

    .line 8
    .line 9
    return p2

    .line 10
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->isLayoutRequested()Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-nez p0, :cond_2

    .line 15
    .line 16
    const/4 p0, -0x2

    .line 17
    if-ne p3, p0, :cond_2

    .line 18
    .line 19
    invoke-static {}, Ll/r230;->w()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0

    .line 24
    :cond_2
    const/4 p0, 0x0

    .line 25
    return p0
.end method

.method public final y(Landroid/view/View;)I
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getPaddingTop()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getPaddingBottom()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    add-int/2addr v0, v1

    .line 10
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    iget v1, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 v1, 0x0

    .line 20
    :goto_0
    if-nez v1, :cond_1

    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    invoke-virtual {p0, p1, v2, v1, v0}, Ll/r230;->x(Landroid/view/View;III)I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    return p0
.end method

.method public final z(Landroid/view/View;)I
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getPaddingRight()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    add-int/2addr v0, v1

    .line 10
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    iget v1, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 v1, 0x0

    .line 20
    :goto_0
    if-nez v1, :cond_1

    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    invoke-virtual {p0, p1, v2, v1, v0}, Ll/r230;->x(Landroid/view/View;III)I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    return p0
.end method
