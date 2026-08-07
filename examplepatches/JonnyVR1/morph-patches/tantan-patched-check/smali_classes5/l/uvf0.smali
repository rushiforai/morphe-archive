.class public final synthetic Ll/uvf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/yvf0;


# direct methods
.method public synthetic constructor <init>(Ll/yvf0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uvf0;->a:Ll/yvf0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uvf0;->a:Ll/yvf0;

    check-cast p1, Lcom/p1/mobile/putong/core/data/UserPrivilege;

    invoke-static {p0, p1}, Ll/yvf0;->i0(Ll/yvf0;Lcom/p1/mobile/putong/core/data/UserPrivilege;)V

    return-void
.end method
