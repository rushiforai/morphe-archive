.class public final synthetic Ll/h16;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/Contact;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/Contact;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/h16;->a:Lcom/p1/mobile/putong/data/Contact;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h16;->a:Lcom/p1/mobile/putong/data/Contact;

    check-cast p1, Lcom/p1/mobile/putong/data/Contact;

    invoke-static {p0, p1}, Ll/q16;->l(Lcom/p1/mobile/putong/data/Contact;Lcom/p1/mobile/putong/data/Contact;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
