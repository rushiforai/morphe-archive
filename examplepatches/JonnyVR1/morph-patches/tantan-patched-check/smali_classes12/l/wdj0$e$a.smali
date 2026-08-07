.class Ll/wdj0$e$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/wdj0$e;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/wdj0$e;


# direct methods
.method public constructor <init>(Ll/wdj0$e;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wdj0$e$a;->a:Ll/wdj0$e;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    invoke-static {}, Ll/wdj0;->s()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "onToygerComplete:\u751f\u6210\u8ba4\u8bc1\u89c6\u9891"

    .line 6
    .line 7
    invoke-static {v0, v1}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/wdj0$e$a;->a:Ll/wdj0$e;

    .line 11
    .line 12
    iget-object v0, v0, Ll/wdj0$e;->a:Ll/wdj0;

    .line 13
    .line 14
    invoke-static {v0}, Ll/wdj0;->q(Ll/wdj0;)Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    sget-object v2, Ll/vdj0;->a:Ljava/lang/String;

    .line 19
    .line 20
    iget-object p0, p0, Ll/wdj0$e$a;->a:Ll/wdj0$e;

    .line 21
    .line 22
    iget-object p0, p0, Ll/wdj0$e;->a:Ll/wdj0;

    .line 23
    .line 24
    invoke-static {p0}, Ll/wdj0;->x(Ll/wdj0;)Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {v0, v1, v2, p0}, Ll/wdj0;->r(Ll/wdj0;Landroid/content/Context;Ljava/lang/String;Ljava/util/concurrent/CopyOnWriteArrayList;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method
