.class public Ll/ybh0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ybh0;->d0(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y20<",
        "Ll/uxj0;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/ybh0;


# direct methods
.method public constructor <init>(Ll/ybh0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ybh0$a;->a:Ll/ybh0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ll/uxj0;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/och0;->d()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/ybh0$a;->a:Ll/ybh0;

    .line 5
    .line 6
    invoke-static {p1}, Ll/ybh0;->Y(Ll/ybh0;)Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iget-object v0, p0, Ll/ybh0$a;->a:Ll/ybh0;

    .line 11
    .line 12
    invoke-static {v0}, Ll/ybh0;->Y(Ll/ybh0;)Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object p0, p0, Ll/ybh0$a;->a:Ll/ybh0;

    .line 17
    .line 18
    invoke-static {p0}, Ll/ybh0;->Z(Ll/ybh0;)Lcom/p1/mobile/putong/data/User;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    invoke-static {v0, p0, v1, v1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->k2(Landroid/content/Context;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/uxj0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ybh0$a;->a(Ll/uxj0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
