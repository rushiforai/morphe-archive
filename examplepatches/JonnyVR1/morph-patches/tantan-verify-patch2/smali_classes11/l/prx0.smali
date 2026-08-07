.class public final Ll/prx0;
.super Ll/xgw;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/xgw<",
        "Ljava/lang/String;",
        "Ll/g9s0;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic i:Lcom/google/android/gms/measurement/internal/e;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/measurement/internal/e;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/prx0;->i:Lcom/google/android/gms/measurement/internal/e;

    .line 2
    .line 3
    const/16 p1, 0x14

    .line 4
    .line 5
    invoke-direct {p0, p1}, Ll/xgw;-><init>(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final synthetic a(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/prx0;->i:Lcom/google/android/gms/measurement/internal/e;

    .line 7
    .line 8
    invoke-static {p0, p1}, Lcom/google/android/gms/measurement/internal/e;->y(Lcom/google/android/gms/measurement/internal/e;Ljava/lang/String;)Ll/g9s0;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method
