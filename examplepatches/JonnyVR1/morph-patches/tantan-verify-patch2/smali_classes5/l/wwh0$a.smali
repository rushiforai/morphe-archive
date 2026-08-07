.class public Ll/wwh0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/wwh0;->A(Ljava/lang/String;Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;)Lrx/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/pcj<",
        "Lrx/c<",
        "Lcom/p1/mobile/putong/data/VerificationToken;",
        ">;>;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;

.field public final synthetic c:Ll/wwh0;


# direct methods
.method public constructor <init>(Ll/wwh0;Ljava/lang/String;Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/wwh0$a;->c:Ll/wwh0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/wwh0$a;->a:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Ll/wwh0$a;->b:Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a()Lrx/c;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/VerificationToken;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/bn5;->me_()Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/wwh0$a;->c:Ll/wwh0;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/wwh0$a;->a:Ljava/lang/String;

    .line 12
    .line 13
    iget-object p0, p0, Ll/wwh0$a;->b:Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;

    .line 14
    .line 15
    invoke-static {v1, v0, p0}, Ll/wwh0;->v(Ll/wwh0;Ljava/lang/String;Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    iget-object v2, p0, Ll/wwh0$a;->b:Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;

    .line 21
    .line 22
    iget-object v3, p0, Ll/wwh0$a;->a:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {v1, v0, v2, v3}, Ll/wwh0;->u(Ll/wwh0;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;Ljava/lang/String;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object v1, p0, Ll/wwh0$a;->c:Ll/wwh0;

    .line 29
    .line 30
    invoke-static {v1}, Ll/wwh0;->t(Ll/wwh0;)Ljava/util/HashMap;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v1, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    iget-object v2, p0, Ll/wwh0$a;->c:Ll/wwh0;

    .line 39
    .line 40
    if-eqz v1, :cond_1

    .line 41
    .line 42
    invoke-static {v2}, Ll/wwh0;->t(Ll/wwh0;)Ljava/util/HashMap;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    check-cast v1, Lcom/p1/mobile/putong/data/VerificationToken;

    .line 51
    .line 52
    invoke-static {v1}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    iget-object p0, p0, Ll/wwh0$a;->c:Ll/wwh0;

    .line 57
    .line 58
    invoke-static {p0}, Ll/wwh0;->t(Ll/wwh0;)Ljava/util/HashMap;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p0, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    return-object v1

    .line 66
    :cond_1
    iget-object v0, p0, Ll/wwh0$a;->a:Ljava/lang/String;

    .line 67
    .line 68
    iget-object p0, p0, Ll/wwh0$a;->b:Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;

    .line 69
    .line 70
    invoke-static {v2, v0, p0}, Ll/wwh0;->v(Ll/wwh0;Ljava/lang/String;Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;)Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    return-object p0
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/wwh0$a;->a()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
