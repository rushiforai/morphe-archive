.class public final synthetic Ll/pi3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/pf2;


# direct methods
.method public synthetic constructor <init>(Ll/pf2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pi3;->a:Ll/pf2;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pi3;->a:Ll/pf2;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->c(Ll/pf2;Landroid/view/View;)V

    return-void
.end method
