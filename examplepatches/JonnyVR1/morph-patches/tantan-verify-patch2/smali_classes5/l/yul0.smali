.class public final synthetic Ll/yul0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/qvl0;

.field public final synthetic b:Lcom/p1/mobile/putong/data/DoublePair;


# direct methods
.method public synthetic constructor <init>(Ll/qvl0;Lcom/p1/mobile/putong/data/DoublePair;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yul0;->a:Ll/qvl0;

    iput-object p2, p0, Ll/yul0;->b:Lcom/p1/mobile/putong/data/DoublePair;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yul0;->a:Ll/qvl0;

    iget-object p0, p0, Ll/yul0;->b:Lcom/p1/mobile/putong/data/DoublePair;

    check-cast p1, Ll/z80;

    invoke-static {v0, p0, p1}, Ll/qvl0;->p0(Ll/qvl0;Lcom/p1/mobile/putong/data/DoublePair;Ll/z80;)V

    return-void
.end method
