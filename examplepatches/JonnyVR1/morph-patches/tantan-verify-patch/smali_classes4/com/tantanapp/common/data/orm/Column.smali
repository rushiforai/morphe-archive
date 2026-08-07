.class public abstract Lcom/tantanapp/common/data/orm/Column;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "C:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field public static final PREFIX:Ljava/lang/String; = "$."


# instance fields
.field public final NAME:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tantanapp/common/data/orm/Column;->NAME:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public NOT_NULL()Lcom/tantanapp/common/data/orm/Filter;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/tantanapp/common/data/orm/Column$2;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/tantanapp/common/data/orm/Column$2;-><init>(Lcom/tantanapp/common/data/orm/Column;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public NULL()Lcom/tantanapp/common/data/orm/Filter;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/tantanapp/common/data/orm/Filter<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/tantanapp/common/data/orm/Column$1;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/tantanapp/common/data/orm/Column$1;-><init>(Lcom/tantanapp/common/data/orm/Column;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public abstract get(Ljava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)TC;"
        }
    .end annotation
.end method

.method public put(Landroid/content/ContentValues;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/ContentValues;",
            "TC;)V"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 2
    .line 3
    const-string p1, ""

    .line 4
    .line 5
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    throw p0
.end method

.method public abstract set(Ljava/lang/Object;Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TC;)V"
        }
    .end annotation
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/Column;->NAME:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
