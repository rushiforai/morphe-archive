.class public final Ll/fnu0;
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
    iput-object p1, p0, Ll/fnu0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/fnu0;->b:Ll/kqx0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fnu0;->a:Ll/kqx0;

    .line 2
    .line 3
    check-cast v0, Ll/rku0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/rku0;->a()Ll/qru0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Ll/fnu0;->b:Ll/kqx0;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/google/android/gms/common/util/Clock;

    .line 16
    .line 17
    new-instance v1, Ll/enu0;

    .line 18
    .line 19
    invoke-direct {v1, v0, p0}, Ll/enu0;-><init>(Ll/qru0;Lcom/google/android/gms/common/util/Clock;)V

    .line 20
    .line 21
    .line 22
    return-object v1
.end method
