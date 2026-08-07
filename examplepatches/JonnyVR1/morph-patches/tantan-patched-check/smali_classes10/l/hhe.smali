.class public final synthetic Ll/hhe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/jhe;

.field public final synthetic b:Ll/hre;

.field public final synthetic c:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/jhe;Ll/hre;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hhe;->a:Ll/jhe;

    iput-object p2, p0, Ll/hhe;->b:Ll/hre;

    iput-object p3, p0, Ll/hhe;->c:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hhe;->a:Ll/jhe;

    iget-object v1, p0, Ll/hhe;->b:Ll/hre;

    iget-object p0, p0, Ll/hhe;->c:Ll/x20;

    check-cast p1, Ll/udl0;

    invoke-static {v0, v1, p0, p1}, Ll/jhe;->n(Ll/jhe;Ll/hre;Ll/x20;Ll/udl0;)V

    return-void
.end method
