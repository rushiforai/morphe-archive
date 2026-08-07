.class public final synthetic Ll/c3b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

.field public final synthetic b:Z

.field public final synthetic c:Lrx/subjects/a;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/CoreSuggested;ZLrx/subjects/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c3b;->a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iput-boolean p2, p0, Ll/c3b;->b:Z

    iput-object p3, p0, Ll/c3b;->c:Lrx/subjects/a;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/c3b;->a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iget-boolean v1, p0, Ll/c3b;->b:Z

    iget-object p0, p0, Ll/c3b;->c:Lrx/subjects/a;

    check-cast p1, Lrx/Notification;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->l3(Lcom/p1/mobile/putong/core/api/CoreSuggested;ZLrx/subjects/a;Lrx/Notification;)V

    return-void
.end method
