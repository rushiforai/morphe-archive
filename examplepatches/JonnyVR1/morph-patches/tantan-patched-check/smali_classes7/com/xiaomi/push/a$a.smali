.class public Lcom/xiaomi/push/a$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/push/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# static fields
.field private static final d:Lcom/xiaomi/push/a;


# instance fields
.field public a:I

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/xiaomi/push/a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/xiaomi/push/a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/xiaomi/push/a$a;->d:Lcom/xiaomi/push/a;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(ILjava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/xiaomi/push/a$a;->a:I

    .line 5
    .line 6
    iput-object p2, p0, Lcom/xiaomi/push/a$a;->c:Ljava/lang/Object;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a()Lcom/xiaomi/push/a;
    .locals 1

    .line 1
    sget-object v0, Lcom/xiaomi/push/a$a;->d:Lcom/xiaomi/push/a;

    .line 2
    .line 3
    return-object v0
.end method
