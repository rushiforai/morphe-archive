.class public final synthetic Ll/mhl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/yil0;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/yil0;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mhl0;->a:Ll/yil0;

    iput p2, p0, Ll/mhl0;->b:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mhl0;->a:Ll/yil0;

    iget p0, p0, Ll/mhl0;->b:I

    invoke-static {v0, p0, p1}, Ll/yil0;->R(Ll/yil0;ILandroid/view/View;)V

    return-void
.end method
