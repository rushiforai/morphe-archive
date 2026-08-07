.class public final synthetic Ll/q4z0;
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
    iput-object p1, p0, Ll/q4z0;->a:Landroid/app/PendingIntent;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/q4z0;->a:Landroid/app/PendingIntent;

    .line 2
    .line 3
    check-cast p1, Ll/yxv0;

    .line 4
    .line 5
    check-cast p2, Ll/sni0;

    .line 6
    .line 7
    sget-object v0, Ll/gjr0;->a:Lcom/google/android/gms/common/api/Api$ClientKey;

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Ll/yxv0;->c(Landroid/app/PendingIntent;)V

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    invoke-virtual {p2, p0}, Ll/sni0;->c(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
