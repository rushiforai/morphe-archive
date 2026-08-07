.class Lio/agora/utils2/DnsParseRequest$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/utils2/DnsParseRequest;->makeRequest(JLjava/lang/String;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/agora/utils2/DnsParseRequest;

.field final synthetic val$name:Ljava/lang/String;

.field final synthetic val$nativeHandle:J


# direct methods
.method public constructor <init>(Lio/agora/utils2/DnsParseRequest;Ljava/lang/String;J)V
    .locals 0

    iput-object p1, p0, Lio/agora/utils2/DnsParseRequest$1;->this$0:Lio/agora/utils2/DnsParseRequest;

    iput-object p2, p0, Lio/agora/utils2/DnsParseRequest$1;->val$name:Ljava/lang/String;

    iput-wide p3, p0, Lio/agora/utils2/DnsParseRequest$1;->val$nativeHandle:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 13

    :try_start_0
    iget-object v0, p0, Lio/agora/utils2/DnsParseRequest$1;->val$name:Ljava/lang/String;

    invoke-static {v0}, Ljava/net/InetAddress;->getAllByName(Ljava/lang/String;)[Ljava/net/InetAddress;

    move-result-object v0

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_0

    aget-object v2, v0, v1

    invoke-virtual {v2}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    iget-wide v1, p0, Lio/agora/utils2/DnsParseRequest$1;->val$nativeHandle:J

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v0

    int-to-long v5, v0

    const/4 v3, 0x1

    invoke-static/range {v1 .. v6}, Lio/agora/utils2/DnsParseRequest;->access$000(JZLjava/lang/Object;J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    iget-wide v7, p0, Lio/agora/utils2/DnsParseRequest$1;->val$nativeHandle:J

    const/4 v10, 0x0

    const-wide/16 v11, 0x0

    const/4 v9, 0x0

    invoke-static/range {v7 .. v12}, Lio/agora/utils2/DnsParseRequest;->access$000(JZLjava/lang/Object;J)V

    return-void
.end method
