.class Lcom/p1/mobile/putong/data/tenum/TEnumColumn$2;
.super Lcom/tantanapp/common/data/orm/StringColumn;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/data/tenum/TEnumColumn;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/orm/StringColumn<",
        "TT;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

.field final synthetic val$tEnumJsonAdapter:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/data/tenum/TEnumColumn;Ljava/lang/String;Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn$2;->this$0:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn$2;->val$tEnumJsonAdapter:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 4
    .line 5
    invoke-direct {p0, p2}, Lcom/tantanapp/common/data/orm/StringColumn;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 18
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn$2;->get(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn$2;->this$0:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/data/orm/Column;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0

    .line 13
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->name()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public bridge synthetic set(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 21
    check-cast p2, Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn$2;->set(Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method public set(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn$2;->val$tEnumJsonAdapter:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 2
    .line 3
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->getInteger(Ljava/lang/String;)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-virtual {v0, p2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/data/tenum/TEnumColumn$2;->this$0:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 16
    .line 17
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->set(Ljava/lang/Object;Lcom/p1/mobile/putong/data/tenum/TEnum;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
