.class public Ll/i900$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/i900;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public a:I

.field public b:Landroid/view/View;

.field public c:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic d:Ll/i900;


# direct methods
.method public constructor <init>(Ll/i900;ILandroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/i900$b;->d:Ll/i900;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput p2, p0, Ll/i900$b;->a:I

    .line 7
    .line 8
    iput-object p3, p0, Ll/i900$b;->b:Landroid/view/View;

    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Message;->new_()Lcom/p1/mobile/putong/core/data/Message;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Ll/i900$b;->c:Lcom/p1/mobile/putong/core/data/Message;

    .line 15
    .line 16
    if-lez p2, :cond_0

    .line 17
    .line 18
    neg-int p0, p2

    .line 19
    int-to-long p2, p0

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    int-to-long p2, p2

    .line 22
    :goto_0
    iput-wide p2, p1, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 23
    .line 24
    const-wide/high16 p2, -0x4010000000000000L    # -1.0

    .line 25
    .line 26
    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 27
    .line 28
    return-void
.end method
