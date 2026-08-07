.class public final synthetic Ll/xzm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/PopupWindow$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/zzm;

.field public final synthetic b:Ljava/lang/Runnable;

.field public final synthetic c:Ll/v0t;


# direct methods
.method public synthetic constructor <init>(Ll/zzm;Ljava/lang/Runnable;Ll/v0t;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xzm;->a:Ll/zzm;

    iput-object p2, p0, Ll/xzm;->b:Ljava/lang/Runnable;

    iput-object p3, p0, Ll/xzm;->c:Ll/v0t;

    return-void
.end method


# virtual methods
.method public final onDismiss()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xzm;->a:Ll/zzm;

    iget-object v1, p0, Ll/xzm;->b:Ljava/lang/Runnable;

    iget-object p0, p0, Ll/xzm;->c:Ll/v0t;

    invoke-static {v0, v1, p0}, Ll/zzm;->B(Ll/zzm;Ljava/lang/Runnable;Ll/v0t;)V

    return-void
.end method
