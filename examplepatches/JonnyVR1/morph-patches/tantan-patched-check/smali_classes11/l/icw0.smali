.class public final synthetic Ll/icw0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/jdu0;


# instance fields
.field public final synthetic a:Ll/mbw0;


# direct methods
.method public synthetic constructor <init>(Ll/mbw0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/icw0;->a:Ll/mbw0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/icw0;->a:Ll/mbw0;

    .line 2
    .line 3
    check-cast p1, Ll/mcw0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/mbw0;->a()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/mbw0;->b()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast v0, Lcom/google/android/gms/internal/ads/zzflg;

    .line 14
    .line 15
    invoke-interface {p1, v0, p0}, Ll/mcw0;->z(Lcom/google/android/gms/internal/ads/zzflg;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
