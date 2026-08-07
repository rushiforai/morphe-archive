.class public final synthetic Ll/c2h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/MenuItem$OnMenuItemClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/feed/data/Moment;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c2h;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/c2h;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/c2h;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    return-void
.end method


# virtual methods
.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/c2h;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/c2h;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/c2h;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    invoke-static {v0, v1, p0, p1}, Ll/k3h;->L(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/MenuItem;)Z

    move-result p0

    return p0
.end method
