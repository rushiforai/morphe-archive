.class public Ll/hrk0$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/hrk0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

.field public b:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/hrk0$a;->b:I

    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-object p1, p0, Ll/hrk0$a;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(ILcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput p1, p0, Ll/hrk0$a;->b:I

    .line 12
    iput-object p2, p0, Ll/hrk0$a;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    return-void
.end method


# virtual methods
.method public a()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hrk0$a;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method
