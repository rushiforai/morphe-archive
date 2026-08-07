.class public final synthetic Ll/cpu0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xuw0;


# instance fields
.field public final synthetic a:Ll/hpr;


# direct methods
.method public synthetic constructor <init>(Ll/hpr;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/cpu0;->a:Ll/hpr;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/Object;)Ll/hpr;
    .locals 1

    .line 1
    check-cast p1, Ll/wit0;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/cpu0;->a:Ll/hpr;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    new-instance p0, Lcom/google/android/gms/internal/ads/zzeml;

    .line 9
    .line 10
    const/4 p1, 0x1

    .line 11
    const-string v0, "Retrieve Web View from image ad response failed."

    .line 12
    .line 13
    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/ads/zzeml;-><init>(ILjava/lang/String;)V

    .line 14
    .line 15
    .line 16
    throw p0
.end method
