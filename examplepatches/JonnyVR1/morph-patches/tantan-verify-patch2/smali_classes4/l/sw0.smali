.class public Ll/sw0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/sw0$b;,
        Ll/sw0$c;
    }
.end annotation


# static fields
.field public static volatile b:Z = true


# instance fields
.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/sw0$c;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/sw0;->a:Ljava/util/List;

    .line 10
    .line 11
    instance-of v0, p1, Landroid/app/Application;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    new-instance v0, Ll/sw0$a;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Ll/sw0$a;-><init>(Ll/sw0;)V

    .line 18
    .line 19
    .line 20
    check-cast p1, Landroid/app/Application;

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Ll/sw0$a;)V
    .locals 0

    .line 26
    invoke-direct {p0, p1}, Ll/sw0;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method public static synthetic a(Ll/sw0;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sw0;->a:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public static c()Ll/sw0;
    .locals 1

    .line 1
    invoke-static {}, Ll/sw0$b;->a()Ll/sw0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method


# virtual methods
.method public b(Ll/sw0$c;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/sw0;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/sw0;->a:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
