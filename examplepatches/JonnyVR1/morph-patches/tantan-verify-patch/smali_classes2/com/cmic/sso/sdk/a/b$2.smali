.class Lcom/cmic/sso/sdk/a/b$2;
.super Lcom/cmic/sso/sdk/e/n$a;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cmic/sso/sdk/a/b;->a(Lcom/cmic/sso/sdk/a;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/cmic/sso/sdk/a;

.field final synthetic b:Lcom/cmic/sso/sdk/a/b;


# direct methods
.method public constructor <init>(Lcom/cmic/sso/sdk/a/b;Lcom/cmic/sso/sdk/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cmic/sso/sdk/a/b$2;->b:Lcom/cmic/sso/sdk/a/b;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/cmic/sso/sdk/a/b$2;->a:Lcom/cmic/sso/sdk/a;

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/cmic/sso/sdk/e/n$a;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 1
    const-string v0, "UmcConfigHandle"

    .line 2
    .line 3
    const-string v1, "\u5f00\u59cb\u62c9\u53d6\u914d\u7f6e.."

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cmic/sso/sdk/e/c;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/cmic/sso/sdk/a/b$2;->b:Lcom/cmic/sso/sdk/a/b;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/cmic/sso/sdk/a/b$2;->a:Lcom/cmic/sso/sdk/a;

    .line 11
    .line 12
    invoke-static {v0, p0}, Lcom/cmic/sso/sdk/a/b;->a(Lcom/cmic/sso/sdk/a/b;Lcom/cmic/sso/sdk/a;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
