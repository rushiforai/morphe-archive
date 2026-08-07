.class public final synthetic Ll/gts;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/y20;

.field public final synthetic b:Ll/g2t;


# direct methods
.method public synthetic constructor <init>(Ll/y20;Ll/g2t;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gts;->a:Ll/y20;

    iput-object p2, p0, Ll/gts;->b:Ll/g2t;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gts;->a:Ll/y20;

    iget-object p0, p0, Ll/gts;->b:Ll/g2t;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/LiveGuardItem;->h0(Ll/y20;Ll/g2t;Landroid/view/View;)V

    return-void
.end method
