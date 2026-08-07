.class public Ll/ske0$e;
.super Ll/ske0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ske0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "e"
.end annotation


# instance fields
.field public final d:J

.field public final e:J


# direct methods
.method public constructor <init>()V
    .locals 10

    .line 1
    const-wide/16 v6, 0x0

    .line 2
    .line 3
    const-wide/16 v8, 0x0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    const-wide/16 v2, 0x1

    .line 7
    .line 8
    const-wide/16 v4, 0x0

    .line 9
    .line 10
    move-object v0, p0

    .line 11
    invoke-direct/range {v0 .. v9}, Ll/ske0$e;-><init>(Ll/mkc0;JJJJ)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Ll/mkc0;JJJJ)V
    .locals 0
    .param p1    # Ll/mkc0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 15
    invoke-direct/range {p0 .. p5}, Ll/ske0;-><init>(Ll/mkc0;JJ)V

    .line 16
    iput-wide p6, p0, Ll/ske0$e;->d:J

    .line 17
    iput-wide p8, p0, Ll/ske0$e;->e:J

    return-void
.end method


# virtual methods
.method public c()Ll/mkc0;
    .locals 6
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-wide v4, p0, Ll/ske0$e;->e:J

    .line 2
    .line 3
    const-wide/16 v0, 0x0

    .line 4
    .line 5
    cmp-long v0, v4, v0

    .line 6
    .line 7
    if-gtz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    new-instance v0, Ll/mkc0;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    iget-wide v2, p0, Ll/ske0$e;->d:J

    .line 15
    .line 16
    invoke-direct/range {v0 .. v5}, Ll/mkc0;-><init>(Ljava/lang/String;JJ)V

    .line 17
    .line 18
    .line 19
    return-object v0
.end method
