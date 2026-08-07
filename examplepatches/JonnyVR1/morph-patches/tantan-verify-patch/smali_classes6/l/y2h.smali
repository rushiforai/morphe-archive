.class public final synthetic Ll/y2h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/MenuItem$OnMenuItemClickListener;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Ll/x20;

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;

.field public final synthetic d:Ll/y20;


# direct methods
.method public synthetic constructor <init>(ZLl/x20;Lcom/p1/mobile/android/app/Act;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/y2h;->a:Z

    iput-object p2, p0, Ll/y2h;->b:Ll/x20;

    iput-object p3, p0, Ll/y2h;->c:Lcom/p1/mobile/android/app/Act;

    iput-object p4, p0, Ll/y2h;->d:Ll/y20;

    return-void
.end method


# virtual methods
.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/y2h;->a:Z

    iget-object v1, p0, Ll/y2h;->b:Ll/x20;

    iget-object v2, p0, Ll/y2h;->c:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/y2h;->d:Ll/y20;

    invoke-static {v0, v1, v2, p0, p1}, Ll/k3h;->E(ZLl/x20;Lcom/p1/mobile/android/app/Act;Ll/y20;Landroid/view/MenuItem;)Z

    move-result p0

    return p0
.end method
