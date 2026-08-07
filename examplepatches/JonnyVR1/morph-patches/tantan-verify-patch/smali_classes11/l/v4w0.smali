.class public final Ll/v4w0;
.super Ll/zyu0$a;
.source "SourceFile"


# instance fields
.field public final synthetic e:Ljava/lang/Long;

.field public final synthetic f:Ljava/lang/String;

.field public final synthetic g:Ljava/lang/String;

.field public final synthetic h:Landroid/os/Bundle;

.field public final synthetic i:Z

.field public final synthetic j:Z

.field public final synthetic k:Ll/zyu0;


# direct methods
.method public constructor <init>(Ll/zyu0;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;ZZ)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/v4w0;->e:Ljava/lang/Long;

    .line 2
    .line 3
    iput-object p3, p0, Ll/v4w0;->f:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p4, p0, Ll/v4w0;->g:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p5, p0, Ll/v4w0;->h:Landroid/os/Bundle;

    .line 8
    .line 9
    iput-boolean p6, p0, Ll/v4w0;->i:Z

    .line 10
    .line 11
    iput-boolean p7, p0, Ll/v4w0;->j:Z

    .line 12
    .line 13
    iput-object p1, p0, Ll/v4w0;->k:Ll/zyu0;

    .line 14
    .line 15
    invoke-direct {p0, p1}, Ll/zyu0$a;-><init>(Ll/zyu0;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/v4w0;->e:Ljava/lang/Long;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-wide v0, p0, Ll/zyu0$a;->a:J

    .line 6
    .line 7
    :goto_0
    move-wide v8, v0

    .line 8
    goto :goto_1

    .line 9
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    goto :goto_0

    .line 14
    :goto_1
    iget-object v0, p0, Ll/v4w0;->k:Ll/zyu0;

    .line 15
    .line 16
    invoke-static {v0}, Ll/zyu0;->h(Ll/zyu0;)Ll/pgu0;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    move-object v2, v0

    .line 25
    check-cast v2, Ll/pgu0;

    .line 26
    .line 27
    iget-object v3, p0, Ll/v4w0;->f:Ljava/lang/String;

    .line 28
    .line 29
    iget-object v4, p0, Ll/v4w0;->g:Ljava/lang/String;

    .line 30
    .line 31
    iget-object v5, p0, Ll/v4w0;->h:Landroid/os/Bundle;

    .line 32
    .line 33
    iget-boolean v6, p0, Ll/v4w0;->i:Z

    .line 34
    .line 35
    iget-boolean v7, p0, Ll/v4w0;->j:Z

    .line 36
    .line 37
    invoke-interface/range {v2 .. v9}, Ll/pgu0;->logEvent(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;ZZJ)V

    .line 38
    .line 39
    .line 40
    return-void
.end method
