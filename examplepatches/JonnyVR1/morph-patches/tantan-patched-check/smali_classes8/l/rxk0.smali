.class public final synthetic Ll/rxk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lv/VFilterBar;

.field public final synthetic b:Landroid/widget/LinearLayout;


# direct methods
.method public synthetic constructor <init>(Lv/VFilterBar;Landroid/widget/LinearLayout;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rxk0;->a:Lv/VFilterBar;

    iput-object p2, p0, Ll/rxk0;->b:Landroid/widget/LinearLayout;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rxk0;->a:Lv/VFilterBar;

    iget-object p0, p0, Ll/rxk0;->b:Landroid/widget/LinearLayout;

    invoke-static {v0, p0, p1}, Lv/VFilterBar;->a(Lv/VFilterBar;Landroid/widget/LinearLayout;Landroid/view/View;)V

    return-void
.end method
