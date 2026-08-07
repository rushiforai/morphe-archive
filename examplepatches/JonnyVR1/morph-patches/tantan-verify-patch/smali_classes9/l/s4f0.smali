.class public final synthetic Ll/s4f0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/t4f0;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/t4f0;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s4f0;->a:Ll/t4f0;

    iput p2, p0, Ll/s4f0;->b:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/s4f0;->a:Ll/t4f0;

    iget p0, p0, Ll/s4f0;->b:I

    invoke-static {v0, p0, p1}, Ll/t4f0;->E(Ll/t4f0;ILandroid/view/View;)V

    return-void
.end method
