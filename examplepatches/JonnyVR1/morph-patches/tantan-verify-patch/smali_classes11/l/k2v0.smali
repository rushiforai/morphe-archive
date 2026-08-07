.class public final Ll/k2v0;
.super Ll/zyu0$a;
.source "SourceFile"


# instance fields
.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Ljava/lang/String;

.field public final synthetic g:Ljava/lang/Object;

.field public final synthetic h:Z

.field public final synthetic i:Ll/zyu0;


# direct methods
.method public constructor <init>(Ll/zyu0;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Z)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/k2v0;->e:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p3, p0, Ll/k2v0;->f:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p4, p0, Ll/k2v0;->g:Ljava/lang/Object;

    .line 6
    .line 7
    iput-boolean p5, p0, Ll/k2v0;->h:Z

    .line 8
    .line 9
    iput-object p1, p0, Ll/k2v0;->i:Ll/zyu0;

    .line 10
    .line 11
    invoke-direct {p0, p1}, Ll/zyu0$a;-><init>(Ll/zyu0;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/k2v0;->i:Ll/zyu0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/zyu0;->h(Ll/zyu0;)Ll/pgu0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    move-object v1, v0

    .line 12
    check-cast v1, Ll/pgu0;

    .line 13
    .line 14
    iget-object v2, p0, Ll/k2v0;->e:Ljava/lang/String;

    .line 15
    .line 16
    iget-object v3, p0, Ll/k2v0;->f:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v0, p0, Ll/k2v0;->g:Ljava/lang/Object;

    .line 19
    .line 20
    invoke-static {v0}, Ll/h950;->Y2(Ljava/lang/Object;)Ll/p1m;

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    iget-boolean v5, p0, Ll/k2v0;->h:Z

    .line 25
    .line 26
    iget-wide v6, p0, Ll/zyu0$a;->a:J

    .line 27
    .line 28
    invoke-interface/range {v1 .. v7}, Ll/pgu0;->setUserProperty(Ljava/lang/String;Ljava/lang/String;Ll/p1m;ZJ)V

    .line 29
    .line 30
    .line 31
    return-void
.end method
