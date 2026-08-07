.class public Ll/lxf$h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/could/huiyansdk/overseas/HuiYanResultCallBack;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/lxf;->t(Landroid/content/Context;Ljava/util/HashMap;Ll/ltl$b;)V
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
    iput-object p1, p0, Ll/lxf$h;->c:Ll/lxf;

    .line 2
    .line 3
    iput-object p2, p0, Ll/lxf$h;->a:Ll/kxf;

    .line 4
    .line 5
    iput-object p3, p0, Ll/lxf$h;->b:Ll/ltl$b;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onFail(ILjava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/lxf$h;->a:Ll/kxf;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iput-boolean v1, v0, Ll/kxf;->h:Z

    .line 5
    .line 6
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, v0, Ll/kxf;->b:Ljava/lang/String;

    .line 11
    .line 12
    iget-object p1, p0, Ll/lxf$h;->a:Ll/kxf;

    .line 13
    .line 14
    iput-object p2, p1, Ll/kxf;->d:Ljava/lang/String;

    .line 15
    .line 16
    iget-object p0, p0, Ll/lxf$h;->b:Ll/ltl$b;

    .line 17
    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    invoke-interface {p0, p1}, Ll/ltl$b;->a(Ll/kxf;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public onSuccess([BLjava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/lxf$h;->a:Ll/kxf;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    iput-boolean v1, v0, Ll/kxf;->h:Z

    .line 5
    .line 6
    iput-object p2, v0, Ll/kxf;->e:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p1, v0, Ll/kxf;->n:[B

    .line 9
    .line 10
    iget-object p0, p0, Ll/lxf$h;->b:Ll/ltl$b;

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    invoke-interface {p0, v0}, Ll/ltl$b;->a(Ll/kxf;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method
