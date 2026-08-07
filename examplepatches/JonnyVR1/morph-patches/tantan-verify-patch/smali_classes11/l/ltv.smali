.class public interface abstract Ll/ltv;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field public static final a:Ll/fyx;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/fyx;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/Object;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/fyx;-><init>(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Ll/ltv;->a:Ll/fyx;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public abstract a()V
.end method

.method public abstract b()Z
.end method

.method public c([Lcom/google/android/exoplayer2/x;Ll/ffj0;[Ll/u9f;)V
    .locals 6
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    sget-object v1, Lcom/google/android/exoplayer2/c0;->a:Lcom/google/android/exoplayer2/c0;

    .line 2
    .line 3
    sget-object v2, Ll/ltv;->a:Ll/fyx;

    .line 4
    .line 5
    move-object v0, p0

    .line 6
    move-object v3, p1

    .line 7
    move-object v4, p2

    .line 8
    move-object v5, p3

    .line 9
    invoke-interface/range {v0 .. v5}, Ll/ltv;->f(Lcom/google/android/exoplayer2/c0;Ll/fyx;[Lcom/google/android/exoplayer2/x;Ll/ffj0;[Ll/u9f;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public abstract d()V
.end method

.method public abstract e(JJF)Z
.end method

.method public f(Lcom/google/android/exoplayer2/c0;Ll/fyx;[Lcom/google/android/exoplayer2/x;Ll/ffj0;[Ll/u9f;)V
    .locals 0

    .line 1
    invoke-interface {p0, p3, p4, p5}, Ll/ltv;->c([Lcom/google/android/exoplayer2/x;Ll/ffj0;[Ll/u9f;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public abstract g()J
.end method

.method public h(JFZJ)Z
    .locals 9
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    sget-object v1, Lcom/google/android/exoplayer2/c0;->a:Lcom/google/android/exoplayer2/c0;

    .line 2
    .line 3
    sget-object v2, Ll/ltv;->a:Ll/fyx;

    .line 4
    .line 5
    move-object v0, p0

    .line 6
    move-wide v3, p1

    .line 7
    move v5, p3

    .line 8
    move v6, p4

    .line 9
    move-wide v7, p5

    .line 10
    invoke-interface/range {v0 .. v8}, Ll/ltv;->k(Lcom/google/android/exoplayer2/c0;Ll/fyx;JFZJ)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public abstract i()Ll/oj0;
.end method

.method public abstract j()V
.end method

.method public k(Lcom/google/android/exoplayer2/c0;Ll/fyx;JFZJ)Z
    .locals 0

    .line 1
    move-wide p1, p3

    .line 2
    move p3, p5

    .line 3
    move p4, p6

    .line 4
    move-wide p5, p7

    .line 5
    invoke-interface/range {p0 .. p6}, Ll/ltv;->h(JFZJ)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
