.class public Lcom/tencent/could/huiyansdk/entity/HostEntity;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;
    }
.end annotation


# instance fields
.field public backupIp:Ljava/lang/String;

.field public mainHost:Ljava/lang/String;

.field public secondHost:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->access$000(Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/entity/HostEntity;->mainHost:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {p1}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->access$100(Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/entity/HostEntity;->secondHost:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {p1}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->access$200(Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/entity/HostEntity;->backupIp:Ljava/lang/String;

    .line 21
    .line 22
    return-void
.end method

.method public synthetic constructor <init>(Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;Lcom/tencent/could/huiyansdk/entity/HostEntity$1;)V
    .locals 0

    .line 23
    invoke-direct {p0, p1}, Lcom/tencent/could/huiyansdk/entity/HostEntity;-><init>(Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;)V

    return-void
.end method


# virtual methods
.method public getBackupIp()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/entity/HostEntity;->backupIp:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMainHost()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/entity/HostEntity;->mainHost:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSecondHost()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/entity/HostEntity;->secondHost:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
