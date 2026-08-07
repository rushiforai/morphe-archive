.class public Ll/t1d0$c;
.super Ll/t1d0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/t1d0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# instance fields
.field public final i:Landroid/net/Uri;

.field public final j:J

.field public final k:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final l:Ll/mkc0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final m:Ll/nqf0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(JLcom/google/android/exoplayer2/k;Ljava/util/List;Ll/ske0$e;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/lang/String;J)V
    .locals 10
    .param p6    # Ljava/util/List;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p9    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Lcom/google/android/exoplayer2/k;",
            "Ljava/util/List<",
            "Ll/fs2;",
            ">;",
            "Ll/ske0$e;",
            "Ljava/util/List<",
            "Ll/tvd;",
            ">;",
            "Ljava/util/List<",
            "Ll/tvd;",
            ">;",
            "Ljava/util/List<",
            "Ll/tvd;",
            ">;",
            "Ljava/lang/String;",
            "J)V"
        }
    .end annotation

    .line 1
    const/4 v9, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-wide v1, p1

    .line 4
    move-object v3, p3

    .line 5
    move-object v4, p4

    .line 6
    move-object v5, p5

    .line 7
    move-object/from16 v6, p6

    .line 8
    .line 9
    move-object/from16 v7, p7

    .line 10
    .line 11
    move-object/from16 v8, p8

    .line 12
    .line 13
    invoke-direct/range {v0 .. v9}, Ll/t1d0;-><init>(JLcom/google/android/exoplayer2/k;Ljava/util/List;Ll/ske0;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ll/t1d0$a;)V

    .line 14
    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    invoke-interface {p4, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Ll/fs2;

    .line 22
    .line 23
    iget-object p1, p1, Ll/fs2;->a:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iput-object p1, p0, Ll/t1d0$c;->i:Landroid/net/Uri;

    .line 30
    .line 31
    invoke-virtual {p5}, Ll/ske0$e;->c()Ll/mkc0;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iput-object p1, p0, Ll/t1d0$c;->l:Ll/mkc0;

    .line 36
    .line 37
    move-object/from16 p2, p9

    .line 38
    .line 39
    iput-object p2, p0, Ll/t1d0$c;->k:Ljava/lang/String;

    .line 40
    .line 41
    move-wide/from16 p2, p10

    .line 42
    .line 43
    iput-wide p2, p0, Ll/t1d0$c;->j:J

    .line 44
    .line 45
    if-eqz p1, :cond_0

    .line 46
    .line 47
    const/4 p1, 0x0

    .line 48
    goto :goto_0

    .line 49
    :cond_0
    new-instance p1, Ll/nqf0;

    .line 50
    .line 51
    new-instance p4, Ll/mkc0;

    .line 52
    .line 53
    const/4 p5, 0x0

    .line 54
    const-wide/16 v1, 0x0

    .line 55
    .line 56
    move-wide/from16 p6, p2

    .line 57
    .line 58
    move-object p2, p4

    .line 59
    move-object p3, p5

    .line 60
    move-wide p4, v1

    .line 61
    invoke-direct/range {p2 .. p7}, Ll/mkc0;-><init>(Ljava/lang/String;JJ)V

    .line 62
    .line 63
    .line 64
    invoke-direct {p1, p2}, Ll/nqf0;-><init>(Ll/mkc0;)V

    .line 65
    .line 66
    .line 67
    :goto_0
    iput-object p1, p0, Ll/t1d0$c;->m:Ll/nqf0;

    .line 68
    .line 69
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/t1d0$c;->k:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Ll/l4c;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/t1d0$c;->m:Ll/nqf0;

    .line 2
    .line 3
    return-object p0
.end method

.method public m()Ll/mkc0;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/t1d0$c;->l:Ll/mkc0;

    .line 2
    .line 3
    return-object p0
.end method
