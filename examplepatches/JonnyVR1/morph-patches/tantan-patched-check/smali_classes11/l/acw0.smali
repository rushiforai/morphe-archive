.class public final synthetic Ll/acw0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/dcw0;

.field public final synthetic b:Ll/mbw0;


# direct methods
.method public synthetic constructor <init>(Ll/dcw0;Ll/mbw0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/acw0;->a:Ll/dcw0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/acw0;->b:Ll/mbw0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/acw0;->a:Ll/dcw0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/dcw0;->f:Ll/ecw0;

    .line 4
    .line 5
    invoke-static {v0}, Ll/ecw0;->c(Ll/ecw0;)Ll/fcw0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Ll/acw0;->b:Ll/mbw0;

    .line 10
    .line 11
    invoke-interface {v0, p0}, Ll/fcw0;->P(Ll/mbw0;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
