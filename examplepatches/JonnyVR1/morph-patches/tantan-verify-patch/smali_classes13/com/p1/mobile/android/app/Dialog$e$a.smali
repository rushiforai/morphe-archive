.class public Lcom/p1/mobile/android/app/Dialog$e$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/app/Dialog$g;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/android/app/Dialog$e;->j0(Landroid/view/Menu;)Lcom/p1/mobile/android/app/Dialog$e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/util/ArrayList;

.field public final synthetic b:Lcom/p1/mobile/android/app/Dialog$e;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Dialog$e;Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/app/Dialog$e$a;->b:Lcom/p1/mobile/android/app/Dialog$e;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/android/app/Dialog$e$a;->a:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/android/app/Dialog$e$a;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Lorg/joor/Reflect;->on(Ljava/lang/Object;)Lorg/joor/Reflect;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const-string p2, "mClickListener"

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Lorg/joor/Reflect;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Landroid/view/MenuItem$OnMenuItemClickListener;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/android/app/Dialog$e$a;->a:Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-virtual {p0, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Landroid/view/MenuItem;

    .line 26
    .line 27
    invoke-interface {p1, p0}, Landroid/view/MenuItem$OnMenuItemClickListener;->onMenuItemClick(Landroid/view/MenuItem;)Z

    .line 28
    .line 29
    .line 30
    return-void
.end method
