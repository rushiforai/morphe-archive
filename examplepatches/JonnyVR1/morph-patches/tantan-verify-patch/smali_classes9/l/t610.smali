.class public Ll/t610;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Z

.field public b:Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;

.field public c:Ll/g0m;

.field public d:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Ljava/lang/Integer;",
            "Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(ZLcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Ll/t610;->a:Z

    .line 5
    .line 6
    iput-object p2, p0, Ll/t610;->b:Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Ll/z20;)Ll/t610;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z20<",
            "Ljava/lang/Integer;",
            "Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;",
            ">;)",
            "Ll/t610;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/t610;->d:Ll/z20;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Ll/g0m;)Ll/t610;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/t610;->c:Ll/g0m;

    .line 2
    .line 3
    return-object p0
.end method
