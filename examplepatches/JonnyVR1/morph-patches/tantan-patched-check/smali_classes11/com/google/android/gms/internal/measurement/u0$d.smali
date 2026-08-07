.class public abstract Lcom/google/android/gms/internal/measurement/u0$d;
.super Lcom/google/android/gms/internal/measurement/u0;
.source "SourceFile"

# interfaces
.implements Ll/v9y0;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/measurement/u0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "d"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<MessageType:",
        "Lcom/google/android/gms/internal/measurement/u0$d<",
        "TMessageType;TBuilderType;>;BuilderType:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/android/gms/internal/measurement/u0<",
        "TMessageType;TBuilderType;>;",
        "Ll/v9y0;"
    }
.end annotation


# instance fields
.field protected zzc:Ll/v0y0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/v0y0<",
            "Lcom/google/android/gms/internal/measurement/u0$c;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/measurement/u0;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/v0y0;->i()Ll/v0y0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/google/android/gms/internal/measurement/u0$d;->zzc:Ll/v0y0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final B()Ll/v0y0;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v0y0<",
            "Lcom/google/android/gms/internal/measurement/u0$c;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/gms/internal/measurement/u0$d;->zzc:Ll/v0y0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/v0y0;->r()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/google/android/gms/internal/measurement/u0$d;->zzc:Ll/v0y0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/v0y0;->clone()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ll/v0y0;

    .line 16
    .line 17
    iput-object v0, p0, Lcom/google/android/gms/internal/measurement/u0$d;->zzc:Ll/v0y0;

    .line 18
    .line 19
    :cond_0
    iget-object p0, p0, Lcom/google/android/gms/internal/measurement/u0$d;->zzc:Ll/v0y0;

    .line 20
    .line 21
    return-object p0
.end method
