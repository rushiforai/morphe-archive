.class public final synthetic Ll/dd80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/PlatformQualificationButton;

.field public final synthetic b:Lv/VButton;

.field public final synthetic c:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/PlatformQualificationButton;Lv/VButton;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dd80;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/PlatformQualificationButton;

    iput-object p2, p0, Ll/dd80;->b:Lv/VButton;

    iput-object p3, p0, Ll/dd80;->c:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dd80;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/PlatformQualificationButton;

    iget-object v1, p0, Ll/dd80;->b:Lv/VButton;

    iget-object p0, p0, Ll/dd80;->c:Landroid/content/Context;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/PlatformQualificationButton;->p(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/PlatformQualificationButton;Lv/VButton;Landroid/content/Context;)V

    return-void
.end method
