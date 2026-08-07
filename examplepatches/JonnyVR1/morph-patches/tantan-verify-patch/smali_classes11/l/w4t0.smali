.class public final Ll/w4t0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:J

.field public final b:Ll/u4t0;


# direct methods
.method public constructor <init>(Ll/x4t0;Ll/u4t0;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/bxy0;->b()Lcom/google/android/gms/common/util/Clock;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-interface {p1}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    iput-wide v0, p0, Ll/w4t0;->a:J

    .line 13
    .line 14
    iput-object p2, p0, Ll/w4t0;->b:Ll/u4t0;

    .line 15
    .line 16
    return-void
.end method
