.class public final synthetic Ll/bcz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Sticker;

.field public final synthetic c:Ll/jl80;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Sticker;Ll/jl80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bcz;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/bcz;->b:Lcom/p1/mobile/putong/core/data/Sticker;

    iput-object p3, p0, Ll/bcz;->c:Ll/jl80;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bcz;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/bcz;->b:Lcom/p1/mobile/putong/core/data/Sticker;

    iget-object p0, p0, Ll/bcz;->c:Ll/jl80;

    invoke-static {v0, v1, p0, p1}, Ll/tcz;->v(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Sticker;Ll/jl80;Landroid/view/View;)V

    return-void
.end method
