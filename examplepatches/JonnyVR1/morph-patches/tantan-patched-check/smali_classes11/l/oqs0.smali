.class public final Ll/oqs0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pqs0;


# instance fields
.field public final synthetic a:Ll/tct0;


# direct methods
.method public constructor <init>(Ll/qqs0;Ll/tct0;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/oqs0;->a:Ll/tct0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oqs0;->a:Ll/tct0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/tct0;->b(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final zza(Ljava/lang/String;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/ads/zzbrm;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/ads/zzbrm;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/oqs0;->a:Ll/tct0;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/tct0;->c(Ljava/lang/Throwable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method
