.class public abstract Ll/ske0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/ske0$d;,
        Ll/ske0$c;,
        Ll/ske0$b;,
        Ll/ske0$a;,
        Ll/ske0$e;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:Ll/mkc0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final b:J

.field public final c:J


# direct methods
.method public constructor <init>(Ll/mkc0;JJ)V
    .locals 0
    .param p1    # Ll/mkc0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ske0;->a:Ll/mkc0;

    .line 5
    .line 6
    iput-wide p2, p0, Ll/ske0;->b:J

    .line 7
    .line 8
    iput-wide p4, p0, Ll/ske0;->c:J

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Ll/t1d0;)Ll/mkc0;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ske0;->a:Ll/mkc0;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()J
    .locals 6

    .line 1
    iget-wide v0, p0, Ll/ske0;->c:J

    .line 2
    .line 3
    const-wide/32 v2, 0xf4240

    .line 4
    .line 5
    .line 6
    iget-wide v4, p0, Ll/ske0;->b:J

    .line 7
    .line 8
    invoke-static/range {v0 .. v5}, Ll/bmk0;->W0(JJJ)J

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    return-wide v0
.end method
