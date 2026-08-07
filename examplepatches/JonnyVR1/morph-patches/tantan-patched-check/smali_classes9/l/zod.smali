.class public Ll/zod;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/String;

.field public b:Z

.field public c:Ll/m500;

.field public d:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

.field public e:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ll/cxl;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/cxl<",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;",
            ">;"
        }
    .end annotation
.end field

.field public g:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ll/m500;Lrx/subjects/b;Ll/cxl;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;",
            "Ll/m500;",
            "Lrx/subjects/b<",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;",
            ">;",
            "Ll/cxl<",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/zod;->g:Ljava/util/HashMap;

    .line 10
    .line 11
    iput-object p2, p0, Ll/zod;->c:Ll/m500;

    .line 12
    .line 13
    iput-object p1, p0, Ll/zod;->d:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 14
    .line 15
    iput-object p3, p0, Ll/zod;->e:Lrx/subjects/b;

    .line 16
    .line 17
    iput-object p4, p0, Ll/zod;->f:Ll/cxl;

    .line 18
    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 22
    .line 23
    if-eqz p2, :cond_0

    .line 24
    .line 25
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 26
    .line 27
    sget-object p3, Ll/zrv;->a:Ll/wrv;

    .line 28
    .line 29
    invoke-virtual {p3}, Ll/wrv;->D0()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p3

    .line 33
    invoke-static {p2, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result p2

    .line 37
    if-eqz p2, :cond_0

    .line 38
    .line 39
    const/4 p2, 0x1

    .line 40
    goto :goto_0

    .line 41
    :cond_0
    const/4 p2, 0x0

    .line 42
    :goto_0
    iput-boolean p2, p0, Ll/zod;->b:Z

    .line 43
    .line 44
    invoke-static {p1, p2}, Ll/afu;->g(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Z)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    iput-object p1, p0, Ll/zod;->a:Ljava/lang/String;

    .line 49
    .line 50
    return-void
.end method


# virtual methods
.method public a()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zod;->d:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Lrx/subjects/b;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/b<",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/zod;->e:Lrx/subjects/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ll/cxl;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/cxl<",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/zod;->f:Ll/cxl;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Ll/m500;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zod;->c:Ll/m500;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zod;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/zod;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method public g(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/zod;->d:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 2
    .line 3
    return-void
.end method
