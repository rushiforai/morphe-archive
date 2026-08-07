.class public final synthetic Ll/p5m0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/y20;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/y20;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p5m0;->a:Ll/y20;

    iput-object p2, p0, Ll/p5m0;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/p5m0;->a:Ll/y20;

    iget-object p0, p0, Ll/p5m0;->b:Ljava/lang/String;

    invoke-static {v0, p0, p1}, Ll/q5m0;->a(Ll/y20;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method
