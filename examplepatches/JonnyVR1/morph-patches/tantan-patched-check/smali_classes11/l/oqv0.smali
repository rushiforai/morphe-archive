.class public final Ll/oqv0;
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
    iput-object p1, p0, Ll/oqv0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/oqv0;->b:Ll/kqx0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/oqv0;->a:Ll/kqx0;

    .line 2
    .line 3
    check-cast v0, Ll/evv0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/evv0;->a()Ll/dvv0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Ll/oqv0;->b:Ll/kqx0;

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
    new-instance v1, Ll/ypv0;

    .line 18
    .line 19
    sget-object v2, Ll/ois0;->a:Ll/kis0;

    .line 20
    .line 21
    invoke-virtual {v2}, Ll/kis0;->e()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    check-cast v2, Ljava/lang/Long;

    .line 26
    .line 27
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 28
    .line 29
    .line 30
    move-result-wide v2

    .line 31
    invoke-direct {v1, v0, v2, v3, p0}, Ll/ypv0;-><init>(Ll/wuv0;JLcom/google/android/gms/common/util/Clock;)V

    .line 32
    .line 33
    .line 34
    return-object v1
.end method
