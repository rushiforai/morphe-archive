.class public final synthetic Ll/l6e0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/q6e0;

.field public final synthetic b:Ll/abe0;

.field public final synthetic c:Ljava/util/Map;

.field public final synthetic d:Ll/z20;


# direct methods
.method public synthetic constructor <init>(Ll/q6e0;Ll/abe0;Ljava/util/Map;Ll/z20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l6e0;->a:Ll/q6e0;

    iput-object p2, p0, Ll/l6e0;->b:Ll/abe0;

    iput-object p3, p0, Ll/l6e0;->c:Ljava/util/Map;

    iput-object p4, p0, Ll/l6e0;->d:Ll/z20;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/l6e0;->a:Ll/q6e0;

    iget-object v1, p0, Ll/l6e0;->b:Ll/abe0;

    iget-object v2, p0, Ll/l6e0;->c:Ljava/util/Map;

    iget-object p0, p0, Ll/l6e0;->d:Ll/z20;

    invoke-static {v0, v1, v2, p0, p1}, Ll/q6e0;->f(Ll/q6e0;Ll/abe0;Ljava/util/Map;Ll/z20;Landroid/view/View;)V

    return-void
.end method
