.class Ll/ob4$d$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ob4$d;->a(Landroid/os/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroid/os/Message;

.field final synthetic b:Ll/ob4$d;


# direct methods
.method public constructor <init>(Ll/ob4$d;Landroid/os/Message;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ob4$d$a;->b:Ll/ob4$d;

    .line 2
    .line 3
    iput-object p2, p0, Ll/ob4$d$a;->a:Landroid/os/Message;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ob4$d$a;->a:Landroid/os/Message;

    .line 2
    .line 3
    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v0, [Ljava/lang/Object;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    aget-object v1, v0, v1

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Ll/ob4$d$a;->b:Ll/ob4$d;

    .line 15
    .line 16
    iget-object p0, p0, Ll/ob4$d;->a:Ll/ob4;

    .line 17
    .line 18
    check-cast v1, Ll/crf0;

    .line 19
    .line 20
    const/4 v2, 0x1

    .line 21
    aget-object v0, v0, v2

    .line 22
    .line 23
    check-cast v0, Ll/xow;

    .line 24
    .line 25
    invoke-static {p0, v1, v0}, Ll/ob4;->K0(Ll/ob4;Ll/crf0;Ll/xow;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method
