.class public final synthetic Ll/s3z0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/g5z0;


# instance fields
.field public final synthetic a:Ll/h4z0;


# direct methods
.method public synthetic constructor <init>(Ll/h4z0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/s3z0;->a:Ll/h4z0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(ILl/t2u0;[I)Ljava/util/List;
    .locals 8

    .line 1
    sget-object v0, Ll/l5z0;->k:Lcom/google/android/gms/internal/ads/c3;

    .line 2
    .line 3
    new-instance v0, Ll/mqw0;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/mqw0;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    move v5, v1

    .line 10
    :goto_0
    iget v1, p2, Ll/t2u0;->a:I

    .line 11
    .line 12
    if-gtz v5, :cond_0

    .line 13
    .line 14
    iget-object v6, p0, Ll/s3z0;->a:Ll/h4z0;

    .line 15
    .line 16
    new-instance v2, Ll/b4z0;

    .line 17
    .line 18
    aget v7, p3, v5

    .line 19
    .line 20
    move v3, p1

    .line 21
    move-object v4, p2

    .line 22
    invoke-direct/range {v2 .. v7}, Ll/b4z0;-><init>(ILl/t2u0;ILl/h4z0;I)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v2}, Ll/mqw0;->g(Ljava/lang/Object;)Ll/mqw0;

    .line 26
    .line 27
    .line 28
    add-int/lit8 v5, v5, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    invoke-virtual {v0}, Ll/mqw0;->j()Lcom/google/android/gms/internal/ads/zzgaa;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method
