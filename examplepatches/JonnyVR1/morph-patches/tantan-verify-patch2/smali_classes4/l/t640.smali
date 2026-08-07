.class public final synthetic Ll/t640;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

.field public final synthetic b:Z

.field public final synthetic c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;ZLcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t640;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    iput-boolean p2, p0, Ll/t640;->b:Z

    iput-object p3, p0, Ll/t640;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/t640;->a:Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    iget-boolean v1, p0, Ll/t640;->b:Z

    iget-object p0, p0, Ll/t640;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;->M1(Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;ZLcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Landroid/view/View;)V

    return-void
.end method
