.class public final synthetic Ll/hye0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/app/Dialog$g;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/settings/a;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/settings/a;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hye0;->a:Lcom/p1/mobile/putong/core/ui/settings/a;

    iput p2, p0, Ll/hye0;->b:I

    return-void
.end method


# virtual methods
.method public final a(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/hye0;->a:Lcom/p1/mobile/putong/core/ui/settings/a;

    iget v1, p0, Ll/hye0;->b:I

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move-object v5, p4

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/settings/a;->e1(Lcom/p1/mobile/putong/core/ui/settings/a;ILcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V

    return-void
.end method
