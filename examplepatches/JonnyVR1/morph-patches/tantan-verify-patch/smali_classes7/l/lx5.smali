.class public final Ll/lx5;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/kmc0;


# direct methods
.method public constructor <init>()V
    .locals 4

    const-wide/16 v0, 0x5

    .line 12
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    const/4 v3, 0x5

    invoke-direct {p0, v3, v0, v1, v2}, Ll/lx5;-><init>(IJLjava/util/concurrent/TimeUnit;)V

    return-void
.end method

.method public constructor <init>(IJLjava/util/concurrent/TimeUnit;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/kmc0;

    .line 5
    .line 6
    invoke-direct {v0, p1, p2, p3, p4}, Ll/kmc0;-><init>(IJLjava/util/concurrent/TimeUnit;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/lx5;->a:Ll/kmc0;

    .line 10
    .line 11
    return-void
.end method
