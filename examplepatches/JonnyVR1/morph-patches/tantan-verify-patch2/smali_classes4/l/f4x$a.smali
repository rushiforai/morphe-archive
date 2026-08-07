.class public Ll/f4x$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/f4x;->a0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y20<",
        "Landroid/os/Bundle;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/f4x;


# direct methods
.method public constructor <init>(Ll/f4x;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/f4x$a;->a:Ll/f4x;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/f4x$a;->a:Ll/f4x;

    .line 2
    .line 3
    invoke-static {p1}, Ll/f4x;->n0(Ll/f4x;)Ll/iam;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->m(Z)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/f4x$a;->a:Ll/f4x;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/f4x;->G0()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/f4x$a;->a(Landroid/os/Bundle;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
