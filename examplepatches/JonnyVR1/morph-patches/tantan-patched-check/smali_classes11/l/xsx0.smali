.class public final Ll/xsx0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/fex0;


# instance fields
.field public final a:Ll/fex0;

.field public b:J

.field public c:Landroid/net/Uri;

.field public d:Ljava/util/Map;


# direct methods
.method public constructor <init>(Ll/fex0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/xsx0;->a:Ll/fex0;

    .line 5
    .line 6
    sget-object p1, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    .line 7
    .line 8
    iput-object p1, p0, Ll/xsx0;->c:Landroid/net/Uri;

    .line 9
    .line 10
    sget-object p1, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 11
    .line 12
    iput-object p1, p0, Ll/xsx0;->d:Ljava/util/Map;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final a([BII)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/xsx0;->a:Ll/fex0;

    .line 2
    .line 3
    invoke-interface {v0, p1, p2, p3}, Ll/nyy0;->a([BII)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 p2, -0x1

    .line 8
    if-eq p1, p2, :cond_0

    .line 9
    .line 10
    iget-wide p2, p0, Ll/xsx0;->b:J

    .line 11
    .line 12
    int-to-long v0, p1

    .line 13
    add-long/2addr p2, v0

    .line 14
    iput-wide p2, p0, Ll/xsx0;->b:J

    .line 15
    .line 16
    :cond_0
    return p1
.end method

.method public final e(Ll/akx0;)J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p1, Ll/akx0;->a:Landroid/net/Uri;

    .line 2
    .line 3
    iput-object v0, p0, Ll/xsx0;->c:Landroid/net/Uri;

    .line 4
    .line 5
    sget-object v0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 6
    .line 7
    iput-object v0, p0, Ll/xsx0;->d:Ljava/util/Map;

    .line 8
    .line 9
    iget-object v0, p0, Ll/xsx0;->a:Ll/fex0;

    .line 10
    .line 11
    invoke-interface {v0, p1}, Ll/fex0;->e(Ll/akx0;)J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    invoke-virtual {p0}, Ll/xsx0;->zzc()Landroid/net/Uri;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Ll/xsx0;->c:Landroid/net/Uri;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/xsx0;->zze()Ljava/util/Map;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iput-object p1, p0, Ll/xsx0;->d:Ljava/util/Map;

    .line 29
    .line 30
    return-wide v0
.end method

.method public final f(Ll/btx0;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/xsx0;->a:Ll/fex0;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ll/fex0;->f(Ll/btx0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final j()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/xsx0;->b:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final k()Landroid/net/Uri;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xsx0;->c:Landroid/net/Uri;

    .line 2
    .line 3
    return-object p0
.end method

.method public final l()Ljava/util/Map;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xsx0;->d:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public final zzc()Landroid/net/Uri;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/xsx0;->a:Ll/fex0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/fex0;->zzc()Landroid/net/Uri;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
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
    iget-object p0, p0, Ll/xsx0;->a:Ll/fex0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/fex0;->zzd()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final zze()Ljava/util/Map;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xsx0;->a:Ll/fex0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/fex0;->zze()Ljava/util/Map;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
