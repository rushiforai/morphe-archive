.class final Lcn/shuzilm/core/AIClient$AI;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/IInterface;


# instance fields
.field final synthetic a:Lcn/shuzilm/core/AIClient;

.field private b:Landroid/os/IBinder;

.field private c:Ljava/lang/String;

.field private d:I


# direct methods
.method public constructor <init>(Lcn/shuzilm/core/AIClient;Landroid/os/IBinder;Ljava/lang/String;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcn/shuzilm/core/AIClient$AI;->a:Lcn/shuzilm/core/AIClient;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcn/shuzilm/core/AIClient$AI;->b:Landroid/os/IBinder;

    .line 7
    .line 8
    iput-object p3, p0, Lcn/shuzilm/core/AIClient$AI;->c:Ljava/lang/String;

    .line 9
    .line 10
    iput p4, p0, Lcn/shuzilm/core/AIClient$AI;->d:I

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcn/shuzilm/core/AIClient$AI;->b:Landroid/os/IBinder;

    .line 2
    .line 3
    return-object p0
.end method

.method public getId()Ljava/lang/String;
    .locals 5

    .line 1
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const/4 v2, 0x0

    .line 10
    :try_start_0
    iget-object v3, p0, Lcn/shuzilm/core/AIClient$AI;->c:Ljava/lang/String;

    .line 11
    .line 12
    if-eqz v3, :cond_1

    .line 13
    .line 14
    iget v4, p0, Lcn/shuzilm/core/AIClient$AI;->d:I

    .line 15
    .line 16
    if-gez v4, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    invoke-virtual {v0, v3}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object v3, p0, Lcn/shuzilm/core/AIClient$AI;->b:Landroid/os/IBinder;

    .line 23
    .line 24
    iget p0, p0, Lcn/shuzilm/core/AIClient$AI;->d:I

    .line 25
    .line 26
    const/4 v4, 0x0

    .line 27
    invoke-interface {v3, p0, v0, v1, v4}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 28
    .line 29
    .line 30
    invoke-virtual {v1}, Landroid/os/Parcel;->readException()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    goto :goto_1

    .line 38
    :cond_1
    :goto_0
    return-object v2

    .line 39
    :catchall_0
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 43
    .line 44
    .line 45
    :goto_1
    invoke-virtual {v1}, Landroid/os/Parcel;->recycle()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 49
    .line 50
    .line 51
    return-object v2
.end method
