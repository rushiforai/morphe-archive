.class public final Ll/drw0;
.super Ll/ze00;
.source "SourceFile"


# instance fields
.field public d:Ll/b9r;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public e:Ll/z8r;

.field public final f:Landroid/content/Context;

.field public final g:Ll/a9r;

.field public final h:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/a9r;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ze00;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/drw0;->f:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/drw0;->g:Ll/a9r;

    .line 7
    .line 8
    invoke-interface {p2}, Ll/a9r;->getPriority()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    const/16 p2, 0x64

    .line 13
    .line 14
    if-ne p1, p2, :cond_0

    .line 15
    .line 16
    const/4 p1, 0x1

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p1, 0x0

    .line 19
    :goto_0
    iput-boolean p1, p0, Ll/drw0;->h:Z

    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public final c()V
    .locals 3
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/mlkit/common/MlKitException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ze00;->a:Ll/joi0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/joi0;->a()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/drw0;->d:Ll/b9r;

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ll/drw0;->g:Ll/a9r;

    .line 11
    .line 12
    iget-object v1, p0, Ll/drw0;->f:Landroid/content/Context;

    .line 13
    .line 14
    iget-object v2, p0, Ll/drw0;->e:Ll/z8r;

    .line 15
    .line 16
    invoke-interface {v0, v1, v2}, Ll/a9r;->a(Landroid/content/Context;Ll/z8r;)Ll/b9r;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Ll/drw0;->d:Ll/b9r;

    .line 21
    .line 22
    invoke-interface {v0}, Ll/b9r;->init()V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public final e()V
    .locals 1
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ze00;->a:Ll/joi0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/joi0;->a()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/drw0;->d:Ll/b9r;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-interface {v0}, Ll/b9r;->release()V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-object v0, p0, Ll/drw0;->d:Ll/b9r;

    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final j(Ljava/lang/String;F)Ljava/lang/String;
    .locals 2
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/mlkit/common/MlKitException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/drw0;->d:Ll/b9r;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/drw0;->c()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const-string v1, "und"

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    return-object v1

    .line 17
    :cond_1
    iget-object p0, p0, Ll/drw0;->d:Ll/b9r;

    .line 18
    .line 19
    invoke-static {p0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Ll/b9r;

    .line 24
    .line 25
    invoke-interface {p0, p1, p2}, Ll/b9r;->a(Ljava/lang/String;F)Ljava/util/List;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    :cond_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_3

    .line 38
    .line 39
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    check-cast p1, Lcom/google/mlkit/nl/languageid/IdentifiedLanguage;

    .line 44
    .line 45
    const-string p2, "unknown"

    .line 46
    .line 47
    invoke-virtual {p1}, Lcom/google/mlkit/nl/languageid/IdentifiedLanguage;->b()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    if-nez p2, :cond_2

    .line 56
    .line 57
    invoke-virtual {p1}, Lcom/google/mlkit/nl/languageid/IdentifiedLanguage;->b()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    goto :goto_0

    .line 62
    :cond_3
    const-string p0, ""

    .line 63
    .line 64
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-eqz p1, :cond_4

    .line 69
    .line 70
    return-object v1

    .line 71
    :cond_4
    const-string p1, "iw"

    .line 72
    .line 73
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    if-eqz p1, :cond_5

    .line 78
    .line 79
    const-string p0, "he"

    .line 80
    .line 81
    :cond_5
    return-object p0
.end method

.method public final k(Ljava/lang/String;F)Ljava/util/List;
    .locals 5
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/mlkit/common/MlKitException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/drw0;->d:Ll/b9r;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/drw0;->c()V

    .line 6
    .line 7
    .line 8
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    const/high16 v2, 0x3f800000    # 1.0f

    .line 18
    .line 19
    const-string v3, "und"

    .line 20
    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    new-instance p0, Lcom/google/mlkit/nl/languageid/IdentifiedLanguage;

    .line 24
    .line 25
    invoke-direct {p0, v3, v2}, Lcom/google/mlkit/nl/languageid/IdentifiedLanguage;-><init>(Ljava/lang/String;F)V

    .line 26
    .line 27
    .line 28
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    return-object v0

    .line 32
    :cond_1
    iget-object p0, p0, Ll/drw0;->d:Ll/b9r;

    .line 33
    .line 34
    invoke-static {p0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    check-cast p0, Ll/b9r;

    .line 39
    .line 40
    invoke-interface {p0, p1, p2}, Ll/b9r;->a(Ljava/lang/String;F)Ljava/util/List;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    :cond_2
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-eqz p1, :cond_4

    .line 53
    .line 54
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    check-cast p1, Lcom/google/mlkit/nl/languageid/IdentifiedLanguage;

    .line 59
    .line 60
    const-string p2, "unknown"

    .line 61
    .line 62
    invoke-virtual {p1}, Lcom/google/mlkit/nl/languageid/IdentifiedLanguage;->b()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result p2

    .line 70
    if-nez p2, :cond_2

    .line 71
    .line 72
    new-instance p2, Lcom/google/mlkit/nl/languageid/IdentifiedLanguage;

    .line 73
    .line 74
    const-string v1, "iw"

    .line 75
    .line 76
    invoke-virtual {p1}, Lcom/google/mlkit/nl/languageid/IdentifiedLanguage;->b()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v4

    .line 80
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    if-eqz v1, :cond_3

    .line 85
    .line 86
    const-string v1, "he"

    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_3
    invoke-virtual {p1}, Lcom/google/mlkit/nl/languageid/IdentifiedLanguage;->b()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    :goto_1
    invoke-virtual {p1}, Lcom/google/mlkit/nl/languageid/IdentifiedLanguage;->a()F

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    invoke-direct {p2, v1, p1}, Lcom/google/mlkit/nl/languageid/IdentifiedLanguage;-><init>(Ljava/lang/String;F)V

    .line 98
    .line 99
    .line 100
    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_4
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 105
    .line 106
    .line 107
    move-result p0

    .line 108
    if-eqz p0, :cond_5

    .line 109
    .line 110
    new-instance p0, Lcom/google/mlkit/nl/languageid/IdentifiedLanguage;

    .line 111
    .line 112
    invoke-direct {p0, v3, v2}, Lcom/google/mlkit/nl/languageid/IdentifiedLanguage;-><init>(Ljava/lang/String;F)V

    .line 113
    .line 114
    .line 115
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    :cond_5
    return-object v0
.end method

.method public final l(Ll/z8r;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/drw0;->e:Ll/z8r;

    .line 2
    .line 3
    return-void
.end method

.method public final m()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/drw0;->h:Z

    .line 2
    .line 3
    return p0
.end method
