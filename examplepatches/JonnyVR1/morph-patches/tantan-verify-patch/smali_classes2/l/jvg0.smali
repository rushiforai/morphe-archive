.class public final Ll/jvg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltech/sud/runtime/a/a$a;


# instance fields
.field public final synthetic a:Ll/pgg0;


# direct methods
.method public constructor <init>(Ll/pgg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jvg0;->a:Ll/pgg0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jvg0;->a:Ll/pgg0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/pgg0;->a:Ll/yxg0;

    .line 4
    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    const-string v1, "true"

    .line 8
    .line 9
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/jvg0;->a:Ll/pgg0;

    .line 16
    .line 17
    iget-object p0, p0, Ll/pgg0;->j:Landroid/widget/FrameLayout;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    :goto_0
    iget-object p1, v0, Ll/yxg0;->c:Ltech/sud/runtime/a/c;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_1
    invoke-interface {p1, p0}, Ltech/sud/runtime/a/a;->a(Landroid/widget/FrameLayout;)V

    .line 27
    .line 28
    .line 29
    :cond_2
    :goto_1
    return-void
.end method
