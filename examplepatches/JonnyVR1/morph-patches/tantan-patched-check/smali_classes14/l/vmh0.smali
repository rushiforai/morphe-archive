.class public final synthetic Ll/vmh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/anh0;

.field public final synthetic b:Lcom/p1/mobile/putong/data/RememberUserInfo;


# direct methods
.method public synthetic constructor <init>(Ll/anh0;Lcom/p1/mobile/putong/data/RememberUserInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vmh0;->a:Ll/anh0;

    iput-object p2, p0, Ll/vmh0;->b:Lcom/p1/mobile/putong/data/RememberUserInfo;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vmh0;->a:Ll/anh0;

    iget-object p0, p0, Ll/vmh0;->b:Lcom/p1/mobile/putong/data/RememberUserInfo;

    invoke-static {v0, p0, p1}, Ll/anh0;->b(Ll/anh0;Lcom/p1/mobile/putong/data/RememberUserInfo;Landroid/view/View;)V

    return-void
.end method
