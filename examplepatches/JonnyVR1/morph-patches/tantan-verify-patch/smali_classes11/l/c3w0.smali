.class public final Ll/c3w0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lvw0;


# direct methods
.method public constructor <init>(Ll/e3w0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const-string p0, "Notification of cache hit failed."

    .line 2
    .line 3
    invoke-static {p0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic zzb(Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation runtime Lorg/checkerframework/checker/nullness/compatqual/NullableDecl;
        .end annotation
    .end param

    .line 1
    check-cast p1, Ljava/lang/Void;

    .line 2
    .line 3
    const-string p0, "Notification of cache hit successful."

    .line 4
    .line 5
    invoke-static {p0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
