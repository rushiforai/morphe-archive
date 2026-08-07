.class public final synthetic Ll/zyf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ll/jl80;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ll/jl80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zyf;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/zyf;->b:Ll/jl80;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zyf;->a:Ljava/lang/String;

    iget-object p0, p0, Ll/zyf;->b:Ll/jl80;

    invoke-static {v0, p0, p1}, Ll/a0g;->y(Ljava/lang/String;Ll/jl80;Landroid/view/View;)V

    return-void
.end method
