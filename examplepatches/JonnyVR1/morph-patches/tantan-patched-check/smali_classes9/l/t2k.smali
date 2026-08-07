.class public final synthetic Ll/t2k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/jl80;


# direct methods
.method public synthetic constructor <init>(Ll/jl80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t2k;->a:Ll/jl80;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t2k;->a:Ll/jl80;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftwallnew/view/GiftWallSendGiftDialogContentView;->j0(Ll/jl80;Landroid/view/View;)V

    return-void
.end method
