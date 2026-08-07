.class public final synthetic Lcom/google/android/libraries/places/internal/zzfe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/yo50;


# instance fields
.field public final synthetic zza:Ll/lkm;


# direct methods
.method public synthetic constructor <init>(Ll/lkm;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzfe;->zza:Ll/lkm;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onCanceled()V
    .locals 0

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzfe;->zza:Ll/lkm;

    invoke-virtual {p0}, Ll/lkm;->cancel()V

    return-void
.end method
