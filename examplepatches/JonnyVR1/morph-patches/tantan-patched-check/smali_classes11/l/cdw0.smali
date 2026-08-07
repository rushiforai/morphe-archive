.class public final Ll/cdw0;
.super Ll/zyu0$a;
.source "SourceFile"


# instance fields
.field public final synthetic e:Landroid/app/Activity;

.field public final synthetic f:Ll/xhu0;

.field public final synthetic g:Ll/zyu0$d;


# direct methods
.method public constructor <init>(Ll/zyu0$d;Landroid/app/Activity;Ll/xhu0;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/cdw0;->e:Landroid/app/Activity;

    .line 2
    .line 3
    iput-object p3, p0, Ll/cdw0;->f:Ll/xhu0;

    .line 4
    .line 5
    iput-object p1, p0, Ll/cdw0;->g:Ll/zyu0$d;

    .line 6
    .line 7
    iget-object p1, p1, Ll/zyu0$d;->a:Ll/zyu0;

    .line 8
    .line 9
    invoke-direct {p0, p1}, Ll/zyu0$a;-><init>(Ll/zyu0;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/cdw0;->g:Ll/zyu0$d;

    .line 2
    .line 3
    iget-object v0, v0, Ll/zyu0$d;->a:Ll/zyu0;

    .line 4
    .line 5
    invoke-static {v0}, Ll/zyu0;->h(Ll/zyu0;)Ll/pgu0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ll/pgu0;

    .line 14
    .line 15
    iget-object v1, p0, Ll/cdw0;->e:Landroid/app/Activity;

    .line 16
    .line 17
    invoke-static {v1}, Ll/h950;->Y2(Ljava/lang/Object;)Ll/p1m;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget-object v2, p0, Ll/cdw0;->f:Ll/xhu0;

    .line 22
    .line 23
    iget-wide v3, p0, Ll/zyu0$a;->b:J

    .line 24
    .line 25
    invoke-interface {v0, v1, v2, v3, v4}, Ll/pgu0;->onActivitySaveInstanceState(Ll/p1m;Ll/wmu0;J)V

    .line 26
    .line 27
    .line 28
    return-void
.end method
