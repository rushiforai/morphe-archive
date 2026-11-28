.class Le/e/a/NicoliveSession$2;
.super Ljava/lang/Object;
.source "NicoliveSession.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/NicoliveSession;->message(Lnicoid/network238/okhttp3/WebSocket;Lorg/json/JSONObject;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Le/e/a/NicoliveSession;

.field private final synthetic val$token:I

.field private final synthetic val$ws:Lnicoid/network238/okhttp3/WebSocket;


# direct methods
.method constructor <init>(Le/e/a/NicoliveSession;ILnicoid/network238/okhttp3/WebSocket;)V
    .registers 4

    .line 44
    iput-object p1, p0, Le/e/a/NicoliveSession$2;->this$0:Le/e/a/NicoliveSession;

    iput p2, p0, Le/e/a/NicoliveSession$2;->val$token:I

    iput-object p3, p0, Le/e/a/NicoliveSession$2;->val$ws:Lnicoid/network238/okhttp3/WebSocket;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 44
    iget-object v0, p0, Le/e/a/NicoliveSession$2;->this$0:Le/e/a/NicoliveSession;

    iget v1, p0, Le/e/a/NicoliveSession$2;->val$token:I

    invoke-virtual {v0, v1}, Le/e/a/NicoliveSession;->active(I)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Le/e/a/NicoliveSession$2;->val$ws:Lnicoid/network238/okhttp3/WebSocket;

    const-string v0, "{\"type\":\"keepSeat\"}"

    invoke-interface {p0, v0}, Lnicoid/network238/okhttp3/WebSocket;->send(Ljava/lang/String;)Z

    :cond_0
    return-void
.end method
