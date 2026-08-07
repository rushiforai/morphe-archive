.class public final Ll/m2z0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/f2z0;


# instance fields
.field public final a:Ll/f2z0;

.field public final b:J


# direct methods
.method public constructor <init>(Ll/f2z0;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/m2z0;->a:Ll/f2z0;

    .line 5
    .line 6
    iput-wide p2, p0, Ll/m2z0;->b:J

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(J)I
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/m2z0;->b:J

    .line 2
    .line 3
    iget-object p0, p0, Ll/m2z0;->a:Ll/f2z0;

    .line 4
    .line 5
    sub-long/2addr p1, v0

    .line 6
    invoke-interface {p0, p1, p2}, Ll/f2z0;->a(J)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public final b(Ll/l9y0;Ll/evx0;I)I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/m2z0;->a:Ll/f2z0;

    .line 2
    .line 3
    invoke-interface {v0, p1, p2, p3}, Ll/f2z0;->b(Ll/l9y0;Ll/evx0;I)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 p3, -0x4

    .line 8
    if-ne p1, p3, :cond_0

    .line 9
    .line 10
    iget-wide v0, p2, Ll/evx0;->f:J

    .line 11
    .line 12
    iget-wide p0, p0, Ll/m2z0;->b:J

    .line 13
    .line 14
    add-long/2addr v0, p0

    .line 15
    iput-wide v0, p2, Ll/evx0;->f:J

    .line 16
    .line 17
    return p3

    .line 18
    :cond_0
    return p1
.end method

.method public final c()Ll/f2z0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m2z0;->a:Ll/f2z0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final zzd()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/m2z0;->a:Ll/f2z0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/f2z0;->zzd()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final zze()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m2z0;->a:Ll/f2z0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/f2z0;->zze()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
