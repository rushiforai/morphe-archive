.class Lcom/tantanapp/common/network/ObservableRunner$Batch;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/common/network/ObservableRunner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Batch"
.end annotation


# instance fields
.field final requests:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/tantanapp/common/network/ObservableRunner$Req;",
            ">;"
        }
    .end annotation
.end field

.field private final type:I


# direct methods
.method public constructor <init>(Lcom/tantanapp/common/network/ObservableRunner$Req;I)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/tantanapp/common/network/ObservableRunner$Batch;->requests:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    iput p2, p0, Lcom/tantanapp/common/network/ObservableRunner$Batch;->type:I

    .line 16
    .line 17
    return-void
.end method

.method public static synthetic access$000(Lcom/tantanapp/common/network/ObservableRunner$Batch;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantanapp/common/network/ObservableRunner$Batch;->type:I

    .line 2
    .line 3
    return p0
.end method
