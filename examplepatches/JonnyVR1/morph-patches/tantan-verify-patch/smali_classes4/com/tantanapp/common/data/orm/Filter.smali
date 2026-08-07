.class public abstract Lcom/tantanapp/common/data/orm/Filter;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field public static final TRUE:Lcom/tantanapp/common/data/orm/Filter;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tantanapp/common/data/orm/Filter$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tantanapp/common/data/orm/Filter$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/tantanapp/common/data/orm/Filter;->TRUE:Lcom/tantanapp/common/data/orm/Filter;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static varargs AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;)",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;"
        }
    .end annotation

    .annotation runtime Ljava/lang/SafeVarargs;
    .end annotation

    .line 1
    new-instance v0, Lcom/tantanapp/common/data/orm/Filter$2;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/tantanapp/common/data/orm/Filter$2;-><init>([Lcom/tantanapp/common/data/orm/Filter;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static varargs OR([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;)",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;"
        }
    .end annotation

    .annotation runtime Ljava/lang/SafeVarargs;
    .end annotation

    .line 1
    new-instance v0, Lcom/tantanapp/common/data/orm/Filter$3;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/tantanapp/common/data/orm/Filter$3;-><init>([Lcom/tantanapp/common/data/orm/Filter;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public abstract emit()Lcom/tantanapp/common/data/orm/SqlSegment;
.end method

.method public abstract emitWithPrefix()Lcom/tantanapp/common/data/orm/SqlSegment;
.end method

.method public abstract filter(Ljava/lang/Object;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)Z"
        }
    .end annotation
.end method
