.class public Ll/pm0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;

.field public b:Lcom/p1/mobile/putong/data/User;

.field public c:Lcom/p1/mobile/putong/data/Live;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Live;Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/pm0;->b:Lcom/p1/mobile/putong/data/User;

    .line 5
    .line 6
    iput-object p2, p0, Ll/pm0;->c:Lcom/p1/mobile/putong/data/Live;

    .line 7
    .line 8
    iput-object p3, p0, Ll/pm0;->a:Lcom/p1/mobile/putong/core/data/BCoreLiveActivity;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a()Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/pm0;->c:Lcom/p1/mobile/putong/data/Live;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Live;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 8
    .line 9
    const-string v2, "onlive"

    .line 10
    .line 11
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_2

    .line 16
    .line 17
    iget-object p0, p0, Ll/pm0;->c:Lcom/p1/mobile/putong/data/Live;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Live;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 20
    .line 21
    const-string v0, "suspended"

    .line 22
    .line 23
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    return v1

    .line 31
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 32
    return p0
.end method
