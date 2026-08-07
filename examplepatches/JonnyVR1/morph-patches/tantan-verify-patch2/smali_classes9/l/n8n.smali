.class public final synthetic Ll/n8n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/o8n;


# direct methods
.method public synthetic constructor <init>(Ll/o8n;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n8n;->a:Ll/o8n;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n8n;->a:Ll/o8n;

    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/d;

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    invoke-static {p0, p1, p2}, Ll/o8n;->g(Ll/o8n;Lcom/p1/mobile/putong/core/ui/purchase/d;Z)V

    return-void
.end method
