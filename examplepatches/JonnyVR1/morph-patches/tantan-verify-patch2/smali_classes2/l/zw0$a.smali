.class public final Ll/zw0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/zw0;->c(Landroid/content/Context;Ljava/lang/String;Ll/zw0$b;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/content/Context;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/zw0$b;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ll/zw0$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zw0$a;->a:Landroid/content/Context;

    .line 2
    .line 3
    iput-object p2, p0, Ll/zw0$a;->b:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Ll/zw0$a;->c:Ll/zw0$b;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    invoke-static {p0}, Ll/ztb;->d(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    :try_start_0
    iget-object v0, p0, Ll/zw0$a;->a:Landroid/content/Context;

    .line 9
    .line 10
    iget-object v1, p0, Ll/zw0$a;->b:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v2, p0, Ll/zw0$a;->c:Ll/zw0$b;

    .line 13
    .line 14
    invoke-static {v0, v1, v2}, Ll/zw0;->a(Landroid/content/Context;Ljava/lang/String;Ll/zw0$b;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :catchall_0
    move-exception v0

    .line 19
    invoke-static {v0, p0}, Ll/ztb;->b(Ljava/lang/Throwable;Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
