.class public final synthetic Ll/b2b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

.field public final synthetic b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

.field public final synthetic c:I

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/CoreSuggested;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;IZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/b2b;->a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iput-object p2, p0, Ll/b2b;->b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    iput p3, p0, Ll/b2b;->c:I

    iput-boolean p4, p0, Ll/b2b;->d:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/b2b;->a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iget-object v1, p0, Ll/b2b;->b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    iget v2, p0, Ll/b2b;->c:I

    iget-boolean p0, p0, Ll/b2b;->d:Z

    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->t5(Lcom/p1/mobile/putong/core/api/CoreSuggested;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;IZ)V

    return-void
.end method
