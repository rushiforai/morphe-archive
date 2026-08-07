.class public final Lcom/p1/mobile/putong/core/ui/onlinematch/c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/onlinematch/c$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u000b\n\u0002\u0010\t\n\u0002\u0008\r\n\u0002\u0010\u000e\n\u0002\u0008\n\u0018\u0000 ,2\u00020\u0001:\u0001\u000fB\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\r\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0005\u0010\u0003J\r\u0010\u0006\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0003J\u001d\u0010\u000b\u001a\u00020\u00042\u0006\u0010\u0008\u001a\u00020\u00072\u0006\u0010\n\u001a\u00020\t\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\r\u0010\r\u001a\u00020\t\u00a2\u0006\u0004\u0008\r\u0010\u000eR\"\u0010\u0014\u001a\u00020\t8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u000f\u0010\u0010\u001a\u0004\u0008\u0011\u0010\u000e\"\u0004\u0008\u0012\u0010\u0013R\"\u0010\u001c\u001a\u00020\u00158\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u0016\u0010\u0017\u001a\u0004\u0008\u0018\u0010\u0019\"\u0004\u0008\u001a\u0010\u001bR$\u0010\u0008\u001a\u0004\u0018\u00010\u00078\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u001d\u0010\u001e\u001a\u0004\u0008\u001f\u0010 \"\u0004\u0008!\u0010\"R\"\u0010)\u001a\u00020#8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u0011\u0010$\u001a\u0004\u0008%\u0010&\"\u0004\u0008\'\u0010(R\"\u0010+\u001a\u00020\u00158\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u0018\u0010\u0017\u001a\u0004\u0008\u001d\u0010\u0019\"\u0004\u0008*\u0010\u001b\u00a8\u0006-"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/ui/onlinematch/c;",
        "",
        "<init>",
        "()V",
        "",
        "k",
        "j",
        "Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;",
        "pushUser",
        "",
        "isQuickChat",
        "l",
        "(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;Z)V",
        "h",
        "()Z",
        "a",
        "Z",
        "d",
        "setCurrentIsMatch",
        "(Z)V",
        "currentIsMatch",
        "",
        "b",
        "J",
        "e",
        "()J",
        "i",
        "(J)V",
        "currentTime",
        "c",
        "Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;",
        "g",
        "()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;",
        "setPushUser",
        "(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;)V",
        "",
        "Ljava/lang/String;",
        "getDropDownMatchTag",
        "()Ljava/lang/String;",
        "setDropDownMatchTag",
        "(Ljava/lang/String;)V",
        "dropDownMatchTag",
        "setBroadcastTextTimerValue",
        "broadcastTextTimerValue",
        "Companion",
        "b_core_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final Companion:Lcom/p1/mobile/putong/core/ui/onlinematch/c$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static volatile f:Lcom/p1/mobile/putong/core/ui/onlinematch/c;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# instance fields
.field public a:Z

.field public b:J

.field public c:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public d:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public e:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/p1/mobile/putong/core/ui/onlinematch/c$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/onlinematch/c$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->Companion:Lcom/p1/mobile/putong/core/ui/onlinematch/c$a;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->d:Ljava/lang/String;

    .line 7
    .line 8
    const-wide/16 v0, -0x1

    .line 9
    .line 10
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->e:J

    .line 11
    .line 12
    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/onlinematch/c;-><init>()V

    return-void
.end method

.method public static final synthetic a()Lcom/p1/mobile/putong/core/ui/onlinematch/c;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->f:Lcom/p1/mobile/putong/core/ui/onlinematch/c;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic b(Lcom/p1/mobile/putong/core/ui/onlinematch/c;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->f:Lcom/p1/mobile/putong/core/ui/onlinematch/c;

    .line 2
    .line 3
    return-void
.end method

.method public static final f()Lcom/p1/mobile/putong/core/ui/onlinematch/c;
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->Companion:Lcom/p1/mobile/putong/core/ui/onlinematch/c$a;

    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/c$a;->a()Lcom/p1/mobile/putong/core/ui/onlinematch/c;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public final c()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->e:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final d()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->a:Z

    .line 2
    .line 3
    return p0
.end method

.method public final e()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->b:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final g()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->c:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 2
    .line 3
    return-object p0
.end method

.method public final h()Z
    .locals 6

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->b:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 12
    .line 13
    .line 14
    move-result-wide v2

    .line 15
    iget-wide v4, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->b:J

    .line 16
    .line 17
    cmp-long p0, v2, v4

    .line 18
    .line 19
    if-ltz p0, :cond_1

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_1
    return v1
.end method

.method public final i(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->b:J

    .line 2
    .line 3
    return-void
.end method

.method public final j()V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->a:Z

    .line 3
    .line 4
    invoke-static {}, Ll/pzi0;->o()J

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    const-wide/16 v2, 0x2710

    .line 9
    .line 10
    add-long/2addr v0, v2

    .line 11
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->b:J

    .line 12
    .line 13
    return-void
.end method

.method public final k()V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->b:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-static {}, Ll/spl0;->P()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-static {}, Ll/pzi0;->o()J

    .line 17
    .line 18
    .line 19
    move-result-wide v0

    .line 20
    const-wide/16 v2, 0x7530

    .line 21
    .line 22
    add-long/2addr v0, v2

    .line 23
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->b:J

    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    invoke-static {}, Ll/pzi0;->o()J

    .line 27
    .line 28
    .line 29
    move-result-wide v0

    .line 30
    const-wide/32 v2, 0x1b7740

    .line 31
    .line 32
    .line 33
    add-long/2addr v0, v2

    .line 34
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->b:J

    .line 35
    .line 36
    return-void
.end method

.method public final l(Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;Z)V
    .locals 2
    .param p1    # Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->c:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 5
    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    invoke-static {p2, p1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    if-eqz p2, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->c:Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;

    .line 19
    .line 20
    const/4 p2, 0x0

    .line 21
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->a:Z

    .line 22
    .line 23
    invoke-static {}, Ll/pzi0;->o()J

    .line 24
    .line 25
    .line 26
    move-result-wide v0

    .line 27
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->e:J

    .line 28
    .line 29
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchPushUser;->isSquareDataWrapper:Z

    .line 30
    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    const/16 p1, 0x7530

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    const p1, 0x493e0

    .line 37
    .line 38
    .line 39
    :goto_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 40
    .line 41
    .line 42
    move-result-wide v0

    .line 43
    int-to-long p1, p1

    .line 44
    add-long/2addr v0, p1

    .line 45
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/ui/onlinematch/c;->b:J

    .line 46
    .line 47
    return-void
.end method
