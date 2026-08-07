.class Lcom/tantanapp/common/data/orm/Filter$1;
.super Lcom/tantanapp/common/data/orm/Filter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/common/data/orm/Filter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/orm/Filter;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public emit()Lcom/tantanapp/common/data/orm/SqlSegment;
    .locals 0

    .line 1
    sget-object p0, Lcom/tantanapp/common/data/orm/SqlSegment;->NULL:Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 2
    .line 3
    return-object p0
.end method

.method public emitWithPrefix()Lcom/tantanapp/common/data/orm/SqlSegment;
    .locals 0

    .line 1
    sget-object p0, Lcom/tantanapp/common/data/orm/SqlSegment;->NULL:Lcom/tantanapp/common/data/orm/SqlSegment;

    .line 2
    .line 3
    return-object p0
.end method

.method public filter(Ljava/lang/Object;)Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method
