.class public final synthetic Ll/xfb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/yfb0;


# direct methods
.method public synthetic constructor <init>(Ll/yfb0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xfb0;->a:Ll/yfb0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xfb0;->a:Ll/yfb0;

    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/d;

    invoke-static {p0, p1}, Ll/yfb0;->b0(Ll/yfb0;Lcom/p1/mobile/putong/core/ui/purchase/d;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
