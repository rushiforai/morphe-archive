.class public final synthetic Ll/xfp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/scp0;

.field public final synthetic b:Ll/nsv;


# direct methods
.method public synthetic constructor <init>(Ll/scp0;Ll/nsv;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xfp0;->a:Ll/scp0;

    iput-object p2, p0, Ll/xfp0;->b:Ll/nsv;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xfp0;->a:Ll/scp0;

    iget-object p0, p0, Ll/xfp0;->b:Ll/nsv;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->j(Ll/scp0;Ll/nsv;Landroid/view/View;)V

    return-void
.end method
