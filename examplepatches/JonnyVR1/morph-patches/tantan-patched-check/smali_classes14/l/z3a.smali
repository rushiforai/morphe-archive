.class public final synthetic Ll/z3a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/f4a;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/data/Links;


# direct methods
.method public synthetic constructor <init>(Ll/f4a;Ljava/lang/String;Lcom/p1/mobile/putong/data/Links;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z3a;->a:Ll/f4a;

    iput-object p2, p0, Ll/z3a;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/z3a;->c:Lcom/p1/mobile/putong/data/Links;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/z3a;->a:Ll/f4a;

    iget-object v1, p0, Ll/z3a;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/z3a;->c:Lcom/p1/mobile/putong/data/Links;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {v0, v1, p0, p1}, Ll/f4a;->i3(Ll/f4a;Ljava/lang/String;Lcom/p1/mobile/putong/data/Links;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
