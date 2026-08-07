.class Lcom/immomo/push/pb/BodyType$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/protobuf/l$d;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/push/pb/BodyType;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/protobuf/l$d<",
        "Lcom/immomo/push/pb/BodyType;",
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
.method public a(I)Lcom/immomo/push/pb/BodyType;
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/immomo/push/pb/BodyType;->forNumber(I)Lcom/immomo/push/pb/BodyType;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic findValueByNumber(I)Lcom/google/protobuf/l$c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/immomo/push/pb/BodyType$a;->a(I)Lcom/immomo/push/pb/BodyType;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
