.class public final synthetic Ll/ihe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/hre;

.field public final synthetic b:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/hre;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ihe;->a:Ll/hre;

    iput-object p2, p0, Ll/ihe;->b:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ihe;->a:Ll/hre;

    iget-object p0, p0, Ll/ihe;->b:Ll/x20;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, p0, p1}, Ll/jhe;->l(Ll/hre;Ll/x20;Ljava/lang/Throwable;)V

    return-void
.end method
