.class Lcom/cmic/sso/sdk/e/h$1;
.super Lcom/cmic/sso/sdk/e/n$a;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cmic/sso/sdk/e/h;->a(Landroid/content/Context;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroid/content/Context;

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cmic/sso/sdk/e/h$1;->a:Landroid/content/Context;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/cmic/sso/sdk/e/h$1;->b:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/cmic/sso/sdk/e/h$1;->c:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/cmic/sso/sdk/e/n$a;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a()V
    .locals 4

    .line 1
    const-string v0, "PhoneScripUtils"

    .line 2
    .line 3
    const-string v1, "start save scrip to sp in sub thread"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cmic/sso/sdk/e/c;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/cmic/sso/sdk/e/h$1;->a:Landroid/content/Context;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/cmic/sso/sdk/e/h$1;->b:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {}, Lcom/cmic/sso/sdk/e/h;->b()J

    .line 13
    .line 14
    .line 15
    move-result-wide v2

    .line 16
    iget-object p0, p0, Lcom/cmic/sso/sdk/e/h$1;->c:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {v0, v1, v2, v3, p0}, Lcom/cmic/sso/sdk/e/h;->a(Landroid/content/Context;Ljava/lang/String;JLjava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
