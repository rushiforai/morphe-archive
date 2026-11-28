.class public Lcom/google/common/collect/ForwardingSortedMap$StandardKeySet;
.super Lcom/google/common/collect/Maps$SortedKeySet;
.source "ForwardingSortedMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/ForwardingSortedMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "StandardKeySet"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/Maps$SortedKeySet<",
        "TK;TV;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/collect/ForwardingSortedMap;


# direct methods
.method public constructor <init>(Lcom/google/common/collect/ForwardingSortedMap;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 109
    iput-object p1, p0, Lcom/google/common/collect/ForwardingSortedMap$StandardKeySet;->this$0:Lcom/google/common/collect/ForwardingSortedMap;

    .line 110
    invoke-direct {p0, p1}, Lcom/google/common/collect/Maps$SortedKeySet;-><init>(Ljava/util/SortedMap;)V

    return-void
.end method
