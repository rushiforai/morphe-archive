.class public final synthetic Ll/ddt0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/yo50;


# instance fields
.field public final synthetic a:Lcom/google/android/gms/common/internal/ICancelToken;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/gms/common/internal/ICancelToken;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ddt0;->a:Lcom/google/android/gms/common/internal/ICancelToken;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onCanceled()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ddt0;->a:Lcom/google/android/gms/common/internal/ICancelToken;

    .line 2
    .line 3
    sget v0, Ll/f5u0;->d:I

    .line 4
    .line 5
    :try_start_0
    invoke-interface {p0}, Lcom/google/android/gms/common/internal/ICancelToken;->cancel()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    :catch_0
    return-void
.end method
