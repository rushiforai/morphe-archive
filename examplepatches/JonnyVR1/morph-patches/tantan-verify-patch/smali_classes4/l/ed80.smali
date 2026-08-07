.class public final synthetic Ll/ed80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/PlatformQualificationButton;

.field public final synthetic b:Z

.field public final synthetic c:Lv/VButton;

.field public final synthetic d:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/PlatformQualificationButton;ZLv/VButton;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ed80;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/PlatformQualificationButton;

    iput-boolean p2, p0, Ll/ed80;->b:Z

    iput-object p3, p0, Ll/ed80;->c:Lv/VButton;

    iput-object p4, p0, Ll/ed80;->d:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ed80;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/PlatformQualificationButton;

    iget-boolean v1, p0, Ll/ed80;->b:Z

    iget-object v2, p0, Ll/ed80;->c:Lv/VButton;

    iget-object p0, p0, Ll/ed80;->d:Landroid/content/Context;

    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/PlatformQualificationButton;->u(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/PlatformQualificationButton;ZLv/VButton;Landroid/content/Context;)V

    return-void
.end method
