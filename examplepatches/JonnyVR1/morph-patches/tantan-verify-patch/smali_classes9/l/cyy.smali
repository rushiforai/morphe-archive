.class public Ll/cyy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qxy;


# instance fields
.field public a:Ll/x20;

.field public b:Z


# direct methods
.method public constructor <init>(Ll/x20;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/cyy;->b:Z

    .line 6
    .line 7
    iput-object p1, p0, Ll/cyy;->a:Ll/x20;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public a()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyy;->a:Ll/x20;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/cyy;->a:Ll/x20;

    .line 10
    .line 11
    invoke-interface {v0}, Ll/x20;->call()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-boolean p0, p0, Ll/cyy;->b:Z

    .line 15
    .line 16
    return p0
.end method
