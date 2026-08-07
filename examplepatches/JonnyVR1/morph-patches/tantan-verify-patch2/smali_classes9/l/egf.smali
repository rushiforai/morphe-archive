.class public final synthetic Ll/egf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputProfession;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputProfession;Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/egf;->a:Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputProfession;

    iput-object p2, p0, Ll/egf;->b:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/egf;->a:Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputProfession;

    iget-object p0, p0, Ll/egf;->b:Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputProfession;->b(Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputProfession;Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileEditLoopBaseFrag;)V

    return-void
.end method
