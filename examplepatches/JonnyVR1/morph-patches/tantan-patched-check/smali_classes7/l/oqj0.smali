.class public final synthetic Ll/oqj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/jrj0;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Questionnaire;


# direct methods
.method public synthetic constructor <init>(Ll/jrj0;Lcom/p1/mobile/putong/core/data/Questionnaire;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/oqj0;->a:Ll/jrj0;

    iput-object p2, p0, Ll/oqj0;->b:Lcom/p1/mobile/putong/core/data/Questionnaire;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/oqj0;->a:Ll/jrj0;

    iget-object p0, p0, Ll/oqj0;->b:Lcom/p1/mobile/putong/core/data/Questionnaire;

    invoke-static {v0, p0}, Ll/jrj0;->J(Ll/jrj0;Lcom/p1/mobile/putong/core/data/Questionnaire;)V

    return-void
.end method
