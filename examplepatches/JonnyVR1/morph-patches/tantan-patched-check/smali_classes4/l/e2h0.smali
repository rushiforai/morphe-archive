.class public final synthetic Ll/e2h0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/discovery/SuggestUserItem;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;

.field public final synthetic d:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/discovery/SuggestUserItem;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e2h0;->a:Lcom/p1/mobile/putong/core/newui/discovery/SuggestUserItem;

    iput-object p2, p0, Ll/e2h0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/e2h0;->c:Lcom/p1/mobile/android/app/Act;

    iput-object p4, p0, Ll/e2h0;->d:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/e2h0;->a:Lcom/p1/mobile/putong/core/newui/discovery/SuggestUserItem;

    iget-object v1, p0, Ll/e2h0;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/e2h0;->c:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/e2h0;->d:Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/core/newui/discovery/SuggestUserItem;->a(Lcom/p1/mobile/putong/core/newui/discovery/SuggestUserItem;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method
