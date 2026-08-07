.class public final synthetic Ll/q270;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/w270;

.field public final synthetic b:Lcom/p1/mobile/putong/data/VerifyReason;

.field public final synthetic c:Lcom/p1/mobile/putong/data/SignInData;


# direct methods
.method public synthetic constructor <init>(Ll/w270;Lcom/p1/mobile/putong/data/VerifyReason;Lcom/p1/mobile/putong/data/SignInData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q270;->a:Ll/w270;

    iput-object p2, p0, Ll/q270;->b:Lcom/p1/mobile/putong/data/VerifyReason;

    iput-object p3, p0, Ll/q270;->c:Lcom/p1/mobile/putong/data/SignInData;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/q270;->a:Ll/w270;

    iget-object v1, p0, Ll/q270;->b:Lcom/p1/mobile/putong/data/VerifyReason;

    iget-object p0, p0, Ll/q270;->c:Lcom/p1/mobile/putong/data/SignInData;

    invoke-static {v0, v1, p0, p1}, Ll/w270;->s(Ll/w270;Lcom/p1/mobile/putong/data/VerifyReason;Lcom/p1/mobile/putong/data/SignInData;Landroid/view/View;)V

    return-void
.end method
