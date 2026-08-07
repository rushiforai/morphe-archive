.class public final synthetic Ll/s0i0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/y0i0;

.field public final synthetic b:Z

.field public final synthetic c:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/y0i0;ZLjava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s0i0;->a:Ll/y0i0;

    iput-boolean p2, p0, Ll/s0i0;->b:Z

    iput-object p3, p0, Ll/s0i0;->c:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/s0i0;->a:Ll/y0i0;

    iget-boolean v1, p0, Ll/s0i0;->b:Z

    iget-object p0, p0, Ll/s0i0;->c:Ljava/util/List;

    invoke-static {v0, v1, p0, p1}, Ll/y0i0;->j(Ll/y0i0;ZLjava/util/List;Landroid/view/View;)V

    return-void
.end method
