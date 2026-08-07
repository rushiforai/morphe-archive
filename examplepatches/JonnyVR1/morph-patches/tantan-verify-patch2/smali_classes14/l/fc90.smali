.class public final synthetic Ll/fc90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/gc90;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Merchandise;


# direct methods
.method public synthetic constructor <init>(Ll/gc90;Lcom/p1/mobile/putong/core/data/Merchandise;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fc90;->a:Ll/gc90;

    iput-object p2, p0, Ll/fc90;->b:Lcom/p1/mobile/putong/core/data/Merchandise;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fc90;->a:Ll/gc90;

    iget-object p0, p0, Ll/fc90;->b:Lcom/p1/mobile/putong/core/data/Merchandise;

    invoke-static {v0, p0, p1}, Ll/gc90;->p(Ll/gc90;Lcom/p1/mobile/putong/core/data/Merchandise;Landroid/view/View;)V

    return-void
.end method
