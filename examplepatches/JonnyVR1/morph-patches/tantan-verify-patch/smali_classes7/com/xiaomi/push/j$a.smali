.class public Lcom/xiaomi/push/j$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/push/j;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# static fields
.field public static final b:Lcom/xiaomi/push/j$a;

.field public static final c:Lcom/xiaomi/push/j$a;

.field public static final d:Lcom/xiaomi/push/j$a;

.field public static final e:Lcom/xiaomi/push/j$a;

.field public static final f:Lcom/xiaomi/push/j$a;


# instance fields
.field private a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/xiaomi/push/j$a;

    .line 2
    .line 3
    const-string v1, "get"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/xiaomi/push/j$a;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/xiaomi/push/j$a;->b:Lcom/xiaomi/push/j$a;

    .line 9
    .line 10
    new-instance v0, Lcom/xiaomi/push/j$a;

    .line 11
    .line 12
    const-string v1, "set"

    .line 13
    .line 14
    invoke-direct {v0, v1}, Lcom/xiaomi/push/j$a;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Lcom/xiaomi/push/j$a;->c:Lcom/xiaomi/push/j$a;

    .line 18
    .line 19
    new-instance v0, Lcom/xiaomi/push/j$a;

    .line 20
    .line 21
    const-string v1, "result"

    .line 22
    .line 23
    invoke-direct {v0, v1}, Lcom/xiaomi/push/j$a;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    sput-object v0, Lcom/xiaomi/push/j$a;->d:Lcom/xiaomi/push/j$a;

    .line 27
    .line 28
    new-instance v0, Lcom/xiaomi/push/j$a;

    .line 29
    .line 30
    const-string v1, "error"

    .line 31
    .line 32
    invoke-direct {v0, v1}, Lcom/xiaomi/push/j$a;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sput-object v0, Lcom/xiaomi/push/j$a;->e:Lcom/xiaomi/push/j$a;

    .line 36
    .line 37
    new-instance v0, Lcom/xiaomi/push/j$a;

    .line 38
    .line 39
    const-string v1, "command"

    .line 40
    .line 41
    invoke-direct {v0, v1}, Lcom/xiaomi/push/j$a;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    sput-object v0, Lcom/xiaomi/push/j$a;->f:Lcom/xiaomi/push/j$a;

    .line 45
    .line 46
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/xiaomi/push/j$a;->a:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static a(Ljava/lang/String;)Lcom/xiaomi/push/j$a;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object v1, Lcom/xiaomi/push/j$a;->b:Lcom/xiaomi/push/j$a;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/xiaomi/push/j$a;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-eqz v2, :cond_1

    .line 20
    .line 21
    return-object v1

    .line 22
    :cond_1
    sget-object v1, Lcom/xiaomi/push/j$a;->c:Lcom/xiaomi/push/j$a;

    .line 23
    .line 24
    invoke-virtual {v1}, Lcom/xiaomi/push/j$a;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-eqz v2, :cond_2

    .line 33
    .line 34
    return-object v1

    .line 35
    :cond_2
    sget-object v1, Lcom/xiaomi/push/j$a;->e:Lcom/xiaomi/push/j$a;

    .line 36
    .line 37
    invoke-virtual {v1}, Lcom/xiaomi/push/j$a;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-eqz v2, :cond_3

    .line 46
    .line 47
    return-object v1

    .line 48
    :cond_3
    sget-object v1, Lcom/xiaomi/push/j$a;->d:Lcom/xiaomi/push/j$a;

    .line 49
    .line 50
    invoke-virtual {v1}, Lcom/xiaomi/push/j$a;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    if-eqz v2, :cond_4

    .line 59
    .line 60
    return-object v1

    .line 61
    :cond_4
    sget-object v1, Lcom/xiaomi/push/j$a;->f:Lcom/xiaomi/push/j$a;

    .line 62
    .line 63
    invoke-virtual {v1}, Lcom/xiaomi/push/j$a;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    if-eqz p0, :cond_5

    .line 72
    .line 73
    return-object v1

    .line 74
    :cond_5
    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/xiaomi/push/j$a;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
