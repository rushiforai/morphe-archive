.class public final Ll/z6v0;
.super Ll/z3t0;
.source "SourceFile"


# instance fields
.field public final synthetic a:Ll/a7v0;


# direct methods
.method public constructor <init>(Ll/a7v0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/z6v0;->a:Ll/a7v0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/z3t0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final W(Lcom/google/android/gms/ads/internal/util/zzbb;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z6v0;->a:Ll/a7v0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/a7v0;->a:Ll/tct0;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/google/android/gms/ads/internal/util/zzbb;->F()Lcom/google/android/gms/ads/internal/util/zzba;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Ll/tct0;->c(Ljava/lang/Throwable;)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final a0(Landroid/os/ParcelFileDescriptor;)V
    .locals 1

    .line 1
    new-instance v0, Landroid/os/ParcelFileDescriptor$AutoCloseInputStream;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Landroid/os/ParcelFileDescriptor$AutoCloseInputStream;-><init>(Landroid/os/ParcelFileDescriptor;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/z6v0;->a:Ll/a7v0;

    .line 7
    .line 8
    iget-object p0, p0, Ll/a7v0;->a:Ll/tct0;

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/tct0;->b(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    return-void
.end method
