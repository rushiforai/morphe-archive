.class public final synthetic Ll/wrl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/gsl0;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/data/DoublePair;


# direct methods
.method public synthetic constructor <init>(Ll/gsl0;Ljava/lang/String;Lcom/p1/mobile/putong/data/DoublePair;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wrl0;->a:Ll/gsl0;

    iput-object p2, p0, Ll/wrl0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/wrl0;->c:Lcom/p1/mobile/putong/data/DoublePair;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wrl0;->a:Ll/gsl0;

    iget-object v1, p0, Ll/wrl0;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/wrl0;->c:Lcom/p1/mobile/putong/data/DoublePair;

    check-cast p1, Ll/z80;

    invoke-static {v0, v1, p0, p1}, Ll/gsl0;->r0(Ll/gsl0;Ljava/lang/String;Lcom/p1/mobile/putong/data/DoublePair;Ll/z80;)V

    return-void
.end method
