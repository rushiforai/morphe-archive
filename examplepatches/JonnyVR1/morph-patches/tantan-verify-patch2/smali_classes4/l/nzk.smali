.class public final synthetic Ll/nzk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/pzk;

.field public final synthetic b:Z

.field public final synthetic c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;


# direct methods
.method public synthetic constructor <init>(Ll/pzk;ZLcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nzk;->a:Ll/pzk;

    iput-boolean p2, p0, Ll/nzk;->b:Z

    iput-object p3, p0, Ll/nzk;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nzk;->a:Ll/pzk;

    iget-boolean v1, p0, Ll/nzk;->b:Z

    iget-object p0, p0, Ll/nzk;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    invoke-static {v0, v1, p0, p1}, Ll/pzk;->H(Ll/pzk;ZLcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Landroid/view/View;)V

    return-void
.end method
