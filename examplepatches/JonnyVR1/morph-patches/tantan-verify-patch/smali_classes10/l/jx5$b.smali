.class public Ll/jx5$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/jx5;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public final synthetic a:Ll/jx5;


# direct methods
.method public constructor <init>(Ll/jx5;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jx5$b;->a:Ll/jx5;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Ll/jx5;Ll/kx5;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Ll/jx5$b;-><init>(Ll/jx5;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)Z
    .locals 2

    .line 1
    iget p1, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p1, v0, :cond_3

    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    if-eq p1, v1, :cond_2

    .line 8
    .line 9
    const/4 v1, 0x3

    .line 10
    if-eq p1, v1, :cond_1

    .line 11
    .line 12
    const/4 v1, 0x4

    .line 13
    if-eq p1, v1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object p0, p0, Ll/jx5$b;->a:Ll/jx5;

    .line 17
    .line 18
    invoke-static {p0}, Ll/jx5;->m(Ll/jx5;)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    iget-object p0, p0, Ll/jx5$b;->a:Ll/jx5;

    .line 23
    .line 24
    invoke-static {p0}, Ll/jx5;->l(Ll/jx5;)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_2
    iget-object p0, p0, Ll/jx5$b;->a:Ll/jx5;

    .line 29
    .line 30
    invoke-static {p0}, Ll/jx5;->j(Ll/jx5;)V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_3
    iget-object p0, p0, Ll/jx5$b;->a:Ll/jx5;

    .line 35
    .line 36
    invoke-static {p0}, Ll/jx5;->k(Ll/jx5;)V

    .line 37
    .line 38
    .line 39
    :goto_0
    return v0
.end method
