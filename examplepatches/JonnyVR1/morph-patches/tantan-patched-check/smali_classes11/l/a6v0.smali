.class public final Ll/a6v0;
.super Ll/zyu0$a;
.source "SourceFile"


# instance fields
.field public final synthetic e:Landroid/app/Activity;

.field public final synthetic f:Ljava/lang/String;

.field public final synthetic g:Ljava/lang/String;

.field public final synthetic h:Ll/zyu0;


# direct methods
.method public constructor <init>(Ll/zyu0;Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/a6v0;->e:Landroid/app/Activity;

    .line 2
    .line 3
    iput-object p3, p0, Ll/a6v0;->f:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p4, p0, Ll/a6v0;->g:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p1, p0, Ll/a6v0;->h:Ll/zyu0;

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
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/a6v0;->h:Ll/zyu0;

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
    iget-object v0, p0, Ll/a6v0;->e:Landroid/app/Activity;

    .line 15
    .line 16
    invoke-static {v0}, Ll/h950;->Y2(Ljava/lang/Object;)Ll/p1m;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    iget-object v3, p0, Ll/a6v0;->f:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v4, p0, Ll/a6v0;->g:Ljava/lang/String;

    .line 23
    .line 24
    iget-wide v5, p0, Ll/zyu0$a;->a:J

    .line 25
    .line 26
    invoke-interface/range {v1 .. v6}, Ll/pgu0;->setCurrentScreen(Ll/p1m;Ljava/lang/String;Ljava/lang/String;J)V

    .line 27
    .line 28
    .line 29
    return-void
.end method
