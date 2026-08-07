.class public final synthetic Ll/lk60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lv/VButton;

.field public final synthetic b:Ll/mk60;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/H5Merchandise;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lv/VButton;Ll/mk60;Lcom/p1/mobile/putong/core/data/H5Merchandise;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lk60;->a:Lv/VButton;

    iput-object p2, p0, Ll/lk60;->b:Ll/mk60;

    iput-object p3, p0, Ll/lk60;->c:Lcom/p1/mobile/putong/core/data/H5Merchandise;

    iput-object p4, p0, Ll/lk60;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/lk60;->a:Lv/VButton;

    iget-object v1, p0, Ll/lk60;->b:Ll/mk60;

    iget-object v2, p0, Ll/lk60;->c:Lcom/p1/mobile/putong/core/data/H5Merchandise;

    iget-object p0, p0, Ll/lk60;->d:Ljava/lang/String;

    invoke-static {v0, v1, v2, p0, p1}, Ll/mk60;->b(Lv/VButton;Ll/mk60;Lcom/p1/mobile/putong/core/data/H5Merchandise;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method
