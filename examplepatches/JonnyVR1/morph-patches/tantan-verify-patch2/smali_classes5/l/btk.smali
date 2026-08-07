.class public final synthetic Ll/btk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/z20;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

.field public final synthetic c:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

.field public final synthetic d:Ll/pej0;


# direct methods
.method public synthetic constructor <init>(Ll/z20;Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;Ll/pej0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/btk;->a:Ll/z20;

    iput-object p2, p0, Ll/btk;->b:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    iput-object p3, p0, Ll/btk;->c:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    iput-object p4, p0, Ll/btk;->d:Ll/pej0;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/btk;->a:Ll/z20;

    iget-object v1, p0, Ll/btk;->b:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    iget-object v2, p0, Ll/btk;->c:Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;

    iget-object p0, p0, Ll/btk;->d:Ll/pej0;

    invoke-static {v0, v1, v2, p0, p1}, Ll/qtk;->U(Ll/z20;Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;Lcom/p1/mobile/putong/core/ui/profile/views/WheelPicker;Ll/pej0;Landroid/view/View;)V

    return-void
.end method
