.class public final Ll/jqv0;
.super Ll/zyu0$a;
.source "SourceFile"


# instance fields
.field public final synthetic e:I

.field public final synthetic f:Ljava/lang/String;

.field public final synthetic g:Ljava/lang/Object;

.field public final synthetic h:Ljava/lang/Object;

.field public final synthetic i:Ljava/lang/Object;

.field public final synthetic j:Ll/zyu0;


# direct methods
.method public constructor <init>(Ll/zyu0;ZILjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    const/4 p2, 0x5

    .line 2
    iput p2, p0, Ll/jqv0;->e:I

    .line 3
    .line 4
    iput-object p4, p0, Ll/jqv0;->f:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p5, p0, Ll/jqv0;->g:Ljava/lang/Object;

    .line 7
    .line 8
    const/4 p2, 0x0

    .line 9
    iput-object p2, p0, Ll/jqv0;->h:Ljava/lang/Object;

    .line 10
    .line 11
    iput-object p2, p0, Ll/jqv0;->i:Ljava/lang/Object;

    .line 12
    .line 13
    iput-object p1, p0, Ll/jqv0;->j:Ll/zyu0;

    .line 14
    .line 15
    const/4 p2, 0x0

    .line 16
    invoke-direct {p0, p1, p2}, Ll/zyu0$a;-><init>(Ll/zyu0;Z)V

    .line 17
    .line 18
    .line 19
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
    iget-object v0, p0, Ll/jqv0;->j:Ll/zyu0;

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
    iget v2, p0, Ll/jqv0;->e:I

    .line 15
    .line 16
    iget-object v3, p0, Ll/jqv0;->f:Ljava/lang/String;

    .line 17
    .line 18
    iget-object p0, p0, Ll/jqv0;->g:Ljava/lang/Object;

    .line 19
    .line 20
    invoke-static {p0}, Ll/h950;->Y2(Ljava/lang/Object;)Ll/p1m;

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    const/4 p0, 0x0

    .line 25
    invoke-static {p0}, Ll/h950;->Y2(Ljava/lang/Object;)Ll/p1m;

    .line 26
    .line 27
    .line 28
    move-result-object v5

    .line 29
    invoke-static {p0}, Ll/h950;->Y2(Ljava/lang/Object;)Ll/p1m;

    .line 30
    .line 31
    .line 32
    move-result-object v6

    .line 33
    invoke-interface/range {v1 .. v6}, Ll/pgu0;->logHealthData(ILjava/lang/String;Ll/p1m;Ll/p1m;Ll/p1m;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method
