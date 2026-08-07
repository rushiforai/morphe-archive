.class Ll/fqq$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/fqq;->m(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/kf3;

.field final synthetic b:Ll/fqq;


# direct methods
.method public constructor <init>(Ll/fqq;Ll/kf3;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fqq$a;->b:Ll/fqq;

    .line 2
    .line 3
    iput-object p2, p0, Ll/fqq$a;->a:Ll/kf3;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fqq$a;->a:Ll/kf3;

    .line 2
    .line 3
    iget-object v1, p0, Ll/fqq$a;->b:Ll/fqq;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/fqq;->c()Ll/hul;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {v1}, Ll/hul;->getWebViewUrl()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/kf3;->l(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/fqq$a;->a:Ll/kf3;

    .line 17
    .line 18
    iget-object p0, p0, Ll/fqq$a;->b:Ll/fqq;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/fqq;->c()Ll/hul;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-interface {p0}, Ll/hul;->getBid()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v0, p0}, Ll/kf3;->j(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method
