.class public final synthetic Ll/vt80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ljava/util/List;

.field public final synthetic b:Ll/x20;

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;Ll/x20;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vt80;->a:Ljava/util/List;

    iput-object p2, p0, Ll/vt80;->b:Ll/x20;

    iput-object p3, p0, Ll/vt80;->c:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/vt80;->a:Ljava/util/List;

    iget-object v1, p0, Ll/vt80;->b:Ll/x20;

    iget-object p0, p0, Ll/vt80;->c:Lcom/p1/mobile/android/app/Act;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/pricerecall/PriceRecallGetSurprise2Dialog;->e(Ljava/util/List;Ll/x20;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method
