.class public final synthetic Ll/u2e0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/bm5;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/bm5;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u2e0;->a:Ll/bm5;

    iput-object p2, p0, Ll/u2e0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/u2e0;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/u2e0;->a:Ll/bm5;

    iget-object v1, p0, Ll/u2e0;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/u2e0;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0, p1}, Ll/v2e0;->e(Ll/bm5;Ljava/lang/String;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method
