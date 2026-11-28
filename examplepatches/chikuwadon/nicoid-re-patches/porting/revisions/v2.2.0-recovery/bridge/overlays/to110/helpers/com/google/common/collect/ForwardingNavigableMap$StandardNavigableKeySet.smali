.class public Lcom/google/common/collect/ForwardingNavigableMap$StandardNavigableKeySet;
.super Lcom/google/common/collect/Maps$NavigableKeySet;
.source "ForwardingNavigableMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/ForwardingNavigableMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "StandardNavigableKeySet"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/Maps$NavigableKeySet<",
        "TK;TV;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/collect/ForwardingNavigableMap;


# direct methods
.method public constructor <init>(Lcom/google/common/collect/ForwardingNavigableMap;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 341
    iput-object p1, p0, Lcom/google/common/collect/ForwardingNavigableMap$StandardNavigableKeySet;->this$0:Lcom/google/common/collect/ForwardingNavigableMap;

    .line 342
    invoke-direct {p0, p1}, Lcom/google/common/collect/Maps$NavigableKeySet;-><init>(Ljava/util/NavigableMap;)V

    return-void
.end method
