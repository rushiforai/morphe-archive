.class public Ll/ey2$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/mke0;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ey2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public final a:Ll/ey2$d;

.field public final b:J

.field public final c:J

.field public final d:J

.field public final e:J

.field public final f:J

.field public final g:J


# direct methods
.method public constructor <init>(Ll/ey2$d;JJJJJJ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ey2$a;->a:Ll/ey2$d;

    .line 5
    .line 6
    iput-wide p2, p0, Ll/ey2$a;->b:J

    .line 7
    .line 8
    iput-wide p4, p0, Ll/ey2$a;->c:J

    .line 9
    .line 10
    iput-wide p6, p0, Ll/ey2$a;->d:J

    .line 11
    .line 12
    iput-wide p8, p0, Ll/ey2$a;->e:J

    .line 13
    .line 14
    iput-wide p10, p0, Ll/ey2$a;->f:J

    .line 15
    .line 16
    iput-wide p12, p0, Ll/ey2$a;->g:J

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic a(Ll/ey2$a;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/ey2$a;->c:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic b(Ll/ey2$a;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/ey2$a;->d:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic f(Ll/ey2$a;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/ey2$a;->e:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic h(Ll/ey2$a;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/ey2$a;->f:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic j(Ll/ey2$a;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/ey2$a;->g:J

    .line 2
    .line 3
    return-wide v0
.end method


# virtual methods
.method public d(J)Ll/mke0$a;
    .locals 13

    .line 1
    iget-object v0, p0, Ll/ey2$a;->a:Ll/ey2$d;

    .line 2
    .line 3
    invoke-interface {v0, p1, p2}, Ll/ey2$d;->a(J)J

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    iget-wide v3, p0, Ll/ey2$a;->c:J

    .line 8
    .line 9
    iget-wide v5, p0, Ll/ey2$a;->d:J

    .line 10
    .line 11
    iget-wide v7, p0, Ll/ey2$a;->e:J

    .line 12
    .line 13
    iget-wide v9, p0, Ll/ey2$a;->f:J

    .line 14
    .line 15
    iget-wide v11, p0, Ll/ey2$a;->g:J

    .line 16
    .line 17
    invoke-static/range {v1 .. v12}, Ll/ey2$c;->h(JJJJJJ)J

    .line 18
    .line 19
    .line 20
    move-result-wide v0

    .line 21
    new-instance p0, Ll/mke0$a;

    .line 22
    .line 23
    new-instance v2, Ll/oke0;

    .line 24
    .line 25
    invoke-direct {v2, p1, p2, v0, v1}, Ll/oke0;-><init>(JJ)V

    .line 26
    .line 27
    .line 28
    invoke-direct {p0, v2}, Ll/mke0$a;-><init>(Ll/oke0;)V

    .line 29
    .line 30
    .line 31
    return-object p0
.end method

.method public e()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public i()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/ey2$a;->b:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public k(J)J
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ey2$a;->a:Ll/ey2$d;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ll/ey2$d;->a(J)J

    .line 4
    .line 5
    .line 6
    move-result-wide p0

    .line 7
    return-wide p0
.end method
