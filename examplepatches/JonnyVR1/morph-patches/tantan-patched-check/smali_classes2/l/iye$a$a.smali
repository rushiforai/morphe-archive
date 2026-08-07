.class public Ll/iye$a$a;
.super Ll/iye$g;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/iye$a;->b()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/iye$a;


# direct methods
.method public constructor <init>(Ll/iye$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/iye$a$a;->a:Ll/iye$a;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/iye$g;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Throwable;)V
    .locals 0
    .param p1    # Ljava/lang/Throwable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/iye$a$a;->a:Ll/iye$a;

    .line 2
    .line 3
    iget-object p0, p0, Ll/iye$b;->a:Ll/iye;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/iye;->k(Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public b(Ll/ha00;)V
    .locals 0
    .param p1    # Ll/ha00;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/iye$a$a;->a:Ll/iye$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/iye$a;->e(Ll/ha00;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
