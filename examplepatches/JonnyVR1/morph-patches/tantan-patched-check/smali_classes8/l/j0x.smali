.class public final synthetic Ll/j0x;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnFocusChangeListener;


# instance fields
.field public final synthetic a:Ll/l0x;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;


# direct methods
.method public synthetic constructor <init>(Ll/l0x;Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j0x;->a:Ll/l0x;

    iput-object p2, p0, Ll/j0x;->b:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    return-void
.end method


# virtual methods
.method public final onFocusChange(Landroid/view/View;Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/j0x;->a:Ll/l0x;

    iget-object p0, p0, Ll/j0x;->b:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    invoke-static {v0, p0, p1, p2}, Ll/l0x;->j(Ll/l0x;Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Landroid/view/View;Z)V

    return-void
.end method
