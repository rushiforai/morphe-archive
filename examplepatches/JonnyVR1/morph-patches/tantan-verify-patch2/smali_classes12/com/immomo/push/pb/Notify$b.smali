.class public final Lcom/immomo/push/pb/Notify$b;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Ll/lfz;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/push/pb/Notify;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/immomo/push/pb/Notify;",
        "Lcom/immomo/push/pb/Notify$b;",
        ">;",
        "Ll/lfz;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/immomo/push/pb/Notify;->access$000()Lcom/immomo/push/pb/Notify;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, v0}, Lcom/google/protobuf/GeneratedMessageLite$b;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>(Lcom/immomo/push/pb/Notify$a;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/immomo/push/pb/Notify$b;-><init>()V

    return-void
.end method
