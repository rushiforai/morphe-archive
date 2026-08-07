.class public final Ll/m2s0;
.super Ll/z4s0;
.source "SourceFile"


# instance fields
.field public final synthetic b:Landroid/content/Context;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ll/uws0;

.field public final synthetic e:Ll/s3s0;


# direct methods
.method public constructor <init>(Ll/s3s0;Landroid/content/Context;Ljava/lang/String;Ll/uws0;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/m2s0;->b:Landroid/content/Context;

    .line 2
    .line 3
    iput-object p3, p0, Ll/m2s0;->c:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p4, p0, Ll/m2s0;->d:Ll/uws0;

    .line 6
    .line 7
    iput-object p1, p0, Ll/m2s0;->e:Ll/s3s0;

    .line 8
    .line 9
    invoke-direct {p0}, Ll/z4s0;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final bridge synthetic a()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/m2s0;->b:Landroid/content/Context;

    .line 2
    .line 3
    const-string v0, "rewarded"

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/s3s0;->q(Landroid/content/Context;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance p0, Ll/k1w0;

    .line 9
    .line 10
    invoke-direct {p0}, Ll/k1w0;-><init>()V

    .line 11
    .line 12
    .line 13
    return-object p0
.end method

.method public final bridge synthetic b(Ll/tbt0;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/m2s0;->b:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Ll/h950;->Y2(Ljava/lang/Object;)Ll/p1m;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/m2s0;->c:Ljava/lang/String;

    .line 8
    .line 9
    iget-object p0, p0, Ll/m2s0;->d:Ll/uws0;

    .line 10
    .line 11
    const v2, 0xe52bf80

    .line 12
    .line 13
    .line 14
    invoke-interface {p1, v0, v1, p0, v2}, Ll/tbt0;->W2(Ll/p1m;Ljava/lang/String;Ll/uws0;I)Ll/l7t0;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public final bridge synthetic c()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/m2s0;->b:Landroid/content/Context;

    .line 2
    .line 3
    iget-object v1, p0, Ll/m2s0;->c:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p0, p0, Ll/m2s0;->d:Ll/uws0;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Ll/x7t0;->a(Landroid/content/Context;Ljava/lang/String;Ll/uws0;)Ll/l7t0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
