.class public Ll/gc60;
.super Ll/riv;
.source "SourceFile"


# instance fields
.field public final d:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkLaunchData;

.field public e:Ll/i6t;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;Ll/x6t;Ll/dum;Ll/g0m;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/riv;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;Ll/x6t;Ll/dum;)V

    .line 2
    .line 3
    .line 4
    check-cast p4, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkLaunchData;

    .line 5
    .line 6
    iput-object p4, p0, Ll/gc60;->d:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkLaunchData;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public e()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/riv;->e()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Ll/riv;->c:Ll/dum;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    new-instance v0, Ll/m180;

    .line 14
    .line 15
    iget-object v2, p0, Ll/gc60;->d:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkLaunchData;

    .line 16
    .line 17
    invoke-direct {v0, v1, v2}, Ll/m180;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkLaunchData;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/riv;->d(Ll/l6t;)Ll/l6t;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Ll/i6t;

    .line 25
    .line 26
    iput-object v0, p0, Ll/gc60;->e:Ll/i6t;

    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    new-instance v0, Ll/rz70;

    .line 30
    .line 31
    iget-object v2, p0, Ll/gc60;->d:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkLaunchData;

    .line 32
    .line 33
    invoke-direct {v0, v1, v2}, Ll/rz70;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkLaunchData;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, v0}, Ll/riv;->d(Ll/l6t;)Ll/l6t;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Ll/i6t;

    .line 41
    .line 42
    iput-object v0, p0, Ll/gc60;->e:Ll/i6t;

    .line 43
    .line 44
    return-void
.end method

.method public f()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/riv;->f()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/gc60;->e:Ll/i6t;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/riv;->g(Ll/l6t;)V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Ll/gc60;->e:Ll/i6t;

    .line 13
    .line 14
    :cond_0
    return-void
.end method
