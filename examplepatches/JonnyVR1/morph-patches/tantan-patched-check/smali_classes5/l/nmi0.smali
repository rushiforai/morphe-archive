.class public final synthetic Ll/nmi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Landroid/graphics/Bitmap;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nmi0;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/nmi0;->b:Landroid/graphics/Bitmap;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nmi0;->a:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/nmi0;->b:Landroid/graphics/Bitmap;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/ui/tarot/TarotInfoView;->a0(Lcom/p1/mobile/android/app/Act;Landroid/graphics/Bitmap;)V

    return-void
.end method
