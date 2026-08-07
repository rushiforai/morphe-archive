.class public final synthetic Ll/avk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/bvk0;

.field public final synthetic b:Ll/jl80;

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Ll/bvk0;Ll/jl80;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/avk0;->a:Ll/bvk0;

    iput-object p2, p0, Ll/avk0;->b:Ll/jl80;

    iput-object p3, p0, Ll/avk0;->c:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/avk0;->a:Ll/bvk0;

    iget-object v1, p0, Ll/avk0;->b:Ll/jl80;

    iget-object p0, p0, Ll/avk0;->c:Lcom/p1/mobile/android/app/Act;

    invoke-static {v0, v1, p0, p1}, Ll/bvk0;->k(Ll/bvk0;Ll/jl80;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method
