.class public final Ll/u2s0;
.super Ll/t2s0;
.source "SourceFile"


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/t2s0;-><init>(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static x(Ljava/lang/String;Landroid/content/Context;Z)Ll/u2s0;
    .locals 1

    .line 1
    const/4 p2, 0x0

    .line 2
    invoke-static {p1, p2}, Ll/t2s0;->t(Landroid/content/Context;Z)V

    .line 3
    .line 4
    .line 5
    new-instance v0, Ll/u2s0;

    .line 6
    .line 7
    invoke-direct {v0, p1, p0, p2}, Ll/u2s0;-><init>(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public static y(Ljava/lang/String;Landroid/content/Context;ZI)Ll/u2s0;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-static {p1, p2}, Ll/t2s0;->t(Landroid/content/Context;Z)V

    .line 2
    .line 3
    .line 4
    new-instance p3, Ll/u2s0;

    .line 5
    .line 6
    invoke-direct {p3, p1, p0, p2}, Ll/u2s0;-><init>(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 7
    .line 8
    .line 9
    return-object p3
.end method


# virtual methods
.method public final r(Ll/b4s0;Landroid/content/Context;Ll/fzr0;Lcom/google/android/gms/internal/ads/d;)Ljava/util/List;
    .locals 8

    .line 1
    invoke-virtual {p1}, Ll/b4s0;->k()Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    .line 4
    move-result-object p4

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p4, :cond_0

    .line 7
    .line 8
    iget-boolean p4, p0, Ll/t2s0;->v:Z

    .line 9
    .line 10
    if-nez p4, :cond_1

    .line 11
    .line 12
    :cond_0
    move-object v2, p1

    .line 13
    move-object v5, p3

    .line 14
    goto :goto_0

    .line 15
    :cond_1
    invoke-virtual {p1}, Ll/b4s0;->a()I

    .line 16
    .line 17
    .line 18
    move-result v6

    .line 19
    new-instance p4, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {p4}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-super {p0, p1, p2, p3, v0}, Ll/t2s0;->r(Ll/b4s0;Landroid/content/Context;Ll/fzr0;Lcom/google/android/gms/internal/ads/d;)Ljava/util/List;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-interface {p4, p0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 29
    .line 30
    .line 31
    new-instance v1, Ll/b5s0;

    .line 32
    .line 33
    const/16 v7, 0x18

    .line 34
    .line 35
    const-string v3, "8UEA9TmdE+sqV3zcsNgnFI5Sf8uIsQHU61W37Ddl8zaNqY23x/FpuoK+mm9MWruA"

    .line 36
    .line 37
    const-string v4, "qlbJd0rViXaFpU2SvrkcezPlE/VtgXulMFWFUXmIBBg="

    .line 38
    .line 39
    move-object v2, p1

    .line 40
    move-object v5, p3

    .line 41
    invoke-direct/range {v1 .. v7}, Ll/b5s0;-><init>(Ll/b4s0;Ljava/lang/String;Ljava/lang/String;Ll/fzr0;II)V

    .line 42
    .line 43
    .line 44
    invoke-interface {p4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    return-object p4

    .line 48
    :goto_0
    invoke-super {p0, v2, p2, v5, v0}, Ll/t2s0;->r(Ll/b4s0;Landroid/content/Context;Ll/fzr0;Lcom/google/android/gms/internal/ads/d;)Ljava/util/List;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0
.end method
