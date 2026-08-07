.class public final Ll/h0y0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public b:Ll/mfv0;

.field public c:Ll/fpw0;

.field public d:Ll/fpw0;

.field public e:Ll/fpw0;

.field public f:Ll/fpw0;

.field public g:Ll/fpw0;

.field public h:Ll/eow0;

.field public i:Landroid/os/Looper;

.field public j:Ll/w3y0;

.field public k:I

.field public l:Z

.field public m:Ll/gfy0;

.field public n:J

.field public o:J

.field public p:Z

.field public q:Z

.field public r:Ll/ixx0;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/cit0;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    new-instance v2, Ll/ezx0;

    .line 6
    .line 7
    move-object/from16 v3, p2

    .line 8
    .line 9
    invoke-direct {v2, v3}, Ll/ezx0;-><init>(Ll/cit0;)V

    .line 10
    .line 11
    .line 12
    new-instance v3, Ll/izx0;

    .line 13
    .line 14
    invoke-direct {v3, v1}, Ll/izx0;-><init>(Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    new-instance v4, Ll/nzx0;

    .line 18
    .line 19
    invoke-direct {v4, v1}, Ll/nzx0;-><init>(Landroid/content/Context;)V

    .line 20
    .line 21
    .line 22
    sget-object v5, Ll/rzx0;->a:Ll/rzx0;

    .line 23
    .line 24
    new-instance v6, Ll/wzx0;

    .line 25
    .line 26
    invoke-direct {v6, v1}, Ll/wzx0;-><init>(Landroid/content/Context;)V

    .line 27
    .line 28
    .line 29
    sget-object v7, Ll/zzx0;->a:Ll/zzx0;

    .line 30
    .line 31
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 35
    .line 36
    .line 37
    iput-object v1, v0, Ll/h0y0;->a:Landroid/content/Context;

    .line 38
    .line 39
    iput-object v2, v0, Ll/h0y0;->c:Ll/fpw0;

    .line 40
    .line 41
    iput-object v3, v0, Ll/h0y0;->d:Ll/fpw0;

    .line 42
    .line 43
    iput-object v4, v0, Ll/h0y0;->e:Ll/fpw0;

    .line 44
    .line 45
    iput-object v5, v0, Ll/h0y0;->f:Ll/fpw0;

    .line 46
    .line 47
    iput-object v6, v0, Ll/h0y0;->g:Ll/fpw0;

    .line 48
    .line 49
    iput-object v7, v0, Ll/h0y0;->h:Ll/eow0;

    .line 50
    .line 51
    invoke-static {}, Ll/mpw0;->M()Landroid/os/Looper;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    iput-object v1, v0, Ll/h0y0;->i:Landroid/os/Looper;

    .line 56
    .line 57
    sget-object v1, Ll/w3y0;->b:Ll/w3y0;

    .line 58
    .line 59
    iput-object v1, v0, Ll/h0y0;->j:Ll/w3y0;

    .line 60
    .line 61
    const/4 v1, 0x1

    .line 62
    iput v1, v0, Ll/h0y0;->k:I

    .line 63
    .line 64
    iput-boolean v1, v0, Ll/h0y0;->l:Z

    .line 65
    .line 66
    sget-object v2, Ll/gfy0;->g:Ll/gfy0;

    .line 67
    .line 68
    iput-object v2, v0, Ll/h0y0;->m:Ll/gfy0;

    .line 69
    .line 70
    new-instance v3, Ll/ixx0;

    .line 71
    .line 72
    const-wide/16 v4, 0x14

    .line 73
    .line 74
    invoke-static {v4, v5}, Ll/mpw0;->F(J)J

    .line 75
    .line 76
    .line 77
    move-result-wide v9

    .line 78
    const-wide/16 v4, 0x1f4

    .line 79
    .line 80
    invoke-static {v4, v5}, Ll/mpw0;->F(J)J

    .line 81
    .line 82
    .line 83
    move-result-wide v11

    .line 84
    const v13, 0x3f7fbe77    # 0.999f

    .line 85
    .line 86
    .line 87
    const/4 v14, 0x0

    .line 88
    move-wide v5, v4

    .line 89
    const v4, 0x3f7851ec    # 0.97f

    .line 90
    .line 91
    .line 92
    move-wide v6, v5

    .line 93
    const v5, 0x3f83d70a    # 1.03f

    .line 94
    .line 95
    .line 96
    move-wide v15, v6

    .line 97
    const-wide/16 v6, 0x3e8

    .line 98
    .line 99
    const v8, 0x33d6bf95    # 1.0E-7f

    .line 100
    .line 101
    .line 102
    move-wide v1, v15

    .line 103
    invoke-direct/range {v3 .. v14}, Ll/ixx0;-><init>(FFJFJJFLl/dxx0;)V

    .line 104
    .line 105
    .line 106
    iput-object v3, v0, Ll/h0y0;->r:Ll/ixx0;

    .line 107
    .line 108
    sget-object v3, Ll/mfv0;->a:Ll/mfv0;

    .line 109
    .line 110
    iput-object v3, v0, Ll/h0y0;->b:Ll/mfv0;

    .line 111
    .line 112
    iput-wide v1, v0, Ll/h0y0;->n:J

    .line 113
    .line 114
    const-wide/16 v1, 0x7d0

    .line 115
    .line 116
    iput-wide v1, v0, Ll/h0y0;->o:J

    .line 117
    .line 118
    const/4 v1, 0x1

    .line 119
    iput-boolean v1, v0, Ll/h0y0;->p:Z

    .line 120
    .line 121
    return-void
.end method

.method public static synthetic a(Landroid/content/Context;)Ll/jzy0;
    .locals 2

    .line 1
    new-instance v0, Ll/xyy0;

    .line 2
    .line 3
    new-instance v1, Ll/ker0;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/ker0;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, p0, v1}, Ll/xyy0;-><init>(Landroid/content/Context;Ll/ifr0;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method
