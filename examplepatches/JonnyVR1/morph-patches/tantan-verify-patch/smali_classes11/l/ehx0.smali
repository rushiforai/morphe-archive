.class public final Ll/ehx0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Landroid/net/Uri;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public b:Ljava/util/Map;

.field public c:J

.field public d:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 5
    .line 6
    iput-object v0, p0, Ll/ehx0;->b:Ljava/util/Map;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(I)Ll/ehx0;
    .locals 0

    .line 1
    const/4 p1, 0x6

    .line 2
    iput p1, p0, Ll/ehx0;->d:I

    .line 3
    .line 4
    return-object p0
.end method

.method public final b(Ljava/util/Map;)Ll/ehx0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ehx0;->b:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c(J)Ll/ehx0;
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/ehx0;->c:J

    .line 2
    .line 3
    return-object p0
.end method

.method public final d(Landroid/net/Uri;)Ll/ehx0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ehx0;->a:Landroid/net/Uri;

    .line 2
    .line 3
    return-object p0
.end method

.method public final e()Ll/akx0;
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Ll/ehx0;->a:Landroid/net/Uri;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    new-instance v2, Ll/akx0;

    .line 8
    .line 9
    iget-object v3, v0, Ll/ehx0;->a:Landroid/net/Uri;

    .line 10
    .line 11
    iget-object v8, v0, Ll/ehx0;->b:Ljava/util/Map;

    .line 12
    .line 13
    iget-wide v9, v0, Ll/ehx0;->c:J

    .line 14
    .line 15
    iget v14, v0, Ll/ehx0;->d:I

    .line 16
    .line 17
    const/4 v15, 0x0

    .line 18
    const/16 v16, 0x0

    .line 19
    .line 20
    const-wide/16 v4, 0x0

    .line 21
    .line 22
    const/4 v6, 0x1

    .line 23
    const/4 v7, 0x0

    .line 24
    const-wide/16 v11, -0x1

    .line 25
    .line 26
    const/4 v13, 0x0

    .line 27
    invoke-direct/range {v2 .. v16}, Ll/akx0;-><init>(Landroid/net/Uri;JI[BLjava/util/Map;JJLjava/lang/String;ILjava/lang/Object;Ll/bjx0;)V

    .line 28
    .line 29
    .line 30
    return-object v2

    .line 31
    :cond_0
    const-string v0, "The uri must be set."

    .line 32
    .line 33
    invoke-static {v0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    const/4 v0, 0x0

    .line 37
    return-object v0
.end method
