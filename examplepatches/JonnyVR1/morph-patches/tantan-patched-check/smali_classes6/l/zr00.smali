.class public final synthetic Ll/zr00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/ui/moments/MomentView;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/Moment;

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentView;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zr00;->a:Lcom/p1/mobile/putong/feed/ui/moments/MomentView;

    iput-object p2, p0, Ll/zr00;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    iput-object p3, p0, Ll/zr00;->c:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zr00;->a:Lcom/p1/mobile/putong/feed/ui/moments/MomentView;

    iget-object v1, p0, Ll/zr00;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-object p0, p0, Ll/zr00;->c:Lcom/p1/mobile/android/app/Act;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->g(Lcom/p1/mobile/putong/feed/ui/moments/MomentView;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method
