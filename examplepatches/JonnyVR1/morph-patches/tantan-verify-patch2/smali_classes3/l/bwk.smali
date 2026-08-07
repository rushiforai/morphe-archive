.class public final synthetic Ll/bwk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/fwk;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Ll/zvk;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/fwk;Landroid/view/View;Ll/zvk;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bwk;->a:Ll/fwk;

    iput-object p2, p0, Ll/bwk;->b:Landroid/view/View;

    iput-object p3, p0, Ll/bwk;->c:Ll/zvk;

    iput-object p4, p0, Ll/bwk;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/bwk;->a:Ll/fwk;

    iget-object v1, p0, Ll/bwk;->b:Landroid/view/View;

    iget-object v2, p0, Ll/bwk;->c:Ll/zvk;

    iget-object p0, p0, Ll/bwk;->d:Ljava/lang/String;

    check-cast p1, [I

    invoke-static {v0, v1, v2, p0, p1}, Ll/fwk;->c(Ll/fwk;Landroid/view/View;Ll/zvk;Ljava/lang/String;[I)V

    return-void
.end method
