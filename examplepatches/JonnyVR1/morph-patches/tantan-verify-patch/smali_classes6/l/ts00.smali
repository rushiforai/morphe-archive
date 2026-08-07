.class public final synthetic Ll/ts00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/app/Dialog$g;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/Moment;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ts00;->a:Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;

    iput-object p2, p0, Ll/ts00;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    return-void
.end method


# virtual methods
.method public final a(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/ts00;->a:Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;

    iget-object v1, p0, Ll/ts00;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move-object v5, p4

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->l(Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V

    return-void
.end method
