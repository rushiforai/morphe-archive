.class Lcom/p1/mobile/putong/data/ContactNumber$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/ContactNumber;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/p1/mobile/putong/data/ContactNumber;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public compare(Lcom/p1/mobile/putong/data/ContactNumber;Lcom/p1/mobile/putong/data/ContactNumber;)I
    .locals 0

    .line 10
    iget-object p0, p1, Lcom/p1/mobile/putong/data/ContactNumber;->hash11:Ljava/lang/String;

    iget-object p1, p2, Lcom/p1/mobile/putong/data/ContactNumber;->hash11:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/data/ContactNumber;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/data/ContactNumber;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/ContactNumber$1;->compare(Lcom/p1/mobile/putong/data/ContactNumber;Lcom/p1/mobile/putong/data/ContactNumber;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
