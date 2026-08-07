.class public final synthetic Ll/hz90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hz90;->a:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hz90;->a:Lcom/p1/mobile/putong/data/User;

    check-cast p1, Lcom/p1/mobile/putong/data/Tag;

    invoke-static {p0, p1}, Ll/jz90;->l0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Tag;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
