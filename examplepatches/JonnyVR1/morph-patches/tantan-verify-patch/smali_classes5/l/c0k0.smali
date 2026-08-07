.class public final synthetic Ll/c0k0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/p0k0;

.field public final synthetic b:Ll/p0k0$b;


# direct methods
.method public synthetic constructor <init>(Ll/p0k0;Ll/p0k0$b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c0k0;->a:Ll/p0k0;

    iput-object p2, p0, Ll/c0k0;->b:Ll/p0k0$b;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/c0k0;->a:Ll/p0k0;

    iget-object p0, p0, Ll/c0k0;->b:Ll/p0k0$b;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {v0, p0, p1}, Ll/p0k0;->S(Ll/p0k0;Ll/p0k0$b;Lcom/p1/mobile/putong/data/Envelope;)Ll/p0k0$b;

    move-result-object p0

    return-object p0
.end method
