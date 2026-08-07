.class public Ll/cs20;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static d:Ll/zqf0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/zqf0<",
            "Ll/cs20;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:I

.field public final c:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/cs20$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/cs20$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/cs20;->d:Ll/zqf0;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Q1:Lcom/p1/mobile/putong/core/api/t;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/t;->R:Lcom/p1/mobile/putong/core/api/t$a;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/t$a;->B()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->Q1:Lcom/p1/mobile/putong/core/api/t;

    .line 17
    .line 18
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/t;->R:Lcom/p1/mobile/putong/core/api/t$a;

    .line 19
    .line 20
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/t$a;->G()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->Q1:Lcom/p1/mobile/putong/core/api/t;

    .line 27
    .line 28
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/t;->R:Lcom/p1/mobile/putong/core/api/t$a;

    .line 29
    .line 30
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/api/t$a;->L()Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    iput-boolean v2, p0, Ll/cs20;->c:Z

    .line 35
    .line 36
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-nez v2, :cond_0

    .line 41
    .line 42
    iput-object v0, p0, Ll/cs20;->a:Ljava/lang/String;

    .line 43
    .line 44
    iput v1, p0, Ll/cs20;->b:I

    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    const/4 v0, 0x0

    .line 48
    iput-object v0, p0, Ll/cs20;->a:Ljava/lang/String;

    .line 49
    .line 50
    const/4 v0, -0x1

    .line 51
    iput v0, p0, Ll/cs20;->b:I

    .line 52
    .line 53
    return-void
.end method

.method public synthetic constructor <init>(Ll/ds20;)V
    .locals 0

    .line 54
    invoke-direct {p0}, Ll/cs20;-><init>()V

    return-void
.end method

.method public static a()Ll/cs20;
    .locals 1

    .line 1
    sget-object v0, Ll/cs20;->d:Ll/zqf0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/zqf0;->b()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/cs20;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public b()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/cs20;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget p0, p0, Ll/cs20;->b:I

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    if-ne p0, v0, :cond_0

    .line 11
    .line 12
    return v0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public c()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/cs20;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget p0, p0, Ll/cs20;->b:I

    .line 8
    .line 9
    const/4 v0, 0x2

    .line 10
    if-ne p0, v0, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public d()Z
    .locals 1

    .line 1
    const/16 p0, 0x18

    .line 2
    .line 3
    sget-object v0, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/yab;->W(ILjava/util/concurrent/TimeUnit;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public e()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/cs20;->a:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "huawei"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public f()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/cs20;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/cs20;->d()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public g()V
    .locals 1

    .line 1
    new-instance v0, Ll/cs20$b;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/cs20$b;-><init>(Ll/cs20;)V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/cs20;->d:Ll/zqf0;

    .line 7
    .line 8
    return-void
.end method
