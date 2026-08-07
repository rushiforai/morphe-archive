.class public final Ll/lkg0;
.super Ljava/util/TimerTask;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/ArrayList;

.field public final synthetic b:Ll/trg0;


# direct methods
.method public constructor <init>(Ll/trg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/lkg0;->b:Ll/trg0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

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
    iput-object p1, p0, Ll/lkg0;->a:Ljava/util/ArrayList;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/lkg0;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-object v0, p0, Ll/lkg0;->a:Ljava/util/ArrayList;

    .line 7
    .line 8
    iget-object v1, p0, Ll/lkg0;->b:Ll/trg0;

    .line 9
    .line 10
    invoke-virtual {v1}, Ll/trg0;->c()Ljava/util/Collection;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 15
    .line 16
    .line 17
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 18
    .line 19
    .line 20
    move-result-wide v0

    .line 21
    iget-object v2, p0, Ll/lkg0;->b:Ll/trg0;

    .line 22
    .line 23
    invoke-static {v2}, Ll/trg0;->a(Ll/trg0;)I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    mul-int/lit16 v2, v2, 0x5dc

    .line 28
    .line 29
    int-to-long v2, v2

    .line 30
    sub-long/2addr v0, v2

    .line 31
    iget-object v2, p0, Ll/lkg0;->a:Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    const/4 v4, 0x0

    .line 38
    move v5, v4

    .line 39
    :cond_0
    :goto_0
    if-ge v5, v3, :cond_3

    .line 40
    .line 41
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v6

    .line 45
    add-int/lit8 v5, v5, 0x1

    .line 46
    .line 47
    check-cast v6, Ll/hog0;

    .line 48
    .line 49
    instance-of v7, v6, Ll/swg0;

    .line 50
    .line 51
    if-eqz v7, :cond_0

    .line 52
    .line 53
    check-cast v6, Ll/swg0;

    .line 54
    .line 55
    iget-wide v7, v6, Ll/swg0;->l:J

    .line 56
    .line 57
    cmp-long v7, v7, v0

    .line 58
    .line 59
    if-gez v7, :cond_1

    .line 60
    .line 61
    const-string v7, "The connection was closed because the other endpoint did not respond with a pong in time. For more information check: https://github.com/TooTallNate/Java-WebSocket/wiki/Lost-connection-detection"

    .line 62
    .line 63
    const/16 v8, 0x3ee

    .line 64
    .line 65
    invoke-virtual {v6, v8, v7, v4}, Ll/swg0;->e(ILjava/lang/String;Z)V

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_1
    iget v7, v6, Ll/swg0;->d:I

    .line 70
    .line 71
    const/4 v8, 0x3

    .line 72
    if-ne v7, v8, :cond_0

    .line 73
    .line 74
    iget-object v7, v6, Ll/swg0;->n:Ll/qmg0;

    .line 75
    .line 76
    if-nez v7, :cond_2

    .line 77
    .line 78
    new-instance v7, Ll/qmg0;

    .line 79
    .line 80
    invoke-direct {v7}, Ll/qmg0;-><init>()V

    .line 81
    .line 82
    .line 83
    iput-object v7, v6, Ll/swg0;->n:Ll/qmg0;

    .line 84
    .line 85
    :cond_2
    iget-object v7, v6, Ll/swg0;->n:Ll/qmg0;

    .line 86
    .line 87
    invoke-static {v7}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 88
    .line 89
    .line 90
    move-result-object v7

    .line 91
    invoke-virtual {v6, v7}, Ll/swg0;->c(Ljava/util/List;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 92
    .line 93
    .line 94
    goto :goto_0

    .line 95
    :catch_0
    :cond_3
    iget-object p0, p0, Ll/lkg0;->a:Ljava/util/ArrayList;

    .line 96
    .line 97
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 98
    .line 99
    .line 100
    return-void
.end method
