.class public final synthetic Ll/cif;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomQuestionTypeFrag;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomQuestionTypeFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cif;->a:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomQuestionTypeFrag;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cif;->a:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomQuestionTypeFrag;

    check-cast p1, Lcom/p1/mobile/putong/core/data/Question;

    check-cast p2, Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomQuestionTypeFrag;->f5(Lcom/p1/mobile/putong/core/data/Question;Ljava/lang/String;)V

    return-void
.end method
