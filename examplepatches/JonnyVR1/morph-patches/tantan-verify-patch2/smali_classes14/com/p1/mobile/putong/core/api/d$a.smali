.class public Lcom/p1/mobile/putong/core/api/d$a;
.super Ll/mof0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/api/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/mof0<",
        "Ljava/util/List<",
        "Lcom/p1/mobile/putong/core/data/School;",
        ">;>;"
    }
.end annotation


# instance fields
.field public final synthetic h:Lcom/p1/mobile/putong/core/api/d;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/api/d;)V
    .locals 4

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/d$a;->h:Lcom/p1/mobile/putong/core/api/d;

    .line 2
    .line 3
    new-instance p1, Ll/dji;

    .line 4
    .line 5
    new-instance v0, Ll/vod;

    .line 6
    .line 7
    const-string v1, "3"

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    const-string v3, "schools"

    .line 11
    .line 12
    invoke-direct {v0, v3, v1, v2}, Ll/vod;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    sget-object v1, Lcom/p1/mobile/putong/core/data/School;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 16
    .line 17
    invoke-static {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER(Lcom/tantanapp/common/data/ProtobufAdapter;)Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const/4 v2, 0x7

    .line 22
    invoke-direct {p1, v0, v2, v1}, Ll/dji;-><init>(Ll/dji$b;ILcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 23
    .line 24
    .line 25
    new-instance v0, Ll/xe7;

    .line 26
    .line 27
    invoke-direct {v0}, Ll/xe7;-><init>()V

    .line 28
    .line 29
    .line 30
    const-string v1, "Schools"

    .line 31
    .line 32
    invoke-direct {p0, v1, p1, v0}, Ll/mof0;-><init>(Ljava/lang/String;Ll/dji;Ll/pcj;)V

    .line 33
    .line 34
    .line 35
    new-instance p1, Ll/ye7;

    .line 36
    .line 37
    invoke-direct {p1, p0}, Ll/ye7;-><init>(Lcom/p1/mobile/putong/core/api/d$a;)V

    .line 38
    .line 39
    .line 40
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public static synthetic B()Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/ti20;

    .line 2
    .line 3
    new-instance v1, Ll/ze7;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/ze7;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/ti20;-><init>(Ll/pcj;)V

    .line 9
    .line 10
    .line 11
    new-instance v1, Ll/af7;

    .line 12
    .line 13
    invoke-direct {v1}, Ll/af7;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    return-object v0
.end method

.method public static synthetic C(Lcom/p1/mobile/putong/core/data/School;Lcom/p1/mobile/putong/core/data/School;)I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/School;->firstLetter:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "@"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_3

    .line 10
    .line 11
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/School;->firstLetter:Ljava/lang/String;

    .line 12
    .line 13
    const-string v2, "#"

    .line 14
    .line 15
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/School;->firstLetter:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_2

    .line 29
    .line 30
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/School;->firstLetter:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/School;->pinyin:Ljava/lang/String;

    .line 40
    .line 41
    if-eqz p0, :cond_2

    .line 42
    .line 43
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/School;->pinyin:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    return p0

    .line 50
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 51
    return p0

    .line 52
    :cond_3
    :goto_1
    const/4 p0, -0x1

    .line 53
    return p0
.end method

.method public static synthetic D()Ll/x1d0;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "/schools"

    .line 8
    .line 9
    invoke-static {v1}, Lcom/p1/mobile/putong/core/api/a;->G(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    return-object v0
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/core/api/d$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/api/d$a;->G()V

    return-void
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/data/Envelope;)Ljava/util/List;
    .locals 5

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->schools:Ljava/util/List;

    .line 10
    .line 11
    if-eqz v1, :cond_2

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 18
    .line 19
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->schools:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_1

    .line 30
    .line 31
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    check-cast v2, Lcom/p1/mobile/putong/core/data/School;

    .line 36
    .line 37
    iget-object v3, v2, Lcom/p1/mobile/putong/core/data/School;->pinyin:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    if-eqz v3, :cond_0

    .line 44
    .line 45
    iget-object v3, v2, Lcom/p1/mobile/putong/core/data/School;->name:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {v3}, Ll/q8g0;->I(Ljava/lang/String;)Ll/pf60;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    iget-object v4, v3, Ll/pf60;->b:Ljava/lang/Object;

    .line 52
    .line 53
    check-cast v4, Ljava/lang/String;

    .line 54
    .line 55
    iput-object v4, v2, Lcom/p1/mobile/putong/core/data/School;->pinyin:Ljava/lang/String;

    .line 56
    .line 57
    iget-object v3, v3, Ll/pf60;->a:Ljava/lang/Object;

    .line 58
    .line 59
    check-cast v3, Ljava/lang/String;

    .line 60
    .line 61
    iput-object v3, v2, Lcom/p1/mobile/putong/core/data/School;->firstLetter:Ljava/lang/String;

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 69
    .line 70
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->schools:Ljava/util/List;

    .line 71
    .line 72
    new-instance v2, Ll/bf7;

    .line 73
    .line 74
    invoke-direct {v2}, Ll/bf7;-><init>()V

    .line 75
    .line 76
    .line 77
    invoke-static {v1, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 78
    .line 79
    .line 80
    :cond_2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    check-cast p0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 85
    .line 86
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreData;->schools:Ljava/util/List;

    .line 87
    .line 88
    return-object p0
.end method

.method private synthetic G()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/d$a;->h:Lcom/p1/mobile/putong/core/api/d;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/d;->l3()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lrx/c;->subscribe()Ll/kcg0;

    .line 8
    .line 9
    .line 10
    return-void
.end method
