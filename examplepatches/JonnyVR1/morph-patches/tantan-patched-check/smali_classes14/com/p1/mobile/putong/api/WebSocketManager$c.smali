.class public Lcom/p1/mobile/putong/api/WebSocketManager$c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/api/WebSocketManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# static fields
.field public static a:Lcom/p1/mobile/putong/api/WebSocketManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/api/WebSocketManager;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/api/WebSocketManager$c;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 7
    .line 8
    return-void
.end method

.method public static bridge synthetic a()Lcom/p1/mobile/putong/api/WebSocketManager;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/api/WebSocketManager$c;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    return-object v0
.end method
