.class public Lcom/google/common/collect/ForwardingNavigableSet$StandardDescendingSet;
.super Lcom/google/common/collect/Sets$DescendingSet;
.source "ForwardingNavigableSet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/ForwardingNavigableSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "StandardDescendingSet"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/Sets$DescendingSet<",
        "TE;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/collect/ForwardingNavigableSet;


# direct methods
.method public constructor <init>(Lcom/google/common/collect/ForwardingNavigableSet;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 174
    iput-object p1, p0, Lcom/google/common/collect/ForwardingNavigableSet$StandardDescendingSet;->this$0:Lcom/google/common/collect/ForwardingNavigableSet;

    .line 175
    invoke-direct {p0, p1}, Lcom/google/common/collect/Sets$DescendingSet;-><init>(Ljava/util/NavigableSet;)V

    return-void
.end method
