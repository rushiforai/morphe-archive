.class public final synthetic Ll/jfp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/kfp;


# direct methods
.method public synthetic constructor <init>(Ll/kfp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jfp;->a:Ll/kfp;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jfp;->a:Ll/kfp;

    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/d;

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    invoke-static {p0, p1, p2}, Ll/kfp;->i(Ll/kfp;Lcom/p1/mobile/putong/core/ui/purchase/d;Z)V

    return-void
.end method
