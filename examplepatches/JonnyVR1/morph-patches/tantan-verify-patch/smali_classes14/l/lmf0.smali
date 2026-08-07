.class public final synthetic Ll/lmf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/pmf0;

.field public final synthetic b:Lcom/p1/mobile/putong/data/SignUpData;


# direct methods
.method public synthetic constructor <init>(Ll/pmf0;Lcom/p1/mobile/putong/data/SignUpData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lmf0;->a:Ll/pmf0;

    iput-object p2, p0, Ll/lmf0;->b:Lcom/p1/mobile/putong/data/SignUpData;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lmf0;->a:Ll/pmf0;

    iget-object p0, p0, Ll/lmf0;->b:Lcom/p1/mobile/putong/data/SignUpData;

    invoke-static {v0, p0, p1}, Ll/pmf0;->d(Ll/pmf0;Lcom/p1/mobile/putong/data/SignUpData;Landroid/view/View;)V

    return-void
.end method
