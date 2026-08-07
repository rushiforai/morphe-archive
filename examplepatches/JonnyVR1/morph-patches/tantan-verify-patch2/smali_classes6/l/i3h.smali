.class public final synthetic Ll/i3h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/MenuItem$OnMenuItemClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ll/pcj;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/pcj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i3h;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/i3h;->b:Ll/pcj;

    return-void
.end method


# virtual methods
.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/i3h;->a:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/i3h;->b:Ll/pcj;

    invoke-static {v0, p0, p1}, Ll/k3h;->G(Lcom/p1/mobile/android/app/Act;Ll/pcj;Landroid/view/MenuItem;)Z

    move-result p0

    return p0
.end method
