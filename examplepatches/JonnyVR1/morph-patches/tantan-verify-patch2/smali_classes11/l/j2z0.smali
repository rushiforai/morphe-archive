.class public final Ll/j2z0;
.super Ll/d0u0;
.source "SourceFile"


# static fields
.field public static final k:Ljava/lang/Object;

.field public static final l:Ll/trs0;


# instance fields
.field public final f:J

.field public final g:J

.field public final h:Z

.field public final i:Ll/trs0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final j:Ll/jfs0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/j2z0;->k:Ljava/lang/Object;

    .line 7
    .line 8
    new-instance v0, Ll/lxr0;

    .line 9
    .line 10
    invoke-direct {v0}, Ll/lxr0;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string v1, "SinglePeriodTimeline"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ll/lxr0;->a(Ljava/lang/String;)Ll/lxr0;

    .line 16
    .line 17
    .line 18
    sget-object v1, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ll/lxr0;->b(Landroid/net/Uri;)Ll/lxr0;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ll/lxr0;->c()Ll/trs0;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    sput-object v0, Ll/j2z0;->l:Ll/trs0;

    .line 28
    .line 29
    return-void
.end method

.method public constructor <init>(JJJJJJJZZZLjava/lang/Object;Ll/trs0;Ll/jfs0;)V
    .locals 0
    .param p18    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p20    # Ll/jfs0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ll/d0u0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p7, p0, Ll/j2z0;->f:J

    .line 5
    .line 6
    iput-wide p9, p0, Ll/j2z0;->g:J

    .line 7
    .line 8
    iput-boolean p15, p0, Ll/j2z0;->h:Z

    .line 9
    .line 10
    invoke-virtual/range {p19 .. p19}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    move-object/from16 p1, p19

    .line 14
    .line 15
    iput-object p1, p0, Ll/j2z0;->i:Ll/trs0;

    .line 16
    .line 17
    move-object/from16 p1, p20

    .line 18
    .line 19
    iput-object p1, p0, Ll/j2z0;->j:Ll/jfs0;

    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;)I
    .locals 0

    .line 1
    sget-object p0, Ll/j2z0;->k:Ljava/lang/Object;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

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
    const/4 p0, -0x1

    .line 12
    return p0
.end method

.method public final b()I
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public final c()I
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public final d(ILl/hwt0;Z)Ll/hwt0;
    .locals 10

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    invoke-static {p1, v0, v1}, Ll/lev0;->a(III)I

    .line 4
    .line 5
    .line 6
    if-eqz p3, :cond_0

    .line 7
    .line 8
    sget-object p1, Ll/j2z0;->k:Ljava/lang/Object;

    .line 9
    .line 10
    :goto_0
    move-object v2, p1

    .line 11
    goto :goto_1

    .line 12
    :cond_0
    const/4 p1, 0x0

    .line 13
    goto :goto_0

    .line 14
    :goto_1
    iget-wide v4, p0, Ll/j2z0;->f:J

    .line 15
    .line 16
    sget-object v8, Ll/e4u0;->e:Ll/e4u0;

    .line 17
    .line 18
    const/4 v9, 0x0

    .line 19
    const/4 v1, 0x0

    .line 20
    const/4 v3, 0x0

    .line 21
    const-wide/16 v6, 0x0

    .line 22
    .line 23
    move-object v0, p2

    .line 24
    invoke-virtual/range {v0 .. v9}, Ll/hwt0;->l(Ljava/lang/Object;Ljava/lang/Object;IJJLl/e4u0;Z)Ll/hwt0;

    .line 25
    .line 26
    .line 27
    return-object v0
.end method

.method public final e(ILl/wyt0;J)Ll/wyt0;
    .locals 24

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    move/from16 v3, p1

    .line 6
    .line 7
    invoke-static {v3, v1, v2}, Ll/lev0;->a(III)I

    .line 8
    .line 9
    .line 10
    sget-object v4, Ll/wyt0;->p:Ljava/lang/Object;

    .line 11
    .line 12
    iget-object v5, v0, Ll/j2z0;->i:Ll/trs0;

    .line 13
    .line 14
    iget-wide v1, v0, Ll/j2z0;->g:J

    .line 15
    .line 16
    iget-object v15, v0, Ll/j2z0;->j:Ll/jfs0;

    .line 17
    .line 18
    iget-boolean v13, v0, Ll/j2z0;->h:Z

    .line 19
    .line 20
    const/16 v21, 0x0

    .line 21
    .line 22
    const-wide/16 v22, 0x0

    .line 23
    .line 24
    const/4 v6, 0x0

    .line 25
    const-wide v7, -0x7fffffffffffffffL    # -4.9E-324

    .line 26
    .line 27
    .line 28
    .line 29
    .line 30
    const/4 v14, 0x0

    .line 31
    const-wide/16 v16, 0x0

    .line 32
    .line 33
    const/16 v20, 0x0

    .line 34
    .line 35
    move-wide v9, v7

    .line 36
    move-wide v11, v7

    .line 37
    move-object/from16 v3, p2

    .line 38
    .line 39
    move-wide/from16 v18, v1

    .line 40
    .line 41
    invoke-virtual/range {v3 .. v23}, Ll/wyt0;->a(Ljava/lang/Object;Ll/trs0;Ljava/lang/Object;JJJZZLl/jfs0;JJIIJ)Ll/wyt0;

    .line 42
    .line 43
    .line 44
    return-object p2
.end method

.method public final f(I)Ljava/lang/Object;
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    const/4 v0, 0x1

    .line 3
    invoke-static {p1, p0, v0}, Ll/lev0;->a(III)I

    .line 4
    .line 5
    .line 6
    sget-object p0, Ll/j2z0;->k:Ljava/lang/Object;

    .line 7
    .line 8
    return-object p0
.end method
