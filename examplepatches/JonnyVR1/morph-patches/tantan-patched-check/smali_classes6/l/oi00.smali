.class public final synthetic Ll/oi00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/hj00;


# direct methods
.method public synthetic constructor <init>(Ll/hj00;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/oi00;->a:Ll/hj00;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oi00;->a:Ll/hj00;

    check-cast p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    invoke-static {p0, p1}, Ll/hj00;->n0(Ll/hj00;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
