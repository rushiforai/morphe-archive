.class public final Ll/v610;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/v610$a;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:J

.field public final b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/v610$a;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(JLjava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/List<",
            "Ll/v610$a;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Ll/v610;->a:J

    .line 5
    .line 6
    iput-object p3, p0, Ll/v610;->b:Ljava/util/List;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(J)Lcom/google/android/exoplayer2/metadata/mp4/MotionPhotoMetadata;
    .locals 21
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Ll/v610;->b:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x2

    .line 10
    const/4 v3, 0x0

    .line 11
    if-ge v1, v2, :cond_0

    .line 12
    .line 13
    return-object v3

    .line 14
    :cond_0
    iget-object v1, v0, Ll/v610;->b:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    add-int/lit8 v1, v1, -0x1

    .line 21
    .line 22
    const-wide/16 v4, -0x1

    .line 23
    .line 24
    move-wide/from16 v6, p1

    .line 25
    .line 26
    move-wide v9, v4

    .line 27
    move-wide v11, v9

    .line 28
    move-wide v15, v11

    .line 29
    move-wide/from16 v17, v15

    .line 30
    .line 31
    const/4 v8, 0x0

    .line 32
    :goto_0
    if-ltz v1, :cond_4

    .line 33
    .line 34
    iget-object v13, v0, Ll/v610;->b:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {v13, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v13

    .line 40
    check-cast v13, Ll/v610$a;

    .line 41
    .line 42
    const-string v14, "video/mp4"

    .line 43
    .line 44
    iget-object v2, v13, Ll/v610$a;->a:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v14, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    or-int/2addr v2, v8

    .line 51
    if-nez v1, :cond_1

    .line 52
    .line 53
    iget-wide v13, v13, Ll/v610$a;->d:J

    .line 54
    .line 55
    sub-long/2addr v6, v13

    .line 56
    const-wide/16 v13, 0x0

    .line 57
    .line 58
    :goto_1
    move-wide/from16 v19, v13

    .line 59
    .line 60
    move-wide v13, v6

    .line 61
    move-wide/from16 v6, v19

    .line 62
    .line 63
    goto :goto_2

    .line 64
    :cond_1
    iget-wide v13, v13, Ll/v610$a;->c:J

    .line 65
    .line 66
    sub-long v13, v6, v13

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :goto_2
    if-eqz v2, :cond_2

    .line 70
    .line 71
    cmp-long v8, v6, v13

    .line 72
    .line 73
    if-eqz v8, :cond_2

    .line 74
    .line 75
    sub-long v17, v13, v6

    .line 76
    .line 77
    move-wide v15, v6

    .line 78
    const/4 v8, 0x0

    .line 79
    goto :goto_3

    .line 80
    :cond_2
    move v8, v2

    .line 81
    :goto_3
    if-nez v1, :cond_3

    .line 82
    .line 83
    move-wide v9, v6

    .line 84
    move-wide v11, v13

    .line 85
    :cond_3
    add-int/lit8 v1, v1, -0x1

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_4
    cmp-long v1, v15, v4

    .line 89
    .line 90
    if-eqz v1, :cond_6

    .line 91
    .line 92
    cmp-long v1, v17, v4

    .line 93
    .line 94
    if-eqz v1, :cond_6

    .line 95
    .line 96
    cmp-long v1, v9, v4

    .line 97
    .line 98
    if-eqz v1, :cond_6

    .line 99
    .line 100
    cmp-long v1, v11, v4

    .line 101
    .line 102
    if-nez v1, :cond_5

    .line 103
    .line 104
    goto :goto_4

    .line 105
    :cond_5
    new-instance v8, Lcom/google/android/exoplayer2/metadata/mp4/MotionPhotoMetadata;

    .line 106
    .line 107
    iget-wide v13, v0, Ll/v610;->a:J

    .line 108
    .line 109
    invoke-direct/range {v8 .. v18}, Lcom/google/android/exoplayer2/metadata/mp4/MotionPhotoMetadata;-><init>(JJJJJ)V

    .line 110
    .line 111
    .line 112
    return-object v8

    .line 113
    :cond_6
    :goto_4
    return-object v3
.end method
