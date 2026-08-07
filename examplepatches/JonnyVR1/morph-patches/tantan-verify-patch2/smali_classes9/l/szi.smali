.class public Ll/szi;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final c:Ll/szi;


# instance fields
.field public a:Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pf60<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public b:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/szi;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/szi;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/szi;->c:Ll/szi;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/vwt;->b4()Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->followGuide:Lcom/p1/mobile/putong/live/base/data/BLiveFollowGuide;

    .line 15
    .line 16
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFollowGuide;->showNoticeTimes:I

    .line 17
    .line 18
    iput v0, p0, Ll/szi;->b:I

    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public static a()Ll/szi;
    .locals 1

    .line 1
    sget-object v0, Ll/szi;->c:Ll/szi;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public b()Ll/pf60;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/pf60<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/szi;->a:Ll/pf60;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()I
    .locals 0

    .line 1
    iget p0, p0, Ll/szi;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public d(Ll/pf60;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/szi;->a:Ll/pf60;

    .line 2
    .line 3
    return-void
.end method

.method public e(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/szi;->b:I

    .line 2
    .line 3
    return-void
.end method
