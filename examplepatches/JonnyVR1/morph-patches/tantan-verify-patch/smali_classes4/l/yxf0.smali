.class public final synthetic Ll/yxf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/PopupWindow$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/dyf0;

.field public final synthetic b:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ll/dyf0;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yxf0;->a:Ll/dyf0;

    iput-object p2, p0, Ll/yxf0;->b:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final onDismiss()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yxf0;->a:Ll/dyf0;

    iget-object p0, p0, Ll/yxf0;->b:Ljava/lang/Runnable;

    invoke-static {v0, p0}, Ll/dyf0;->B(Ll/dyf0;Ljava/lang/Runnable;)V

    return-void
.end method
