.class public final synthetic Ll/g100;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/h100;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/h100;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g100;->a:Ll/h100;

    iput-object p2, p0, Ll/g100;->b:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    iput-object p3, p0, Ll/g100;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/g100;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/g100;->a:Ll/h100;

    iget-object v1, p0, Ll/g100;->b:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    iget-object v2, p0, Ll/g100;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/g100;->d:Ljava/lang/String;

    invoke-static {v0, v1, v2, p0, p1}, Ll/h100;->p(Ll/h100;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Ljava/lang/String;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method
