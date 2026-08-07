.class public final synthetic Ll/huq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ll/jl80;

.field public final synthetic c:Ll/bm5;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/jl80;Ll/bm5;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/huq;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/huq;->b:Ll/jl80;

    iput-object p3, p0, Ll/huq;->c:Ll/bm5;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/huq;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/huq;->b:Ll/jl80;

    iget-object p0, p0, Ll/huq;->c:Ll/bm5;

    invoke-static {v0, v1, p0, p1}, Ll/quq;->v(Lcom/p1/mobile/android/app/Act;Ll/jl80;Ll/bm5;Landroid/view/View;)V

    return-void
.end method
