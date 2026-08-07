.class public final synthetic Ll/flc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/gp/GpRateGuideDialog$a;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ll/jl80;

.field public final synthetic c:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/jl80;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/flc0;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/flc0;->b:Ll/jl80;

    iput-object p3, p0, Ll/flc0;->c:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/flc0;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/flc0;->b:Ll/jl80;

    iget-object p0, p0, Ll/flc0;->c:Ljava/lang/Runnable;

    invoke-static {v0, v1, p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/gp/a;->c(Lcom/p1/mobile/android/app/Act;Ll/jl80;Ljava/lang/Runnable;Landroid/view/View;Z)V

    return-void
.end method
