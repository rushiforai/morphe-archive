.class public Lcom/p1/mobile/putong/core/api/CoreSuggested$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/api/CoreSuggested;->k6()Lrx/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/qcj<",
        "Lcom/p1/mobile/putong/data/Envelope;",
        "Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/CoreSuggested;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/api/CoreSuggested;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$a;->a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;
    .locals 4

    .line 1
    const-class v0, Lcom/p1/mobile/putong/data/CommonData;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/data/CommonData;

    .line 8
    .line 9
    const-class v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 10
    .line 11
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->moments:Ljava/util/List;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    iget-object v1, v0, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 26
    .line 27
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-nez v1, :cond_1

    .line 32
    .line 33
    new-instance v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 34
    .line 35
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;-><init>()V

    .line 36
    .line 37
    .line 38
    iget-object v2, v0, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 39
    .line 40
    const/4 v3, 0x0

    .line 41
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    check-cast v2, Lcom/p1/mobile/putong/data/User;

    .line 46
    .line 47
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 48
    .line 49
    iput-object v2, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-nez v2, :cond_0

    .line 56
    .line 57
    iput-object p1, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->coreMomentInfoList:Ljava/util/List;

    .line 58
    .line 59
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$a;->a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 60
    .line 61
    iget-object p1, v0, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 62
    .line 63
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 68
    .line 69
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 70
    .line 71
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->o2:Ljava/lang/String;

    .line 72
    .line 73
    return-object v1

    .line 74
    :cond_1
    const/4 p0, 0x0

    .line 75
    return-object p0
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreSuggested$a;->a(Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
