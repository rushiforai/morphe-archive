.class public Ll/siv;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;

.field public final b:Ll/tcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/tcj<",
            "Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;",
            "Ll/x6t;",
            "Ll/dum;",
            "Ll/g0m;",
            "Ll/riv;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;Ll/tcj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;",
            "Ll/tcj<",
            "Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;",
            "Ll/x6t;",
            "Ll/dum;",
            "Ll/g0m;",
            "Ll/riv;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/siv;->a:Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;

    .line 5
    .line 6
    iput-object p2, p0, Ll/siv;->b:Ll/tcj;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Ll/x6t;Ll/dum;Ll/g0m;)Ll/riv;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/siv;->b:Ll/tcj;

    .line 2
    .line 3
    iget-object p0, p0, Ll/siv;->a:Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;

    .line 4
    .line 5
    invoke-interface {v0, p0, p1, p2, p3}, Ll/tcj;->b(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ll/riv;

    .line 10
    .line 11
    return-object p0
.end method

.method public b(Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/siv;->a:Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    if-ne p0, p1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method
