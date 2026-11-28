.class final Lcom/google/common/collect/Iterators$ArrayItr;
.super Lcom/google/common/collect/AbstractIndexedListIterator;
.source "Iterators.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/Iterators;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ArrayItr"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/AbstractIndexedListIterator<",
        "TT;>;"
    }
.end annotation


# static fields
.field static final EMPTY:Lcom/google/common/collect/UnmodifiableListIterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/UnmodifiableListIterator<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final array:[Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[TT;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .line 1077
    new-instance v0, Lcom/google/common/collect/Iterators$ArrayItr;

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Object;

    invoke-direct {v0, v2, v1}, Lcom/google/common/collect/Iterators$ArrayItr;-><init>([Ljava/lang/Object;I)V

    sput-object v0, Lcom/google/common/collect/Iterators$ArrayItr;->EMPTY:Lcom/google/common/collect/UnmodifiableListIterator;

    return-void
.end method

.method constructor <init>([Ljava/lang/Object;I)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "array",
            "position"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;I)V"
        }
    .end annotation

    .line 1082
    array-length v0, p1

    invoke-direct {p0, v0, p2}, Lcom/google/common/collect/AbstractIndexedListIterator;-><init>(II)V

    .line 1083
    iput-object p1, p0, Lcom/google/common/collect/Iterators$ArrayItr;->array:[Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method get(I)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "index"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .line 1089
    iget-object p0, p0, Lcom/google/common/collect/Iterators$ArrayItr;->array:[Ljava/lang/Object;

    aget-object p0, p0, p1

    return-object p0
.end method
