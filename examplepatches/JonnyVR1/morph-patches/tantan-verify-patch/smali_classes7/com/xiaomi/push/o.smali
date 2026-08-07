.class public Lcom/xiaomi/push/o;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final a:Ll/w3r0;

.field private final b:Ll/d4r0;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 18
    new-instance v0, Lcom/xiaomi/push/hw$a;

    invoke-direct {v0}, Lcom/xiaomi/push/hw$a;-><init>()V

    invoke-direct {p0, v0}, Lcom/xiaomi/push/o;-><init>(Lcom/xiaomi/push/ic;)V

    return-void
.end method

.method public constructor <init>(Lcom/xiaomi/push/ic;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/d4r0;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/d4r0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/xiaomi/push/o;->b:Ll/d4r0;

    .line 10
    .line 11
    invoke-interface {p1, v0}, Lcom/xiaomi/push/ic;->a(Ll/e4r0;)Ll/w3r0;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Lcom/xiaomi/push/o;->a:Ll/w3r0;

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public a(Lcom/xiaomi/push/hq;[B)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/push/o;->b:Ll/d4r0;

    .line 2
    .line 3
    invoke-virtual {v0, p2}, Ll/d4r0;->h([B)V

    .line 4
    .line 5
    .line 6
    iget-object p2, p0, Lcom/xiaomi/push/o;->a:Ll/w3r0;

    .line 7
    .line 8
    invoke-interface {p1, p2}, Lcom/xiaomi/push/hq;->a(Ll/w3r0;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/xiaomi/push/o;->a:Ll/w3r0;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/w3r0;->I()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :catchall_0
    move-exception p1

    .line 18
    iget-object p0, p0, Lcom/xiaomi/push/o;->a:Ll/w3r0;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/w3r0;->I()V

    .line 21
    .line 22
    .line 23
    throw p1
.end method
