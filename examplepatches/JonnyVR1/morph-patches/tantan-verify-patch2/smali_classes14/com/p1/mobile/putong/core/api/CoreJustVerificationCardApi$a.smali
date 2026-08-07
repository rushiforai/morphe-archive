.class public final Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/data/User;

.field public b:Lcom/p1/mobile/putong/core/data/SwipeDirection;

.field public c:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/SwipeDirection;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$a;->c:Z

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$a;->a:Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    iput-object p2, p0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$a;->b:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 10
    .line 11
    return-void
.end method
