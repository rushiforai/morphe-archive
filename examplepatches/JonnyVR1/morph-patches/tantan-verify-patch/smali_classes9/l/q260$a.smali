.class public Ll/q260$a;
.super Ll/gk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/q260;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public c:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

.field public d:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

.field public e:Ljava/lang/Boolean;

.field public f:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;

.field public g:Ll/bnl0$g;

.field public h:Ljava/lang/String;

.field public i:Z

.field public j:Z


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gk2;-><init>(I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Ll/q260$a;->j:Z

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public a()Ll/q260;
    .locals 2

    .line 1
    new-instance v0, Ll/q260;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Ll/q260;-><init>(Ll/q260$a;Ll/r260;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public b(Z)Ll/q260$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/q260$a;->i:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)Ll/q260$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/q260$a;->d:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)Ll/q260$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/q260$a;->c:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Ljava/lang/String;)Ll/q260$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/q260$a;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public f(Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;)Ll/q260$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/q260$a;->f:Lcom/p1/mobile/putong/live/base/data/BLiveOperationItemPopUpDrawer;

    .line 2
    .line 3
    return-object p0
.end method

.method public g(Ll/bnl0$g;)Ll/q260$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/q260$a;->g:Ll/bnl0$g;

    .line 2
    .line 3
    return-object p0
.end method

.method public h(Z)Ll/q260$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/q260$a;->j:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public i(Z)Ll/q260$a;
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Ll/q260$a;->e:Ljava/lang/Boolean;

    .line 6
    .line 7
    return-object p0
.end method
