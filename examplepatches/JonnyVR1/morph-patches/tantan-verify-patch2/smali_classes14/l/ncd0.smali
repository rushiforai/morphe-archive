.class public final synthetic Ll/ncd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/ocd0;

.field public final synthetic b:Ll/kr40;


# direct methods
.method public synthetic constructor <init>(Ll/ocd0;Ll/kr40;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ncd0;->a:Ll/ocd0;

    iput-object p2, p0, Ll/ncd0;->b:Ll/kr40;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ncd0;->a:Ll/ocd0;

    iget-object p0, p0, Ll/ncd0;->b:Ll/kr40;

    invoke-static {v0, p0, p1}, Ll/ocd0;->a(Ll/ocd0;Ll/kr40;Landroid/view/View;)V

    return-void
.end method
