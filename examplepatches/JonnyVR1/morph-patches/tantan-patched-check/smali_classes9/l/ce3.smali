.class public final synthetic Ll/ce3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/fe3;

.field public final synthetic b:Landroid/text/SpannableStringBuilder;


# direct methods
.method public synthetic constructor <init>(Ll/fe3;Landroid/text/SpannableStringBuilder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ce3;->a:Ll/fe3;

    iput-object p2, p0, Ll/ce3;->b:Landroid/text/SpannableStringBuilder;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ce3;->a:Ll/fe3;

    iget-object p0, p0, Ll/ce3;->b:Landroid/text/SpannableStringBuilder;

    check-cast p1, Ll/jk20;

    invoke-static {v0, p0, p1}, Ll/fe3;->q(Ll/fe3;Landroid/text/SpannableStringBuilder;Ll/jk20;)V

    return-void
.end method
