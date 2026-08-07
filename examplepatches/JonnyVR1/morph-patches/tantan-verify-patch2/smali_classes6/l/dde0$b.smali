.class public Ll/dde0$b;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/dde0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public final synthetic a:Ll/dde0;


# direct methods
.method public constructor <init>(Ll/dde0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dde0$b;->a:Ll/dde0;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Ll/dde0;Ll/ede0;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Ll/dde0$b;-><init>(Ll/dde0;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2

    .line 1
    iget v0, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    const/16 v1, 0x11

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/dde0$b;->a:Ll/dde0;

    .line 8
    .line 9
    invoke-static {v0}, Ll/dde0;->a(Ll/dde0;)Ll/dde0$a;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Ll/dde0$b;->a:Ll/dde0;

    .line 20
    .line 21
    invoke-static {p0}, Ll/dde0;->a(Ll/dde0;)Ll/dde0$a;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    iget p1, p1, Landroid/os/Message;->arg1:I

    .line 26
    .line 27
    invoke-interface {p0, p1}, Ll/dde0$a;->a(I)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method
