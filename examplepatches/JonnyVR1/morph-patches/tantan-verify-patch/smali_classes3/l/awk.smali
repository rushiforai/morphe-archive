.class public final synthetic Ll/awk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/fwk;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Landroid/view/ViewGroup;

.field public final synthetic d:Ll/zvk;

.field public final synthetic e:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/fwk;Landroid/view/View;Landroid/view/ViewGroup;Ll/zvk;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/awk;->a:Ll/fwk;

    iput-object p2, p0, Ll/awk;->b:Landroid/view/View;

    iput-object p3, p0, Ll/awk;->c:Landroid/view/ViewGroup;

    iput-object p4, p0, Ll/awk;->d:Ll/zvk;

    iput-object p5, p0, Ll/awk;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/awk;->a:Ll/fwk;

    iget-object v1, p0, Ll/awk;->b:Landroid/view/View;

    iget-object v2, p0, Ll/awk;->c:Landroid/view/ViewGroup;

    iget-object v3, p0, Ll/awk;->d:Ll/zvk;

    iget-object v4, p0, Ll/awk;->e:Ljava/lang/String;

    move-object v5, p1

    check-cast v5, [I

    invoke-static/range {v0 .. v5}, Ll/fwk;->e(Ll/fwk;Landroid/view/View;Landroid/view/ViewGroup;Ll/zvk;Ljava/lang/String;[I)V

    return-void
.end method
