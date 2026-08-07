.class public Ll/r610;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/h0m;


# static fields
.field public static final e:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;


# instance fields
.field public final a:Ll/u1f;

.field public b:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

.field public c:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ll/x84$a;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 2
    .line 3
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/a;

    .line 4
    .line 5
    invoke-direct {v1}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/a;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Ll/r610;->e:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Ll/u1f;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/r610;->c:Ljava/util/ArrayList;

    .line 10
    .line 11
    iput-object p1, p0, Ll/r610;->a:Ll/u1f;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public a()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/r610;->b:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "[live][motion]"

    .line 6
    .line 7
    const-string v0, "currentMotion is null  "

    .line 8
    .line 9
    invoke-static {p0, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    sget-object p0, Ll/r610;->e:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 13
    .line 14
    :cond_0
    return-object p0
.end method

.method public b()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/r610;->j()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/r610;->a:Ll/u1f;

    .line 5
    .line 6
    iget-object p0, p0, Ll/u1f;->h:Ll/r510;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/r510;->g()V

    .line 9
    .line 10
    .line 11
    const-string p0, "[live][motion]"

    .line 12
    .line 13
    const-string v0, "stop motion push "

    .line 14
    .line 15
    invoke-static {p0, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public c(Ll/z20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z20<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/r610;->b:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->m1(Ll/z20;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public d(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;)I
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Ll/r610;->e(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/oob0;->a(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;)Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/r610;->b:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget-object v1, p0, Ll/r610;->d:Ll/x84$a;

    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->l1(Ll/x84$a;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Ll/r610;->b:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 20
    .line 21
    iget-object v1, p0, Ll/r610;->a:Ll/u1f;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->b1(Ll/u1f;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    const-string v0, "[live][motion]"

    .line 31
    .line 32
    const-string v1, "[start]"

    .line 33
    .line 34
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {p1, v0}, Ll/nsh0;->k(Ljava/lang/String;[Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Ll/r610;->b:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->o1()I

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    return p0

    .line 48
    :cond_1
    const-string p0, "pusher motion create Error"

    .line 49
    .line 50
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    const/4 p0, 0x0

    .line 54
    return p0
.end method

.method public final e(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/r610;->b:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 2
    .line 3
    const-string v1, "[live][motion]"

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string p0, "currentMotion is null return"

    .line 8
    .line 9
    invoke-static {v1, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v2, "[clear_old]"

    .line 18
    .line 19
    filled-new-array {v1, v2}, [Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-static {v0, v1}, Ll/nsh0;->k(Ljava/lang/String;[Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/r610;->b:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->Z0()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->a()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    if-ne v0, p1, :cond_1

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/r610;->j()V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    invoke-virtual {p0}, Ll/r610;->k()V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public f()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/r610;->b()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    iget-object v1, p0, Ll/r610;->c:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 9
    .line 10
    .line 11
    new-instance v1, Ll/p610;

    .line 12
    .line 13
    invoke-direct {v1}, Ll/p610;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 17
    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/r610;->c:Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 25
    .line 26
    .line 27
    const-string p0, "[live][motion]"

    .line 28
    .line 29
    const-string v0, "end all motion "

    .line 30
    .line 31
    invoke-static {p0, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public g()V
    .locals 0

    .line 1
    return-void
.end method

.method public h(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r610;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r610;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final j()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/r610;->b:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 2
    .line 3
    const-string v1, "[live][motion]"

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->a1()V

    .line 8
    .line 9
    .line 10
    const-string v0, " oldMotionEndNow gotoEnd \u8c03\u7528\u5b8c\u6210 ,\u5f00\u59cb end()"

    .line 11
    .line 12
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/r610;->b:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->X0()V

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    iput-object v0, p0, Ll/r610;->b:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 22
    .line 23
    :cond_0
    const-string p0, "set currentMotion  null  "

    .line 24
    .line 25
    invoke-static {v1, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final k()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/r610;->b:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->a1()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/r610;->b:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 10
    .line 11
    :cond_0
    const-string p0, "[live][motion]"

    .line 12
    .line 13
    const-string v0, "set currentMotion  null  "

    .line 14
    .line 15
    invoke-static {p0, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public l()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/r610;->a:Ll/u1f;

    .line 2
    .line 3
    iget-object v0, v0, Ll/u1f;->d:Ll/p410;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/p410;->Y0()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/r610;->b:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->g1()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public m()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/r610;->f()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public n(Ll/x84$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/r610;->d:Ll/x84$a;

    .line 2
    .line 3
    return-void
.end method

.method public onResume()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/r610;->a:Ll/u1f;

    .line 2
    .line 3
    iget-object v0, v0, Ll/u1f;->d:Ll/p410;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/p410;->Z0()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/r610;->b:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->h1()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method
