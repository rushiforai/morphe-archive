.class public final synthetic Ll/x2y;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/b3y;

.field public final synthetic b:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Ll/b3y;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/x2y;->a:Ll/b3y;

    iput-object p2, p0, Ll/x2y;->b:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/x2y;->a:Ll/b3y;

    iget-object p0, p0, Ll/x2y;->b:Ljava/util/ArrayList;

    invoke-static {v0, p0, p1}, Ll/b3y;->c(Ll/b3y;Ljava/util/ArrayList;Landroid/view/View;)V

    return-void
.end method
