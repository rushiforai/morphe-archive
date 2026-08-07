.class public final Ll/kix;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0002\u0008\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0003\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\r\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u0015\u0010\t\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\u0007\u00a2\u0006\u0004\u0008\t\u0010\nJ\u001d\u0010\u000f\u001a\u00020\u000e2\u000e\u0010\r\u001a\n\u0012\u0004\u0012\u00020\u000c\u0018\u00010\u000b\u00a2\u0006\u0004\u0008\u000f\u0010\u0010\u00a8\u0006\u0011"
    }
    d2 = {
        "Ll/kix;",
        "",
        "<init>",
        "()V",
        "",
        "c",
        "()Z",
        "",
        "fallbackCount",
        "d",
        "(J)J",
        "",
        "Lcom/p1/mobile/putong/core/data/LikeUser;",
        "likeUsers",
        "",
        "b",
        "(Ljava/util/List;)I",
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
.field public static final INSTANCE:Ll/kix;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/kix;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/kix;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/kix;->INSTANCE:Ll/kix;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(JJLkotlin/jvm/internal/Ref$IntRef;Lcom/p1/mobile/putong/core/data/LikeUser;)V
    .locals 2

    .line 1
    iget-wide v0, p5, Lcom/p1/mobile/putong/core/data/LikeUser;->createTime:J

    .line 2
    .line 3
    sub-long/2addr p0, v0

    .line 4
    const-wide/16 v0, 0x3e8

    .line 5
    .line 6
    div-long/2addr p0, v0

    .line 7
    const-wide/16 v0, 0x0

    .line 8
    .line 9
    invoke-static {p0, p1, v0, v1}, Lkotlin/ranges/a;->c(JJ)J

    .line 10
    .line 11
    .line 12
    move-result-wide p0

    .line 13
    sub-long/2addr p2, p0

    .line 14
    cmp-long p0, p2, v0

    .line 15
    .line 16
    if-lez p0, :cond_0

    .line 17
    .line 18
    iget p0, p4, Lkotlin/jvm/internal/Ref$IntRef;->element:I

    .line 19
    .line 20
    add-int/lit8 p0, p0, 0x1

    .line 21
    .line 22
    iput p0, p4, Lkotlin/jvm/internal/Ref$IntRef;->element:I

    .line 23
    .line 24
    :cond_0
    return-void
.end method


# virtual methods
.method public final b(Ljava/util/List;)I
    .locals 8
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/putong/core/data/LikeUser;",
            ">;)I"
        }
    .end annotation

    .line 1
    check-cast p1, Ljava/util/Collection;

    .line 2
    .line 3
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    invoke-static {}, Ll/joa;->f4()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_1

    .line 16
    .line 17
    const-wide/32 v0, 0x3f480

    .line 18
    .line 19
    .line 20
    :goto_0
    move-wide v5, v0

    .line 21
    goto :goto_1

    .line 22
    :cond_1
    const-wide/32 v0, 0x15180

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :goto_1
    new-instance v7, Lkotlin/jvm/internal/Ref$IntRef;

    .line 27
    .line 28
    invoke-direct {v7}, Lkotlin/jvm/internal/Ref$IntRef;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-static {}, Ll/pzi0;->o()J

    .line 32
    .line 33
    .line 34
    move-result-wide v3

    .line 35
    new-instance v2, Ll/jix;

    .line 36
    .line 37
    invoke-direct/range {v2 .. v7}, Ll/jix;-><init>(JJLkotlin/jvm/internal/Ref$IntRef;)V

    .line 38
    .line 39
    .line 40
    invoke-static {p1, v2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 41
    .line 42
    .line 43
    iget p0, v7, Lkotlin/jvm/internal/Ref$IntRef;->element:I

    .line 44
    .line 45
    return p0
.end method

.method public final c()Z
    .locals 2

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->p0:Ll/z99;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/z99;->g3()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const/4 v0, 0x0

    .line 10
    const/4 v1, 0x1

    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    invoke-static {}, Ll/joa;->i4()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    return v1

    .line 20
    :cond_0
    return v0

    .line 21
    :cond_1
    invoke-static {}, Ll/joa;->f4()Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-nez p0, :cond_2

    .line 26
    .line 27
    return v1

    .line 28
    :cond_2
    return v0
.end method

.method public final d(J)J
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->E1:Ll/cd9;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/cd9;->F3()Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-ltz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    int-to-long p0, p0

    .line 26
    return-wide p0

    .line 27
    :cond_0
    return-wide p1
.end method
