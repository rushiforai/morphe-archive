.class public final synthetic Ll/ulp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/y20;

.field public final synthetic b:Z

.field public final synthetic c:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/y20;ZLjava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ulp;->a:Ll/y20;

    iput-boolean p2, p0, Ll/ulp;->b:Z

    iput-object p3, p0, Ll/ulp;->c:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ulp;->a:Ll/y20;

    iget-boolean v1, p0, Ll/ulp;->b:Z

    iget-object p0, p0, Ll/ulp;->c:Ljava/util/List;

    invoke-static {v0, v1, p0, p1}, Ll/slp$b;->b(Ll/y20;ZLjava/util/List;Landroid/view/View;)V

    return-void
.end method
