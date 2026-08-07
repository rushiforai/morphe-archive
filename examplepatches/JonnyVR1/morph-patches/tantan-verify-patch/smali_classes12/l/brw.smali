.class public Ll/brw;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:Z

.field private b:Ljava/lang/String;

.field private c:Ljava/lang/String;

.field private d:Ljava/lang/String;

.field private e:Z


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/brw;->a:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/brw;->e:Z

    .line 8
    .line 9
    return-void
.end method

.method public static a(Landroid/content/Intent;Ljava/lang/String;)Ll/brw;
    .locals 2

    .line 1
    new-instance v0, Ll/brw;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/brw;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    iput-boolean v1, v0, Ll/brw;->e:Z

    .line 8
    .line 9
    iput-object p1, v0, Ll/brw;->d:Ljava/lang/String;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const-string p1, "PARAM_SERVICE_ID"

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, v0, Ll/brw;->b:Ljava/lang/String;

    .line 20
    .line 21
    const-string p1, "PARAM_WORKER_ID"

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    iput-object p0, v0, Ll/brw;->c:Ljava/lang/String;

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    iput-boolean p0, v0, Ll/brw;->a:Z

    .line 31
    .line 32
    :cond_0
    return-object v0
.end method

.method public static b(Ljava/lang/String;)Ll/brw;
    .locals 2

    .line 1
    new-instance v0, Ll/brw;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/brw;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    iput-boolean v1, v0, Ll/brw;->e:Z

    .line 8
    .line 9
    iput-object p0, v0, Ll/brw;->d:Ljava/lang/String;

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    iput-boolean p0, v0, Ll/brw;->a:Z

    .line 13
    .line 14
    return-object v0
.end method


# virtual methods
.method public c()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/brw;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/brw;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/brw;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/brw;->a:Z

    .line 2
    .line 3
    return p0
.end method

.method public g()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/brw;->e:Z

    .line 2
    .line 3
    return p0
.end method
