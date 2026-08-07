.class public Ll/cqj$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/cqj;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Ll/coj;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic a(Ll/cqj$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cqj$a;->c:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic b(Ll/cqj$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cqj$a;->b:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic c(Ll/cqj$a;)Ll/coj;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cqj$a;->a:Ll/coj;

    return-object p0
.end method


# virtual methods
.method public d()Ll/cqj;
    .locals 2

    .line 1
    new-instance v0, Ll/cqj;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Ll/cqj;-><init>(Ll/cqj$a;Ll/dqj;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public e(Ll/coj;Ljava/lang/String;)Ll/cqj$a;
    .locals 0
    .param p1    # Ll/coj;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/cqj$a;->a:Ll/coj;

    .line 2
    .line 3
    iput-object p2, p0, Ll/cqj$a;->b:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public f(Ll/coj;)Ll/cqj$a;
    .locals 0
    .param p1    # Ll/coj;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/cqj$a;->a:Ll/coj;

    .line 2
    .line 3
    const-string p1, "extra_type_multi_call"

    .line 4
    .line 5
    iput-object p1, p0, Ll/cqj$a;->b:Ljava/lang/String;

    .line 6
    .line 7
    return-object p0
.end method

.method public g(Ll/coj;)Ll/cqj$a;
    .locals 0
    .param p1    # Ll/coj;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/cqj$a;->a:Ll/coj;

    .line 2
    .line 3
    const-string p1, "extra_type_audience"

    .line 4
    .line 5
    iput-object p1, p0, Ll/cqj$a;->b:Ljava/lang/String;

    .line 6
    .line 7
    return-object p0
.end method

.method public h(Ll/coj;)Ll/cqj$a;
    .locals 0
    .param p1    # Ll/coj;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/cqj$a;->a:Ll/coj;

    .line 2
    .line 3
    const-string p1, "extra_type_lian_mai"

    .line 4
    .line 5
    iput-object p1, p0, Ll/cqj$a;->b:Ljava/lang/String;

    .line 6
    .line 7
    return-object p0
.end method
