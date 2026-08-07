.class public final synthetic Ll/b450;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/e450;


# direct methods
.method public synthetic constructor <init>(Ll/e450;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/b450;->a:Ll/e450;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b450;->a:Ll/e450;

    check-cast p1, Lcom/p1/mobile/putong/core/data/UserPrivilege;

    invoke-static {p0, p1}, Ll/e450;->i0(Ll/e450;Lcom/p1/mobile/putong/core/data/UserPrivilege;)V

    return-void
.end method
