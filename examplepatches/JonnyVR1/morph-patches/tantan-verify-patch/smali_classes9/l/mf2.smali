.class public final synthetic Ll/mf2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/pf2;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/DefaultBulletView;

.field public final synthetic c:Landroid/text/SpannableStringBuilder;


# direct methods
.method public synthetic constructor <init>(Ll/pf2;Lcom/p1/mobile/putong/live/livingroom/increment/bullet/DefaultBulletView;Landroid/text/SpannableStringBuilder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mf2;->a:Ll/pf2;

    iput-object p2, p0, Ll/mf2;->b:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/DefaultBulletView;

    iput-object p3, p0, Ll/mf2;->c:Landroid/text/SpannableStringBuilder;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mf2;->a:Ll/pf2;

    iget-object v1, p0, Ll/mf2;->b:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/DefaultBulletView;

    iget-object p0, p0, Ll/mf2;->c:Landroid/text/SpannableStringBuilder;

    check-cast p1, Ll/jk20;

    invoke-static {v0, v1, p0, p1}, Ll/pf2;->b(Ll/pf2;Lcom/p1/mobile/putong/live/livingroom/increment/bullet/DefaultBulletView;Landroid/text/SpannableStringBuilder;Ll/jk20;)V

    return-void
.end method
