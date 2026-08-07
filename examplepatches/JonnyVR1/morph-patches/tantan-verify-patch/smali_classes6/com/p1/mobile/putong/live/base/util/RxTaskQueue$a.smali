.class public Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/util/RxTaskQueue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a<",
        "*>;>;"
    }
.end annotation


# instance fields
.field public a:Ll/vrd0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/vrd0<",
            "TR;>;"
        }
    .end annotation
.end field

.field public b:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "-TR;>;"
        }
    .end annotation
.end field

.field public c:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ll/zrd0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a;)I
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a<",
            "*>;)I"
        }
    .end annotation

    .line 1
    iget p1, p1, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a;->c:I

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a;->c:I

    .line 4
    .line 5
    sub-int/2addr p1, p0

    .line 6
    return p1
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a;->a(Lcom/p1/mobile/putong/live/base/util/RxTaskQueue$a;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
