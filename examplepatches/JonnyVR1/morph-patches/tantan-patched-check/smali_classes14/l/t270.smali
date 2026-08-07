.class public final synthetic Ll/t270;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/w270;

.field public final synthetic b:Lcom/p1/mobile/putong/data/VerifyReason;

.field public final synthetic c:Lcom/p1/mobile/putong/data/SignInData;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/w270;Lcom/p1/mobile/putong/data/VerifyReason;Lcom/p1/mobile/putong/data/SignInData;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t270;->a:Ll/w270;

    iput-object p2, p0, Ll/t270;->b:Lcom/p1/mobile/putong/data/VerifyReason;

    iput-object p3, p0, Ll/t270;->c:Lcom/p1/mobile/putong/data/SignInData;

    iput-object p4, p0, Ll/t270;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/t270;->a:Ll/w270;

    iget-object v1, p0, Ll/t270;->b:Lcom/p1/mobile/putong/data/VerifyReason;

    iget-object v2, p0, Ll/t270;->c:Lcom/p1/mobile/putong/data/SignInData;

    iget-object p0, p0, Ll/t270;->d:Ljava/lang/String;

    invoke-static {v0, v1, v2, p0, p1}, Ll/w270;->v(Ll/w270;Lcom/p1/mobile/putong/data/VerifyReason;Lcom/p1/mobile/putong/data/SignInData;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method
