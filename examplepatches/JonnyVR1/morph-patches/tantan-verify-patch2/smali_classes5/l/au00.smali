.class public final synthetic Ll/au00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/visitor/c;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/visitor/c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/au00;->a:Lcom/p1/mobile/putong/core/ui/visitor/c;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/au00;->a:Lcom/p1/mobile/putong/core/ui/visitor/c;

    check-cast p1, Lcom/p1/mobile/putong/core/data/VisitorSetting;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/c;->u0(Lcom/p1/mobile/putong/core/ui/visitor/c;Lcom/p1/mobile/putong/core/data/VisitorSetting;)V

    return-void
.end method
