.class public final synthetic Ll/mra0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/Question;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/Question;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mra0;->a:Lcom/p1/mobile/putong/core/data/Question;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mra0;->a:Lcom/p1/mobile/putong/core/data/Question;

    check-cast p1, Lcom/p1/mobile/putong/data/Answer;

    invoke-static {p0, p1}, Ll/tra0;->a(Lcom/p1/mobile/putong/core/data/Question;Lcom/p1/mobile/putong/data/Answer;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
