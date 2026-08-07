.class public final synthetic Ll/eg3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/ui/bubble/d;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Landroid/view/View;

.field public final synthetic d:Lcom/p1/mobile/android/ui/bubble/a;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/ui/bubble/d;Ljava/lang/String;Landroid/view/View;Lcom/p1/mobile/android/ui/bubble/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/eg3;->a:Lcom/p1/mobile/android/ui/bubble/d;

    iput-object p2, p0, Ll/eg3;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/eg3;->c:Landroid/view/View;

    iput-object p4, p0, Ll/eg3;->d:Lcom/p1/mobile/android/ui/bubble/a;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/eg3;->a:Lcom/p1/mobile/android/ui/bubble/d;

    iget-object v1, p0, Ll/eg3;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/eg3;->c:Landroid/view/View;

    iget-object p0, p0, Ll/eg3;->d:Lcom/p1/mobile/android/ui/bubble/a;

    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/android/ui/bubble/d;->c(Lcom/p1/mobile/android/ui/bubble/d;Ljava/lang/String;Landroid/view/View;Lcom/p1/mobile/android/ui/bubble/a;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
