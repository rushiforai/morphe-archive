.class public final synthetic Ll/km0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/yuk;


# direct methods
.method public synthetic constructor <init>(Ll/yuk;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/km0;->a:Ll/yuk;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/km0;->a:Ll/yuk;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;->h0(Ll/yuk;Landroid/view/View;)V

    return-void
.end method
