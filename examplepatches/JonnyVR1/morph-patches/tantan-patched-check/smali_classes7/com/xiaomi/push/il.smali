.class public Lcom/xiaomi/push/il;
.super Lcom/xiaomi/push/hu;
.source "SourceFile"


# instance fields
.field protected a:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/xiaomi/push/hu;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/xiaomi/push/il;->a:I

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(I)V
    .locals 0

    .line 8
    invoke-direct {p0}, Lcom/xiaomi/push/hu;-><init>()V

    .line 9
    iput p1, p0, Lcom/xiaomi/push/il;->a:I

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .locals 0

    .line 10
    invoke-direct {p0, p2}, Lcom/xiaomi/push/hu;-><init>(Ljava/lang/String;)V

    .line 11
    iput p1, p0, Lcom/xiaomi/push/il;->a:I

    return-void
.end method

.method public constructor <init>(ILjava/lang/Throwable;)V
    .locals 0

    .line 14
    invoke-direct {p0, p2}, Lcom/xiaomi/push/hu;-><init>(Ljava/lang/Throwable;)V

    .line 15
    iput p1, p0, Lcom/xiaomi/push/il;->a:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 12
    invoke-direct {p0, p1}, Lcom/xiaomi/push/hu;-><init>(Ljava/lang/String;)V

    const/4 p1, 0x0

    .line 13
    iput p1, p0, Lcom/xiaomi/push/il;->a:I

    return-void
.end method
