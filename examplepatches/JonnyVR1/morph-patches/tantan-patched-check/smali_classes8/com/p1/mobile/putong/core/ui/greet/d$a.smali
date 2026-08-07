.class public Lcom/p1/mobile/putong/core/ui/greet/d$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/greet/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/data/Greeting;

.field public b:Ljava/lang/String;

.field public c:Z

.field public d:Z

.field public e:Ljava/lang/String;

.field public f:Ljava/lang/String;

.field public g:Ljava/lang/String;

.field public h:Ljava/lang/String;

.field public i:I

.field public j:Ljava/lang/String;

.field public k:Ljava/lang/Object;

.field public l:Z

.field public m:Z

.field public n:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/data/Greeting;Ljava/lang/String;)V
    .locals 1

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 42
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/greet/d$a;->c:Z

    .line 43
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/greet/d$a;->d:Z

    .line 44
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/greet/d$a;->i:I

    .line 45
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/greet/d$a;->l:Z

    const/4 v0, 0x1

    .line 46
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/greet/d$a;->m:Z

    .line 47
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/d$a;->a:Lcom/p1/mobile/putong/core/data/Greeting;

    .line 48
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Greeting;->id:Ljava/lang/String;

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/d$a;->b:Ljava/lang/String;

    .line 49
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/greet/d$a;->e:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/greet/d$a;->c:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/greet/d$a;->d:Z

    .line 8
    .line 9
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/greet/d$a;->i:I

    .line 10
    .line 11
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/greet/d$a;->l:Z

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/greet/d$a;->m:Z

    .line 15
    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Greeting;->new_()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object p1, v0, Lcom/p1/mobile/putong/core/data/Greeting;->otherUser:Ljava/lang/String;

    .line 21
    .line 22
    iput-object p1, v0, Lcom/p1/mobile/putong/core/data/Greeting;->id:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Greeting;->actorUserId:Ljava/lang/String;

    .line 33
    .line 34
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/greet/d$a;->e:Ljava/lang/String;

    .line 35
    .line 36
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/d$a;->a:Lcom/p1/mobile/putong/core/data/Greeting;

    .line 37
    .line 38
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/d$a;->b:Ljava/lang/String;

    .line 39
    .line 40
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/core/ui/greet/d$a;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/d$a;->b(Landroid/content/Intent;)V

    return-void
.end method


# virtual methods
.method public final b(Landroid/content/Intent;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/d$a;->a:Lcom/p1/mobile/putong/core/data/Greeting;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ljava/lang/NullPointerException;

    .line 10
    .line 11
    new-instance v1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v2, "greetact_greetInfo_null,from:"

    .line 14
    .line 15
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/greet/d$a;->e:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    new-instance v0, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;

    .line 34
    .line 35
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;-><init>()V

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/d$a;->a:Lcom/p1/mobile/putong/core/data/Greeting;

    .line 39
    .line 40
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;->greetInfo:Lcom/p1/mobile/putong/core/data/Greeting;

    .line 41
    .line 42
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/greet/d$a;->c:Z

    .line 43
    .line 44
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;->finishForReport:Z

    .line 45
    .line 46
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/greet/d$a;->d:Z

    .line 47
    .line 48
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;->isStartHomeCard:Z

    .line 49
    .line 50
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/d$a;->e:Ljava/lang/String;

    .line 51
    .line 52
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;->from:Ljava/lang/String;

    .line 53
    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/d$a;->f:Ljava/lang/String;

    .line 55
    .line 56
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;->preSendMsg:Ljava/lang/String;

    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/d$a;->g:Ljava/lang/String;

    .line 59
    .line 60
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;->stateId:Ljava/lang/String;

    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/d$a;->h:Ljava/lang/String;

    .line 63
    .line 64
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;->recommendReason:Ljava/lang/String;

    .line 65
    .line 66
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/greet/d$a;->i:I

    .line 67
    .line 68
    iput v1, v0, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;->hotLevel:I

    .line 69
    .line 70
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/greet/d$a;->m:Z

    .line 71
    .line 72
    iput-boolean p0, v0, Lcom/p1/mobile/putong/core/ui/greet/GreetingParam;->hasCreatedGreeting:Z

    .line 73
    .line 74
    const-string p0, "greet_param"

    .line 75
    .line 76
    invoke-virtual {p1, p0, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public c()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/d$a;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Lcom/p1/mobile/putong/core/data/Greeting;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/d$a;->a:Lcom/p1/mobile/putong/core/data/Greeting;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/d$a;->k:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/d$a;->j:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/d$a;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/d$a;->n:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public i()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/d$a;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public j(Z)Lcom/p1/mobile/putong/core/ui/greet/d$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/greet/d$a;->l:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public k(Z)Lcom/p1/mobile/putong/core/ui/greet/d$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/greet/d$a;->d:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public l(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/greet/d$a;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/d$a;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public m(Ljava/lang/Object;)Lcom/p1/mobile/putong/core/ui/greet/d$a;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/d$a;->k:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public n(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/greet/d$a;
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/d$a;->j:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/d$a;->a:Lcom/p1/mobile/putong/core/data/Greeting;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Greeting;->moment:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 6
    .line 7
    iput-object p1, v0, Lcom/p1/mobile/putong/data/IdBoxed;->id:Ljava/lang/String;

    .line 8
    .line 9
    return-object p0
.end method

.method public o(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/greet/d$a;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/d$a;->n:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public p(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/greet/d$a;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/d$a;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public q(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/greet/d$a;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/d$a;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public r(Lcom/p1/mobile/putong/core/data/Greeting;)Lcom/p1/mobile/putong/core/ui/greet/d$a;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/d$a;->a:Lcom/p1/mobile/putong/core/data/Greeting;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Greeting;->id:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/d$a;->b:Ljava/lang/String;

    .line 6
    .line 7
    return-object p0
.end method
