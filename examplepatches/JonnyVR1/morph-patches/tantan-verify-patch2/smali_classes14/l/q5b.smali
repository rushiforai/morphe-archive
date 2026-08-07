.class public final synthetic Ll/q5b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/CoreSuggested;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q5b;->a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iput-boolean p2, p0, Ll/q5b;->b:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/q5b;->a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iget-boolean p0, p0, Ll/q5b;->b:Z

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->W4(Lcom/p1/mobile/putong/core/api/CoreSuggested;ZLjava/lang/Throwable;)V

    return-void
.end method
