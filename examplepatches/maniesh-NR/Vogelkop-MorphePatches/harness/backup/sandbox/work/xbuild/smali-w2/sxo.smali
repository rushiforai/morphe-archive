.class public abstract Lsxo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Luio;

.field public b:Lzy9;

.field public c:Lqe6;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const-class v0, Lsxo;

    invoke-static {v0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v0

    invoke-virtual {v0}, Ls15;->c()Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/view/View;Ljava/lang/String;Lmzo;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0, p1, p2, p3}, Lsxo;->a(Landroid/view/View;Ljava/lang/String;Lmzo;)V

    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;Ljava/lang/String;Lmzo;)V
    .registers 6

    check-cast p1, Landroid/webkit/WebView;

    sget-object p3, Lw3b;->b:Lw3b;

    sget-object v0, Lgvf;->c:Lgvf;

    sget-object v1, Lu06;->b:Lu06;

    invoke-static {v1, p3, v0, v0}, Ls9i;->E(Lu06;Lw3b;Lgvf;Lgvf;)Ls9i;

    move-result-object p3

    const-string v0, "2.14.0"

    invoke-static {v0}, Lgd7;->a(Ljava/lang/String;)Lgd7;

    move-result-object v0

    invoke-static {v0, p1, p2}, Lne5;->v(Lgd7;Landroid/webkit/WebView;Ljava/lang/String;)Lne5;

    move-result-object p2

    invoke-static {p3, p2}, Luio;->b(Ls9i;Lne5;)Luio;

    move-result-object p2

    invoke-virtual {p2, p1}, Luio;->d(Landroid/view/View;)V

    invoke-virtual {p2}, Luio;->e()V

    iput-object p2, p0, Lsxo;->a:Luio;

    return-void
.end method

.method public b()V
    .registers 4

    iget-object p0, p0, Lsxo;->c:Lqe6;

    if-eqz p0, :cond_1e

    iget-object p0, p0, Lqe6;->b:Ljava/lang/Object;

    check-cast p0, Luio;

    invoke-static {p0}, Lzch;->c(Luio;)V

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "interactionType"

    sget-object v2, Lsdb;->b:Lsdb;

    invoke-static {v0, v1, v2}, Lyqo;->b(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object p0, p0, Luio;->e:Lyp;

    const-string v1, "adUserInteraction"

    invoke-virtual {p0, v1, v0}, Lyp;->d(Ljava/lang/String;Lorg/json/JSONObject;)V

    :cond_1e
    return-void
.end method

.method public c()V
    .registers 1

    iget-object p0, p0, Lsxo;->b:Lzy9;

    if-eqz p0, :cond_7

    invoke-virtual {p0}, Lzy9;->L()V

    :cond_7
    return-void
.end method
