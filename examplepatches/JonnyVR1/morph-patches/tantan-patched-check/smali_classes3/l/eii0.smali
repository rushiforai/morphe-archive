.class public final synthetic Ll/eii0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ll/xc00;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/xc00;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/eii0;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/eii0;->b:Ll/xc00;

    iput-object p3, p0, Ll/eii0;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onGlobalLayout()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/eii0;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/eii0;->b:Ll/xc00;

    iget-object p0, p0, Ll/eii0;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Ll/kii0;->K(Lcom/p1/mobile/android/app/Act;Ll/xc00;Ljava/lang/String;)V

    return-void
.end method
