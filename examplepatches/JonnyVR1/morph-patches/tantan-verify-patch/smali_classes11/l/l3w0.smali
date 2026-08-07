.class public final Ll/l3w0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/eow0;


# instance fields
.field public final synthetic a:Ll/o3w0;


# direct methods
.method public constructor <init>(Ll/o3w0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/l3w0;->a:Ll/o3w0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final bridge synthetic apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p1    # Ljava/lang/Object;
        .annotation runtime Lorg/checkerframework/checker/nullness/compatqual/NullableDecl;
        .end annotation
    .end param
    .annotation runtime Lorg/checkerframework/checker/nullness/compatqual/NullableDecl;
    .end annotation

    .line 1
    check-cast p1, Lcom/google/android/gms/internal/ads/zzbze;

    .line 2
    .line 3
    new-instance v0, Ll/n3w0;

    .line 4
    .line 5
    new-instance v1, Ll/x9w0;

    .line 6
    .line 7
    iget-object v2, p1, Lcom/google/android/gms/internal/ads/zzbze;->zzj:Ljava/lang/String;

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ll/x9w0;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-direct {v0, p1, v1, v2}, Ll/n3w0;-><init>(Lcom/google/android/gms/internal/ads/zzbze;Ll/v9w0;Ll/m3w0;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Ll/l3w0;->a:Ll/o3w0;

    .line 17
    .line 18
    invoke-static {p1, v0}, Ll/o3w0;->d(Ll/o3w0;Ll/n3w0;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Ll/l3w0;->a:Ll/o3w0;

    .line 22
    .line 23
    invoke-static {p0}, Ll/o3w0;->a(Ll/o3w0;)Ll/n3w0;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method
