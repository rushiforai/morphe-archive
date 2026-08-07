.class public final Ll/wfw0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/nhw0;

.field public final b:Ljava/lang/String;

.field public final c:Lcom/google/android/gms/internal/ads/zzfok;

.field public final d:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/view/View;Lcom/google/android/gms/internal/ads/zzfok;Ljava/lang/String;)V
    .locals 0
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance p3, Ll/nhw0;

    .line 5
    .line 6
    invoke-direct {p3, p1}, Ll/nhw0;-><init>(Landroid/view/View;)V

    .line 7
    .line 8
    .line 9
    iput-object p3, p0, Ll/wfw0;->a:Ll/nhw0;

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, Ll/wfw0;->b:Ljava/lang/String;

    .line 20
    .line 21
    iput-object p2, p0, Ll/wfw0;->c:Lcom/google/android/gms/internal/ads/zzfok;

    .line 22
    .line 23
    const-string p1, "Ad overlay"

    .line 24
    .line 25
    iput-object p1, p0, Ll/wfw0;->d:Ljava/lang/String;

    .line 26
    .line 27
    return-void
.end method


# virtual methods
.method public final a()Lcom/google/android/gms/internal/ads/zzfok;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wfw0;->c:Lcom/google/android/gms/internal/ads/zzfok;

    .line 2
    .line 3
    return-object p0
.end method

.method public final b()Ll/nhw0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wfw0;->a:Ll/nhw0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wfw0;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wfw0;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
