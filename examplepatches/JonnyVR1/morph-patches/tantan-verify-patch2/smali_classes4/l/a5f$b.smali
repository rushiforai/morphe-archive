.class public Ll/a5f$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/beatles/NetConnectivityReceiver$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/a5f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public final synthetic a:Ll/a5f;


# direct methods
.method public constructor <init>(Ll/a5f;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/a5f$b;->a:Ll/a5f;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object p1, p0, Ll/a5f$b;->a:Ll/a5f;

    .line 4
    .line 5
    invoke-static {p1}, Ll/a5f;->d(Ll/a5f;)Ll/q3k0;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Ll/q3k0;->m()V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/du2;->u()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-nez p1, :cond_0

    .line 17
    .line 18
    iget-object p1, p0, Ll/a5f$b;->a:Ll/a5f;

    .line 19
    .line 20
    invoke-static {p1}, Ll/a5f;->e(Ll/a5f;)Ll/zx3;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1}, Ll/zx3;->g()V

    .line 25
    .line 26
    .line 27
    :cond_0
    iget-object p0, p0, Ll/a5f$b;->a:Ll/a5f;

    .line 28
    .line 29
    invoke-static {p0}, Ll/a5f;->f(Ll/a5f;)Ll/v31;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0}, Ll/v31;->p()V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method
