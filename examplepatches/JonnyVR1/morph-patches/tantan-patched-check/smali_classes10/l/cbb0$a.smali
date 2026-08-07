.class public Ll/cbb0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x3m;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/cbb0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/cbb0;


# direct methods
.method public constructor <init>(Ll/cbb0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cbb0$a;->a:Ll/cbb0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Landroid/app/Dialog;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/cbb0$a;->a:Ll/cbb0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/q0m;->d()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object p0, p0, Ll/cbb0$a;->a:Ll/cbb0;

    .line 11
    .line 12
    invoke-static {p0}, Ll/cbb0;->g(Ll/cbb0;)Ll/msf0;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const/4 p1, 0x1

    .line 17
    invoke-virtual {p0, p1}, Ll/msf0;->c(Z)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public b(Landroid/app/Dialog;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cbb0$a;->a:Ll/cbb0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/cbb0;->g(Ll/cbb0;)Ll/msf0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 p1, 0x0

    .line 8
    invoke-virtual {p0, p1}, Ll/msf0;->c(Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
