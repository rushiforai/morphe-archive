.class public final Ll/c9t0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/upx0;


# instance fields
.field public final a:Ll/kqx0;

.field public final b:Ll/kqx0;


# direct methods
.method public constructor <init>(Ll/kqx0;Ll/kqx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/c9t0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/c9t0;->b:Ll/kqx0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a()Ll/b9t0;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/c9t0;->a:Ll/kqx0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/google/android/gms/common/util/Clock;

    .line 8
    .line 9
    iget-object p0, p0, Ll/c9t0;->b:Ll/kqx0;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance v1, Ll/b9t0;

    .line 16
    .line 17
    check-cast p0, Ll/z8t0;

    .line 18
    .line 19
    invoke-direct {v1, v0, p0}, Ll/b9t0;-><init>(Lcom/google/android/gms/common/util/Clock;Ll/z8t0;)V

    .line 20
    .line 21
    .line 22
    return-object v1
.end method

.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/c9t0;->a()Ll/b9t0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
