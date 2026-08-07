.class public final synthetic Ll/hr00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/data/Moment;

.field public final synthetic b:Landroid/widget/ImageView;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/widget/ImageView;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hr00;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    iput-object p2, p0, Ll/hr00;->b:Landroid/widget/ImageView;

    iput-boolean p3, p0, Ll/hr00;->c:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hr00;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-object v1, p0, Ll/hr00;->b:Landroid/widget/ImageView;

    iget-boolean p0, p0, Ll/hr00;->c:Z

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->A(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/widget/ImageView;ZLjava/lang/Throwable;)V

    return-void
.end method
