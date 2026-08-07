.class public final synthetic Ll/it9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/jt9;

.field public final synthetic b:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Ll/jt9;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/it9;->a:Ll/jt9;

    iput-object p2, p0, Ll/it9;->b:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/it9;->a:Ll/jt9;

    iget-object p0, p0, Ll/it9;->b:Ljava/util/ArrayList;

    invoke-static {v0, p0, p1}, Ll/jt9;->a(Ll/jt9;Ljava/util/ArrayList;Landroid/view/View;)V

    return-void
.end method
