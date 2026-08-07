.class public final synthetic Ll/o8k0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/p8k0;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Z

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/p8k0;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/o8k0;->a:Ll/p8k0;

    iput-object p2, p0, Ll/o8k0;->b:Lcom/p1/mobile/putong/data/User;

    iput-boolean p3, p0, Ll/o8k0;->c:Z

    iput-object p4, p0, Ll/o8k0;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/o8k0;->a:Ll/p8k0;

    iget-object v1, p0, Ll/o8k0;->b:Lcom/p1/mobile/putong/data/User;

    iget-boolean v2, p0, Ll/o8k0;->c:Z

    iget-object p0, p0, Ll/o8k0;->d:Ljava/lang/String;

    invoke-static {v0, v1, v2, p0, p1}, Ll/p8k0;->k4(Ll/p8k0;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Landroid/view/View;)V

    return-void
.end method
