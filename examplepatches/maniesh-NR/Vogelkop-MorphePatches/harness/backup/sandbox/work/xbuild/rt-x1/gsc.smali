.class public final synthetic Lgsc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/PopupWindow$OnDismissListener;


# instance fields
.field public final synthetic a:Lx79;

.field public final synthetic b:Leq6;


# direct methods
.method public synthetic constructor <init>(Lx79;Leq6;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lgsc;->a:Lx79;

    iput-object p2, p0, Lgsc;->b:Leq6;

    return-void
.end method


# virtual methods
.method public final onDismiss()V
    .registers 4

    iget-object v0, p0, Lgsc;->a:Lx79;

    iget-object v1, v0, Lx79;->c:Ljava/lang/Object;

    check-cast v1, Lm24;

    iget-object v2, v0, Lx79;->d:Ljava/lang/Object;

    check-cast v2, Lhe;

    invoke-interface {v1, v2}, Lm24;->c(Ll24;)V

    iget-object p0, p0, Lgsc;->b:Leq6;

    invoke-virtual {p0}, Leq6;->K()V

    const/4 p0, 0x0

    iput-object p0, v0, Lx79;->e:Ljava/lang/Object;

    return-void
.end method
