.class public final synthetic Ll/z71;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/o81;

.field public final synthetic b:Ll/b3v;


# direct methods
.method public synthetic constructor <init>(Ll/o81;Ll/b3v;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z71;->a:Ll/o81;

    iput-object p2, p0, Ll/z71;->b:Ll/b3v;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/z71;->a:Ll/o81;

    iget-object p0, p0, Ll/z71;->b:Ll/b3v;

    invoke-static {v0, p0, p1}, Ll/o81;->g4(Ll/o81;Ll/b3v;Landroid/view/View;)V

    return-void
.end method
