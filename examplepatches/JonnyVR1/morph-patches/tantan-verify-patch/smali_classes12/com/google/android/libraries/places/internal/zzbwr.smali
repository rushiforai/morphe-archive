.class final Lcom/google/android/libraries/places/internal/zzbwr;
.super Lcom/google/android/libraries/places/internal/zzbvz;
.source "SourceFile"


# instance fields
.field private final zzd:Ljava/net/Socket;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/net/Socket;)V
    .locals 0
    .param p1    # Ljava/net/Socket;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzbvz;-><init>()V

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbwr;->zzd:Ljava/net/Socket;

    return-void
.end method
