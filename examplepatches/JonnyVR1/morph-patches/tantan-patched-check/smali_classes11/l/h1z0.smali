.class public final Ll/h1z0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/w5z0;


# instance fields
.field public a:J

.field public b:J

.field public c:Ll/v5z0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public d:Ll/h1z0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(JI)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 p3, 0x10000

    .line 5
    .line 6
    invoke-virtual {p0, p1, p2, p3}, Ll/h1z0;->c(JI)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final a(J)I
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/h1z0;->a:J

    .line 2
    .line 3
    sub-long/2addr p1, v0

    .line 4
    iget-object p0, p0, Ll/h1z0;->c:Ll/v5z0;

    .line 5
    .line 6
    iget p0, p0, Ll/v5z0;->b:I

    .line 7
    .line 8
    long-to-int p0, p1

    .line 9
    return p0
.end method

.method public final b()Ll/h1z0;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/h1z0;->c:Ll/v5z0;

    .line 3
    .line 4
    iget-object v1, p0, Ll/h1z0;->d:Ll/h1z0;

    .line 5
    .line 6
    iput-object v0, p0, Ll/h1z0;->d:Ll/h1z0;

    .line 7
    .line 8
    return-object v1
.end method

.method public final c(JI)V
    .locals 2

    .line 1
    iget-object p3, p0, Ll/h1z0;->c:Ll/v5z0;

    .line 2
    .line 3
    if-nez p3, :cond_0

    .line 4
    .line 5
    const/4 p3, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p3, 0x0

    .line 8
    :goto_0
    invoke-static {p3}, Ll/lev0;->f(Z)V

    .line 9
    .line 10
    .line 11
    iput-wide p1, p0, Ll/h1z0;->a:J

    .line 12
    .line 13
    const-wide/32 v0, 0x10000

    .line 14
    .line 15
    .line 16
    add-long/2addr p1, v0

    .line 17
    iput-wide p1, p0, Ll/h1z0;->b:J

    .line 18
    .line 19
    return-void
.end method

.method public final zzc()Ll/v5z0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h1z0;->c:Ll/v5z0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public final zzd()Ll/w5z0;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/h1z0;->d:Ll/h1z0;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/h1z0;->c:Ll/v5z0;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    return-object p0

    .line 11
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method
