.class public final synthetic Ll/z3b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

.field public final synthetic b:I

.field public final synthetic c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/CoreSuggested;ILcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z3b;->a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iput p2, p0, Ll/z3b;->b:I

    iput-object p3, p0, Ll/z3b;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/z3b;->a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iget v1, p0, Ll/z3b;->b:I

    iget-object p0, p0, Ll/z3b;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    check-cast p1, Ll/uxj0;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->v3(Lcom/p1/mobile/putong/core/api/CoreSuggested;ILcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Ll/uxj0;)V

    return-void
.end method
