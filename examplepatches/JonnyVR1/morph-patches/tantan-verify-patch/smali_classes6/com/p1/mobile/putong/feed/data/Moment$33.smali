.class Lcom/p1/mobile/putong/feed/data/Moment$33;
.super Lcom/p1/mobile/putong/data/tenum/TEnumColumn;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/data/Moment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/data/tenum/TEnumColumn<",
        "Lcom/p1/mobile/putong/feed/data/Moment;",
        "Lcom/p1/mobile/putong/feed/data/UserSetVisibility;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public get(Lcom/p1/mobile/putong/feed/data/Moment;)Lcom/p1/mobile/putong/feed/data/UserSetVisibility;
    .locals 0

    .line 8
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->userSetVisibility:Lcom/p1/mobile/putong/feed/data/UserSetVisibility;

    return-object p0
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/Moment$33;->get(Lcom/p1/mobile/putong/feed/data/Moment;)Lcom/p1/mobile/putong/feed/data/UserSetVisibility;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public setTEnum(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/UserSetVisibility;)V
    .locals 0

    .line 9
    iput-object p2, p1, Lcom/p1/mobile/putong/feed/data/Moment;->userSetVisibility:Lcom/p1/mobile/putong/feed/data/UserSetVisibility;

    return-void
.end method

.method public bridge synthetic setTEnum(Ljava/lang/Object;Lcom/p1/mobile/putong/data/tenum/TEnum;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/feed/data/UserSetVisibility;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/data/Moment$33;->setTEnum(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/UserSetVisibility;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
