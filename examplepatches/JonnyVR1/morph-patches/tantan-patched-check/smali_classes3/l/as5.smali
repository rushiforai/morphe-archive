.class public final synthetic Ll/as5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$c;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/as5;->a:Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;

    iput-object p2, p0, Ll/as5;->b:Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$c;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/as5;->a:Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;

    iget-object p0, p0, Ll/as5;->b:Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$c;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$c;->a(Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter;Lcom/p1/mobile/putong/core/ui/compliment/ComplimentPhotoAdapter$c;Landroid/view/View;)V

    return-void
.end method
