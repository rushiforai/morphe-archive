.class public final synthetic Ll/lgs0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/common/api/internal/RemoteCall;


# instance fields
.field public final synthetic a:Landroid/app/PendingIntent;


# direct methods
.method public synthetic constructor <init>(Landroid/app/PendingIntent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/lgs0;->a:Landroid/app/PendingIntent;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/lgs0;->a:Landroid/app/PendingIntent;

    .line 2
    .line 3
    check-cast p1, Ll/f5u0;

    .line 4
    .line 5
    check-cast p2, Ll/sni0;

    .line 6
    .line 7
    sget-object v0, Ll/vrs0;->a:Lcom/google/android/gms/common/api/Api$ClientKey;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p1, p0, p2, v0}, Ll/f5u0;->f(Landroid/app/PendingIntent;Ll/sni0;Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
