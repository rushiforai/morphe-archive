.class public final synthetic Ll/ozr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/wzr;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/wzr;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ozr;->a:Ll/wzr;

    iput-object p2, p0, Ll/ozr;->b:Lcom/p1/mobile/putong/data/User;

    iput-object p3, p0, Ll/ozr;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ozr;->a:Ll/wzr;

    iget-object v1, p0, Ll/ozr;->b:Lcom/p1/mobile/putong/data/User;

    iget-object p0, p0, Ll/ozr;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0, p1}, Ll/wzr;->V3(Ll/wzr;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method
