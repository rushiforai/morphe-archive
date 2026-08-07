.class public abstract Ll/iye$c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/iye;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "c"
.end annotation


# instance fields
.field public final a:Ll/iye$f;

.field public b:Z

.field public c:Z

.field public d:[I

.field public e:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ll/iye$d;",
            ">;"
        }
    .end annotation
.end field

.field public f:Z

.field public g:I

.field public h:I


# direct methods
.method public constructor <init>(Ll/iye$f;)V
    .locals 1
    .param p1    # Ll/iye$f;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const v0, -0xff0100

    .line 5
    .line 6
    .line 7
    iput v0, p0, Ll/iye$c;->g:I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput v0, p0, Ll/iye$c;->h:I

    .line 11
    .line 12
    const-string v0, "metadataLoader cannot be null."

    .line 13
    .line 14
    invoke-static {p1, v0}, Ll/yn80;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Ll/iye$c;->a:Ll/iye$f;

    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public a(Ll/iye$d;)Ll/iye$c;
    .locals 1
    .param p1    # Ll/iye$d;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const-string v0, "initCallback cannot be null"

    .line 2
    .line 3
    invoke-static {p1, v0}, Ll/yn80;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/iye$c;->e:Ljava/util/Set;

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    new-instance v0, Ll/p01;

    .line 11
    .line 12
    invoke-direct {v0}, Ll/p01;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/iye$c;->e:Ljava/util/Set;

    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Ll/iye$c;->e:Ljava/util/Set;

    .line 18
    .line 19
    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    return-object p0
.end method

.method public b(I)Ll/iye$c;
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    iput p1, p0, Ll/iye$c;->g:I

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Z)Ll/iye$c;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/iye$c;->b:Z

    .line 2
    .line 3
    return-object p0
.end method
