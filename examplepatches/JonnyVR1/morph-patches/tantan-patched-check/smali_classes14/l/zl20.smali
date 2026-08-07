.class public final synthetic Ll/zl20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/qm20;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/qm20;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zl20;->a:Ll/qm20;

    iput-object p2, p0, Ll/zl20;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/zl20;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zl20;->a:Ll/qm20;

    iget-object v1, p0, Ll/zl20;->b:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/zl20;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0, p1}, Ll/qm20;->t0(Ll/qm20;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method
