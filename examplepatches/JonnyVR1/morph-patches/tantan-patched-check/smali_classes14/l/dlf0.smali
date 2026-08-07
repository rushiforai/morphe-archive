.class public final synthetic Ll/dlf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/flf0;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/flf0;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dlf0;->a:Ll/flf0;

    iput-boolean p2, p0, Ll/dlf0;->b:Z

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dlf0;->a:Ll/flf0;

    iget-boolean p0, p0, Ll/dlf0;->b:Z

    invoke-static {v0, p0, p1}, Ll/flf0;->a(Ll/flf0;ZLandroid/view/View;)V

    return-void
.end method
