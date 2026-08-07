.class public final synthetic Ll/v1i0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/y1i0;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/NewTags;


# direct methods
.method public synthetic constructor <init>(Ll/y1i0;Lcom/p1/mobile/putong/core/data/NewTags;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v1i0;->a:Ll/y1i0;

    iput-object p2, p0, Ll/v1i0;->b:Lcom/p1/mobile/putong/core/data/NewTags;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/v1i0;->a:Ll/y1i0;

    iget-object p0, p0, Ll/v1i0;->b:Lcom/p1/mobile/putong/core/data/NewTags;

    invoke-static {v0, p0, p1}, Ll/y1i0;->z(Ll/y1i0;Lcom/p1/mobile/putong/core/data/NewTags;Landroid/view/View;)V

    return-void
.end method
