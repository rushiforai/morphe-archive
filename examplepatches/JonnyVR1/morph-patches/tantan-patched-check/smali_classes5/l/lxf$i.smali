.class public Ll/lxf$i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/could/huiyansdk/overseas/HuiYanOsAuthCallBack;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/lxf;->u(Landroid/content/Context;Ljava/util/HashMap;Ll/ltl$b;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/kxf;

.field public final synthetic b:Ll/ltl$b;

.field public final synthetic c:Ll/lxf;


# direct methods
.method public constructor <init>(Ll/lxf;Ll/kxf;Ll/ltl$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/lxf$i;->c:Ll/lxf;

    .line 2
    .line 3
    iput-object p2, p0, Ll/lxf$i;->a:Ll/kxf;

    .line 4
    .line 5
    iput-object p3, p0, Ll/lxf$i;->b:Ll/ltl$b;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onFail(ILjava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object p3, p0, Ll/lxf$i;->a:Ll/kxf;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x3

    .line 12
    if-eq v0, v1, :cond_0

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    :goto_0
    iput-boolean v0, p3, Ll/kxf;->h:Z

    .line 18
    .line 19
    iget-object p3, p0, Ll/lxf$i;->a:Ll/kxf;

    .line 20
    .line 21
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iput-object p1, p3, Ll/kxf;->b:Ljava/lang/String;

    .line 26
    .line 27
    iget-object p1, p0, Ll/lxf$i;->a:Ll/kxf;

    .line 28
    .line 29
    iput-object p2, p1, Ll/kxf;->d:Ljava/lang/String;

    .line 30
    .line 31
    iget-object p0, p0, Ll/lxf$i;->b:Ll/ltl$b;

    .line 32
    .line 33
    if-eqz p0, :cond_1

    .line 34
    .line 35
    invoke-interface {p0, p1}, Ll/ltl$b;->a(Ll/kxf;)V

    .line 36
    .line 37
    .line 38
    :cond_1
    return-void
.end method

.method public onSuccess(Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthResult;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/lxf$i;->a:Ll/kxf;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    iput-boolean v0, p1, Ll/kxf;->h:Z

    .line 5
    .line 6
    iget-object p0, p0, Ll/lxf$i;->b:Ll/ltl$b;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-interface {p0, p1}, Ll/ltl$b;->a(Ll/kxf;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method
