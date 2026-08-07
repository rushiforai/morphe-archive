.class public final synthetic Ll/mxm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/nxm;


# direct methods
.method public synthetic constructor <init>(Ll/nxm;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mxm;->a:Ll/nxm;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mxm;->a:Ll/nxm;

    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/d;

    check-cast p2, Ljava/lang/Boolean;

    invoke-static {p0, p1, p2}, Ll/nxm;->c(Ll/nxm;Lcom/p1/mobile/putong/core/ui/purchase/d;Ljava/lang/Boolean;)V

    return-void
.end method
