.class public final synthetic Ll/w580;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lv/VRadioButton;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;


# direct methods
.method public synthetic constructor <init>(Lv/VRadioButton;Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w580;->a:Lv/VRadioButton;

    iput-object p2, p0, Ll/w580;->b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/w580;->a:Lv/VRadioButton;

    iget-object p0, p0, Ll/w580;->b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    invoke-static {v0, p0, p1}, Ll/c680;->e(Lv/VRadioButton;Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;Landroid/view/View;)V

    return-void
.end method
