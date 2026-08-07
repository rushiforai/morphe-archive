.class public final Ll/xdy0;
.super Ll/c4u0;
.source "SourceFile"


# instance fields
.field public final synthetic a:Ll/jhy0;


# direct methods
.method public constructor <init>(Ll/jhy0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xdy0;->a:Ll/jhy0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/c4u0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final S2(Lcom/google/android/gms/common/api/Status;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/xdy0;->a:Ll/jhy0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/api/internal/BasePendingResult;->setResult(Lcom/google/android/gms/common/api/Result;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
