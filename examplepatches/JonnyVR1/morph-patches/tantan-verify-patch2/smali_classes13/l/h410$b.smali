.class Ll/h410$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/o410$f;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/h410;->A(Lcom/momo/pub/MomoPipelineModuleRegister$b;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/h410;


# direct methods
.method public constructor <init>(Ll/h410;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/h410$b;->a:Ll/h410;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public P0(Ll/g510;IIII)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h410$b;->a:Ll/h410;

    .line 2
    .line 3
    iget-object p0, p0, Ll/h410;->r:Ll/q210$c;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    const/4 p2, 0x0

    .line 9
    invoke-interface {p0, p2, p2, p1}, Ll/q210$c;->a(IILjava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method
