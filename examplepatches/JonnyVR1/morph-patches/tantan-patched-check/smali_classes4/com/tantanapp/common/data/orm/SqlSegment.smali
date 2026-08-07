.class public Lcom/tantanapp/common/data/orm/SqlSegment;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static FALSE:Lcom/tantanapp/common/data/orm/SqlSegment;

.field public static NULL:Lcom/tantanapp/common/data/orm/SqlSegment;

.field public static TRUE:Lcom/tantanapp/common/data/orm/SqlSegment;


# instance fields
.field public final args:[Ljava/lang/String;

.field public final part:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1, v1}, Lcom/tantanapp/common/data/orm/SqlSegment;-><init>(Ljava/lang/String;[Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/tantanapp/common/data/orm/SqlSegment;->NULL:Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 8
    .line 9
    new-instance v0, Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 10
    .line 11
    const-string v2, "1=0"

    .line 12
    .line 13
    invoke-direct {v0, v2, v1}, Lcom/tantanapp/common/data/orm/SqlSegment;-><init>(Ljava/lang/String;[Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    sput-object v0, Lcom/tantanapp/common/data/orm/SqlSegment;->FALSE:Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 17
    .line 18
    new-instance v0, Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 19
    .line 20
    const-string v2, "1=1"

    .line 21
    .line 22
    invoke-direct {v0, v2, v1}, Lcom/tantanapp/common/data/orm/SqlSegment;-><init>(Ljava/lang/String;[Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    sput-object v0, Lcom/tantanapp/common/data/orm/SqlSegment;->TRUE:Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 26
    .line 27
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;[Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tantanapp/common/data/orm/SqlSegment;->part:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/tantanapp/common/data/orm/SqlSegment;->args:[Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Lcom/tantanapp/common/data/orm/SqlSegment;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/SqlSegment;->part:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Lcom/tantanapp/common/data/orm/SqlSegment;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/tantanapp/common/data/orm/SqlSegment;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static concat(Ljava/util/List;Ljava/lang/String;)Lcom/tantanapp/common/data/orm/SqlSegment;
    .locals 9
    .param p0    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/tantanapp/common/data/orm/SqlSegment;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lcom/tantanapp/common/data/orm/SqlSegment;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/wzf0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/wzf0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    sget-object p0, Lcom/tantanapp/common/data/orm/SqlSegment;->NULL:Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    const/4 v1, 0x1

    .line 24
    const/4 v2, 0x0

    .line 25
    if-ne v0, v1, :cond_1

    .line 26
    .line 27
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_1
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    move v1, v2

    .line 39
    :cond_2
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    if-eqz v3, :cond_3

    .line 44
    .line 45
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    check-cast v3, Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 50
    .line 51
    iget-object v3, v3, Lcom/tantanapp/common/data/orm/SqlSegment;->args:[Ljava/lang/String;

    .line 52
    .line 53
    if-eqz v3, :cond_2

    .line 54
    .line 55
    array-length v3, v3

    .line 56
    add-int/2addr v1, v3

    .line 57
    goto :goto_0

    .line 58
    :cond_3
    new-array v0, v1, [Ljava/lang/String;

    .line 59
    .line 60
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    move v3, v2

    .line 65
    :cond_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    if-eqz v4, :cond_5

    .line 70
    .line 71
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    check-cast v4, Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 76
    .line 77
    iget-object v4, v4, Lcom/tantanapp/common/data/orm/SqlSegment;->args:[Ljava/lang/String;

    .line 78
    .line 79
    if-eqz v4, :cond_4

    .line 80
    .line 81
    array-length v5, v4

    .line 82
    move v6, v2

    .line 83
    :goto_1
    if-ge v6, v5, :cond_4

    .line 84
    .line 85
    aget-object v7, v4, v6

    .line 86
    .line 87
    add-int/lit8 v8, v3, 0x1

    .line 88
    .line 89
    aput-object v7, v0, v3

    .line 90
    .line 91
    add-int/lit8 v6, v6, 0x1

    .line 92
    .line 93
    move v3, v8

    .line 94
    goto :goto_1

    .line 95
    :cond_5
    new-instance v1, Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 96
    .line 97
    new-instance v2, Ll/xzf0;

    .line 98
    .line 99
    invoke-direct {v2}, Ll/xzf0;-><init>()V

    .line 100
    .line 101
    .line 102
    invoke-static {p0, v2}, Ll/jyb;->T(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-static {p0, p1}, Ll/jyb;->U(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    invoke-direct {v1, p0, v0}, Lcom/tantanapp/common/data/orm/SqlSegment;-><init>(Ljava/lang/String;[Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    return-object v1
.end method


# virtual methods
.method public append(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/SqlSegment;
    .locals 3

    .line 1
    new-instance v0, Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    iget-object v2, p0, Lcom/tantanapp/common/data/orm/SqlSegment;->part:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/SqlSegment;->args:[Ljava/lang/String;

    .line 21
    .line 22
    invoke-direct {v0, p1, p0}, Lcom/tantanapp/common/data/orm/SqlSegment;-><init>(Ljava/lang/String;[Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-object v0
.end method

.method public isEmpty()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/SqlSegment;->part:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/SqlSegment;->args:[Ljava/lang/String;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    array-length p0, p0

    .line 14
    if-nez p0, :cond_1

    .line 15
    .line 16
    :cond_0
    const/4 p0, 0x1

    .line 17
    return p0

    .line 18
    :cond_1
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method public prepend(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/SqlSegment;
    .locals 2

    .line 1
    new-instance v0, Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/tantanapp/common/data/orm/SqlSegment;->part:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/SqlSegment;->args:[Ljava/lang/String;

    .line 21
    .line 22
    invoke-direct {v0, p1, p0}, Lcom/tantanapp/common/data/orm/SqlSegment;-><init>(Ljava/lang/String;[Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-object v0
.end method
