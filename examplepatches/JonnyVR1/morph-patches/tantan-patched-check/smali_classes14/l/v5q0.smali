.class public final synthetic Ll/v5q0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/account/ui/welcome/WelcomeV2Act;

.field public final synthetic b:Landroid/widget/EditText;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/account/ui/welcome/WelcomeV2Act;Landroid/widget/EditText;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v5q0;->a:Lcom/p1/mobile/putong/account/ui/welcome/WelcomeV2Act;

    iput-object p2, p0, Ll/v5q0;->b:Landroid/widget/EditText;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/v5q0;->a:Lcom/p1/mobile/putong/account/ui/welcome/WelcomeV2Act;

    iget-object p0, p0, Ll/v5q0;->b:Landroid/widget/EditText;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeV2Act;->y2(Lcom/p1/mobile/putong/account/ui/welcome/WelcomeV2Act;Landroid/widget/EditText;)V

    return-void
.end method
