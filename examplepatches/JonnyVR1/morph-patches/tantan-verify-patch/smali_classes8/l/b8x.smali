.class public final synthetic Ll/b8x;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/k8x;


# direct methods
.method public synthetic constructor <init>(Ll/k8x;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/b8x;->a:Ll/k8x;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b8x;->a:Ll/k8x;

    check-cast p1, Lcom/p1/mobile/putong/core/data/UserPrivilege;

    invoke-static {p0, p1}, Ll/k8x;->k0(Ll/k8x;Lcom/p1/mobile/putong/core/data/UserPrivilege;)V

    return-void
.end method
