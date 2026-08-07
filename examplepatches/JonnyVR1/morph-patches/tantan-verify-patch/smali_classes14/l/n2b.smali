.class public final synthetic Ll/n2b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/CoreSuggested;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n2b;->a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iput-boolean p2, p0, Ll/n2b;->b:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/n2b;->a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iget-boolean p0, p0, Ll/n2b;->b:Z

    check-cast p1, Ll/pf60;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->L3(Lcom/p1/mobile/putong/core/api/CoreSuggested;ZLl/pf60;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
