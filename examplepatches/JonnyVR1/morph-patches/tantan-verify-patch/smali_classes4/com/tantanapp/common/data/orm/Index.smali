.class public Lcom/tantanapp/common/data/orm/Index;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final columns:[Lcom/tantanapp/common/data/orm/Column;

.field public final where:Lcom/tantanapp/common/data/orm/Filter;


# direct methods
.method private varargs constructor <init>(Lcom/tantanapp/common/data/orm/Filter;[Lcom/tantanapp/common/data/orm/Column;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lcom/tantanapp/common/data/orm/Index;->columns:[Lcom/tantanapp/common/data/orm/Column;

    .line 5
    .line 6
    iput-object p1, p0, Lcom/tantanapp/common/data/orm/Index;->where:Lcom/tantanapp/common/data/orm/Filter;

    .line 7
    .line 8
    return-void
.end method

.method public varargs constructor <init>([Lcom/tantanapp/common/data/orm/Column;)V
    .locals 1

    const/4 v0, 0x0

    .line 9
    invoke-direct {p0, v0, p1}, Lcom/tantanapp/common/data/orm/Index;-><init>(Lcom/tantanapp/common/data/orm/Filter;[Lcom/tantanapp/common/data/orm/Column;)V

    return-void
.end method
