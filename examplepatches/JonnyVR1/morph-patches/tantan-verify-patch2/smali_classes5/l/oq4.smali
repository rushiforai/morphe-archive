.class public final synthetic Ll/oq4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ljava/lang/Runnable;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Z

.field public final synthetic d:Ll/bm5;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Runnable;Lcom/p1/mobile/android/app/Act;ZLl/bm5;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/oq4;->a:Ljava/lang/Runnable;

    iput-object p2, p0, Ll/oq4;->b:Lcom/p1/mobile/android/app/Act;

    iput-boolean p3, p0, Ll/oq4;->c:Z

    iput-object p4, p0, Ll/oq4;->d:Ll/bm5;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/oq4;->a:Ljava/lang/Runnable;

    iget-object v1, p0, Ll/oq4;->b:Lcom/p1/mobile/android/app/Act;

    iget-boolean v2, p0, Ll/oq4;->c:Z

    iget-object p0, p0, Ll/oq4;->d:Ll/bm5;

    invoke-static {v0, v1, v2, p0, p1}, Ll/pq4$a;->a(Ljava/lang/Runnable;Lcom/p1/mobile/android/app/Act;ZLl/bm5;Landroid/view/View;)V

    return-void
.end method
