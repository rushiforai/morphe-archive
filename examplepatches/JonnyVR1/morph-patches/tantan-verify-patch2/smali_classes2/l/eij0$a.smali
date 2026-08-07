.class public Ll/eij0$a;
.super Ll/yhj0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/eij0;->runAnimators()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/ygj0;

.field public final synthetic b:Ll/eij0;


# direct methods
.method public constructor <init>(Ll/eij0;Ll/ygj0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/eij0$a;->b:Ll/eij0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/eij0$a;->a:Ll/ygj0;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/yhj0;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public c(Ll/ygj0;)V
    .locals 1
    .param p1    # Ll/ygj0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/eij0$a;->a:Ll/ygj0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ygj0;->runAnimators()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, p0}, Ll/ygj0;->removeListener(Ll/ygj0$g;)Ll/ygj0;

    .line 7
    .line 8
    .line 9
    return-void
.end method
