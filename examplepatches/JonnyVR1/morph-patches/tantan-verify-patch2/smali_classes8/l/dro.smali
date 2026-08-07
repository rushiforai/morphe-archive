.class public final synthetic Ll/dro;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dro;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/dro;->b:Lcom/p1/mobile/putong/data/User;

    iput-object p3, p0, Ll/dro;->c:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dro;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/dro;->b:Lcom/p1/mobile/putong/data/User;

    iget-object p0, p0, Ll/dro;->c:Ll/x20;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/match/a;->m(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Ll/x20;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method
