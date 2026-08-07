.class public abstract Lcom/xiaomi/push/service/ah$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/push/service/ah;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "a"
.end annotation


# instance fields
.field private mDescription:Ljava/lang/String;

.field private mId:I


# direct methods
.method public constructor <init>(ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/xiaomi/push/service/ah$a;->mId:I

    .line 5
    .line 6
    iput-object p2, p0, Lcom/xiaomi/push/service/ah$a;->mDescription:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 2

    .line 1
    instance-of v0, p1, Lcom/xiaomi/push/service/ah$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget p0, p0, Lcom/xiaomi/push/service/ah$a;->mId:I

    .line 7
    .line 8
    check-cast p1, Lcom/xiaomi/push/service/ah$a;

    .line 9
    .line 10
    iget p1, p1, Lcom/xiaomi/push/service/ah$a;->mId:I

    .line 11
    .line 12
    if-ne p0, p1, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_0
    return v1
.end method

.method public hashCode()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/xiaomi/push/service/ah$a;->mId:I

    .line 2
    .line 3
    return p0
.end method

.method public abstract onCallback()V
.end method

.method public final run()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/xiaomi/push/service/ah$a;->onCallback()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
