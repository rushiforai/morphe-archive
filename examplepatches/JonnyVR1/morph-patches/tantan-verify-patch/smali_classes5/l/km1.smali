.class public final synthetic Ll/km1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/lm1;

.field public final synthetic b:Ll/bm5;


# direct methods
.method public synthetic constructor <init>(Ll/lm1;Ll/bm5;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/km1;->a:Ll/lm1;

    iput-object p2, p0, Ll/km1;->b:Ll/bm5;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/km1;->a:Ll/lm1;

    iget-object p0, p0, Ll/km1;->b:Ll/bm5;

    invoke-static {v0, p0, p1}, Ll/lm1;->c(Ll/lm1;Ll/bm5;Landroid/view/View;)V

    return-void
.end method
