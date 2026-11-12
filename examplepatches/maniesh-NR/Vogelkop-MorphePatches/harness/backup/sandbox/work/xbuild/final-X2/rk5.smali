.class public final Lrk5;
.super Lcom/leanplum/callbacks/StartCallback;
.source "SourceFile"


# instance fields
.field public final synthetic a:Luk5;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Luk5;Ljava/lang/String;)V
    .registers 3

    iput-object p1, p0, Lrk5;->a:Luk5;

    iput-object p2, p0, Lrk5;->b:Ljava/lang/String;

    invoke-direct {p0}, Lcom/leanplum/callbacks/StartCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public final onResponse(Z)V
    .registers 3

    iget-object v0, p0, Lrk5;->a:Luk5;

    if-nez p1, :cond_14

    new-instance p0, Ldzh;

    const-string p1, "Onboarding"

    invoke-direct {p0, p1}, Ldzh;-><init>(Ljava/lang/String;)V

    new-instance p1, Lrw7;

    invoke-direct {p1, p0}, Lrw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, p1}, Luk5;->run(Ljava/lang/Object;)V

    return-void

    :cond_14
    const-string p1, "configBundle"

    iget-object p0, p0, Lrk5;->b:Ljava/lang/String;

    invoke-static {p1, p0}, Lcom/leanplum/Leanplum;->setCustomParam(Ljava/lang/String;Ljava/lang/Object;)V

    new-instance p0, Lqk5;

    const/4 p1, 0x1

    invoke-direct {p0, v0, p1}, Lqk5;-><init>(Luk5;B)V

    invoke-static {p0}, Lcom/leanplum/Leanplum;->forceContentUpdate(Lcom/leanplum/callbacks/VariablesChangedCallback;)V

    return-void
.end method
