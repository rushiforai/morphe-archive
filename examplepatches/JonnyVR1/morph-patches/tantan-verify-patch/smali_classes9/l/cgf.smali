.class public final synthetic Ll/cgf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/Answer;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/Answer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cgf;->a:Lcom/p1/mobile/putong/data/Answer;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cgf;->a:Lcom/p1/mobile/putong/data/Answer;

    check-cast p1, Lcom/p1/mobile/putong/data/Answer;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputMyQuestion;->a(Lcom/p1/mobile/putong/data/Answer;Lcom/p1/mobile/putong/data/Answer;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
