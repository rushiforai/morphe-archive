.class public Ll/riv;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;

.field public final b:Ll/x6t;

.field public final c:Ll/dum;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;Ll/x6t;Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/riv;->a:Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;

    .line 5
    .line 6
    iput-object p2, p0, Ll/riv;->b:Ll/x6t;

    .line 7
    .line 8
    iput-object p3, p0, Ll/riv;->c:Ll/dum;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public b()V
    .locals 0

    .line 1
    return-void
.end method

.method public c()Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/riv;->a:Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Ll/l6t;)Ll/l6t;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ll/l6t;",
            ">(TT;)TT;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/riv;->b:Ll/x6t;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public e()V
    .locals 0

    .line 1
    return-void
.end method

.method public f()V
    .locals 0

    .line 1
    return-void
.end method

.method public g(Ll/l6t;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/riv;->b:Ll/x6t;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/l6t;->C2(Ll/l6t;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
