.class public Ll/zl80;
.super Ll/ngk;
.source "SourceFile"


# instance fields
.field private I:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private J:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/i3m;",
            ">;"
        }
    .end annotation
.end field

.field private K:Ll/it2;

.field private L:Ll/jre;


# direct methods
.method public constructor <init>(Ljava/util/List;ZLl/jre;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/immomo/velib/anim/model/PostProcessingModel;",
            ">;Z",
            "Ll/jre;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/ngk;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    const/16 v1, 0x8

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/zl80;->I:Ljava/util/HashMap;

    .line 12
    .line 13
    new-instance v0, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ll/zl80;->J:Ljava/util/List;

    .line 19
    .line 20
    iput-object p3, p0, Ll/zl80;->L:Ll/jre;

    .line 21
    .line 22
    invoke-direct {p0}, Ll/zl80;->W()V

    .line 23
    .line 24
    .line 25
    if-eqz p2, :cond_0

    .line 26
    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    if-nez p2, :cond_0

    .line 34
    .line 35
    invoke-direct {p0, p1}, Ll/zl80;->U(Ljava/util/List;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    new-instance p1, Ll/rv40;

    .line 40
    .line 41
    invoke-direct {p1}, Ll/rv40;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, p0}, Ll/ffj;->H(Ll/cfj;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, p1}, Ll/ngk;->R(Ll/it2;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0, p1}, Ll/ngk;->S(Ll/it2;)V

    .line 51
    .line 52
    .line 53
    iput-object p1, p0, Ll/zl80;->K:Ll/it2;

    .line 54
    .line 55
    return-void
.end method

.method private U(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/immomo/velib/anim/model/PostProcessingModel;",
            ">;)V"
        }
    .end annotation

    .line 1
    :try_start_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/immomo/velib/anim/model/PostProcessingModel;

    .line 16
    .line 17
    iget-object v1, p0, Ll/zl80;->I:Ljava/util/HashMap;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/immomo/velib/anim/model/PostProcessingModel;->getFilterName()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Ljava/lang/String;

    .line 28
    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-lez v2, :cond_0

    .line 36
    .line 37
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    check-cast v1, Ll/i3m;

    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/immomo/velib/anim/model/PostProcessingModel;->getParams()Lcom/immomo/velib/anim/model/PostProcessingModel$ParamsModel;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-interface {v1, v0}, Ll/i3m;->d(Lcom/immomo/velib/anim/model/PostProcessingModel$ParamsModel;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/zl80;->J:Ljava/util/List;

    .line 55
    .line 56
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    check-cast v1, Ll/it2;

    .line 60
    .line 61
    invoke-direct {p0, v1}, Ll/zl80;->V(Ll/it2;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_1
    return-void

    .line 66
    :catch_0
    move-exception p0

    .line 67
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method private V(Ll/it2;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zl80;->K:Ll/it2;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/ffj;->O(Ll/cfj;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/zl80;->K:Ll/it2;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ll/ffj;->H(Ll/cfj;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/zl80;->K:Ll/it2;

    .line 14
    .line 15
    iput-object v0, p1, Ll/it2;->D:Ll/it2;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ll/ngk;->T(Ll/it2;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/zl80;->K:Ll/it2;

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Ll/ngk;->Q(Ll/it2;)V

    .line 23
    .line 24
    .line 25
    iput-object p1, p0, Ll/zl80;->K:Ll/it2;

    .line 26
    .line 27
    invoke-virtual {p1, p0}, Ll/ffj;->H(Ll/cfj;)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Ll/zl80;->K:Ll/it2;

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Ll/ngk;->S(Ll/it2;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    invoke-virtual {p1, p0}, Ll/ffj;->H(Ll/cfj;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, p1}, Ll/ngk;->R(Ll/it2;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, p1}, Ll/ngk;->S(Ll/it2;)V

    .line 43
    .line 44
    .line 45
    iput-object p1, p0, Ll/zl80;->K:Ll/it2;

    .line 46
    .line 47
    return-void
.end method

.method private W()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/zl80;->I:Ljava/util/HashMap;

    .line 2
    .line 3
    const-class v1, Ll/am80;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "saturation"

    .line 10
    .line 11
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/zl80;->I:Ljava/util/HashMap;

    .line 15
    .line 16
    const-class v1, Ll/yl80;

    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const-string v2, "contrast"

    .line 23
    .line 24
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Ll/zl80;->I:Ljava/util/HashMap;

    .line 28
    .line 29
    const-class v0, Ll/bm80;

    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v1, "usm"

    .line 36
    .line 37
    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    return-void
.end method


# virtual methods
.method public f(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/zl80;->J:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/i3m;

    .line 18
    .line 19
    invoke-interface {v0, p1}, Ll/i3m;->f(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-void
.end method

.method public declared-synchronized i()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-super {p0}, Ll/ngk;->i()V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Ll/zl80;->I:Ljava/util/HashMap;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/zl80;->J:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v0}, Ljava/util/List;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    .line 14
    .line 15
    monitor-exit p0

    .line 16
    return-void

    .line 17
    :catchall_0
    move-exception v0

    .line 18
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 19
    throw v0
.end method
