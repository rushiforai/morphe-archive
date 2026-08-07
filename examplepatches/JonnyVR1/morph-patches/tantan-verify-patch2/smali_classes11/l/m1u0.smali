.class public final Ll/m1u0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/common/api/internal/ListenerHolder$Notifier;


# instance fields
.field public final synthetic a:Ll/u2u0;


# direct methods
.method public constructor <init>(Ll/u2u0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/m1u0;->a:Ll/u2u0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final bridge synthetic notifyListener(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/google/android/gms/location/LocationListener;

    .line 2
    .line 3
    iget-object p0, p0, Ll/m1u0;->a:Ll/u2u0;

    .line 4
    .line 5
    invoke-static {p0}, Ll/u2u0;->O(Ll/u2u0;)Ll/utt0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Ll/utt0;->zzb()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final onNotifyListenerFailed()V
    .locals 0

    .line 1
    return-void
.end method
