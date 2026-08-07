.class public final synthetic Ll/xch0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/zch0;

.field public final synthetic b:Lv/VText;

.field public final synthetic c:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/zch0;Lv/VText;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xch0;->a:Ll/zch0;

    iput-object p2, p0, Ll/xch0;->b:Lv/VText;

    iput-object p3, p0, Ll/xch0;->c:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xch0;->a:Ll/zch0;

    iget-object v1, p0, Ll/xch0;->b:Lv/VText;

    iget-object p0, p0, Ll/xch0;->c:Ljava/util/List;

    invoke-static {v0, v1, p0, p1}, Ll/zch0;->a(Ll/zch0;Lv/VText;Ljava/util/List;Landroid/view/View;)V

    return-void
.end method
