.class Ll/n410$l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/rpr;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/n410;->D0(ZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/n410;


# direct methods
.method public constructor <init>(Ll/n410;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/n410$l;->a:Ll/n410;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n410$l;->a:Ll/n410;

    .line 2
    .line 3
    iget-object p0, p0, Ll/n410;->i:Ll/xcl0;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xcl0;->p()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public b()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-static {}, Ll/lrw;->j()Ll/lrw;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/lrw;->h()Lcom/immomo/components/interfaces/IProcessOutput;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
