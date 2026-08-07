.class public final synthetic Ll/wqi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Landroid/widget/TextView;

.field public final synthetic b:Ljava/lang/CharSequence;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/TextView;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wqi0;->a:Landroid/widget/TextView;

    iput-object p2, p0, Ll/wqi0;->b:Ljava/lang/CharSequence;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wqi0;->a:Landroid/widget/TextView;

    iget-object p0, p0, Ll/wqi0;->b:Ljava/lang/CharSequence;

    invoke-static {v0, p0}, Ll/cri0;->c(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    return-void
.end method
