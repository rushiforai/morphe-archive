.class public final synthetic Ll/sd5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/fe5;


# direct methods
.method public synthetic constructor <init>(Ll/fe5;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sd5;->a:Ll/fe5;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sd5;->a:Ll/fe5;

    check-cast p1, Lcom/p1/mobile/putong/core/data/UserPrivilege;

    invoke-static {p0, p1}, Ll/fe5;->m(Ll/fe5;Lcom/p1/mobile/putong/core/data/UserPrivilege;)V

    return-void
.end method
