.class public Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi;
.super Lcom/p1/mobile/putong/account/api/b;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi$a;,
        Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi$ReportMobileSource;
    }
.end annotation


# static fields
.field public static h:Ll/jxd0;


# instance fields
.field public g:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi$a;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ll/jxd0;

    .line 2
    .line 3
    const-string v1, "has_report_mobile_number"

    .line 4
    .line 5
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi;->h:Ll/jxd0;

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/api/b;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi;->g:Lrx/subjects/b;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public g(Ljava/lang/String;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/account/data/WeChatToken;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 2
    .line 3
    iget-object p0, p0, Ll/pw;->c:Ll/awi0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/awi0;->e(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/account/api/b;->f()Lrx/c$d;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public h(Landroid/content/Context;Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi$ReportMobileSource;Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public i()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi$a;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi;->g:Lrx/subjects/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public j(Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi$a;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi;->g:Lrx/subjects/b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public k(ILjava/lang/String;)V
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi$a;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi$a;-><init>()V

    .line 4
    .line 5
    .line 6
    iput p1, p0, Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi$a;->b:I

    .line 7
    .line 8
    iput-object p2, p0, Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi$a;->c:Ljava/lang/String;

    .line 9
    .line 10
    const/4 p1, 0x1

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi$a;->a:I

    .line 12
    .line 13
    sget-object p1, Lcom/p1/mobile/putong/account/AccountModule;->e:Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi;

    .line 14
    .line 15
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi;->j(Lcom/p1/mobile/putong/account/api/ThirdPartLoginApi$a;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public l(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/account/data/WeChatUserInfo;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 2
    .line 3
    iget-object p0, p0, Ll/pw;->c:Ll/awi0;

    .line 4
    .line 5
    invoke-virtual {p0, p2, p1}, Ll/awi0;->f(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/account/api/b;->f()Lrx/c$d;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public m(Ljava/lang/String;Ljava/lang/String;Z)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z)",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/account/data/ThirdPartVetify;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->d:Ll/pw;

    .line 2
    .line 3
    iget-object p0, p0, Ll/pw;->c:Ll/awi0;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Ll/awi0;->l(Ljava/lang/String;Ljava/lang/String;Z)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/account/api/b;->f()Lrx/c$d;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method
