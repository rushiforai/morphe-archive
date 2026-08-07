.class public Ll/k50;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static e:Ll/k50;


# instance fields
.field private final a:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field b:Landroid/app/Application;

.field private c:Z

.field d:Landroid/app/Application$ActivityLifecycleCallbacks;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/k50;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/k50;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/k50;->e:Ll/k50;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/LinkedList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/k50;->a:Ljava/util/LinkedList;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Ll/k50;->c:Z

    .line 13
    .line 14
    new-instance v0, Ll/k50$a;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Ll/k50$a;-><init>(Ll/k50;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/k50;->d:Landroid/app/Application$ActivityLifecycleCallbacks;

    .line 20
    .line 21
    return-void
.end method

.method public static synthetic a(Ll/k50;)Ljava/util/LinkedList;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k50;->a:Ljava/util/LinkedList;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Ll/k50;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/k50;->c:Z

    .line 2
    .line 3
    return p1
.end method

.method public static c()Ll/k50;
    .locals 1

    .line 1
    sget-object v0, Ll/k50;->e:Ll/k50;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public d(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Landroid/app/Application;

    .line 6
    .line 7
    iput-object p1, p0, Ll/k50;->b:Landroid/app/Application;

    .line 8
    .line 9
    iget-object p0, p0, Ll/k50;->d:Landroid/app/Application$ActivityLifecycleCallbacks;

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public e()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/k50;->b:Landroid/app/Application;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/k50;->d:Landroid/app/Application$ActivityLifecycleCallbacks;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Landroid/app/Application;->unregisterActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    sget-object p0, Ll/k50;->e:Ll/k50;

    .line 11
    .line 12
    iget-object p0, p0, Ll/k50;->a:Ljava/util/LinkedList;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/util/LinkedList;->clear()V

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    sput-object p0, Ll/k50;->e:Ll/k50;

    .line 19
    .line 20
    return-void
.end method
