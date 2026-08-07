.class public Lcom/p1/mobile/putong/core/newui/main/a$f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/main/a;->F7()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/main/a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/main/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/main/a$f;->a:Lcom/p1/mobile/putong/core/newui/main/a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->e0:Lrx/subjects/b;

    .line 6
    .line 7
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
