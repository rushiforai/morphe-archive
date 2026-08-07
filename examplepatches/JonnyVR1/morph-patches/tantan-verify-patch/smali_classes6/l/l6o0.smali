.class public Ll/l6o0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pyl;


# static fields
.field public static d:Ll/l6o0;


# instance fields
.field public a:Ljava/lang/String;

.field public b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

.field public c:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/l6o0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/l6o0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/l6o0;->d:Ll/l6o0;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/l6o0;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-boolean p2, p0, Ll/l6o0;->c:Z

    .line 7
    .line 8
    return-void
.end method

.method public static c(Ll/nsv;)Ll/l6o0;
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
    instance-of v0, v0, Ll/l6o0;

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
    check-cast p0, Ll/l6o0;

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_1
    sget-object p0, Ll/l6o0;->d:Ll/l6o0;

    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_2
    :goto_0
    sget-object p0, Ll/l6o0;->d:Ll/l6o0;

    .line 29
    .line 30
    return-object p0
.end method


# virtual methods
.method public a(Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ll/l6o0;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/l6o0;->d:Ll/l6o0;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final b()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Ll/l6o0;->c:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Ll/l6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 14
    .line 15
    iget-object p0, p0, Ll/l6o0;->a:Ljava/lang/String;

    .line 16
    .line 17
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->userId:Ljava/lang/String;

    .line 18
    .line 19
    const-string p0, "#ffffff"

    .line 20
    .line 21
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->color:Ljava/lang/String;

    .line 22
    .line 23
    new-instance p0, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    const-string v1, "res://drawable/"

    .line 26
    .line 27
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    sget v1, Ll/mbc0;->T:I

    .line 31
    .line 32
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatar:Ljava/lang/String;

    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public d()Z
    .locals 1

    .line 1
    sget-object v0, Ll/l6o0;->d:Ll/l6o0;

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

.method public e()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/l6o0;->d()Z

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
    iget-object p0, p0, Ll/l6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

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

.method public f(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)Ll/l6o0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/l6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/l6o0;->b()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method
