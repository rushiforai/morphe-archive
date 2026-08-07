.class public Ll/abo0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Z

.field public b:Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;

.field public c:Ll/ram;

.field public d:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Ljava/lang/Integer;",
            "Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(ZLcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Ll/abo0;->a:Z

    .line 5
    .line 6
    iput-object p2, p0, Ll/abo0;->b:Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Ll/z20;)Ll/abo0;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z20<",
            "Ljava/lang/Integer;",
            "Lcom/p1/mobile/putong/live/livingroom/voice/motion/VoiceLiveMotionType;",
            ">;)",
            "Ll/abo0;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/abo0;->d:Ll/z20;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Ll/ram;)Ll/abo0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/abo0;->c:Ll/ram;

    .line 2
    .line 3
    return-object p0
.end method
