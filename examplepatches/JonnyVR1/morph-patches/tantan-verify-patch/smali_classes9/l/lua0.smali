.class public final synthetic Ll/lua0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/kua0$d;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/kua0$d;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lua0;->a:Ll/kua0$d;

    iput p2, p0, Ll/lua0;->b:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lua0;->a:Ll/kua0$d;

    iget p0, p0, Ll/lua0;->b:I

    invoke-static {v0, p0, p1}, Ll/kua0$d;->E(Ll/kua0$d;ILandroid/view/View;)V

    return-void
.end method
