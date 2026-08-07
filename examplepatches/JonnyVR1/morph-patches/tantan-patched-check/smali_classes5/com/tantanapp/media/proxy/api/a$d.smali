.class public Lcom/tantanapp/media/proxy/api/a$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/media/proxy/api/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/tantanapp/media/proxy/api/a;


# direct methods
.method public constructor <init>(Lcom/tantanapp/media/proxy/api/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/media/proxy/api/a$d;->a:Lcom/tantanapp/media/proxy/api/a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/tantanapp/media/proxy/api/a$d;->a:Lcom/tantanapp/media/proxy/api/a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/media/proxy/api/a;->a(Lcom/tantanapp/media/proxy/api/a;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/l7b0;->a(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/tantanapp/media/proxy/api/a$d;->a:Lcom/tantanapp/media/proxy/api/a;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/tantanapp/media/proxy/api/a;->h(Lcom/tantanapp/media/proxy/api/a;)Ljava/util/LinkedList;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    goto :goto_4

    .line 23
    :cond_0
    iget-object v0, p0, Lcom/tantanapp/media/proxy/api/a$d;->a:Lcom/tantanapp/media/proxy/api/a;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/media/proxy/api/a;->d(Lcom/tantanapp/media/proxy/api/a;)Ljava/util/Map;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-interface {v0}, Ljava/util/Map;->size()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    invoke-static {}, Lcom/tantanapp/media/proxy/api/a;->i()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-ge v0, v1, :cond_3

    .line 38
    .line 39
    invoke-static {}, Lcom/tantanapp/media/proxy/api/a;->i()I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    iget-object v1, p0, Lcom/tantanapp/media/proxy/api/a$d;->a:Lcom/tantanapp/media/proxy/api/a;

    .line 44
    .line 45
    invoke-static {v1}, Lcom/tantanapp/media/proxy/api/a;->d(Lcom/tantanapp/media/proxy/api/a;)Ljava/util/Map;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-interface {v1}, Ljava/util/Map;->size()I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    sub-int/2addr v0, v1

    .line 54
    iget-object v1, p0, Lcom/tantanapp/media/proxy/api/a$d;->a:Lcom/tantanapp/media/proxy/api/a;

    .line 55
    .line 56
    invoke-static {v1}, Lcom/tantanapp/media/proxy/api/a;->h(Lcom/tantanapp/media/proxy/api/a;)Ljava/util/LinkedList;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    monitor-enter v1

    .line 61
    :try_start_0
    iget-object v2, p0, Lcom/tantanapp/media/proxy/api/a$d;->a:Lcom/tantanapp/media/proxy/api/a;

    .line 62
    .line 63
    invoke-static {v2}, Lcom/tantanapp/media/proxy/api/a;->h(Lcom/tantanapp/media/proxy/api/a;)Ljava/util/LinkedList;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    const/4 v3, 0x0

    .line 72
    :goto_0
    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    .line 73
    .line 74
    .line 75
    move-result v4

    .line 76
    if-ge v3, v4, :cond_2

    .line 77
    .line 78
    iget-object v4, p0, Lcom/tantanapp/media/proxy/api/a$d;->a:Lcom/tantanapp/media/proxy/api/a;

    .line 79
    .line 80
    invoke-static {v4}, Lcom/tantanapp/media/proxy/api/a;->h(Lcom/tantanapp/media/proxy/api/a;)Ljava/util/LinkedList;

    .line 81
    .line 82
    .line 83
    move-result-object v4

    .line 84
    invoke-virtual {v4}, Ljava/util/LinkedList;->remove()Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v4

    .line 88
    check-cast v4, Landroid/net/Uri;

    .line 89
    .line 90
    if-eqz v4, :cond_1

    .line 91
    .line 92
    iget-object v5, p0, Lcom/tantanapp/media/proxy/api/a$d;->a:Lcom/tantanapp/media/proxy/api/a;

    .line 93
    .line 94
    sget-wide v6, Lcom/tantanapp/media/proxy/api/a;->l:J

    .line 95
    .line 96
    invoke-static {v5, v4, v6, v7}, Lcom/tantanapp/media/proxy/api/a;->j(Lcom/tantanapp/media/proxy/api/a;Landroid/net/Uri;J)V

    .line 97
    .line 98
    .line 99
    goto :goto_1

    .line 100
    :catchall_0
    move-exception p0

    .line 101
    goto :goto_2

    .line 102
    :cond_1
    :goto_1
    add-int/lit8 v3, v3, 0x1

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_2
    monitor-exit v1

    .line 106
    goto :goto_3

    .line 107
    :goto_2
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 108
    throw p0

    .line 109
    :cond_3
    :goto_3
    iget-object v0, p0, Lcom/tantanapp/media/proxy/api/a$d;->a:Lcom/tantanapp/media/proxy/api/a;

    .line 110
    .line 111
    invoke-static {v0}, Lcom/tantanapp/media/proxy/api/a;->h(Lcom/tantanapp/media/proxy/api/a;)Ljava/util/LinkedList;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    if-nez v0, :cond_4

    .line 120
    .line 121
    iget-object v0, p0, Lcom/tantanapp/media/proxy/api/a$d;->a:Lcom/tantanapp/media/proxy/api/a;

    .line 122
    .line 123
    invoke-static {v0}, Lcom/tantanapp/media/proxy/api/a;->a(Lcom/tantanapp/media/proxy/api/a;)Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    const-wide/16 v1, 0x1f4

    .line 128
    .line 129
    invoke-static {v0, p0, v1, v2}, Ll/l7b0;->c(Ljava/lang/Object;Ljava/lang/Runnable;J)V

    .line 130
    .line 131
    .line 132
    :cond_4
    :goto_4
    return-void
.end method
