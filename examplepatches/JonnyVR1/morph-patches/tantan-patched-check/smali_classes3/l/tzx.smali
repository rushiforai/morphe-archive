.class public final synthetic Ll/tzx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/wzx;

.field public final synthetic b:Z

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Ll/wzx;ZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tzx;->a:Ll/wzx;

    iput-boolean p2, p0, Ll/tzx;->b:Z

    iput-boolean p3, p0, Ll/tzx;->c:Z

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/tzx;->a:Ll/wzx;

    iget-boolean v1, p0, Ll/tzx;->b:Z

    iget-boolean p0, p0, Ll/tzx;->c:Z

    invoke-static {v0, v1, p0, p1}, Ll/wzx;->c(Ll/wzx;ZZLandroid/view/View;)V

    return-void
.end method
