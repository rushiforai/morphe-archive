.class public final Ll/fjr0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Landroid/app/Application;


# direct methods
.method public synthetic constructor <init>(Ll/pmr0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a()Ll/m9r0;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fjr0;->a:Landroid/app/Application;

    .line 2
    .line 3
    const-class v1, Landroid/app/Application;

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/hku0;->b(Ljava/lang/Object;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Ll/zhr0;

    .line 9
    .line 10
    iget-object p0, p0, Ll/fjr0;->a:Landroid/app/Application;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-direct {v0, p0, v1}, Ll/zhr0;-><init>(Landroid/app/Application;Ll/pmr0;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method public final b(Landroid/app/Application;)Ll/fjr0;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/fjr0;->a:Landroid/app/Application;

    .line 5
    .line 6
    return-object p0
.end method
