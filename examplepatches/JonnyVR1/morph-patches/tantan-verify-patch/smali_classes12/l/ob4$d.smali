.class Ll/ob4$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ppr;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ob4;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/ob4;


# direct methods
.method public constructor <init>(Ll/ob4;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ob4$d;->a:Ll/ob4;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Landroid/os/Message;)V
    .locals 2

    .line 1
    iget v0, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eq v0, v1, :cond_1

    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    if-eq v0, v1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget p1, p1, Landroid/os/Message;->arg1:I

    .line 11
    .line 12
    iget-object p0, p0, Ll/ob4$d;->a:Ll/ob4;

    .line 13
    .line 14
    invoke-static {p0, p1}, Ll/ob4;->L0(Ll/ob4;I)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    new-instance v0, Ll/ob4$d$a;

    .line 19
    .line 20
    invoke-direct {v0, p0, p1}, Ll/ob4$d$a;-><init>(Ll/ob4$d;Landroid/os/Message;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v0}, Ll/w310;->b(Ljava/lang/Runnable;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method
