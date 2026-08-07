.class public final synthetic Ll/e3l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/d3l;


# direct methods
.method public synthetic constructor <init>(Ll/d3l;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e3l;->a:Ll/d3l;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e3l;->a:Ll/d3l;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/external/page/setting/privacy/view/HideAvatarSettingView;->h0(Ll/d3l;Landroid/view/View;)V

    return-void
.end method
