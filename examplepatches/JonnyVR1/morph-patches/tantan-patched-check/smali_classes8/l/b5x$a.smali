.class public Ll/b5x$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/b5x;->a0()V
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
.field public final synthetic a:Ll/b5x;


# direct methods
.method public constructor <init>(Ll/b5x;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/b5x$a;->a:Ll/b5x;

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
    iget-object p1, p0, Ll/b5x$a;->a:Ll/b5x;

    .line 2
    .line 3
    invoke-static {p1}, Ll/b5x;->j0(Ll/b5x;)Ll/iam;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ll/d5x;

    .line 8
    .line 9
    iget-object p1, p1, Ll/d5x;->d:Lv/VImage;

    .line 10
    .line 11
    new-instance v0, Ll/b5x$a$a;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/b5x$a$a;-><init>(Ll/b5x$a;)V

    .line 14
    .line 15
    .line 16
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/b5x$a;->a(Landroid/os/Bundle;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
