.class public final synthetic Ll/pla0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ima0;


# direct methods
.method public synthetic constructor <init>(Ll/ima0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pla0;->a:Ll/ima0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pla0;->a:Ll/ima0;

    check-cast p1, Landroid/widget/LinearLayout;

    invoke-static {p0, p1}, Ll/ima0;->b(Ll/ima0;Landroid/widget/LinearLayout;)V

    return-void
.end method
