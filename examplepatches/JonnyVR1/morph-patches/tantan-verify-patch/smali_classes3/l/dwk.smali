.class public final synthetic Ll/dwk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


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

    iput-object p1, p0, Ll/dwk;->a:Ll/fwk;

    iput-object p2, p0, Ll/dwk;->b:Landroid/view/View;

    iput-object p3, p0, Ll/dwk;->c:Ll/zvk;

    iput-object p4, p0, Ll/dwk;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/dwk;->a:Ll/fwk;

    iget-object v1, p0, Ll/dwk;->b:Landroid/view/View;

    iget-object v2, p0, Ll/dwk;->c:Ll/zvk;

    iget-object p0, p0, Ll/dwk;->d:Ljava/lang/String;

    invoke-static {v0, v1, v2, p0}, Ll/fwk;->a(Ll/fwk;Landroid/view/View;Ll/zvk;Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
