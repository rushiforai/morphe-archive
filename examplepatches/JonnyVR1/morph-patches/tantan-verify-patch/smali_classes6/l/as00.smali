.class public final synthetic Ll/as00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/Moment;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/Moment;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/as00;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/as00;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    iput p3, p0, Ll/as00;->c:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/as00;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/as00;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    iget p0, p0, Ll/as00;->c:I

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->l(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/Moment;ILandroid/view/View;)V

    return-void
.end method
