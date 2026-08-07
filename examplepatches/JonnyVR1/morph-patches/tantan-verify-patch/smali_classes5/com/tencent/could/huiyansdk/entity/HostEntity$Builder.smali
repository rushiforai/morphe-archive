.class public Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/could/huiyansdk/entity/HostEntity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field public backupIp:Ljava/lang/String;

.field public mainHost:Ljava/lang/String;

.field public secondHost:Ljava/lang/String;


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

.method public static synthetic access$000(Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->mainHost:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100(Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->secondHost:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$200(Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->backupIp:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public backupIp(Ljava/lang/String;)Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->backupIp:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public build()Lcom/tencent/could/huiyansdk/entity/HostEntity;
    .locals 2

    .line 1
    new-instance v0, Lcom/tencent/could/huiyansdk/entity/HostEntity;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Lcom/tencent/could/huiyansdk/entity/HostEntity;-><init>(Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;Lcom/tencent/could/huiyansdk/entity/HostEntity$1;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public mainHost(Ljava/lang/String;)Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->mainHost:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public secondHost(Ljava/lang/String;)Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->secondHost:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
