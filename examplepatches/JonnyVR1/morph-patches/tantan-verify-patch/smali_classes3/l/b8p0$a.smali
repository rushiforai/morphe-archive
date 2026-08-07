.class public Ll/b8p0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/b8p0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y20<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/b8p0;


# direct methods
.method public constructor <init>(Ll/b8p0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/b8p0$a;->a:Ll/b8p0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/b8p0$a;->a:Ll/b8p0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/b8p0;->c(Ll/b8p0;)Ll/j8p0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/b8p0$a;->a:Ll/b8p0;

    .line 14
    .line 15
    invoke-static {v0}, Ll/b8p0;->c(Ll/b8p0;)Ll/j8p0;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0, p1}, Ll/j8p0;->J4(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object p0, p0, Ll/b8p0$a;->a:Ll/b8p0;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/b8p0;->e()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/b8p0$a;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
