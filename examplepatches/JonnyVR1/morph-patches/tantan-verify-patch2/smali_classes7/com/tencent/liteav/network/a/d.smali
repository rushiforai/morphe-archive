.class public final Lcom/tencent/liteav/network/a/d;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/liteav/network/a/d$a;
    }
.end annotation


# static fields
.field public static final a:Lcom/tencent/liteav/network/a/d;

.field public static final b:Lcom/tencent/liteav/network/a/d;


# instance fields
.field public final c:I

.field public final d:Lcom/tencent/liteav/network/a/d$a;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/tencent/liteav/network/a/d;

    .line 2
    .line 3
    sget-object v1, Lcom/tencent/liteav/network/a/d$a;->a:Lcom/tencent/liteav/network/a/d$a;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lcom/tencent/liteav/network/a/d;-><init>(Lcom/tencent/liteav/network/a/d$a;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/tencent/liteav/network/a/d;->a:Lcom/tencent/liteav/network/a/d;

    .line 10
    .line 11
    new-instance v0, Lcom/tencent/liteav/network/a/d;

    .line 12
    .line 13
    sget-object v1, Lcom/tencent/liteav/network/a/d$a;->b:Lcom/tencent/liteav/network/a/d$a;

    .line 14
    .line 15
    invoke-direct {v0, v1, v2}, Lcom/tencent/liteav/network/a/d;-><init>(Lcom/tencent/liteav/network/a/d$a;I)V

    .line 16
    .line 17
    .line 18
    sput-object v0, Lcom/tencent/liteav/network/a/d;->b:Lcom/tencent/liteav/network/a/d;

    .line 19
    .line 20
    return-void
.end method

.method public constructor <init>(Lcom/tencent/liteav/network/a/d$a;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tencent/liteav/network/a/d;->d:Lcom/tencent/liteav/network/a/d$a;

    .line 5
    .line 6
    iput p2, p0, Lcom/tencent/liteav/network/a/d;->c:I

    .line 7
    .line 8
    return-void
.end method
