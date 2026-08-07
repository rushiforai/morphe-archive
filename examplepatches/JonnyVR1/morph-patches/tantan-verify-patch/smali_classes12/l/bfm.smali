.class public Ll/bfm;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/bfm$b;
    }
.end annotation


# instance fields
.field private a:Landroid/content/Context;

.field private b:Lcom/idv/identity/platform/config/CustomUIConfig;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ll/bfm$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/bfm;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static c()Ll/bfm;
    .locals 1

    .line 1
    sget-object v0, Ll/bfm$b;->a:Ll/bfm;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public a(ILjava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/azb;->u(ILjava/lang/String;)Lcom/idv/identity/platform/config/CustomUIConfig;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/idv/identity/platform/config/CustomUIConfig;->isValid()Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    iput-object p1, p0, Ll/bfm;->b:Lcom/idv/identity/platform/config/CustomUIConfig;

    .line 12
    .line 13
    :cond_0
    invoke-virtual {p1}, Lcom/idv/identity/platform/config/CustomUIConfig;->getErrMsg()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public b()Landroid/content/Context;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bfm;->a:Landroid/content/Context;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/xrl;->a()Ll/xrl;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/xrl;->b()Landroid/app/Activity;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Ll/bfm;->d(Landroid/content/Context;)Ll/bfm;

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object p0, p0, Ll/bfm;->a:Landroid/content/Context;

    .line 17
    .line 18
    return-object p0
.end method

.method public d(Landroid/content/Context;)Ll/bfm;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bfm;->a:Landroid/content/Context;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Ll/bfm;->a:Landroid/content/Context;

    .line 13
    .line 14
    :cond_1
    :goto_0
    return-object p0
.end method
