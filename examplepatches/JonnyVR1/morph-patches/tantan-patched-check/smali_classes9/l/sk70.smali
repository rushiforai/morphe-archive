.class public final synthetic Ll/sk70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/jl70;


# direct methods
.method public synthetic constructor <init>(Ll/jl70;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sk70;->a:Ll/jl70;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sk70;->a:Ll/jl70;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->c(Ll/jl70;Landroid/view/View;)V

    return-void
.end method
