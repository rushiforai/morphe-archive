.class public final synthetic Ll/jk3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ll/pej0;

.field public final synthetic c:Lcom/p1/mobile/putong/data/Settings;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/pej0;Lcom/p1/mobile/putong/data/Settings;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jk3;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/jk3;->b:Ll/pej0;

    iput-object p3, p0, Ll/jk3;->c:Lcom/p1/mobile/putong/data/Settings;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jk3;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/jk3;->b:Ll/pej0;

    iget-object p0, p0, Ll/jk3;->c:Lcom/p1/mobile/putong/data/Settings;

    invoke-static {v0, v1, p0, p1}, Ll/hl3;->l(Lcom/p1/mobile/android/app/Act;Ll/pej0;Lcom/p1/mobile/putong/data/Settings;Landroid/view/View;)V

    return-void
.end method
