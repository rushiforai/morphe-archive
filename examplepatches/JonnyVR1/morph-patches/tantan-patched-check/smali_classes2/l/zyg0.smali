.class public final Ll/zyg0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/cng0;

.field public final b:Ll/mxg0;

.field public c:J

.field public d:J

.field public e:J

.field public f:J

.field public g:J

.field public h:J

.field public i:J

.field public j:J

.field public k:I

.field public l:I

.field public m:I


# direct methods
.method public constructor <init>(Ll/cng0;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/zyg0;->a:Ll/cng0;

    .line 5
    .line 6
    new-instance p1, Landroid/os/HandlerThread;

    .line 7
    .line 8
    const-string v0, "SudPicasso-Stats"

    .line 9
    .line 10
    const/16 v1, 0xa

    .line 11
    .line 12
    invoke-direct {p1, v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sget-object v1, Ll/yuq0;->a:Ljava/lang/StringBuilder;

    .line 23
    .line 24
    new-instance v1, Ll/ftg0;

    .line 25
    .line 26
    invoke-direct {v1, v0}, Ll/ftg0;-><init>(Landroid/os/Looper;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const-wide/16 v2, 0x3e8

    .line 34
    .line 35
    invoke-virtual {v1, v0, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 36
    .line 37
    .line 38
    new-instance v0, Ll/mxg0;

    .line 39
    .line 40
    invoke-virtual {p1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-direct {v0, p1, p0}, Ll/mxg0;-><init>(Landroid/os/Looper;Ll/zyg0;)V

    .line 45
    .line 46
    .line 47
    iput-object v0, p0, Ll/zyg0;->b:Ll/mxg0;

    .line 48
    .line 49
    return-void
.end method


# virtual methods
.method public final a()Ll/dtg0;
    .locals 26

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    new-instance v1, Ll/dtg0;

    .line 4
    .line 5
    iget-object v2, v0, Ll/zyg0;->a:Ll/cng0;

    .line 6
    .line 7
    invoke-virtual {v2}, Ll/cng0;->a()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    iget-object v3, v0, Ll/zyg0;->a:Ll/cng0;

    .line 12
    .line 13
    invoke-virtual {v3}, Ll/cng0;->d()I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    move-object v5, v1

    .line 18
    move v1, v2

    .line 19
    move v2, v3

    .line 20
    iget-wide v3, v0, Ll/zyg0;->c:J

    .line 21
    .line 22
    move-object v7, v5

    .line 23
    iget-wide v5, v0, Ll/zyg0;->d:J

    .line 24
    .line 25
    move-object v9, v7

    .line 26
    iget-wide v7, v0, Ll/zyg0;->e:J

    .line 27
    .line 28
    move-object v11, v9

    .line 29
    iget-wide v9, v0, Ll/zyg0;->f:J

    .line 30
    .line 31
    move-object v13, v11

    .line 32
    iget-wide v11, v0, Ll/zyg0;->g:J

    .line 33
    .line 34
    move-object v15, v13

    .line 35
    iget-wide v13, v0, Ll/zyg0;->h:J

    .line 36
    .line 37
    move/from16 v17, v1

    .line 38
    .line 39
    move/from16 v16, v2

    .line 40
    .line 41
    iget-wide v1, v0, Ll/zyg0;->i:J

    .line 42
    .line 43
    move-wide/from16 v18, v1

    .line 44
    .line 45
    iget-wide v1, v0, Ll/zyg0;->j:J

    .line 46
    .line 47
    move-wide/from16 v20, v1

    .line 48
    .line 49
    iget v1, v0, Ll/zyg0;->k:I

    .line 50
    .line 51
    iget v2, v0, Ll/zyg0;->l:I

    .line 52
    .line 53
    iget v0, v0, Ll/zyg0;->m:I

    .line 54
    .line 55
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 56
    .line 57
    .line 58
    move-result-wide v22

    .line 59
    move-wide/from16 v24, v20

    .line 60
    .line 61
    move/from16 v21, v0

    .line 62
    .line 63
    move/from16 v20, v2

    .line 64
    .line 65
    move-object v0, v15

    .line 66
    move/from16 v2, v16

    .line 67
    .line 68
    move-wide/from16 v15, v18

    .line 69
    .line 70
    move/from16 v19, v1

    .line 71
    .line 72
    move/from16 v1, v17

    .line 73
    .line 74
    move-wide/from16 v17, v24

    .line 75
    .line 76
    invoke-direct/range {v0 .. v23}, Ll/dtg0;-><init>(IIJJJJJJJJIIIJ)V

    .line 77
    .line 78
    .line 79
    move-object v15, v0

    .line 80
    return-object v15
.end method
