.class final enum Lcom/google/common/collect/SortedLists$KeyAbsentBehavior$3;
.super Lcom/google/common/collect/SortedLists$KeyAbsentBehavior;
.source "SortedLists.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/SortedLists$KeyAbsentBehavior;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4010
    name = null
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            "$enum$name",
            "$enum$ordinal"
        }
    .end annotation

    const/4 v0, 0x0

    .line 185
    invoke-direct {p0, p1, p2, v0}, Lcom/google/common/collect/SortedLists$KeyAbsentBehavior;-><init>(Ljava/lang/String;ILcom/google/common/collect/SortedLists$1;)V

    return-void
.end method


# virtual methods
.method resultIndex(I)I
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "higherIndex"
        }
    .end annotation

    not-int p0, p1

    return p0
.end method
