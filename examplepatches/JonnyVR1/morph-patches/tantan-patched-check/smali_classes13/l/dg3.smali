.class public final synthetic Ll/dg3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/ui/bubble/d;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Lcom/p1/mobile/android/ui/bubble/a;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/ui/bubble/d;Landroid/view/View;Ljava/lang/String;Lcom/p1/mobile/android/ui/bubble/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dg3;->a:Lcom/p1/mobile/android/ui/bubble/d;

    iput-object p2, p0, Ll/dg3;->b:Landroid/view/View;

    iput-object p3, p0, Ll/dg3;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/dg3;->d:Lcom/p1/mobile/android/ui/bubble/a;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/dg3;->a:Lcom/p1/mobile/android/ui/bubble/d;

    iget-object v1, p0, Ll/dg3;->b:Landroid/view/View;

    iget-object v2, p0, Ll/dg3;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/dg3;->d:Lcom/p1/mobile/android/ui/bubble/a;

    check-cast p1, [I

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/android/ui/bubble/d;->f(Lcom/p1/mobile/android/ui/bubble/d;Landroid/view/View;Ljava/lang/String;Lcom/p1/mobile/android/ui/bubble/a;[I)V

    return-void
.end method
