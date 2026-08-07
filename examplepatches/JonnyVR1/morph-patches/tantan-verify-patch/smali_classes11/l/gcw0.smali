.class public final synthetic Ll/gcw0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/jdu0;


# instance fields
.field public final synthetic a:Ll/mbw0;

.field public final synthetic b:Ljava/lang/Throwable;


# direct methods
.method public synthetic constructor <init>(Ll/mbw0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/gcw0;->a:Ll/mbw0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/gcw0;->b:Ljava/lang/Throwable;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gcw0;->a:Ll/mbw0;

    .line 2
    .line 3
    check-cast p1, Ll/mcw0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/mbw0;->a()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0}, Ll/mbw0;->b()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v1, Lcom/google/android/gms/internal/ads/zzflg;

    .line 14
    .line 15
    iget-object p0, p0, Ll/gcw0;->b:Ljava/lang/Throwable;

    .line 16
    .line 17
    invoke-interface {p1, v1, v0, p0}, Ll/mcw0;->D(Lcom/google/android/gms/internal/ads/zzflg;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
