.class Lcom/tantanapp/common/data/orm/Column$1;
.super Lcom/tantanapp/common/data/orm/Filter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tantanapp/common/data/orm/Column;->NULL()Lcom/tantanapp/common/data/orm/Filter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/orm/Filter<",
        "TT;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tantanapp/common/data/orm/Column;


# direct methods
.method public constructor <init>(Lcom/tantanapp/common/data/orm/Column;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/common/data/orm/Column$1;->this$0:Lcom/tantanapp/common/data/orm/Column;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/tantanapp/common/data/orm/Filter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public emit()Lcom/tantanapp/common/data/orm/SqlSegment;
    .locals 2

    .line 1
    new-instance v0, Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/Column$1;->this$0:Lcom/tantanapp/common/data/orm/Column;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/Column;->NAME:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string p0, " IS NULL"

    .line 16
    .line 17
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const/4 v1, 0x0

    .line 25
    invoke-direct {v0, p0, v1}, Lcom/tantanapp/common/data/orm/SqlSegment;-><init>(Ljava/lang/String;[Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-object v0
.end method

.method public emitWithPrefix()Lcom/tantanapp/common/data/orm/SqlSegment;
    .locals 3

    .line 1
    new-instance v0, Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "$."

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/Column$1;->this$0:Lcom/tantanapp/common/data/orm/Column;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/Column;->NAME:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string p0, " IS NULL"

    .line 18
    .line 19
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const/4 v1, 0x0

    .line 27
    invoke-direct {v0, p0, v1}, Lcom/tantanapp/common/data/orm/SqlSegment;-><init>(Ljava/lang/String;[Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-object v0
.end method

.method public filter(Ljava/lang/Object;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/Column$1;->this$0:Lcom/tantanapp/common/data/orm/Column;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/orm/Column;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method
