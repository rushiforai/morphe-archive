.class public final synthetic Ll/wa0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/cb0;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Action;


# direct methods
.method public synthetic constructor <init>(Ll/cb0;Lcom/p1/mobile/putong/data/Action;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wa0;->a:Ll/cb0;

    iput-object p2, p0, Ll/wa0;->b:Lcom/p1/mobile/putong/data/Action;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wa0;->a:Ll/cb0;

    iget-object p0, p0, Ll/wa0;->b:Lcom/p1/mobile/putong/data/Action;

    invoke-static {v0, p0, p1}, Ll/cb0;->A(Ll/cb0;Lcom/p1/mobile/putong/data/Action;Landroid/view/View;)V

    return-void
.end method
