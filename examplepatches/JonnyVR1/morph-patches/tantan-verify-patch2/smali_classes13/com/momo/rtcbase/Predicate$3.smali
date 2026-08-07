.class Lcom/momo/rtcbase/Predicate$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/rtcbase/Predicate;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/rtcbase/Predicate;->negate()Lcom/momo/rtcbase/Predicate;
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


# direct methods
.method public constructor <init>(Lcom/momo/rtcbase/Predicate;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/Predicate$3;->this$0:Lcom/momo/rtcbase/Predicate;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public test(Ljava/lang/Object;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/Predicate$3;->this$0:Lcom/momo/rtcbase/Predicate;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lcom/momo/rtcbase/Predicate;->test(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    return p0
.end method
