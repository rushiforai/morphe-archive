.class public final synthetic Ll/l3p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/r3p;


# direct methods
.method public synthetic constructor <init>(Ll/r3p;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l3p;->a:Ll/r3p;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l3p;->a:Ll/r3p;

    check-cast p1, Lcom/p1/mobile/putong/core/ui/purchase/d;

    invoke-static {p0, p1}, Ll/r3p;->d(Ll/r3p;Lcom/p1/mobile/putong/core/ui/purchase/d;)V

    return-void
.end method
