.class public Ll/xh10;
.super Ll/ar10;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar10<",
        "Ll/mu40;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;Ll/td10;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "Ll/mu40;",
            ">;",
            "Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;",
            "Ll/td10<",
            "Ll/mu40;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/ar10;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;Ll/td10;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic J4(Ll/xh10;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/xh10;->K4(Ljava/lang/Boolean;)V

    return-void
.end method

.method private synthetic K4(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar10;->i:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ar10;->t()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ar10;->j:Ll/td10;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/td10;->f4()Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/vh10;

    .line 15
    .line 16
    invoke-direct {v1}, Ll/vh10;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/wh10;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/wh10;-><init>(Ll/xh10;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    return-void
.end method
