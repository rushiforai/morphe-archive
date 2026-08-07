.class public final Landroidx/work/impl/WorkManagerImplExtKt;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000L\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u001a\u00e1\u0001\u0010\u0014\u001a\u00020\u00132\u0006\u0010\u0001\u001a\u00020\u00002\u0006\u0010\u0003\u001a\u00020\u00022\u0008\u0008\u0002\u0010\u0005\u001a\u00020\u00042\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u00062\u0008\u0008\u0002\u0010\t\u001a\u00020\u00082\u0008\u0008\u0002\u0010\u000b\u001a\u00020\n2\u0097\u0001\u0008\u0002\u0010\u0012\u001a\u0090\u0001\u0012\u0013\u0012\u00110\u0000\u00a2\u0006\u000c\u0008\r\u0012\u0008\u0008\u000e\u0012\u0004\u0008\u0008(\u0001\u0012\u0013\u0012\u00110\u0002\u00a2\u0006\u000c\u0008\r\u0012\u0008\u0008\u000e\u0012\u0004\u0008\u0008(\u0003\u0012\u0013\u0012\u00110\u0004\u00a2\u0006\u000c\u0008\r\u0012\u0008\u0008\u000e\u0012\u0004\u0008\u0008(\u0005\u0012\u0013\u0012\u00110\u0006\u00a2\u0006\u000c\u0008\r\u0012\u0008\u0008\u000e\u0012\u0004\u0008\u0008(\u0007\u0012\u0013\u0012\u00110\u0008\u00a2\u0006\u000c\u0008\r\u0012\u0008\u0008\u000e\u0012\u0004\u0008\u0008(\t\u0012\u0013\u0012\u00110\n\u00a2\u0006\u000c\u0008\r\u0012\u0008\u0008\u000e\u0012\u0004\u0008\u0008(\u000b\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00100\u000f0\u000cj\u0002`\u0011H\u0007\u00a2\u0006\u0004\u0008\u0014\u0010\u0015\u001aE\u0010\u0016\u001a\u0008\u0012\u0004\u0012\u00020\u00100\u000f2\u0006\u0010\u0001\u001a\u00020\u00002\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\u00082\u0006\u0010\u000b\u001a\u00020\nH\u0002\u00a2\u0006\u0004\u0008\u0016\u0010\u0017\u001a\u0017\u0010\u001a\u001a\u00020\u00192\u0006\u0010\u0018\u001a\u00020\u0004H\u0001\u00a2\u0006\u0004\u0008\u001a\u0010\u001b*\u00a0\u0002\u0010\u001c\"\u008c\u0001\u0012\u0013\u0012\u00110\u0000\u00a2\u0006\u000c\u0008\r\u0012\u0008\u0008\u000e\u0012\u0004\u0008\u0008(\u0001\u0012\u0013\u0012\u00110\u0002\u00a2\u0006\u000c\u0008\r\u0012\u0008\u0008\u000e\u0012\u0004\u0008\u0008(\u0003\u0012\u0013\u0012\u00110\u0004\u00a2\u0006\u000c\u0008\r\u0012\u0008\u0008\u000e\u0012\u0004\u0008\u0008(\u0005\u0012\u0013\u0012\u00110\u0006\u00a2\u0006\u000c\u0008\r\u0012\u0008\u0008\u000e\u0012\u0004\u0008\u0008(\u0007\u0012\u0013\u0012\u00110\u0008\u00a2\u0006\u000c\u0008\r\u0012\u0008\u0008\u000e\u0012\u0004\u0008\u0008(\t\u0012\u0013\u0012\u00110\n\u00a2\u0006\u000c\u0008\r\u0012\u0008\u0008\u000e\u0012\u0004\u0008\u0008(\u000b\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00100\u000f0\u000c2\u008c\u0001\u0012\u0013\u0012\u00110\u0000\u00a2\u0006\u000c\u0008\r\u0012\u0008\u0008\u000e\u0012\u0004\u0008\u0008(\u0001\u0012\u0013\u0012\u00110\u0002\u00a2\u0006\u000c\u0008\r\u0012\u0008\u0008\u000e\u0012\u0004\u0008\u0008(\u0003\u0012\u0013\u0012\u00110\u0004\u00a2\u0006\u000c\u0008\r\u0012\u0008\u0008\u000e\u0012\u0004\u0008\u0008(\u0005\u0012\u0013\u0012\u00110\u0006\u00a2\u0006\u000c\u0008\r\u0012\u0008\u0008\u000e\u0012\u0004\u0008\u0008(\u0007\u0012\u0013\u0012\u00110\u0008\u00a2\u0006\u000c\u0008\r\u0012\u0008\u0008\u000e\u0012\u0004\u0008\u0008(\t\u0012\u0013\u0012\u00110\n\u00a2\u0006\u000c\u0008\r\u0012\u0008\u0008\u000e\u0012\u0004\u0008\u0008(\u000b\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00100\u000f0\u000c\u00a8\u0006\u001d"
    }
    d2 = {
        "Landroid/content/Context;",
        "context",
        "Landroidx/work/a;",
        "configuration",
        "Ll/zni0;",
        "workTaskExecutor",
        "Landroidx/work/impl/WorkDatabase;",
        "workDatabase",
        "Ll/fgj0;",
        "trackers",
        "Landroidx/work/impl/a;",
        "processor",
        "Lkotlin/Function6;",
        "Lkotlin/ParameterName;",
        "name",
        "",
        "Ll/h2e0;",
        "Landroidx/work/impl/SchedulersCreator;",
        "schedulersCreator",
        "Ll/xiq0;",
        "d",
        "(Landroid/content/Context;Landroidx/work/a;Ll/zni0;Landroidx/work/impl/WorkDatabase;Ll/fgj0;Landroidx/work/impl/a;Lkotlin/jvm/functions/Function6;)Ll/xiq0;",
        "b",
        "(Landroid/content/Context;Landroidx/work/a;Ll/zni0;Landroidx/work/impl/WorkDatabase;Ll/fgj0;Landroidx/work/impl/a;)Ljava/util/List;",
        "taskExecutor",
        "Ll/drb;",
        "f",
        "(Ll/zni0;)Ll/drb;",
        "SchedulersCreator",
        "work-runtime_release"
    }
    k = 0x2
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static final synthetic a(Landroid/content/Context;Landroidx/work/a;Ll/zni0;Landroidx/work/impl/WorkDatabase;Ll/fgj0;Landroidx/work/impl/a;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-static/range {p0 .. p5}, Landroidx/work/impl/WorkManagerImplExtKt;->b(Landroid/content/Context;Landroidx/work/a;Ll/zni0;Landroidx/work/impl/WorkDatabase;Ll/fgj0;Landroidx/work/impl/a;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final b(Landroid/content/Context;Landroidx/work/a;Ll/zni0;Landroidx/work/impl/WorkDatabase;Ll/fgj0;Landroidx/work/impl/a;)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroidx/work/a;",
            "Ll/zni0;",
            "Landroidx/work/impl/WorkDatabase;",
            "Ll/fgj0;",
            "Landroidx/work/impl/a;",
            ")",
            "Ljava/util/List<",
            "Ll/h2e0;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p0, p3, p1}, Ll/n2e0;->c(Landroid/content/Context;Landroidx/work/impl/WorkDatabase;Landroidx/work/a;)Ll/h2e0;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    new-instance v0, Ll/n9k;

    .line 9
    .line 10
    new-instance v5, Ll/uiq0;

    .line 11
    .line 12
    invoke-direct {v5, p5, p2}, Ll/uiq0;-><init>(Landroidx/work/impl/a;Ll/zni0;)V

    .line 13
    .line 14
    .line 15
    move-object v1, p0

    .line 16
    move-object v2, p1

    .line 17
    move-object v6, p2

    .line 18
    move-object v3, p4

    .line 19
    move-object v4, p5

    .line 20
    invoke-direct/range {v0 .. v6}, Ll/n9k;-><init>(Landroid/content/Context;Landroidx/work/a;Ll/fgj0;Landroidx/work/impl/a;Ll/siq0;Ll/zni0;)V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x2

    .line 24
    new-array p0, p0, [Ll/h2e0;

    .line 25
    .line 26
    const/4 p1, 0x0

    .line 27
    aput-object p3, p0, p1

    .line 28
    .line 29
    const/4 p1, 0x1

    .line 30
    aput-object v0, p0, p1

    .line 31
    .line 32
    invoke-static {p0}, Lkotlin/collections/CollectionsKt;->listOf([Ljava/lang/Object;)Ljava/util/List;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method

.method public static final c(Landroid/content/Context;Landroidx/work/a;)Ll/xiq0;
    .locals 9
    .param p0    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p1    # Landroidx/work/a;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmName;
    .end annotation

    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v7, 0x7c

    const/4 v8, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    invoke-static/range {v0 .. v8}, Landroidx/work/impl/WorkManagerImplExtKt;->e(Landroid/content/Context;Landroidx/work/a;Ll/zni0;Landroidx/work/impl/WorkDatabase;Ll/fgj0;Landroidx/work/impl/a;Lkotlin/jvm/functions/Function6;ILjava/lang/Object;)Ll/xiq0;

    move-result-object p0

    return-object p0
.end method

.method public static final d(Landroid/content/Context;Landroidx/work/a;Ll/zni0;Landroidx/work/impl/WorkDatabase;Ll/fgj0;Landroidx/work/impl/a;Lkotlin/jvm/functions/Function6;)Ll/xiq0;
    .locals 9
    .param p0    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p1    # Landroidx/work/a;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/zni0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Landroidx/work/impl/WorkDatabase;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Ll/fgj0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p5    # Landroidx/work/impl/a;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p6    # Lkotlin/jvm/functions/Function6;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroidx/work/a;",
            "Ll/zni0;",
            "Landroidx/work/impl/WorkDatabase;",
            "Ll/fgj0;",
            "Landroidx/work/impl/a;",
            "Lkotlin/jvm/functions/Function6<",
            "-",
            "Landroid/content/Context;",
            "-",
            "Landroidx/work/a;",
            "-",
            "Ll/zni0;",
            "-",
            "Landroidx/work/impl/WorkDatabase;",
            "-",
            "Ll/fgj0;",
            "-",
            "Landroidx/work/impl/a;",
            "+",
            "Ljava/util/List<",
            "+",
            "Ll/h2e0;",
            ">;>;)",
            "Ll/xiq0;"
        }
    .end annotation

    .annotation build Lkotlin/jvm/JvmName;
    .end annotation

    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    move-object v8, p1

    .line 23
    move-object p1, p0

    .line 24
    move-object p0, p6

    .line 25
    move-object p6, p5

    .line 26
    move-object p5, p4

    .line 27
    move-object p4, p3

    .line 28
    move-object p3, p2

    .line 29
    move-object p2, v8

    .line 30
    invoke-interface/range {p0 .. p6}, Lkotlin/jvm/functions/Function6;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    move-object v5, p0

    .line 35
    check-cast v5, Ljava/util/List;

    .line 36
    .line 37
    new-instance v0, Ll/xiq0;

    .line 38
    .line 39
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    move-object v2, p2

    .line 44
    move-object v3, p3

    .line 45
    move-object v4, p4

    .line 46
    move-object v7, p5

    .line 47
    move-object v6, p6

    .line 48
    invoke-direct/range {v0 .. v7}, Ll/xiq0;-><init>(Landroid/content/Context;Landroidx/work/a;Ll/zni0;Landroidx/work/impl/WorkDatabase;Ljava/util/List;Landroidx/work/impl/a;Ll/fgj0;)V

    .line 49
    .line 50
    .line 51
    return-object v0
.end method

.method public static synthetic e(Landroid/content/Context;Landroidx/work/a;Ll/zni0;Landroidx/work/impl/WorkDatabase;Ll/fgj0;Landroidx/work/impl/a;Lkotlin/jvm/functions/Function6;ILjava/lang/Object;)Ll/xiq0;
    .locals 10

    .line 1
    and-int/lit8 v0, p7, 0x4

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance p2, Ll/yiq0;

    .line 6
    .line 7
    invoke-virtual {p1}, Landroidx/work/a;->m()Ljava/util/concurrent/Executor;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-direct {p2, v0}, Ll/yiq0;-><init>(Ljava/util/concurrent/Executor;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    move-object v3, p2

    .line 15
    and-int/lit8 p2, p7, 0x8

    .line 16
    .line 17
    if-eqz p2, :cond_1

    .line 18
    .line 19
    sget-object p2, Landroidx/work/impl/WorkDatabase;->Companion:Landroidx/work/impl/WorkDatabase$a;

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object p3

    .line 25
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 26
    .line 27
    .line 28
    invoke-interface {v3}, Ll/zni0;->d()Ll/tqe0;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1}, Landroidx/work/a;->a()Ll/sa5;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    sget v4, Ll/t8c0;->a:I

    .line 44
    .line 45
    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getBoolean(I)Z

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    invoke-virtual {p2, p3, v0, v1, v2}, Landroidx/work/impl/WorkDatabase$a;->b(Landroid/content/Context;Ljava/util/concurrent/Executor;Ll/sa5;Z)Landroidx/work/impl/WorkDatabase;

    .line 50
    .line 51
    .line 52
    move-result-object p3

    .line 53
    :cond_1
    and-int/lit8 p2, p7, 0x10

    .line 54
    .line 55
    if-eqz p2, :cond_2

    .line 56
    .line 57
    new-instance v1, Ll/fgj0;

    .line 58
    .line 59
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 64
    .line 65
    .line 66
    const/16 v8, 0x3c

    .line 67
    .line 68
    const/4 v9, 0x0

    .line 69
    const/4 v4, 0x0

    .line 70
    const/4 v5, 0x0

    .line 71
    const/4 v6, 0x0

    .line 72
    const/4 v7, 0x0

    .line 73
    invoke-direct/range {v1 .. v9}, Ll/fgj0;-><init>(Landroid/content/Context;Ll/zni0;Ll/j06;Ll/au2;Ll/j06;Ll/j06;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 74
    .line 75
    .line 76
    move-object v5, v1

    .line 77
    goto :goto_0

    .line 78
    :cond_2
    move-object v5, p4

    .line 79
    :goto_0
    and-int/lit8 p2, p7, 0x20

    .line 80
    .line 81
    if-eqz p2, :cond_3

    .line 82
    .line 83
    new-instance p2, Landroidx/work/impl/a;

    .line 84
    .line 85
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 86
    .line 87
    .line 88
    move-result-object p4

    .line 89
    invoke-direct {p2, p4, p1, v3, p3}, Landroidx/work/impl/a;-><init>(Landroid/content/Context;Landroidx/work/a;Ll/zni0;Landroidx/work/impl/WorkDatabase;)V

    .line 90
    .line 91
    .line 92
    move-object v6, p2

    .line 93
    goto :goto_1

    .line 94
    :cond_3
    move-object v6, p5

    .line 95
    :goto_1
    and-int/lit8 p2, p7, 0x40

    .line 96
    .line 97
    if-eqz p2, :cond_4

    .line 98
    .line 99
    sget-object p2, Landroidx/work/impl/WorkManagerImplExtKt$WorkManagerImpl$1;->INSTANCE:Landroidx/work/impl/WorkManagerImplExtKt$WorkManagerImpl$1;

    .line 100
    .line 101
    move-object v7, p2

    .line 102
    :goto_2
    move-object v1, p0

    .line 103
    move-object v2, p1

    .line 104
    move-object v4, p3

    .line 105
    goto :goto_3

    .line 106
    :cond_4
    move-object/from16 v7, p6

    .line 107
    .line 108
    goto :goto_2

    .line 109
    :goto_3
    invoke-static/range {v1 .. v7}, Landroidx/work/impl/WorkManagerImplExtKt;->d(Landroid/content/Context;Landroidx/work/a;Ll/zni0;Landroidx/work/impl/WorkDatabase;Ll/fgj0;Landroidx/work/impl/a;Lkotlin/jvm/functions/Function6;)Ll/xiq0;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    return-object p0
.end method

.method public static final f(Ll/zni0;)Ll/drb;
    .locals 0
    .param p0    # Ll/zni0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmName;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-interface {p0}, Ll/zni0;->a()Lkotlinx/coroutines/CoroutineDispatcher;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    invoke-static {p0}, Lkotlinx/coroutines/f;->a(Lkotlin/coroutines/CoroutineContext;)Ll/drb;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method
