.class public final synthetic Ll/xyk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/w0m;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/w0m;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xyk0;->a:Ll/w0m;

    iput p2, p0, Ll/xyk0;->b:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xyk0;->a:Ll/w0m;

    iget p0, p0, Ll/xyk0;->b:I

    check-cast p1, Landroid/view/View;

    invoke-static {v0, p0, p1}, Lv/navigationbar/VNavigationBar$a;->b(Ll/w0m;ILandroid/view/View;)Landroid/animation/Animator;

    move-result-object p0

    return-object p0
.end method
