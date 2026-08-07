.class public abstract Ll/jf00;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field public static b:Z


# instance fields
.field public a:Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pf60<",
            "Ljava/lang/String;",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi;->i:Lrx/subjects/a;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/ff00;

    .line 12
    .line 13
    invoke-direct {v1}, Ll/ff00;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/gf00;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/gf00;-><init>(Ll/jf00;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-static {}, Ll/psd0;->F()Lcom/p1/mobile/android/rx/a;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi;)Lrx/c;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/mof0;->l(Z)Lrx/c;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static synthetic b(Ll/jf00;Ljava/lang/String;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jf00;->j(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c(Ll/jf00;Ljava/lang/String;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jf00;->j(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public d()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/jf00;->e(Z)Lrx/c;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public e(Z)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/uqb0;->Y:Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/mof0;->l(Z)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p1, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    new-instance v0, Ll/hf00;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Ll/hf00;-><init>(Ll/jf00;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p0, p1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    new-instance p1, Ll/if00;

    .line 33
    .line 34
    invoke-direct {p1}, Ll/if00;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, p1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0
.end method

.method public f(Ll/qcj;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/qcj<",
            "TT;TR;>;TR;)TR;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/jf00;->g()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p1, p0}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    return-object p2
.end method

.method public g()Ljava/lang/Object;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/uqb0;->Y:Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/jf00;->j(Ljava/lang/String;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public h(Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public abstract i()Lcom/tantanapp/common/data/JsonAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "TT;>;"
        }
    .end annotation
.end method

.method public final j(Ljava/lang/String;)Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .line 1
    const-string v0, "[putong-common][assets]"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    return-object v1

    .line 7
    :cond_0
    iget-object v2, p0, Ll/jf00;->a:Ll/pf60;

    .line 8
    .line 9
    if-eqz v2, :cond_1

    .line 10
    .line 11
    iget-object v2, v2, Ll/pf60;->a:Ljava/lang/Object;

    .line 12
    .line 13
    if-eqz v2, :cond_1

    .line 14
    .line 15
    check-cast v2, Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_1

    .line 22
    .line 23
    iget-object p0, p0, Ll/jf00;->a:Ll/pf60;

    .line 24
    .line 25
    iget-object p0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_1
    const/4 v2, 0x0

    .line 29
    :try_start_0
    invoke-virtual {p0}, Ll/jf00;->i()Lcom/tantanapp/common/data/JsonAdapter;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-virtual {v3, p1}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    const-string v3, "Success"

    .line 38
    .line 39
    invoke-static {v0, v3}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    sput-boolean v2, Ll/jf00;->b:Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :catch_0
    move-exception v3

    .line 46
    sget-object v4, Ll/uqb0;->Y:Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi;

    .line 47
    .line 48
    invoke-virtual {v4}, Ll/mof0;->o()V

    .line 49
    .line 50
    .line 51
    const-string v4, "Failed"

    .line 52
    .line 53
    invoke-static {v0, v4}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    sget-boolean v4, Ll/jf00;->b:Z

    .line 57
    .line 58
    if-nez v4, :cond_3

    .line 59
    .line 60
    invoke-static {v3}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 61
    .line 62
    .line 63
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    if-ge v2, v3, :cond_2

    .line 68
    .line 69
    add-int/lit16 v3, v2, 0x2800

    .line 70
    .line 71
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 72
    .line 73
    .line 74
    move-result v4

    .line 75
    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    .line 76
    .line 77
    .line 78
    move-result v4

    .line 79
    invoke-virtual {p1, v2, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    invoke-static {v0, v2}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    move v2, v3

    .line 87
    goto :goto_0

    .line 88
    :cond_2
    const/4 v0, 0x1

    .line 89
    sput-boolean v0, Ll/jf00;->b:Z

    .line 90
    .line 91
    :cond_3
    :goto_1
    if-eqz v1, :cond_4

    .line 92
    .line 93
    invoke-virtual {p0, v1}, Ll/jf00;->h(Ljava/lang/Object;)V

    .line 94
    .line 95
    .line 96
    new-instance v0, Ll/pf60;

    .line 97
    .line 98
    invoke-direct {v0, p1, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 99
    .line 100
    .line 101
    iput-object v0, p0, Ll/jf00;->a:Ll/pf60;

    .line 102
    .line 103
    :cond_4
    return-object v1
.end method

.method public k()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Ll/uqb0;->Y:Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/mof0;->z()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
