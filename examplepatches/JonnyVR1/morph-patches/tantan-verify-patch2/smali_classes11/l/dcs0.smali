.class public final Ll/dcs0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/io/InputStream;

.field public final b:Z

.field public final c:Z

.field public final d:J

.field public final e:Z


# direct methods
.method public constructor <init>(Ljava/io/InputStream;ZZJZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/dcs0;->a:Ljava/io/InputStream;

    .line 5
    .line 6
    iput-boolean p2, p0, Ll/dcs0;->b:Z

    .line 7
    .line 8
    iput-boolean p3, p0, Ll/dcs0;->c:Z

    .line 9
    .line 10
    iput-wide p4, p0, Ll/dcs0;->d:J

    .line 11
    .line 12
    iput-boolean p6, p0, Ll/dcs0;->e:Z

    .line 13
    .line 14
    return-void
.end method

.method public static b(Ljava/io/InputStream;ZZJZ)Ll/dcs0;
    .locals 7

    .line 1
    new-instance v0, Ll/dcs0;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move v2, p1

    .line 5
    move v3, p2

    .line 6
    move-wide v4, p3

    .line 7
    move v6, p5

    .line 8
    invoke-direct/range {v0 .. v6}, Ll/dcs0;-><init>(Ljava/io/InputStream;ZZJZ)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method


# virtual methods
.method public final a()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/dcs0;->d:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final c()Ljava/io/InputStream;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dcs0;->a:Ljava/io/InputStream;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/dcs0;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method public final e()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/dcs0;->e:Z

    .line 2
    .line 3
    return p0
.end method

.method public final f()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/dcs0;->c:Z

    .line 2
    .line 3
    return p0
.end method
