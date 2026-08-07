.class public final synthetic Ll/suy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/fwy;

.field public final synthetic b:Ll/clz;

.field public final synthetic c:Ll/ruy;


# direct methods
.method public synthetic constructor <init>(Ll/fwy;Ll/clz;Ll/ruy;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/suy;->a:Ll/fwy;

    iput-object p2, p0, Ll/suy;->b:Ll/clz;

    iput-object p3, p0, Ll/suy;->c:Ll/ruy;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/suy;->a:Ll/fwy;

    iget-object v1, p0, Ll/suy;->b:Ll/clz;

    iget-object p0, p0, Ll/suy;->c:Ll/ruy;

    invoke-static {v0, v1, p0, p1}, Ll/vuy;->c(Ll/fwy;Ll/clz;Ll/ruy;Landroid/view/View;)V

    return-void
.end method
