.class public final synthetic Ll/xha0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/aia0;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Landroid/widget/TextView;

.field public final synthetic d:Landroid/widget/TextView;

.field public final synthetic e:Landroid/widget/TextView;


# direct methods
.method public synthetic constructor <init>(Ll/aia0;Lcom/p1/mobile/android/app/Act;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xha0;->a:Ll/aia0;

    iput-object p2, p0, Ll/xha0;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/xha0;->c:Landroid/widget/TextView;

    iput-object p4, p0, Ll/xha0;->d:Landroid/widget/TextView;

    iput-object p5, p0, Ll/xha0;->e:Landroid/widget/TextView;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/xha0;->a:Ll/aia0;

    iget-object v1, p0, Ll/xha0;->b:Lcom/p1/mobile/android/app/Act;

    iget-object v2, p0, Ll/xha0;->c:Landroid/widget/TextView;

    iget-object v3, p0, Ll/xha0;->d:Landroid/widget/TextView;

    iget-object p0, p0, Ll/xha0;->e:Landroid/widget/TextView;

    invoke-static {v0, v1, v2, v3, p0}, Ll/aia0;->a(Ll/aia0;Lcom/p1/mobile/android/app/Act;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/TextView;)V

    return-void
.end method
