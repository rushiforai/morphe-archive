.class public final synthetic Ll/elf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ljava/util/List;

.field public final synthetic b:Ll/flf0;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;Ll/flf0;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/elf0;->a:Ljava/util/List;

    iput-object p2, p0, Ll/elf0;->b:Ll/flf0;

    iput-boolean p3, p0, Ll/elf0;->c:Z

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/elf0;->a:Ljava/util/List;

    iget-object v1, p0, Ll/elf0;->b:Ll/flf0;

    iget-boolean p0, p0, Ll/elf0;->c:Z

    invoke-static {v0, v1, p0, p1}, Ll/flf0;->b(Ljava/util/List;Ll/flf0;ZLandroid/view/View;)V

    return-void
.end method
