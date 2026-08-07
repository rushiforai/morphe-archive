.class public Lcom/xiaomi/push/p;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final a:Ljava/io/ByteArrayOutputStream;

.field private final b:Ll/b4r0;

.field private c:Ll/w3r0;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 25
    new-instance v0, Lcom/xiaomi/push/hw$a;

    invoke-direct {v0}, Lcom/xiaomi/push/hw$a;-><init>()V

    invoke-direct {p0, v0}, Lcom/xiaomi/push/p;-><init>(Lcom/xiaomi/push/ic;)V

    return-void
.end method

.method public constructor <init>(Lcom/xiaomi/push/ic;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/xiaomi/push/p;->a:Ljava/io/ByteArrayOutputStream;

    .line 10
    .line 11
    new-instance v1, Ll/b4r0;

    .line 12
    .line 13
    invoke-direct {v1, v0}, Ll/b4r0;-><init>(Ljava/io/OutputStream;)V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Lcom/xiaomi/push/p;->b:Ll/b4r0;

    .line 17
    .line 18
    invoke-interface {p1, v1}, Lcom/xiaomi/push/ic;->a(Ll/e4r0;)Ll/w3r0;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iput-object p1, p0, Lcom/xiaomi/push/p;->c:Ll/w3r0;

    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public a(Lcom/xiaomi/push/hq;)[B
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/xiaomi/push/p;->a:Ljava/io/ByteArrayOutputStream;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->reset()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/xiaomi/push/p;->c:Ll/w3r0;

    .line 7
    .line 8
    invoke-interface {p1, v0}, Lcom/xiaomi/push/hq;->b(Ll/w3r0;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/xiaomi/push/p;->a:Ljava/io/ByteArrayOutputStream;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method
