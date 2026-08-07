.class public Ll/k26;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Z

.field public static b:Landroid/app/Application;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a()Landroid/app/Application;
    .locals 1

    .line 1
    sget-boolean v0, Ll/k26;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Ll/k26;->b:Landroid/app/Application;

    .line 6
    .line 7
    return-object v0

    .line 8
    :cond_0
    const-string v0, "you should call init first!"

    .line 9
    .line 10
    invoke-static {v0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    return-object v0
.end method

.method public static b(Landroid/content/Context;)V
    .locals 1

    .line 1
    instance-of v0, p0, Landroid/app/Application;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Landroid/app/Application;

    .line 6
    .line 7
    sput-object p0, Ll/k26;->b:Landroid/app/Application;

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Landroid/app/Application;

    .line 15
    .line 16
    sput-object p0, Ll/k26;->b:Landroid/app/Application;

    .line 17
    .line 18
    :goto_0
    const/4 p0, 0x1

    .line 19
    sput-boolean p0, Ll/k26;->a:Z

    .line 20
    .line 21
    return-void
.end method
