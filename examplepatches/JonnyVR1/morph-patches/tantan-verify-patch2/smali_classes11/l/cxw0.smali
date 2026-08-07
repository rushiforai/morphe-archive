.class public final Ll/cxw0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Z

.field public final b:Ll/zww0;

.field public final c:Ll/xww0;

.field public final d:Ll/lxw0;

.field public e:Ll/dxw0;

.field public f:Ll/exw0;


# direct methods
.method public synthetic constructor <init>(Ll/lxw0;Ll/bxw0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object p2, Ll/zww0;->b:Ll/zww0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/cxw0;->b:Ll/zww0;

    .line 7
    .line 8
    const/4 p2, 0x0

    .line 9
    iput-object p2, p0, Ll/cxw0;->e:Ll/dxw0;

    .line 10
    .line 11
    iput-object p2, p0, Ll/cxw0;->f:Ll/exw0;

    .line 12
    .line 13
    iput-object p2, p0, Ll/cxw0;->c:Ll/xww0;

    .line 14
    .line 15
    iput-object p1, p0, Ll/cxw0;->d:Ll/lxw0;

    .line 16
    .line 17
    return-void
.end method

.method public static bridge synthetic a(Ll/cxw0;)Ll/xww0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cxw0;->c:Ll/xww0;

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0
.end method

.method public static bridge synthetic b(Ll/cxw0;)Ll/zww0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cxw0;->b:Ll/zww0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic f(Ll/cxw0;)Ll/dxw0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cxw0;->e:Ll/dxw0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic g(Ll/cxw0;)Ll/exw0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cxw0;->f:Ll/exw0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic h(Ll/cxw0;)Ll/lxw0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cxw0;->d:Ll/lxw0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic i(Ll/cxw0;Ll/exw0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cxw0;->f:Ll/exw0;

    .line 2
    .line 3
    return-void
.end method

.method public static bridge synthetic j(Ll/cxw0;Z)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Ll/cxw0;->a:Z

    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic k(Ll/cxw0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/cxw0;->a:Z

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public final c()Ll/zww0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cxw0;->b:Ll/zww0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d()Ll/cxw0;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cxw0;->f:Ll/exw0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {v0}, Ll/exw0;->c(Ll/exw0;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Ll/cxw0;->a:Z

    .line 10
    .line 11
    return-object p0
.end method

.method public final e()Ll/cxw0;
    .locals 1

    .line 1
    invoke-static {}, Ll/dxw0;->b()Ll/dxw0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Ll/cxw0;->e:Ll/dxw0;

    .line 6
    .line 7
    return-object p0
.end method
