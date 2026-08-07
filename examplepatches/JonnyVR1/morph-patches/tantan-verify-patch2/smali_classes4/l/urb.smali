.class public final synthetic Ll/urb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/urb;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/urb;->b:Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;

    iput-object p3, p0, Ll/urb;->c:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/urb;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/urb;->b:Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;

    iget-object p0, p0, Ll/urb;->c:Lcom/p1/mobile/android/app/Act;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/innerpush/CountdownConvPushLayout;->b(Ljava/lang/String;Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method
