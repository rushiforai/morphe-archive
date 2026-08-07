.class public Ll/vqp0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/vqp0;->U()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/vqp0;


# direct methods
.method public constructor <init>(Ll/vqp0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vqp0$a;->a:Ll/vqp0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/vqp0$a;->a:Ll/vqp0;

    .line 2
    .line 3
    iget-object p1, p1, Ll/sup0;->g:Landroid/widget/FrameLayout;

    .line 4
    .line 5
    const/16 v0, 0x8

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/vqp0$a;->a:Ll/vqp0;

    .line 11
    .line 12
    invoke-static {p0}, Ll/vqp0;->P(Ll/vqp0;)Ljava/util/Map;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p0, p1}, Ll/vqp0;->A(Ljava/util/Map;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
