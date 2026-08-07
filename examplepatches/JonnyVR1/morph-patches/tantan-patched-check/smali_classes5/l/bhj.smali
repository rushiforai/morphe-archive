.class public final synthetic Ll/bhj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/fhj;


# direct methods
.method public synthetic constructor <init>(Ll/fhj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bhj;->a:Ll/fhj;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bhj;->a:Ll/fhj;

    invoke-static {p0, p1}, Ll/fhj;->v0(Ll/fhj;Landroid/view/View;)V

    return-void
.end method
