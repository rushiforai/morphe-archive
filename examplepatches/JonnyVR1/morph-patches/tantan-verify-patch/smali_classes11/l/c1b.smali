.class public final synthetic Ll/c1b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Landroid/widget/TextView;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Landroid/widget/TextView;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c1b;->a:Landroid/widget/TextView;

    iput p2, p0, Ll/c1b;->b:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/c1b;->a:Landroid/widget/TextView;

    iget p0, p0, Ll/c1b;->b:I

    invoke-static {v0, p0}, Ll/e1b;->x0(Landroid/widget/TextView;I)V

    return-void
.end method
