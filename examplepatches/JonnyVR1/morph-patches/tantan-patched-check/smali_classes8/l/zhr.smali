.class public final synthetic Ll/zhr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/cir;


# direct methods
.method public synthetic constructor <init>(Ll/cir;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zhr;->a:Ll/cir;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zhr;->a:Ll/cir;

    check-cast p1, Lcom/p1/mobile/putong/core/data/UserPrivilege;

    invoke-static {p0, p1}, Ll/cir;->f0(Ll/cir;Lcom/p1/mobile/putong/core/data/UserPrivilege;)V

    return-void
.end method
