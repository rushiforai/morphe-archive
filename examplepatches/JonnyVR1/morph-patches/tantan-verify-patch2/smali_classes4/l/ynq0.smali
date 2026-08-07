.class public final synthetic Ll/ynq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Frag;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/youthvip/view/YouthVipLocationView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/newui/youthvip/view/YouthVipLocationView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ynq0;->a:Lcom/p1/mobile/android/app/Frag;

    iput-object p2, p0, Ll/ynq0;->b:Lcom/p1/mobile/putong/core/newui/youthvip/view/YouthVipLocationView;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ynq0;->a:Lcom/p1/mobile/android/app/Frag;

    iget-object p0, p0, Ll/ynq0;->b:Lcom/p1/mobile/putong/core/newui/youthvip/view/YouthVipLocationView;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/newui/youthvip/view/YouthVipLocationView;->i0(Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/newui/youthvip/view/YouthVipLocationView;Landroid/view/View;)V

    return-void
.end method
