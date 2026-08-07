.class Lcom/momo/rtcbase/Predicate$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/rtcbase/Predicate;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/rtcbase/Predicate;->or(Lcom/momo/rtcbase/Predicate;)Lcom/momo/rtcbase/Predicate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/momo/rtcbase/Predicate<",
        "TT;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/rtcbase/Predicate;

.field final synthetic val$other:Lcom/momo/rtcbase/Predicate;


# direct methods
.method public constructor <init>(Lcom/momo/rtcbase/Predicate;Lcom/momo/rtcbase/Predicate;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/Predicate$1;->this$0:Lcom/momo/rtcbase/Predicate;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/momo/rtcbase/Predicate$1;->val$other:Lcom/momo/rtcbase/Predicate;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public test(Ljava/lang/Object;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/Predicate$1;->this$0:Lcom/momo/rtcbase/Predicate;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Lcom/momo/rtcbase/Predicate;->test(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object p0, p0, Lcom/momo/rtcbase/Predicate$1;->val$other:Lcom/momo/rtcbase/Predicate;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Lcom/momo/rtcbase/Predicate;->test(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 21
    return p0
.end method
