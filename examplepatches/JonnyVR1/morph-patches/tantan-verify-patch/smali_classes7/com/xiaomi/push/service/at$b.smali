.class Lcom/xiaomi/push/service/at$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/push/service/at;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# static fields
.field private static final a:Lcom/xiaomi/push/service/at;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/xiaomi/push/service/at;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/xiaomi/push/service/at;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/xiaomi/push/service/at$b;->a:Lcom/xiaomi/push/service/at;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a()Lcom/xiaomi/push/service/at;
    .locals 1

    .line 1
    sget-object v0, Lcom/xiaomi/push/service/at$b;->a:Lcom/xiaomi/push/service/at;

    .line 2
    .line 3
    return-object v0
.end method
