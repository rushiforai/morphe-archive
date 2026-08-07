.class public final synthetic Ll/gg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/ig0;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/ig0;Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gg0;->a:Ll/ig0;

    iput-object p2, p0, Ll/gg0;->b:Ljava/lang/String;

    iput p3, p0, Ll/gg0;->c:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gg0;->a:Ll/ig0;

    iget-object v1, p0, Ll/gg0;->b:Ljava/lang/String;

    iget p0, p0, Ll/gg0;->c:I

    invoke-static {v0, v1, p0, p1}, Ll/ig0;->E(Ll/ig0;Ljava/lang/String;ILandroid/view/View;)V

    return-void
.end method
