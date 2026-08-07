.class public final synthetic Ll/mlt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/nlt;

.field public final synthetic b:Ll/olt;


# direct methods
.method public synthetic constructor <init>(Ll/nlt;Ll/olt;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mlt;->a:Ll/nlt;

    iput-object p2, p0, Ll/mlt;->b:Ll/olt;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mlt;->a:Ll/nlt;

    iget-object p0, p0, Ll/mlt;->b:Ll/olt;

    invoke-static {v0, p0, p1}, Ll/nlt;->G(Ll/nlt;Ll/olt;Landroid/view/View;)V

    return-void
.end method
