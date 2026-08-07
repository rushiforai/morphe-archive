.class public final synthetic Ll/skk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Landroid/widget/EditText;

.field public final synthetic b:Landroid/text/TextWatcher;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/EditText;Landroid/text/TextWatcher;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/skk;->a:Landroid/widget/EditText;

    iput-object p2, p0, Ll/skk;->b:Landroid/text/TextWatcher;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/skk;->a:Landroid/widget/EditText;

    iget-object p0, p0, Ll/skk;->b:Landroid/text/TextWatcher;

    invoke-static {v0, p0}, Ll/clk;->c(Landroid/widget/EditText;Landroid/text/TextWatcher;)V

    return-void
.end method
