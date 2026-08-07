.class public final synthetic Ll/mtq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Landroid/widget/CheckBox;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Ll/jl80;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/CheckBox;Lcom/p1/mobile/android/app/Act;Ll/jl80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mtq;->a:Landroid/widget/CheckBox;

    iput-object p2, p0, Ll/mtq;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/mtq;->c:Ll/jl80;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mtq;->a:Landroid/widget/CheckBox;

    iget-object v1, p0, Ll/mtq;->b:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/mtq;->c:Ll/jl80;

    invoke-static {v0, v1, p0, p1}, Ll/quq;->h(Landroid/widget/CheckBox;Lcom/p1/mobile/android/app/Act;Ll/jl80;Landroid/view/View;)V

    return-void
.end method
