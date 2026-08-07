.class public Lcom/xiaomi/push/hw$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/xiaomi/push/ic;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/push/hw;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field protected a:I

.field protected a:Z

.field protected b:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 12
    invoke-direct {p0, v0, v1}, Lcom/xiaomi/push/hw$a;-><init>(ZZ)V

    return-void
.end method

.method public constructor <init>(ZZ)V
    .locals 1

    const/4 v0, 0x0

    .line 11
    invoke-direct {p0, p1, p2, v0}, Lcom/xiaomi/push/hw$a;-><init>(ZZI)V

    return-void
.end method

.method public constructor <init>(ZZI)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Lcom/xiaomi/push/hw$a;->a:Z

    .line 5
    .line 6
    iput-boolean p2, p0, Lcom/xiaomi/push/hw$a;->b:Z

    .line 7
    .line 8
    iput p3, p0, Lcom/xiaomi/push/hw$a;->a:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Ll/e4r0;)Ll/w3r0;
    .locals 3

    .line 1
    new-instance v0, Lcom/xiaomi/push/hw;

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/xiaomi/push/hw$a;->a:Z

    .line 4
    .line 5
    iget-boolean v2, p0, Lcom/xiaomi/push/hw$a;->b:Z

    .line 6
    .line 7
    invoke-direct {v0, p1, v1, v2}, Lcom/xiaomi/push/hw;-><init>(Ll/e4r0;ZZ)V

    .line 8
    .line 9
    .line 10
    iget p0, p0, Lcom/xiaomi/push/hw$a;->a:I

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    invoke-virtual {v0, p0}, Lcom/xiaomi/push/hw;->L(I)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-object v0
.end method
