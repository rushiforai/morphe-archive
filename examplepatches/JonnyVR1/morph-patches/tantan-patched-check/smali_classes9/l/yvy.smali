.class public final synthetic Ll/yvy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/fwy;

.field public final synthetic b:Ll/clz;


# direct methods
.method public synthetic constructor <init>(Ll/fwy;Ll/clz;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yvy;->a:Ll/fwy;

    iput-object p2, p0, Ll/yvy;->b:Ll/clz;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yvy;->a:Ll/fwy;

    iget-object p0, p0, Ll/yvy;->b:Ll/clz;

    invoke-static {v0, p0, p1}, Ll/fwy;->H0(Ll/fwy;Ll/clz;Landroid/view/View;)V

    return-void
.end method
