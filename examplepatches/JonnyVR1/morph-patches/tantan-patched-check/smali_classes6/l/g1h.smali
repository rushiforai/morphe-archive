.class public final synthetic Ll/g1h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/MenuItem$OnMenuItemClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ll/x20;

.field public final synthetic c:Lcom/p1/mobile/putong/feed/data/Moment;

.field public final synthetic d:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/x20;Lcom/p1/mobile/putong/feed/data/Moment;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g1h;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/g1h;->b:Ll/x20;

    iput-object p3, p0, Ll/g1h;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    iput-object p4, p0, Ll/g1h;->d:Ll/x20;

    return-void
.end method


# virtual methods
.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/g1h;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/g1h;->b:Ll/x20;

    iget-object v2, p0, Ll/g1h;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-object p0, p0, Ll/g1h;->d:Ll/x20;

    invoke-static {v0, v1, v2, p0, p1}, Ll/k3h;->u0(Lcom/p1/mobile/android/app/Act;Ll/x20;Lcom/p1/mobile/putong/feed/data/Moment;Ll/x20;Landroid/view/MenuItem;)Z

    move-result p0

    return p0
.end method
