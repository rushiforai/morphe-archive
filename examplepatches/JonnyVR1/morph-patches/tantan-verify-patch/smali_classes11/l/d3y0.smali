.class public final Ll/d3y0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Executor;


# instance fields
.field public final synthetic a:Lcom/google/android/gms/measurement/internal/g;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/measurement/internal/g;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/d3y0;->a:Lcom/google/android/gms/measurement/internal/g;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final execute(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d3y0;->a:Lcom/google/android/gms/measurement/internal/g;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/yyx0;->zzl()Ll/qsx0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Ll/qsx0;->w(Ljava/lang/Runnable;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
