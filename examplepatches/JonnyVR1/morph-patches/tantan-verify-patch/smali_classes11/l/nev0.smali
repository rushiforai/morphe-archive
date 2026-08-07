.class public final synthetic Ll/nev0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wiu0;


# instance fields
.field public final synthetic a:Ll/tct0;


# direct methods
.method public synthetic constructor <init>(Ll/tct0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/nev0;->a:Ll/tct0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(ZLandroid/content/Context;Ll/c7u0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nev0;->a:Ll/tct0;

    .line 2
    .line 3
    :try_start_0
    invoke-static {}, Ll/bxy0;->k()Ll/ghy0;

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/tct0;->get()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 11
    .line 12
    const/4 p1, 0x1

    .line 13
    invoke-static {p2, p0, p1}, Ll/ghy0;->a(Landroid/content/Context;Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    .line 16
    :catch_0
    return-void
.end method
