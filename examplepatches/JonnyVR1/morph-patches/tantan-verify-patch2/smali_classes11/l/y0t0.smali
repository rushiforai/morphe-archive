.class public final synthetic Ll/y0t0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/common/api/internal/RemoteCall;


# instance fields
.field public final synthetic a:Lcom/google/android/gms/location/GeofencingRequest;

.field public final synthetic b:Landroid/app/PendingIntent;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/gms/location/GeofencingRequest;Landroid/app/PendingIntent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/y0t0;->a:Lcom/google/android/gms/location/GeofencingRequest;

    .line 5
    .line 6
    iput-object p2, p0, Ll/y0t0;->b:Landroid/app/PendingIntent;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/y0t0;->a:Lcom/google/android/gms/location/GeofencingRequest;

    .line 2
    .line 3
    iget-object p0, p0, Ll/y0t0;->b:Landroid/app/PendingIntent;

    .line 4
    .line 5
    check-cast p1, Ll/f5u0;

    .line 6
    .line 7
    check-cast p2, Ll/sni0;

    .line 8
    .line 9
    invoke-virtual {p1, v0, p0, p2}, Ll/f5u0;->i(Lcom/google/android/gms/location/GeofencingRequest;Landroid/app/PendingIntent;Ll/sni0;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
