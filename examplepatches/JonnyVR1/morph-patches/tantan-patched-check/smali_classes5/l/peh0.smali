.class public final synthetic Ll/peh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/Merchandise;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Ll/g1e;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/android/app/Act;Ll/g1e;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/peh0;->a:Lcom/p1/mobile/putong/core/data/Merchandise;

    iput-object p2, p0, Ll/peh0;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/peh0;->c:Ll/g1e;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/peh0;->a:Lcom/p1/mobile/putong/core/data/Merchandise;

    iget-object v1, p0, Ll/peh0;->b:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/peh0;->c:Ll/g1e;

    invoke-static {v0, v1, p0, p1}, Ll/qeh0;->d(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/android/app/Act;Ll/g1e;Landroid/view/View;)V

    return-void
.end method
