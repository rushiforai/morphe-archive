.class public Ll/c3g0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/mke0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/c3g0;->k(Ll/mke0;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/mke0;

.field public final synthetic b:Ll/c3g0;


# direct methods
.method public constructor <init>(Ll/c3g0;Ll/mke0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/c3g0$a;->b:Ll/c3g0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/c3g0$a;->a:Ll/mke0;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public d(J)Ll/mke0$a;
    .locals 8

    .line 1
    iget-object v0, p0, Ll/c3g0$a;->a:Ll/mke0;

    .line 2
    .line 3
    invoke-interface {v0, p1, p2}, Ll/mke0;->d(J)Ll/mke0$a;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    new-instance p2, Ll/mke0$a;

    .line 8
    .line 9
    new-instance v0, Ll/oke0;

    .line 10
    .line 11
    iget-object v1, p1, Ll/mke0$a;->a:Ll/oke0;

    .line 12
    .line 13
    iget-wide v2, v1, Ll/oke0;->a:J

    .line 14
    .line 15
    iget-wide v4, v1, Ll/oke0;->b:J

    .line 16
    .line 17
    iget-object v1, p0, Ll/c3g0$a;->b:Ll/c3g0;

    .line 18
    .line 19
    invoke-static {v1}, Ll/c3g0;->a(Ll/c3g0;)J

    .line 20
    .line 21
    .line 22
    move-result-wide v6

    .line 23
    add-long/2addr v4, v6

    .line 24
    invoke-direct {v0, v2, v3, v4, v5}, Ll/oke0;-><init>(JJ)V

    .line 25
    .line 26
    .line 27
    new-instance v1, Ll/oke0;

    .line 28
    .line 29
    iget-object p1, p1, Ll/mke0$a;->b:Ll/oke0;

    .line 30
    .line 31
    iget-wide v2, p1, Ll/oke0;->a:J

    .line 32
    .line 33
    iget-wide v4, p1, Ll/oke0;->b:J

    .line 34
    .line 35
    iget-object p0, p0, Ll/c3g0$a;->b:Ll/c3g0;

    .line 36
    .line 37
    invoke-static {p0}, Ll/c3g0;->a(Ll/c3g0;)J

    .line 38
    .line 39
    .line 40
    move-result-wide p0

    .line 41
    add-long/2addr v4, p0

    .line 42
    invoke-direct {v1, v2, v3, v4, v5}, Ll/oke0;-><init>(JJ)V

    .line 43
    .line 44
    .line 45
    invoke-direct {p2, v0, v1}, Ll/mke0$a;-><init>(Ll/oke0;Ll/oke0;)V

    .line 46
    .line 47
    .line 48
    return-object p2
.end method

.method public e()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c3g0$a;->a:Ll/mke0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/mke0;->e()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public i()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/c3g0$a;->a:Ll/mke0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/mke0;->i()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method
