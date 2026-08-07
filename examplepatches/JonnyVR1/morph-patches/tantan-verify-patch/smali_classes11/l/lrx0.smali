.class public final synthetic Ll/lrx0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public synthetic a:Lcom/google/android/gms/measurement/internal/e;

.field public synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/gms/measurement/internal/e;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/lrx0;->a:Lcom/google/android/gms/measurement/internal/e;

    .line 5
    .line 6
    iput-object p2, p0, Ll/lrx0;->b:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/lrx0;->a:Lcom/google/android/gms/measurement/internal/e;

    .line 2
    .line 3
    iget-object p0, p0, Ll/lrx0;->b:Ljava/lang/String;

    .line 4
    .line 5
    new-instance v1, Ll/ody0;

    .line 6
    .line 7
    new-instance v2, Ll/wrx0;

    .line 8
    .line 9
    invoke-direct {v2, v0, p0}, Ll/wrx0;-><init>(Lcom/google/android/gms/measurement/internal/e;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const-string p0, "internal.remoteConfig"

    .line 13
    .line 14
    invoke-direct {v1, p0, v2}, Ll/ody0;-><init>(Ljava/lang/String;Ll/pky0;)V

    .line 15
    .line 16
    .line 17
    return-object v1
.end method
