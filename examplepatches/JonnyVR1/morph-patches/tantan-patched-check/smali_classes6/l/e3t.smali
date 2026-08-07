.class public Ll/e3t;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pyl;


# static fields
.field public static b:Ll/e3t;


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/e3t;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/e3t;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/e3t;->b:Ll/e3t;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/e3t;->a:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 5
    .line 6
    return-void
.end method

.method public static a(Ll/nsv;)Ll/e3t;
    .locals 1

    .line 1
    if-eqz p0, :cond_2

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/nsv;->g()Ll/pyl;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p0}, Ll/nsv;->g()Ll/pyl;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    instance-of v0, v0, Ll/e3t;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/nsv;->g()Ll/pyl;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Ll/e3t;

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_1
    sget-object p0, Ll/e3t;->b:Ll/e3t;

    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_2
    :goto_0
    sget-object p0, Ll/e3t;->b:Ll/e3t;

    .line 29
    .line 30
    return-object p0
.end method


# virtual methods
.method public b()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e3t;->a:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->fakeId:Ljava/lang/String;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const-string p0, ""

    .line 9
    .line 10
    return-object p0
.end method

.method public c()Z
    .locals 1

    .line 1
    sget-object v0, Ll/e3t;->b:Ll/e3t;

    .line 2
    .line 3
    if-eq p0, v0, :cond_0

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

.method public d()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/e3t;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    iget-object p0, p0, Ll/e3t;->a:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->fakeType:Ljava/lang/String;

    .line 12
    .line 13
    const-string v0, "mystery"

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method

.method public e()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/e3t;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    iget-object p0, p0, Ll/e3t;->a:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatar:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_1

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_1
    return v1
.end method
