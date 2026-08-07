.class public final synthetic Ll/le1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

.field public final synthetic b:Landroid/graphics/ColorMatrixColorFilter;


# direct methods
.method public synthetic constructor <init>(Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;Landroid/graphics/ColorMatrixColorFilter;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/le1;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    iput-object p2, p0, Ll/le1;->b:Landroid/graphics/ColorMatrixColorFilter;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/le1;->a:Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;

    iget-object p0, p0, Ll/le1;->b:Landroid/graphics/ColorMatrixColorFilter;

    invoke-static {v0, p0}, Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;->Y3(Lcom/tencent/could/huiyansdk/fragments/AuthingFragment;Landroid/graphics/ColorMatrixColorFilter;)V

    return-void
.end method
