.class public final synthetic Ll/dws0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vct0;


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
    iput-object p1, p0, Ll/dws0;->a:Ll/tct0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final zza()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/ads/zzbrm;

    .line 2
    .line 3
    const-string v1, "Cannot get Javascript Engine"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/ads/zzbrm;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/dws0;->a:Ll/tct0;

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/tct0;->c(Ljava/lang/Throwable;)Z

    .line 11
    .line 12
    .line 13
    return-void
.end method
