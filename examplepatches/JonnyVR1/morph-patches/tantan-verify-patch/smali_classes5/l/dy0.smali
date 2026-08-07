.class public final synthetic Ll/dy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:[Ll/th0;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;[Ll/th0;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dy0;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/dy0;->b:[Ll/th0;

    iput-boolean p3, p0, Ll/dy0;->c:Z

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dy0;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/dy0;->b:[Ll/th0;

    iget-boolean p0, p0, Ll/dy0;->c:Z

    invoke-static {v0, v1, p0, p1}, Ll/ey0;->e(Lcom/p1/mobile/android/app/Act;[Ll/th0;ZLandroid/view/View;)V

    return-void
.end method
