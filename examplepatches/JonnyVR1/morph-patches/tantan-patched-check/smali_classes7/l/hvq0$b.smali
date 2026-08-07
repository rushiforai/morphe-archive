.class Ll/hvq0$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/hvq0;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroid/content/Context;

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:Landroid/app/NotificationChannel;

.field final synthetic d:Ll/hvq0;


# direct methods
.method public constructor <init>(Ll/hvq0;Landroid/content/Context;Ljava/lang/String;Landroid/app/NotificationChannel;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hvq0$b;->d:Ll/hvq0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/hvq0$b;->a:Landroid/content/Context;

    .line 4
    .line 5
    iput-object p3, p0, Ll/hvq0$b;->b:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p4, p0, Ll/hvq0$b;->c:Landroid/app/NotificationChannel;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hvq0$b;->a:Landroid/content/Context;

    .line 2
    .line 3
    iget-object v1, p0, Ll/hvq0$b;->b:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p0, p0, Ll/hvq0$b;->c:Landroid/app/NotificationChannel;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Lcom/xiaomi/push/service/f;->a(Landroid/content/Context;Ljava/lang/String;Landroid/app/NotificationChannel;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public synthetic call()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hvq0$b;->a()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
