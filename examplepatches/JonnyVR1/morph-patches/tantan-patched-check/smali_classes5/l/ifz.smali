.class public final synthetic Ll/ifz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ifz;->a:Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;

    iput-object p2, p0, Ll/ifz;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ifz;->a:Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;

    iget-object p0, p0, Ll/ifz;->b:Ljava/lang/String;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;->b(Lcom/p1/mobile/putong/core/ui/view/MessageKnowHimLayout;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method
